$(document).ready ->
  $("#new_floorplan").on("ajax:success", (e, data, status, xhr) ->
    $("#new_floorplan").append "<p class='alert-success'>Floorplan Added!</p>"
  ).bind "ajax:error", (e, xhr, status, error) ->
    $("#new_floorplan").append "<p class='alert-danger'>There was an error adding your floorplan.</p>"