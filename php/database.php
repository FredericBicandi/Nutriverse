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

function user_validation_rules($input, $type)
{
    if (empty($input) || strlen($input) < 2) {
        return (false);
    }
    if ($type == 'username' && is_numeric($input)) {
        return (false);
    }
    if ($type == 'password' && strlen($input) < 8) {
        return (false);
    }
    if ($type == 'email') {
        $connection = sql_connect();
        if ($connection) {
            $sql = "SELECT email FROM Users";
            $rows = '';
            if ($rows = mysqli_query($connection, $sql)) {
                while ($r = mysqli_fetch_assoc($rows)) {
                    if ($r['email'] == $input) {
                        mysqli_close($connection);
                        return false;
                    }
                }
            }
            mysqli_close($connection);
        }
    }
    return (true);
}

?>