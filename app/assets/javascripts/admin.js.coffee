# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $.fn.editable.defaults.mode = 'inline'
  $('.user_editable').each (i, obj) ->
    $(this).editable()
    return

  $(".approve_disapprove").click ->
    id = $(this).attr("id")

    $.post "/users/approve_disapprove", { id: id }, (data) ->
      if data.status == 200
        $(".approve_" + id).html(data.approved)