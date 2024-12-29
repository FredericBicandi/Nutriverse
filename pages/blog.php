<?php
include("../php/components/material_nutriblog.php");
require("../php/connection.php");
$connection = sql_connect();
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nutriblog</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
    <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
        rel="stylesheet">
    <style>
        .bg_image {
            background-image: url('https://storage.googleapis.com/nutriverse/blog-home.png');
            background-size: 120%;
            background-position: center;
        }

        .primary {
            color: #231f20;
            font-family: Poppins 100;
        }

        .text {
            color: #4a4a4a;
            font-family: Poppins 100;
        }

        .hover-steer-left {
            transition: transform 0.5s ease;
            /* Smooth animation effect */
        }

        .hover-steer-left:hover {
            transform: translateX(-20px);
            /* Moves the image 20px to the left */
        }
    </style>
</head>

<body class="h-screen">
    <section>
        <?= blog_navbar() ?>
        <div class="bg_image bg-no-repeat bg-cover bg-center h-96 hidden sm:block md:block">
    </section>

    <main class="sm:w-screen lg:w-fit">
    <h3 class="text-[#bea7a3] text-5xl mt-12 lg:mt-64 ml-8 lg:text-5xl lg:ml-32">
        <b>
            <?php
            if ($_GET["Filter"] == "nutritions") {
                print ("Nutrition Blogs");
            } else if ($_GET["Filter"] == "entrepreneur") {
                print ("Entrepreneur Blogs");
            } else {
                print ("All Blogs");
            }
            ?>
        </b>
    </h3>

    <!-- first row  -->
    <div class="ml-5 md:flex justify-center mt-12 gap-12">
        <?= blogBox(
            delay:100,
            image: "",
            title: "",
            describtion: "",
            date: "",
        ) ?>
        <?= blogBox(
            delay:200,
            image: "",
            title: "",
            describtion: "",
            date: "",
        ) ?>
        <?= blogBox(
            delay:200,
            image: "",
            title: "",
            describtion: "",
            date: "",
        ) ?>
    </div>
</main>
    <br>
    <!-- Footer -->
    <?= footer() ?>
</body>

</html>