<?php
/*
 * Summary of sql_connect
 * @return bool|mysqli
    this function is used to connect to my sql database with the following credentials instead of pasring them in each file
    for more security measures we can only call this function from this file
 */
function sql_connect()
{
    $host = "sql310.infinityfree.com";
    $username = "if0_35693876";
    $password = "b1tVbXNmF9rYT";
    $database = "if0_35693876_nutriverse";
    $connection = mysqli_connect($host, $username, $password, $database);
    if (!$connection) {
        die("Connection failed: " . mysqli_connect_error());
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

function sql_delete($query)
{
    if ($connection = sql_connect()) {
        $result = mysqli_query($connection, $query);
        mysqli_close($connection);
    } else {
        return false;
    }
    return true;
}

function sql_update($query)
{
    if ($connection = sql_connect()) {
        $result = mysqli_query($connection, $query);
        mysqli_close($connection);
    } else {
        return false;
    }
    return true;
}

?>