<?php
/*
 * Summary of sql_connect
 * @return bool|mysqli
    this function is used to connect to my sql database with the following credentials instead of pasring them in each file
    for more security measures we can only call this function from this file
 */
function sql_connect()
{
    $host = "100.127.90.109";
    $username = "null";
    $password = "@1120338#7";
    $database = "NutriVerse";
    try {
        $connection = mysqli_connect($host, $username, $password, $database);
        if (!$connection) {
            die("Connection failed: " . mysqli_connect_error());
        }
    } catch (e) {
        $host = "192.168.0.109";
        $connection = mysqli_connect($host, $username, $password, $database);
        if (!$connection) {
            die("Connection failed: " . mysqli_connect_error());
        }
    }
    return $connection;
}

function sql_create($query)
{
    if ($connection = sql_connect()) {
        if (mysqli_query($connection, $query))
            mysqli_close($connection);
        else
            return false;
    } else
        return false;
    return true;
}

function sql_read($query)
{
    if ($connection = sql_connect()) {
        $result = mysqli_query($connection, $query);
        mysqli_close($connection);
    } else {
        $result = false;
    }
    return $result;
}

?>