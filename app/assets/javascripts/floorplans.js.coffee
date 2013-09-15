$(document).ready ->
  $("#new_floorplan").on("ajax:success", (e, data, status, xhr) ->
    $("#new_floorplan").append "<span class='text-success'>Floorplan Added!</span>"
  ).bind "ajax:error", (e, xhr, status, error) ->
    $("#new_floorplan").append "<p>There was an error adding your floorplan.</p>"