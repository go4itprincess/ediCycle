<?php

$mysqli = new mysqli("d33028.mysql.zone.ee","d33028sa60274","iUvJ78", "d33028sd57474");

if ($mysqli->connect_errno) {
    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}

$mysqli->autocommit(FALSE);
?>