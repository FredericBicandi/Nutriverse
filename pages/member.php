<?php
/*
    start the session and check for authentication 
        if valid import the blog.php file
 */
session_start();
if (!isset($_SESSION['auth'])) {
    include("../php/components/material_nutriblog.php");
    abort(message: "Not Authenticated");
}
else {
    require("blog.php");
}
?>