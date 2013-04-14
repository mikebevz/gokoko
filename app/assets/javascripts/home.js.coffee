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