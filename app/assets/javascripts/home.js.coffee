# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  onPositionUpdate = (position) ->
    lat = position.coords.latitude
    long = position.coords.longitude
    console.log "Found you at #{lat},#{long}"
    $("#latitude").val(lat)
    $("#longitude").val(long)

    $.ajax "/api/elevation.json?latitude=#{lat}&longitude=#{long}",
      type: 'GET'
      dataType: 'json'
      success: (data, textStatus, jqXHR) -> 
        elevation = data["results"]["elevation"]
        $("#elevation").val("#{elevation}m")


  if(navigator.geolocation)
    navigator.geolocation.getCurrentPosition(onPositionUpdate)
  else
    console.log "navigator.geolocation is not available"
