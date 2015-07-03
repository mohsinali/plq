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

  ## Show Upload New Photo link when hover on Profile Image ##
  $("#profile_image").mouseover ->
    if not $(".upload_photo_form").is ':visible'
      $(".upload_new_image").show()

  ## Hide Upload New Photo link ##
  $("#profile_image").mouseout ->
    $(".upload_new_image").hide()

  ## Show a form to upload new Profile Image ##
  $(".upload_new_image").click ->
    $(this).hide()
    $(".upload_photo_form").show()