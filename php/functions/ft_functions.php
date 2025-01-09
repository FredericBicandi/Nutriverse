<?php

/*
 * Summary of user_validation_rules
 * @param mixed $input
 * @param mixed $type
 * @return bool
    here i will take the user input and the input type and then i will check the following 
        if the input is empty or have less then 2 characters
        if the input is a name and have numbers
        if the input is password and gor less then 8 characters
        if the input is email 
            we query check if found in database upon the return value we can identify if found or not 
                if the user is create the account we do not need to find the email 
                if the user is signing in we have to find the given email
            upon the return value we can specify the outcome
 */
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
        $emails = sql_read(query: "SELECT email FROM Users");
        if ($emails) {
            while ($rows = mysqli_fetch_assoc($emails)) {
                if ($rows['email'] == $input)
                    return false;
            }
        }
    }
    return (true);
}
 

?>