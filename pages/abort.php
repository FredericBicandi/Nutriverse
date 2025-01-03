<?php
include("../php/components/material_nutriblog.php");
session_start();
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
        <?= blog_navbar(content: false) ?>
    </section>

    <main class="sm:w-screen lg:w-fit">
        <div class="w-screen h-screen text-center mt-12 lg:mt-32">
            <h1 class='primary text-6xl font-semibold'>
                <strong>404</strong>
            </h1>
            <h2 class='primary mt-5 text-2xl font-semibold text-gray-700'>
                <i><?= isset($_SESSION['error_message']) ? $_SESSION['error_message'] : 'Unknown error'; ?></i>
            </h2>
            <strong>return <a href='/project/pages/blog.php' class="mt-2"> <span
                        class="hover:underline">home</span></strong></a>
        </div>

    </main>
    <!-- Footer -->
    <?= footer() ?>
</body>

</html>