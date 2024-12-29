<?php
function sql_connect()
{
    $host = "192.168.0.109";
    $username = "null";
    $password = "@1120338#7";
    $database = "NutriVerse";
    $connection = mysqli_connect($host, $username, $password, $database);
    if (!$connection) {
        die("Connection failed: " . mysqli_connect_error());
    }
    return $connection;
}

?>