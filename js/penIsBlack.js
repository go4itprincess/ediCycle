
		function show_route_json() {
			var xmlhttp;
			
			if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
			  xmlhttp=new XMLHttpRequest();
			} else {// code for IE6, IE5
			  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
			}
			   
			xmlhttp.onreadystatechange = function() {
			  if (xmlhttp.readyState==4 && xmlhttp.status==200){
			  	var polylines = JSON.parse(xmlhttp.responseText);
			  	
			  	var length_i = polylines.length;
			  	var element = null;
			  	var div_html = "";
			  	var route = new Array();
			  	var route_data = new Array();
			  	
					for (var i = 0; i < length_i; i++) {
					  var polyline = polylines[i];
						var coordinates = polyline.coordinates;
			  		var length_j = coordinates.length
						var div_html_line = "";
						
						route[i] =  new Array();
						route_data[i] =  new Array();
						
						for (var j = 0; j < length_j; j++) {
						  route_data[i][j] = new google.maps.LatLng(coordinates[j][0], coordinates[j][1]);
						  
//						  new google.maps.Marker({
//			   			 position: new google.maps.LatLng(coordinates[j][0], coordinates[j][1]),
//			   			 map: map,
//			    		 title: (i + '_' + j)
//			  			});

						  div_html_line += "<li>" + coordinates[j][0] + ":" + coordinates[j][1] + "</li>";
						}
						
						route[i] = new google.maps.Polyline({
					    path: route_data[i],
					    strokeColor: "#"+4*i+"F"+4*i+"0"+4*i+"0",
					    strokeOpacity: 1.0,
					    strokeWeight: 4
					  	});
					  	
						route[i].setMap(map);
						
						div_html_line = "<li>" + polyline['polyline'] + "</li><li><ul>" + div_html_line + "</ul></li>";
						
			  		div_html += "<li><ul>" + div_html_line + "</ul></li>";
					}
			  	
			  	div_html = "<ol>" + div_html + "</ol>";
				  
				  
			  	
			    document.getElementById("polylines").innerHTML=div_html;
			  }
			}
			  
			
			var origin = document.forms["route_form"]["origin"].value;
			var destination = document.forms["route_form"]["destination"].value;
			
			xmlhttp.open("POST","get_polylines.php",true);
			xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
			xmlhttp.send("origin=" + encodeURIComponent(origin) + "&destination=" + encodeURIComponent(destination));
			
			return false;
		}


		function getLink() {
			var origin = document.forms["route_form"]["origin"].value;
			var destination = document.forms["route_form"]["destination"].value;
			
			return "https://maps.googleapis.com/maps/api/directions/json?origin=" + origin + "&destination=" + destination + "&sensor=false&mode=bicycling&alternatives=true";
		} 
	