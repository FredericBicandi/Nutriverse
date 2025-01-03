<?php
include("../php/components/material_nutriblog.php");
$id = $_GET['id'];
$i = 0;
while ($i < strlen($id)) {
    if (!is_numeric($id[$i])) {
        abort(message: "blog not found");
    }
    $i++;
}
require("../php/database.php");
$connection = sql_connect();
$sql = "SELECT * FROM Blogs WHERE blog_id={$id}";
$content = mysqli_fetch_assoc(mysqli_query($connection, $sql));
if (!$content) {
    abort(message: "blog not found");
}
$sql = "SELECT first_name, last_name FROM Users WHERE user_id={$content['user_id']}";
$user = mysqli_fetch_assoc(mysqli_query($connection, $sql));
$content['user_id'] = $user['first_name'] . ' ' . $user['last_name'];


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
        pre {
            white-space: pre-wrap;
            /* Preserves whitespace but allows wrapping */
            word-wrap: break-word;
            /* Allows breaking long words */
            overflow-wrap: break-word;
            /* Ensures word-breaking */
            max-width: 100%;
            /* Prevents the <pre> from exceeding container width */
            overflow-x: auto;
            /* Adds horizontal scroll if content still overflows */
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

        pre.text {
            font-family: "Poppins", sans-serif;
            font-size: 18px;
            color: #4a4a4a;
        }

        .text {
            color: #4a4a4a;
            font-family: Poppins 100;
        }

        .title {
            color: #4a4a4a;
            font-family: Poppins 100;
        }

        .title:hover {
            color: #1ab394;
            font-family: Poppins 100;
        }

        .text_accent {
            color: #1ab394;
            font-family: Poppins 100;
        }
    </style>
</head>

<body class="bg-gray-100 w-full h-screen overflow-x-hidden">
    <?php
    blog_navbar(content: 'Daily Tips For Everyone'); ?>
    <div class="bg-[url('<?= $content['cover_url'] ?>')] bg-no-repeat bg-cover w-screen h-1/2 hidden md:block">
    </div>

    <div data-aos="fade-up" class="relative min-h-screen">

        <div class="top-0 left-0 w-full h-full bg-cover bg-center"
            style="background-image: url('your-background-image.jpg'); filter: brightness(80%);"></div>
        <!-- Content Box -->
        <div
            class="absolute lg:left-1/2 lg:-translate-x-1/2 md:translate-y-9 bg-white text_accent border border-[#ddd] lg:w-11/12 sm:w-8/12 p-8 shadow-lg">
            <!-- Title -->
            <h1 class="text-center text-4xl font-bold mb-6 leading-tight">
                <?= $content['blog_title'] ?>
            </h1>

            <!-- Time -->
            <p class="text-center text-xs mb-5 ml-5 text-[#4a4a4a]">By <span
                    class=" underline"><?= $content['user_id'] ?>
                </span>
                / <span class="underline"> <?= explode(" ", $content['created_at'])[0] ?></span>
            </p>

            <!-- Description -->
            <p class="text-[#4a4a4a] text-center mb-4">
                <?= $content['blog_description'] ?>
            </p>
            <!-- content -->

            <?= content(content: $content['blog_content']) ?>
            <?= likes() ?>
            <?= comments() ?>

            <?= footer() ?>
        </div>
</body>

</html>