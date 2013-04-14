# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
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
      error: (err) ->
        console.log err  
    
    $('#myModal').modal('hide')
        
