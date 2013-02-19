
      var map;
      function initialize() {
      	var center = new google.maps.LatLng(55.94, -3.185);
        var mapOptions = {
		      zoom: 12,
		      center: center,
		      mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        
        map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions);
        
      /*  var locationArray = [center];
				var locationNameArray = ['Edinburghhhhh'];     
		
				var coord;
	  
			  for (coord in locationArray) {
			  	new google.maps.Marker({
			    position: locationArray[coord],
			    map: map,
			    title: locationNameArray[coord]
			  	});
			  }*/
        
      }

      google.maps.event.addDomListener(window, 'load', initialize);