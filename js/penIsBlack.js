var route = new Array();

var originalPolylineColor = "#000000";
var highlightedPolylineColor = "#FF6EE4";
var originalPolylineOpacity = 1.0;
var highlightedPolylineOpacity = 1.0;
var originalPolylineWeight = 4;
var highlightedPolylineWeight = 6;
var originalPolylinezIndex = 0;
var highlightedPolylinezIndex = 1;
				
function show_route_json() {
	var xmlhttp;
	var origin = document.forms["route_form"]["origin"].value;
	var destination = document.forms["route_form"]["destination"].value;
	var units = "";
	if(document.getElementById('units-metric').checked) {
  	units = "metric";
	}else if(document.getElementById('units-imperial').checked) {
  	units = "imperial";
	}
		
	if (origin=="" || destination=="") {
		alert("Please put something in both search boxes");
		return false;
	}
	if (origin==destination) {
		alert("Origin and destination are the same");
		return false;
	}	 	
	
	document.getElementById("loader").style.display="block";
	
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
	  xmlhttp=new XMLHttpRequest();
	} else {// code for IE6, IE5
	  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	}
	   
	xmlhttp.onreadystatechange = function() {
	  if (xmlhttp.readyState==4 && xmlhttp.status==200){
	  	var response = xmlhttp.responseText;
	  	
	  	showRoutes (response);
	  }
	}
	  
	xmlhttp.open("POST","scripts/get_polylines.php",true);
	xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xmlhttp.send(
		"origin=" + encodeURIComponent(origin) + 
		"&destination=" + encodeURIComponent(destination) +
		"&units=" + encodeURIComponent(units)
	);
	
	//return true;
	 
	return false;
}


function showRoutes (response ) {
		
	if (response.length<2){
		alert("Route not found");
		showForm();
		return;
	}
	  	
	  	console.log(response);
	
	var q_data = JSON.parse(response);
	var polylines = q_data.polylines;
	var bounds = q_data.bounds;
	var pedestrian = q_data.pedestrian;
	
	var length_i = polylines.length;
	var output_form = document.getElementById("output-form");
	var div_html = "";
	div_html_line = "";
	
	for (var k in route) {
			route[k].setMap(null);
	}
	
	
	if (pedestrian.start==pedestrian.end) {
		alert("Origin and destination are the same");
		showForm();
		return false;
	}	 	
	
	div_html_line = "";
	div_html_line += "<span id='from' class='location'>From:</span> " + pedestrian.start + "";
	div_html_line += "<br />";
	div_html_line += "<span id='to' class='location'>To:</span> " + pedestrian.end + "";
	div_html_line += "<br />";
	div_html_line += "<br />";
	div_html_line += "<span id='ped_rating' class='location'>Pedestrian safety rating:</span> N/A";// + pedestrian.index;
	div_html_line += "<br />";
	div_html_line += "<span id='ped_time' class='location'>Pedestrian time:</span> " + pedestrian.duration;
	div_html_line += "<br />";
	
	var out_info = document.createElement('div');
  out_info.setAttribute('id','output_info');
  out_info.setAttribute('class','output-element');
  out_info.innerHTML=div_html_line;
  
	output_form.appendChild(out_info);
	
	
	route = new Array();
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

		  //div_html_line += "<li>" + coordinates[j][0] + ":" + coordinates[j][1] + "</li>";
		}
		
		color = originalPolylineColor;
		
//		if ( polyline['index'] > 0.0006) {
//			color = "#F72D2D"; //red
//		} else if ( polyline['index'] > 0.0004) {
//			color = "#E37329"; //orange
//		} else if ( polyline['index'] > 0.0002) {
//			color = "#B7FF00"; //yellow
//		} else {
//			color = "#32B02E"; //green
//		} 
		
		color = "#" + getColor(polyline['index']);
								
		route[i] = new google.maps.Polyline({
	    path: route_data[i],
	    
	    strokeColor: color,
	    strokeOpacity: originalPolylineOpacity,
	    strokeWeight: originalPolylineWeight,
	    zIndex: originalPolylinezIndex,
	    
	    originalPolylineColor: color,
	    originalPolylineOpacity: originalPolylineOpacity,
	    originalPolylineWeight: originalPolylineWeight,
	    originalPolylinezIndex: originalPolylinezIndex,
	    
	    highlightedPolylineColor: highlightedPolylineColor,
	    highlightedPolylineOpacity: highlightedPolylineOpacity,
	    highlightedPolylineWeight: highlightedPolylineWeight,
	    highlightedPolylinezIndex: highlightedPolylinezIndex,
	    
	    
	    route_index: i
	  });
	  	
		route[i].setMap(map);
		
		div_html_line = "";
		div_html_line += "Cycling safety rating: " + polyline['index'];
		div_html_line += "<br />";
		div_html_line += "Time: " + polyline['duration'];
		div_html_line += "<br />";
		div_html_line += "Distance: " + polyline['distance'];
