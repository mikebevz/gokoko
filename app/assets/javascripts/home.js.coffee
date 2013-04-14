# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

getNewEntry = (data) -> 
  return '<div class="cat-all cat-one mega-entry tp-ordered tp-layout mega-square" data-height="400" data-width="504" id="mega-entry-4" style="-webkit-transform: scale(1, 1) rotate(0deg); opacity: 1; visibility: visible; top: 441.7346938775511px; left: 501.4285714285715px; 
    width: 232.8061224489796px; height: 220.86734693877554px; padding-bottom: 20px; padding-right: 20px; z-index: 1;">
    <div class="mega-entry-innerwrap" style="background-image: url('+data.image+'); 
    background-size: cover; -webkit-transform: scale(1, 1) perspective(10000px) rotateX(0deg); opacity: 1; background-position: 50% 49%; 
    background-repeat: no-repeat no-repeat;">
      <div class="mega-covercaption mega-square-top mega-landscape-right mega-portrait-bottom mega-red mega-transparent 
        mega-withsocialbar mega-smallcaptions">
        <div class="mega-title">'+data.title+'</div>
        <div class="mega-date">'+data.created_at+'</div>
        <p>sdfsdf</p>
        <div class="mega-rightfloat">
          <a href="'+data.url+'" target="_blank">Read article</a>
        </div>
      </div>
      <div class="mega-socialbar">
        <span class="mega-leftfloat">Share this</span>
        <a href="javascript:void(0)">
          <div class="mega-soc mega-facebook mega-leftfloat"></div>
        </a>
        <a href="javascript:void(0)">
          <div class="mega-soc mega-twitter mega-leftfloat"></div>
        </a>
        <div class="mega-show-more mega-soc mega-more mega-rightfloat"></div>
        <a href="javascript:void(0)">
          <div class="mega-soc mega-like mega-rightfloat">
            <span>2</span>
          </div>
        </a>
        <a href="javascript:void(0)">
          <div class="mega-soc mega-comments mega-rightfloat">
            <span>0</span>
          </div>
        </a>
      </div>
    </div></div>'


addNewPost = (obj) ->
  api = window.api
  api.megaprependentry(getNewEntry(obj));

$ ->
  $('.dropdown-toggle').dropdown()
  
  loc = $('.location_switch')
  
  loc.click (e) ->
    cur = $(e.currentTarget)
    console.log "Clicked: "+cur.attr("data-id")
    location.href = "/?loc=#{cur.attr("data-id")}"
    
  new_submit = $("#new_article_submit")
  
  new_form = $('#new_article_form')
  
  new_form.on "submit", (e) ->
    e.preventDefault()
  
  new_submit.click (e) ->
    
    $.ajax
      url: "/api/posts"
      dataType: "JSON"
      type: "POST"
      data: new_form.serialize()
      success: (data) ->
        console.log data
        addNewPost(data)
      error: (err) ->
        console.log err  
    
    $('#myModal').modal('hide')
        
