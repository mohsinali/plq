# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  # $('.filter_checkbox').on 'change', ->
  #   $('#user_search').submit()
  #   false

  $('.filter_checkbox').on 'change', ->
    $(".plq-listing").html("<image src='/assets/loading.gif' />")
    valuesToSubmit = $('#user_search_checkbox').serialize()

    $.ajax(
      type: 'GET'
      url: $('#user_search_checkbox').attr('action')
      data: valuesToSubmit
      dataType: 'script').success (json) ->
        # alert json
        # $(".plq-listing").html(json)
      console.log 'success', json
      return
      false