$(document).ready ->
  $("#new_floorplan").on("ajax:success", (e, data, status, xhr) ->
    $("#new_floorplan").append "<p class='text-success'>Floorplan Added!</p>"
  ).bind "ajax:error", (e, xhr, status, error) ->
    $("#new_floorplan").append "<p class='text-danger'>There was an error adding your floorplan.</p>"