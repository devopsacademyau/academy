      function initMap() {
        var uluru = {lat: 23.810332, lng: 90.41251809999994};
        var map = new google.maps.Map(document.getElementById('maps'), {
          zoom: 4,
          center: uluru
        });
        var marker = new google.maps.Marker({
          position: uluru,
          map: map,
          icon: 'images/map-marker.png'
        });
      }
