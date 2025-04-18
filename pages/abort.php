<?php
include("../components/material_nutriblog.php");
session_start();
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Meta tags for proper rendering and mobile optimization -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="theme-color" content="#EEF1F6">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">

    <!-- External resources: Fonts, Styles, and Icons -->
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
    <link rel="stylesheet" href="https://bicandy-new.42web.io/nutriverse/pages/images/blogstyle.css">
    <link rel="icon" type="image/png" href="https://bicandy-new.42web.io/nutriverse/pages/images/nutriblog_logo.png">
    <link
        href="https://fonts.googleapis.com/css2?family=Arima:wght@100..700&family=Bebas+Neue&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
        rel="stylesheet">

    <!-- Page title -->
    <title>
        Nutriblog
    </title>

    <!-- JavaScript dependencies -->
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
</head>

<body class="w-full h-screen overflow-x-hidden">

    <main class="sm:w-screen lg:w-fit">
        <!-- 
            this div contains:
                title: 404
                message: error message
                button : return home
        -->
        <div class="w-screen h-screen text-center mt-12 lg:mt-32">
            <h1 class='body_text text-6xl font-semibold'>
                <strong>404</strong>
            </h1>

            <h2 class='body_text mt-5 text-2xl font-semibold text-gray-700'>
                <i><?= isset($_SESSION['error_message']) ? $_SESSION['error_message'] : 'Unknown error'; ?></i>
            </h2>

            <strong>
                Return
                <a href='/nutriblog' class="mt-2"> <span class="hover:underline text-[#1ab394]">Home</span></a>
            </strong>
        </div>
    </main>

    <?= footer() ?>
</body>

</html>