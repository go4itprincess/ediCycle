<?php
include_once 'db_connect.php';
include_once 'decode_polyline.php';

$sess = date("U");
$url = "https://maps.googleapis.com/maps/api/directions/json?"
	.	"origin="	.	urlencode($_POST["origin"])	
	.	"&destination="	.	 urlencode($_POST["destination"])	
	.	"&sensor=false"	
	.	"&mode=bicycling"
	.	"&region=uk" 
	.	"&alternatives=true";

//echo $url;

$content = json_decode(file_get_contents ($url));
$routes	=$content->routes;
$polylines = array();

foreach	($routes as	$key =>	$route)	{
	$polyline	=	$route->overview_polyline->points;
	$polylines[$key]['sess'] = $sess ;
	$polylines[$key]['polyline'] = $polyline ;
	$polylines[$key]['index'] = 0 ;
	$polylines[$key]['coordinates']	=	decodePolylineToArray	($polyline);
	
	$sql_data=array();
	foreach ($polylines[$key]['coordinates'] as $coordinates) {
		$sql_data_row=array();
		$sql_data_row[]="'" . addslashes($coordinates[0]) . "'";
		$sql_data_row[]="'" . addslashes($coordinates[1]) . "'";
		$sql_data_row[]="'" . $sess . "'";
		$sql_data[] = '(' . implode(',', $sql_data_row) . ')';
	}
	
	$sql = 'INSERT INTO cache (latitude, longitude, sess) VALUES' . implode(',', $sql_data);
	$mysqli->query($sql);
	
		if ($mysqli->errno)	{
			die	('MySQLi error code:'	.	$mysqli->errno . "\n<br/>\n" . $mysqli->error);
		}
		
	$sql = ''/*magic*/;
	//$result = $mysqli->query($sql);
	//$result = $result;
	//$index = $;
	//$polylines[$key]['index'] = $index;
//	
//		if ($mysqli->errno)	{
//			die	('MySQLi error code:'	.	$mysqli->errno . "\n<br/>\n" . $mysqli->error);
//		}
//		
	$sql = 'DELETE FROM cache WHERE sess = ' . addslashes($sess);
	$mysqli->query($sql);
	
		if ($mysqli->errno)	{
			die	('MySQLi error code:'	.	$mysqli->errno . "\n<br/>\n" . $mysqli->error);
		}
}

echo json_encode($polylines);

?>