//						div_html_line += "<br />";
//						div_html_line += "Steps:\t" + route_data[i].length;
//						div_html_line += "<br />";
//						div_html_line += "From:\t" + polyline['start'];
//						div_html_line += "<br />";
//						div_html_line += "To:\t" + polyline['end'];
//						div_html_line += "<br />";
//						div_html_line += "Sess:\t" + polyline['sess'];
			
		var out_el = document.createElement('div');
	  out_el.setAttribute('id', 'output_' + i);
	  out_el.setAttribute('class', 'output-element');
	  out_el.setAttribute('onMouseOver', 'highlight(' + i + ', "in")');
	  out_el.setAttribute('onMouseOut', 'highlight(' + i + ', "out")');
	  out_el.innerHTML=div_html_line;
		
		
		var out_tt = document.createElement('div'); 
	  out_tt.setAttribute('id', 'output_tooltip_' + i);
	  out_tt.setAttribute('class', 'output-tooltip');
	  out_tt.innerHTML=div_html_line;
	  
		output_form.appendChild(out_el);
		output_form.appendChild(out_tt);
	
	}
  
	var back_button = document.createElement('button');
	back_button.setAttribute('id', 'back_button');
	back_button.setAttribute('class', 'button');
	back_button.setAttribute('onclick', 'showForm()');
	back_button.innerHTML="I'll be back";
	output_form.appendChild(back_button);
  
	var ne = new google.maps.LatLng(bounds.ne.y, bounds.ne.x);
	var sw = new google.maps.LatLng(bounds.sw.y, bounds.sw.x);
	bounds = new google.maps.LatLngBounds(sw, ne);
	
	map.fitBounds(bounds);
  
	for (var k in route) {
		document.getElementById('output_' + k ).style.backgroundColor = route[k].originalPolylineColor;
		document.getElementById('output_tooltip_' + k ).style.display = 'none';
		document.getElementById('output_tooltip_' + k ).style.backgroundColor = route[k].originalPolylineColor;
		
		google.maps.event.addListener(route[k], "mouseover", function(){
  		this.setOptions({
  			strokeColor: this.highlightedPolylineColor,
  			strokeOpacity: this.highlightedPolylineOpacity,
    		strokeWeight: this.highlightedPolylineWeight,
    		zIndex: this.highlightedPolylinezIndex
  		});
	  		
  		highlight(this.route_index, 'in');
  		
			document.getElementById('output_tooltip_' + this.route_index ).style.display = 'block';
			
	  }); 
	  	
	  google.maps.event.addListener(route[k], "mouseout", function(){
  		this.setOptions({
		    strokeColor: this.originalPolylineColor,
		    strokeOpacity: this.originalPolylineOpacity,
		    strokeWeight: this.originalPolylineWeight,
    		zIndex: this.originalPolylinezIndex
  		});
  		
  		highlight(this.route_index, 'out');
  		
			document.getElementById('output_tooltip_' + this.route_index ).style.display = 'none';
			
	  }); 
	}
	
	$(document).bind('mousemove', function(e){
		for (var k in route) {
      $('#output_tooltip_' + k ).css({
       left:  e.pageX + 20,
       top:   e.pageY
    	});
  	}
	});

  showResult();
}

function getLink() {
	var origin = document.forms["route_form"]["origin"].value;
	var destination = document.forms["route_form"]["destination"].value;
	
	return "https://maps.googleapis.com/maps/api/directions/json?origin=" + origin + "&destination=" + destination + "&sensor=false&mode=bicycling&alternatives=true";
} 

function showForm () {
  document.getElementById("output-form").style.display="none";
  document.getElementById("input-form").style.display="block";
	setTimeout(function() { document.getElementById("loader").style.display="none";},0); 
}

function showResult () {
  document.getElementById("input-form").style.display="none";
  document.getElementById("output-form").style.display="block";
	setTimeout(function() { document.getElementById("loader").style.display="none";},0); 
}

function highlight (i, act) {
	highlightRoute (i, act);
	highlightInfo (i, act);
}

function highlightRoute (i, act) {
	if (act == 'in') {
		route[i].setOptions({
			strokeColor: route[i].highlightedPolylineColor,
			strokeOpacity: route[i].highlightedPolylineOpacity,
			strokeWeight: route[i].highlightedPolylineWeight,
			zIndex: route[i].highlightedPolylinezIndex
		});
	} else if (act == 'out') {
		route[i].setOptions({
	    strokeColor: route[i].originalPolylineColor,
	    strokeOpacity: route[i].originalPolylineOpacity,
	    strokeWeight: route[i].originalPolylineWeight,
  		zIndex: route[i].originalPolylinezIndex
  	});
	}
}

function highlightInfo(i, act) {
	if (act == 'in') {
		document.getElementById("output_" + i).style.border = '3px inset  ';
	} else if (act == 'out') {
		document.getElementById("output_" + i).style.border = '';
	}
}

function getColor(rating)
{
	var coefficient = 1/10;
	rating = coefficient*(rating);
	if (rating <= 0) rating = 0;
  
  var H = rating * 0.35; // Hue (note 0.4 = Green)
  var S = 0.9; // Saturation
  var B = 0.45; // Brightness

	var color_rgb =  hslToRgb(H,S,B);
	
	var color_rgb_hex = new Array();
	var color_rgb_hex_str = "";
	
	for (elem in color_rgb) {
		color_rgb_hex[elem] =  Math.floor(color_rgb[elem]).toString(16);
		while (color_rgb_hex[elem].length<2) { color_rgb_hex[elem] = "0" + color_rgb_hex[elem]; }
		
		color_rgb_hex_str += color_rgb_hex[elem];
	}
	
	return color_rgb_hex_str;
}

function switch_inputs() {
	var origin = document.forms["route_form"]["origin"].value;
	var destination = document.forms["route_form"]["destination"].value;
	document.forms["route_form"]["origin"].value = destination;
	document.forms["route_form"]["destination"].value = origin;
}