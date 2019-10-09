<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html>
  <head>
    <title>WeatherLike</title>
    <style>
      #map {
        margin-top: 0;
        height: 90%;

      }
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      #header{
        height: 10%;
        width: 100%;
        background: white;
        z-index: -1;
      }
    </style>
  </head>
  <body>
    <div id="header">
      
      <img src="resources/logo.png" alt="logo" height="60px" width="300px">

    </div>
    <div id="map">

    </div>
    <script>
      var map, infoWindow;
      function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: -34.397, lng: 150.644},
          zoom: 15,
          mapTypeControl:false,
          fullscreenControl: false,
          streetViewControl:false

        });
        infoWindow = new google.maps.InfoWindow;

        // Try HTML5 geolocation.
        if (navigator.geolocation) {
          navigator.geolocation.getCurrentPosition(function(position) {
            var pos = {
              lat: position.coords.latitude,
              lng: position.coords.longitude
            };

            infoWindow.setPosition(pos);
            infoWindow.setContent('Location found.');
            infoWindow.open(map);
            map.setCenter(pos);
          }, function() {
            handleLocationError(true, infoWindow, map.getCenter());
          });
        } else {
          // Browser doesn't support Geolocation
          handleLocationError(false, infoWindow, map.getCenter());
        }
      }

      function handleLocationError(browserHasGeolocation, infoWindow, pos) {
        infoWindow.setPosition(pos);
        infoWindow.setContent(browserHasGeolocation ?
                'Error: The Geolocation service failed.' :
                'Error: Your browser doesn\'t support geolocation.');
        infoWindow.open(map);
      }
    </script>
    <script async defer
            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBG6Dz2-h3rVSE0pzXZ7yBFq1Dmv7cixhc&callback=initMap">
    </script>
  </body>
</html>