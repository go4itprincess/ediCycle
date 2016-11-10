<?php
$mysqli = new mysqli("HOSTNAME","USERNAME","PASSWORD", "DATABASE");
if ($mysqli->connect_errno)	{
	echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}
$mysqli->autocommit(FALSE);
?>

