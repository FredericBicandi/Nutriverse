<?php
session_start();

if (isset($_SESSION['auth']) && explode(".php", $_SERVER["PHP_SELF"])[0] == "/project/pages/blog") {
    if (isset($_GET['filter']))
        header("Location: member.php?filter={$_GET['filter']}");
    else
        header("Location: member.php");
    exit();
}
include("../php/components/material_nutriblog.php");
require("../php/database.php");
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
        .hover-steer-left {
            transition: transform 0.5s ease;
        }

        .hover-steer-left:hover {
            transform: translateX(-20px);
        }

        .bg_image {
            background-image: url('https://storage.googleapis.com/nutriverse/blog-home.png');
            background-size: 120%;
            background-position: center;
        }
        .text {
            color: #4a4a4a;
            font-family: Poppins;
        }

        .title {
            color: #4a4a4a;
            transition: color 0.2s ease;
            font-family: Poppins;
        }

        .title:hover {
            color: #1ab394;
            font-family: Poppins;
        }

        .text_accent {
            color: #1ab394;
            font-family: Poppins;
        }

        body {
            font-family: 'Poppins', sans-serif;
        }

        .primary {
            color: #231f20;
            transition: color 0.2s ease;
            font-family: Poppins 100;
        }

        .primary:hover {
            color: #3b3738;
            font-family: Poppins 100;
        }
    </style>
</head>

<body class="w-full h-screen overflow-x-hidden">
    <section>
        <?= blog_navbar(content: "Daily Tips For Everyone") ?>
        <div class="bg_image bg-no-repeat bg-cover h-96 hidden md:block">
            
    </section>

    <main class="w-full sm:w-screen ">
        <div class="container mx-auto px-4">
            <h3 class="text_accent text-5xl mt-12 lg:mt-32 ml-8 lg:ml-32">
                <b>
                    <?php
                    if ($_GET["filter"] == "nutritions") {
                        print ("Nutrition Blogs");
                    } else if ($_GET["filter"] == "entrepreneur") {
                        print ("Entrepreneur Blogs");
                    } else {
                        print ("All Blogs");
                    }
                    ?>
                </b>
            </h3>

            <?php
            if (isset($_GET["filter"])) {
                $sql = "SELECT * from Blogs WHERE blog_type='{$_GET['filter']}'";
            } else {
                $sql = "SELECT * from Blogs";
            }
            $result = mysqli_query($connection, $sql);
            $i = 1;
            while ($row = mysqli_fetch_assoc($result)) {
                if ($i == 1) {
                    print ("<div class='ml-5 md:flex justify-center mt-12 gap-12'>");
                }
                blogBox(
                    delay: $i * 100,
                    image: "{$row['image_url']}",
                    id: "{$row['blog_id']}",
                    title: "<b>{$row['blog_title']}</b>",
                    describtion: substr($row['blog_description'], 0, 80),
                    date: explode(" ", $row['created_at'])[0]
                );
                $i++;
                if ($i == 4) {
                    print ("</div>");
                    $i = 1;
                }
            }
            ?>
        </div>
    </main>
    <br>
    <?= footer() ?>
</body>