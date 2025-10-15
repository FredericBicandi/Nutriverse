<?php
require("nutriverse/php/database/database.php");
include("nutriverse/php/components/material_nutriblog.php");
session_start();
unset($_SESSION["success"]);
unset($_SESSION['errors']);
unset($_SESSION['s_errors']);


$req = explode("?", $_SERVER["REQUEST_URI"]);

if (isset($_SESSION['auth']) && isset($_GET["delBlog"])) {
    $delBlogId = $_GET["delBlog"];
    $delB = sql_delete(query: "DELETE FROM `Blogs` WHERE blog_id='{$delBlogId}' AND user_id='{$_SESSION['user']}'");
    if (!$delB)
        abort(message: "error when deleting data with request id={$delBlogId}");
}
if (
    isset($_SESSION['auth']) &&
    $request[1] == "nutriblog" &&
    $req[0] != "/nutriblog/member"
) {
    if (isset($_GET['filter']))
        header("Location: /nutriblog/member?filter={$_GET['filter']}");
    else
        header("Location: /nutriblog/member");
    exit();
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Meta tags for proper rendering and mobile optimization -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="theme-color" content="#FFFFFF">
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
        nutriblog
    </title>

    <!-- JavaScript dependencies -->
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
    <script>
        function ft_ajax(comp, request, del, conf_message) {
            if (confirm(conf_message)) {
                var xmlhttp = new XMLHttpRequest();

                xmlhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        if (del)
                            document.getElementById(`${comp}`).remove();
                        else
                            document.getElementById(`${comp}`).innerHTML = '';
                    }
                };

                xmlhttp.open("GET", request, true);
                xmlhttp.send();
            }
        }

    </script>
    <script>

        // Wait for <img> tags
        function waitForTagImages() {
            const imgs = Array.from(document.images);
            return Promise.all(imgs.map(img =>
                img.complete ? Promise.resolve() :
                    new Promise(res => {
                        img.addEventListener('load', res, { once: true });
                        img.addEventListener('error', res, { once: true }); // don't block forever on errors
                    })
            ));
        }

        // Wait for background-image URLs in computed styles
        function waitForBackgroundImages() {
            const urls = new Set();
            Array.from(document.querySelectorAll('*')).forEach(el => {
                const bg = getComputedStyle(el).backgroundImage;
                const match = bg && bg.match(/url\(([^)]+)\)/g);
                if (match) match.forEach(m => urls.add(m.replace(/^url\(["']?/, '').replace(/["']?\)$/, '')));
            });
            const loaders = Array.from(urls).map(src => new Promise(res => {
                const i = new Image();
                i.onload = i.onerror = res;
                i.src = src;
            }));
            return Promise.all(loaders);
        }

        // Wait for web fonts too
        const fontsReady = ('fonts' in document) ? document.fonts.ready : Promise.resolve();

        // Window 'load' covers most subresources, but we also explicitly wait for bg images & fonts
        const fullReady = Promise.all([
            new Promise(res => window.addEventListener('load', res, { once: true })),
            waitForTagImages(),
            waitForBackgroundImages(),
            fontsReady
        ]);

        fullReady.then(() => {
            // If you initialize AOS or other libs, do it here
            // AOS.init({ once: true });
            const loader = document.getElementById('app-loader');
            if (loader) loader.remove();
            document.documentElement.classList.add('page-loaded');
        });
    </script>
</head>

<body class="w-full h-screen overflow-x-hidden">
    <div id="app-loader" class="fixed inset-0 z-[99999] flex items-center justify-center bg-white">
        <div class="h-16 w-16 animate-spin rounded-full border-8 border-[#212121]/30 border-t-[#212121]"></div>
    </div>

    <section>
        <?php
        if ($_GET["filter"] != 'ownBlogs') {
            blog_navbar(content: "Daily Tips For Everyone");
            print ('<div class="bg_image bg-no-repeat bg-cover h-96 hidden md:block"></div>');
        } else {
            blog_navbar(content: "");
        }
        ?>
    </section>

    <main class="w-full sm:w-screen ">
        <div class="container mx-auto px-4">
            <h3 class="text_accent text-5xl mt-16 lg:mt-32 ml-8 lg:ml-40 hover:text-transparent hover:[-webkit-text-stroke:2px_#1ab394] transition-all duration-300">
                <b>
                    <?php
                    if ($_GET["filter"] == "ownBlogs") {
                        print ("Your Blogs");
                    } else if ($_GET["filter"] == "nutritions") {
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
            if (isset($_GET["filter"]) && $_GET['filter'] == "ownBlogs") {
                $result = sql_read(
                    query: "SELECT * 
                            FROM Blogs
                            WHERE user_id='{$_SESSION['user']}'"
                );
                if (!$result)
                    abort(message: "error connecting to database please try again later");
            } else if (isset($_GET["filter"])) {
                $result = sql_read(
                    query: "SELECT * 
                            FROM Blogs
                            WHERE blog_type='{$_GET['filter']}' AND accepted=true "
                );
                if (!$result)
                    abort(message: "error connecting to database please try again later");
            } else {
                $result = sql_read(
                    query: "SELECT *
                                FROM Blogs
                                WHERE accepted=1"
                );
                if (!$result)
                    abort(message: "error connecting to database please try again later");
            }
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