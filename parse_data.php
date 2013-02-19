<html>
	<title>
		Add data
	</title>
	
	<body>

<?php

	include_once "db_connect.php";
	$dictionary=NULL;

	if (empty($_POST['submit'])) {
		
	} else {
		
		if ($_POST['password'] != 'Asdasd123') {
			echo 'Invalid password' . "<br/>";
		} else {
			try {
				$allowedExts = array("csv");
				$extension = end(explode(".", $_FILES["file"]["name"]));
				$mimes = array('application/vnd.ms-excel','text/plain','text/csv','text/tsv');
				
				if( in_array($_FILES['file']['type'],$mimes) && in_array($extension, $allowedExts) && $_FILES["file"]["size"] < 200000 ) {
					
				  if ($_FILES["file"]["error"] > 0) {
				    echo "Error: " . $_FILES["file"]["error"] . "<br/>";
				  } else {
	
						try {
							echo "Saving file...<br/>";
							move_uploaded_file($_FILES["file"]["tmp_name"], $filename = "upload/" . date("U") . '.csv');
							echo "Saved!<br/>";
						} catch (Exception $e) {
							echo "Encountered an error while saving: " . $e-getMessage() . "<br/>";
							throw $e;
						}
								
				    
				    echo "Stored in: " . $filename . "<br/>";
				    
				    echo "Parsing..." . "<br>";
				    try {
				    	$delimiter = $_POST['delimiter'];
				    	$enclosure = $_POST['enclosure'];
				    	
				    	if (empty($delimiter)) {
				    		$delimiter = ',';
				    	}
				    	
				    	if (empty($enclosure)) {
				    		$enclosure = '"';
				    	}
				    	
				    	
				    	parse($filename, $delimiter, $enclosure);
				    	$mysqli->autocommit(TRUE);
							$mysqli->close();
				    	echo "Successfully parsed!" . "<br/>";
				    } catch (Exception $e) {
				    	$mysqli->rollback();
				    	$mysqli->autocommit(TRUE);
							$mysqli->close();
				    	echo "Encountered an error: " . $e->getMessage() . "<br/>";
				    	throw $e;
				    }
				    
				  }
				  
				} else {
				  echo "Invalid file";
				}
					
				echo "Successfully finished!" . "<br/><br/>";
			} catch (Exception $e) {
				echo "Failed!<br/><br/>";
			}
		}
		
	}

