<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
<title>Google Maps JavaScript API v3 Example: Polyline Simple</title>
<link href="http://code.google.com/apis/maps/documentation/javascript/examples/default.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false&libraries=geometry"></script>

<script type="text/javascript">
  var jsonPoly = [ 
								{
									"title" : "title1",
									"description" : "desc1",
									"link" : "link1",
									"lat1" : "37.772323",
									"lng1" : "-122.214897",
									"lat2" : "21.291982",
									"lng2" : "-157.821856"
								},
								{
									"title" : "title2",
									"description" : "desc2",
									"link" : "link2",
									"lat1" : "-18.142599",
									"lng1" : "178.431",
									"lat2" : "-27.46758",
									"lng2" : "153.027892"
								}
							];// eof json
  
var map;
var infowindow = new google.maps.InfoWindow();
function initialize() {
    var myLatLng = new google.maps.LatLng(0, -180);
    var myOptions = {
      zoom: 2,
      center: myLatLng,
      mapTypeId: google.maps.MapTypeId.TERRAIN
    };
    map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);

	for(var i=0;i<=jsonPoly.length-1;i++){
		var obj = jsonPoly[i];
		var p1  = new google.maps.LatLng(obj.lat1, obj.lng1);
		var p2  = new google.maps.LatLng(obj.lat2, obj.lng2);
		var infowindow = new google.maps.InfoWindow();
		
		var flightPlanCoordinates = [p1,p2];
		var flightPath = new google.maps.Polyline({
		  path: flightPlanCoordinates,
		  strokeColor: "#FF0000",
		  strokeOpacity: 1.0,
		  strokeWeight: 5
		});
	   flightPath.setMap(map);
		createInfoWindow(flightPath,obj,p1,p2);
	  }
}
function createInfoWindow(poly,content,p1,p2){
	var distance = google.maps.geometry.spherical.computeDistanceBetween(p1, p2);
	
	
	google.maps.event.addListener(poly,'click', function(event){
	infowindow.content = '<p>' + content.title + '</p>' + '<p>' + content.description + '</p>' + '<p>' + content.link + '</p>' + '<p>Miles: ' + Math.round(distance * 0.000621371192) + '</p>';
	infowindow.position = event.latLng;
	infowindow.open(map);	  
			});
}
   
</script>
</head>
<body onload="initialize()">
  <div style="margin:0 auto;height:800px;width:800px;" id="map_canvas"></div>
</body>
</html>
