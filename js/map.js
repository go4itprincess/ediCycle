
      var map;
      function initialize() {
      	var center = new google.maps.LatLng(55.94, -3.185);
        var mapOptions = {
		      zoom: 12,
		      center: center,
		      streetViewControl: false,
		      mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        
        map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions);
        
        var bikeLayer = new google.maps.BicyclingLayer();
				bikeLayer.setMap(map);
        
      }

      google.maps.event.addDomListener(window, 'load', initialize);