?>
		
		<form action="parse_data.php" method="post" enctype="multipart/form-data">
			<table>
				<tr>
					<td>
						<label for="password">
							Password:
						</label>
					</td>
					
					<td>
						<input type="password" name="password" />
					</td>
				</tr>
			
				<tr>
					<td>
						<label for="file">
							Data file (csv):
						</label>
					</td>
					
					<td>
						<input type="file" name="file" />
					</td>
				</tr>
			
				<tr>
					<td>
						<label for="delimiter">
							Delimiter (,) :
						</label>
					</td>
					
					<td>
						<input type="text" name="delimiter" maxlength=1 />
					</td>
				</tr>
			
				<tr>
					<td>
						<label for="enclosure">
							Enclosure (") :
						</label>
					</td>
					
					<td>
						<input type="text" name="enclosure" maxlength=1 />
					</td>
				</tr>
			
				<tr>
					<td/>
					<td>			
						<input type="submit" name="submit" value="Upload" />
					</td>
				</tr>
				
		</form> 
	</body>
</html>

<?php

function parse($filename, $delimiter, $enclosure) {
	global $mysqli;
	global $dictionary;
	
	$file = fopen($filename, 'r');
	
	if ($file == false) {
		throw ("Unable to open file");
	}
	
	
	$detail_labels[] = "junc_ctrls";
	$detail_labels[] = "junc_dets";
	$detail_labels[] = "light_conds";
	$detail_labels[] = "road_classes";
	$detail_labels[] = "road_surfs";
	$detail_labels[] = "road_types";
	$detail_labels[] = "severities";
	$detail_labels[] = "weathers";
	
	
	foreach ($detail_labels as $label) {
		$details[$label] = array();
	}
	
	foreach ($details as $label => &$options) {
		$sql = 'SELECT * FROM ' . $label;
	
		$result = $mysqli->query($sql);
	
		if ($mysqli->errno) {
			die ('MySQLi error code:' . $mysqli->errno . "\n<br/>\n" . $mysqli->error);
		}
		
		if ($result->num_rows == 0) {
			$options = array();
		} else {
			while ($row = $result->fetch_assoc()) {
				$options[] = $row['description'];
			}
		}
	}
	
	$labels = json_decode('["Severity","Marker Colour","Number of Vehicles","Number of Casualties","Date","Day","a_date_mon","Time Hour","Time Minutes","Road Class","road_type","speed_limi","junc_det","junc_ctrl","road2_class","light_cond","weather","road_surf","Postcode","Latitude","Longitude"]');
	$labels_input = fgetcsv ( $file, 0 , $delimiter , $enclosure);
	
	if ($labels != $labels_input) {
		throw new Exception("Unsuitable CSV schema (1st line has to be labels)");
	}
	
	
	$dictionary = array_flip (json_decode( file_get_contents("csv_dictionary.json") ) );

	$mysqli->query("START TRANSACTION");
	if ($mysqli->errno) {
		die ('MySQLi error code:' . $mysqli->errno . "\n<br/>\n" . $mysqli->error);
	}
	
	while ($row = fgetcsv ( $file, 0 , $delimiter , $enclosure)) {
		$data = array();
		
//  parseElement(&$data, $row, $details, $keyword, $table)
		parseElement($data, $row, $details, 'severity', 'severities');
		parseElement($data, $row, $details, 'road_class', 'road_classes');
		parseElement($data, $row, $details, 'road_type', 'road_types');
		parseElement($data, $row, $details, 'junc_det', 'junc_dets');
		parseElement($data, $row, $details, 'junc_ctrl', 'junc_ctrls');
		parseElement($data, $row, $details, 'road2_class', 'road_classes');
		parseElement($data, $row, $details, 'light_cond', 'light_conds');
		parseElement($data, $row, $details, 'weather', 'weathers');
		parseElement($data, $row, $details, 'road_surf', 'road_surfs');

		$data['vehicles'] = '\'' . addslashes($row[getIndex('vehicles')]) . '\'';
		$data['casualities'] = '\'' . addslashes($row[getIndex('casualties')]) . '\'';
		$data['speed_limit'] = '\'' . addslashes($row[getIndex('speed_limit')]) . '\'';
		$data['postcode'] = '\'' . addslashes($row[getIndex('postcode')]) . '\'';
		$data['latitude'] = '\'' . addslashes($row[getIndex('latitude')]) . '\'';
		$data['longitude'] = '\'' . addslashes($row[getIndex('longitude')]) . '\'';
		
		$date = strtotime($row[getIndex('date')]);
		$timestamp = mktime($row[getIndex('hour')], $row[getIndex('minute')], 0,  date("n", $date),   date("j", $date),   date("Y", $date))  ;
		$datetime = date('Y-m-d H:i:s', $timestamp);
		$data['datetime'] = '\'' . addslashes($datetime) . '\'';
	
	
		$sql = 'INSERT INTO accidents (' . implode(' , ', array_keys($data)) . ') VALUES (' . implode(' , ', $data)	. ')' ;
					
	print_r($sql);
	echo "\n<br>\n";
	
	
		$result = $mysqli->query($sql);
	
		if ($mysqli->errno) {
			die ('MySQLi error code:' . $mysqli->errno . "\n<br/>\n" . $mysqli->error);
		}
	}
	
	
	$mysqli->commit();
	return 0;
}

function getIndex($keyword) {
	global $dictionary;
	
	if (!empty ($dictionary[$keyword])) {
		return $dictionary[$keyword];
	} elseif ($dictionary[$keyword] === 0) {
		return $dictionary[$keyword];
	} else {
		throw new Exception("Invalid CSV dictionary reference");
	}
}

function parseElement(&$data, $row, &$details, $keyword, $table) {
	global $mysqli;
	$index = getIndex($keyword);
	if ( !in_array($row[$index], $details[$table]) ) {
		$mysqli->query('INSERT INTO ' . $table . ' (description) VALUES ("' . addslashes($row[$index]) . '")' );
		$details[$table][]=$row[$index];
	}
	$result = $mysqli->query('SELECT id FROM ' . $table . ' WHERE description = "' . addslashes($row[$index]) . '"' );
	
	if ($mysqli->errno) {
		die ('MySQLi error code:' . $mysqli->errno . "\n<br/>\n" . $mysqli->error);
	} else {
		$id = $result->fetch_assoc();
		$id = $id['id'];
		$data[$keyword] = $id;
	}
}

?>