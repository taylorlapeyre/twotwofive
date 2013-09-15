# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $("#new_listing").on("ajax:success", (e, data, status, xhr) ->
    $("#new_listing").append "<p class='alert-success'>Listing Added!</p>"
  ).bind "ajax:error", (e, xhr, status, error) ->
    $("#new_listing").append "<p class='alert-danger'>There was an error adding your listing.</p>"