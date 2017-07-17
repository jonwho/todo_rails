# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('#todo-input').on 'keydown', (event) ->
    if event.keyCode is 13
      $('#todo-submit').click()
      event.target.value = ''
      event.preventDefault()
