<?php

$uri = explode("?=", $_SERVER['REQUEST_URI']);
if (isset($uri[1]))
header("location:{$uri[0]}");
else {
    $uri = explode("?i=", $_SERVER['REQUEST_URI']);
    if (isset($uri[1]))
        header("location:{$uri[0]}");
}



$NutriVerse_folder = 'nutriverse/pages/nutriverse/';
$request = explode("/", $_SERVER['REQUEST_URI']);
if ($request[1] == "nutriverse" && $request[2] == "request_form") {
    die(require("{$NutriVerse_folder}request_form.php"));
} else if ($request[1] == "nutriverse" && $request[2] == "about") {
    die(require("{$NutriVerse_folder}about.php"));
} else if ($request[1] == "nutriverse") {
    die(require("{$NutriVerse_folder}home.php"));
}

$NutriBlog_folder = 'nutriverse/pages/';

if ($request[1] == "nutriblog" && $request[2] == "write" && $_GET["accept"] == "true") {
    die(require("{$NutriBlog_folder}create_blog.php"));
} else if ($request[1] == "nutriblog" && $request[2] == "write") {
    die(require("{$NutriBlog_folder}create_blog.php"));
} else if ($request[1] == "nutriblog" && $request[2] == "content") {
    die(require("{$NutriBlog_folder}blog-content.php"));
} else if ($request[1] == "nutriblog" && $request[2] == "create") {
    die(require("{$NutriBlog_folder}create_user.php"));
} else if ($request[1] == "nutriblog" && $request[2] == "login") {
    die(require("{$NutriBlog_folder}signin.php"));
} else if ($request[1] == "nutriblog" && $request[2] == "abort") {
    die(require("{$NutriBlog_folder}abort.php"));
}


if (
    $request[1] == "nutriblog" &&
    ($request[2] == "?filter=nutritions" || $request[2] == "?filter=entrepreneur")
)
    die(require("{$NutriBlog_folder}blog.php"));
else if (
    ($request[1] == "nutriblog" && $request[2] == "member") &&
    ($request[3] == "?filter=nutritions" || $request[3] == "?filter=entrepreneur")
)
    die(require("{$NutriBlog_folder}member.php"));


if ($request[1] == "nutriblog" && $request[2] == "member")
    die(require("{$NutriBlog_folder}member.php"));
if ($request[1] == "nutriblog" && !isset($request[2])) {
    die(require("{$NutriBlog_folder}blog.php"));
}

if ($request[1] == "nutriblog") {
    die(require("{$NutriBlog_folder}blog.php"));
}

$NutriAdmin_folder = "nutriverse/php/nutriadmin/";
if ($request[1] == "nutriadmin" && $request[2] == "login") {
    die(require("{$NutriAdmin_folder}login.php"));
} else if ($request[1] == "nutriadmin" && $request[2] == "abort") {
    die(require("{$NutriAdmin_folder}abort.php"));
}
if ($request[1] == "nutriadmin") {
    die(require("{$NutriAdmin_folder}nutriadmin.php"));
}