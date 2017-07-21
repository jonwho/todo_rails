# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('#todo-input').on 'keydown', (event) ->
    if event.keyCode is 13
      $('#todo-submit').click()
      event.target.value = ''
      event.preventDefault()

  # for dynamic content you need to use a parent element with the event listener
  # then target the element you want to listen on
  # using the method `on' will let you listen for dynamic elements
  $('#todo-list').on('change', 'input:checkbox', ->
    url = $(this).data('todoUrl')
    status = ''
    if $(this).is(':checked')
      status = 'complete'
    else
      status = 'incomplete'
    $.ajax(
      method: 'PUT'
      url: url
      data:
        todo:
          status: status
      success: (resp) ->
        eval(resp)
    )
  )
