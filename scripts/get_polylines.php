<?php
include_once 'db_connect.php';
include_once 'decode_polyline.php';
error_reporting (0);

$origin = urlencode($_POST["origin"] . ", edinburgh");
$destination = urlencode($_POST["destination"] . ", edinburgh");
$units = urlencode($_POST["units"]);

$sql = 'INSERT INTO history (`from`, `to`) VALUES ("' . $origin . '", "' . $destination . '")';
$mysqli->query($sql);
$history_id = $mysqli->insert_id;

if ($mysqli->errno)	{
	die	('MySQLi error code:'	.	$mysqli->errno . "\n<br/>\n" . $mysqli->error);
}

$params = array();
$params['origin']=$origin;
$params['destination']=$destination;
$params['units']=$units;

$bounds = array();
$polylines = getRoutes ($params, 'bicycling' ,'true' ,$bounds);
$pedestrian = getRoutes ($params, 'walking', 'false' ,$bounds);

$sql = 'UPDATE history
	SET
		origin =  "' . $pedestrian['start'] . '",
		destination = "' . $pedestrian['end'] . '"
	WHERE id = ' . $history_id;
$mysqli->query($sql);

if ($mysqli->errno)	{
	die	('MySQLi error code:'	.	$mysqli->errno . "\n<br/>\n" . $mysqli->error);
}

$pedestrian['index']=normalize($pedestrian[0]['index']);
$pedestrian['duration']=$pedestrian[0]['duration'];
$pedestrian['distance']=$pedestrian[0]['distance'];
unset($pedestrian[0]);

if ($pedestrian['start'] == "University of Edinburgh, Edinburgh, City of Edinburgh EH8, UK") {
	$pedestrian['start']="Good to see you made it to the University";
} else {
	$pedestrian['start']=$pedestrian['start'];
}

if ($pedestrian['end'] == "University of Edinburgh, Edinburgh, City of Edinburgh EH8, UK") {
	$pedestrian['end']="Going to the University is a good idea";
} else {
	$pedestrian['end']=$pedestrian['end'];
}

$bounds['ne']['y'] = max($bounds['ne']['y']);
$bounds['ne']['x'] = max($bounds['ne']['x']);
$bounds['sw']['y'] = min($bounds['sw']['y']);
$bounds['sw']['x'] = min($bounds['sw']['x']);

if ($polylines == array()){
	die();
}

$data = array();
$data['polylines'] = $polylines;
$data['pedestrian'] = $pedestrian;
$data['bounds'] = $bounds;

echo json_encode($data);


function getRoutes ($params, $mode, $alternatives, &$bounds) {
	global $mysqli;

	$url = "https://maps.googleapis.com/maps/api/directions/json?"
		.	"key=APIKEYGOESHERE"
		.	"origin="	.	$params['origin']
		.	"&destination="	.	$params['destination']
		.	"&mode=" 	.	$mode
		.	"&region=uk"
		.	"&alternatives=" . 	$alternatives
		.	"&units=" 	.	$params['units'];

	//echo $url;

	$content = json_decode(file_get_contents ($url));
	if ($content->status == "ZERO_RESULTS") {
		return array();
	}

	$routes	=$content->routes;
	$polylines = array();
	$bounds = array ();

	foreach	($routes as	$key =>	$route)	{
		$mtime=explode(' ', microtime());
		$sess=$mtime[1] . substr($mtime[0], 2);

		$bounds['ne']['y'][]=$route->bounds->northeast->lat;
		$bounds['ne']['x'][]=$route->bounds->northeast->lng;
		$bounds['sw']['y'][]=$route->bounds->southwest->lat;
		$bounds['sw']['x'][]=$route->bounds->southwest->lng;

		$polyline	=	$route->overview_polyline->points;
		$legs = $route->legs;
		$start_leg = $legs[0];
		$end_leg = $legs[count($legs) - 1];
		$polylines[$key]['sess'] = $sess ;
		$polylines[$key]['polyline'] = $polyline ;
		$polylines[$key]['index'] = 0 ;
		$polylines[$key]['duration'] = $start_leg->duration->text ;
		$polylines[$key]['distance'] = $start_leg->distance->text ;
		$polylines[$key]['coordinates']	=	decodePolylineToArray	($polyline);

		$sql_data=array();
		foreach ($polylines[$key]['coordinates'] as $coord_key => $coordinates) {
			$sql_data_row=array();
			$sql_data_row[]="'" . addslashes($coordinates[0]) . "'";
			$sql_data_row[]="'" . addslashes($coordinates[1]) . "'";
			$sql_data_row[]="'" . $sess . "'";
			$sql_data_row[]="'" . $coord_key . "'";
			$sql_data[] = '(' . implode(',', $sql_data_row) . ')';
		}

		$sql = 'INSERT INTO cache (latitude, longitude, sess, id_sess) VALUES' . implode(',', $sql_data);
		$mysqli->query($sql);

			if ($mysqli->errno)	{
				die	('MySQLi error code:'	.	$mysqli->errno . "\n<br/>\n" . $mysqli->error);
			}

		$sql = file_get_contents('../sql/get_ratings.sql');
		$sql = str_replace("##sess##", $sess, $sql);
		$sql = str_replace("##type##", $mode, $sql);
		$result = $mysqli->query($sql);

		if ($mysqli->errno)	{
			die	('MySQLi error code:'	.	$mysqli->errno . "\n<br/>\n" . $mysqli->error);
		}

		$result = $result->fetch_assoc();
		$index = $result['rating']/$result['acc_count'];
		$polylines[$key]['index'] = normalize($index);

		$sql = 'DELETE FROM cache WHERE sess = ' .$sess;
		$mysqli->query($sql);

			if ($mysqli->errno)	{
				die	('MySQLi error code:'	.	$mysqli->errno . "\n<br/>\n" . $mysqli->error);
			}

	}

	if ($alternatives == 'false') {
		$start = $start_leg->start_address;
		$end = $end_leg->end_address;

		$polylines['start']=$start;

		$polylines['end']=$end;
	}

	return $polylines;
}

function normalize ($index) {

	$index = ($index == null ? 0 : $index);
	$index = ($index < 0 ? 0 : $index);

	return $index;
}

?>
