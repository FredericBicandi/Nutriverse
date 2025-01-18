<?php
require("nutriverse/php/database/database.php"); 
include("nutriverse/php/components/material_nutriblog.php");
session_start(); 
$ispreview = 0;

/**
 * check for post request:
 *      if the post action is to like [12]
 *          get current count and increment [14-15]
 *          send the new count to databse [18]
 *      else if post is comment deletion
 *                 get comment_id [28]
 *                 delete comment by comment_id [31]
 *      else if post is new comment
 *                 get comment_text,blog_id,user_id [41-43]
 *                 create comment in database [46]
 *                  redierct to the same blog [57]
 *      
 */
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['action']) && $_POST['action'] === 'like') {
        $currentCount = isset($_POST['currentCount']) ? (int) $_POST['currentCount'] : 0;
        $newCount = $currentCount + 1;

        sql_update(
            query: "UPDATE `Blogs` 
                    SET `Likes_count`={$newCount} 
                    WHERE blog_id={$_SESSION['blogid']}"
        );
        echo strval($newCount);
        exit;
    }
    if (isset($_POST['comment_id'])) {
        $cmnt_id = intval($_POST['comment_id']);

        sql_delete(
            query: "DELETE FROM `Comments` 
                    WHERE comment_id={$cmnt_id}"
        );
        exit;
    }
    if (isset($_POST['comment_text'], $_SESSION['user'], $_SESSION['blogid'])) {
        $user_id = intval($_SESSION['user']);
        $blog_id = intval($_SESSION['blogid']);
        $comment_text = htmlspecialchars($_POST['comment_text'], ENT_QUOTES, 'UTF-8');

        sql_create(
            query: sprintf(
                "INSERT INTO Comments (blog_id, user_id, comment_text)
                 VALUES (%d, %d, '%s')",
                $blog_id,
                $user_id,
                $comment_text,
            )
        );
        $redirect = "/nutriblog/content/?id=" . strval($blog_id);
        header("Location: {$redirect}");
    } else {
        abort(message: "bad request");
    }
}

/**
 * if id is set
 *      get id
 *      check if id contans str
 *             abort on true
 *      fetch for blog id from database
 *              abort if blog not found
 *      fetch the user name and date of the blog and repalce them [89-95]
 *      if the admin is seeing this
 *             enable preview mode
 *  else if its preview mod for the writer
 *         enable preview mod
 *         load all data content from a session variabel
 *  else
 *         abort with message: no content to display 
 */
if (isset($_GET['id'])) {
    $id = $_GET['id'];
    $i = 0;

    while ($i < strlen($id)) {
        if (!is_numeric($id[$i])) {
            abort(message: "blog not found");
        }
        $i++;
    }
    $content = mysqli_fetch_assoc(
        sql_read(query: "SELECT * FROM Blogs WHERE blog_id={$id}")
    );
    if (!$content) {
        abort(message: "blog not found");
    }
    $user = mysqli_fetch_assoc(
        sql_read(
            query: "SELECT first_name, last_name FROM Users 
                    WHERE user_id={$content['user_id']}"
        )
    );
    $content['user_id'] = $user['first_name'] . ' ' . $user['last_name'];
    if ($content['accepted'] == 0) {
        $ispreview = 1;
    }
} else if (isset($_GET['preview']) && $_GET['preview'] == "true") {
    $ispreview = 1;

    if (isset($_SESSION['POST'])) {
        $content['cover_url'] = $_SESSION['POST']['cover'];
        $content['blog_title'] = $_SESSION['POST']['title'];
        $content['blog_description'] = $_SESSION['POST']['desc'];
        $content['blog_content'] = $_SESSION['POST']['content'];
        $content['user_id'] = 'unknown';
        $content['created_at'] = date("Y-m-d");
    }
} else {
    abort(message: "no content to display");
}
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
    <script>
        function delete_comment(comment_id) {
            if (confirm("Are you sure you want to delete your comment?")) {
                var xmlhttp = new XMLHttpRequest();

                xmlhttp.onreadystatechange = function () {
                    if (this.readyState === 4) {
                        if (this.status === 200) {
                            document.getElementById(`comment_text_${comment_id}`).remove();
                            alert(response.message);
                        } else {
                            alert("An error occurred while processing your request.");
                        }
                    }
                };

                xmlhttp.open("POST", "/nutriblog/content/", true);
                xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                xmlhttp.send(`comment_id=${encodeURIComponent(comment_id)}`);
            }
        }

        function like(currentCount) {
            var xmlhttp = new XMLHttpRequest();

            xmlhttp.onreadystatechange = function () {
                if (this.readyState === 4) {
                    if (this.status === 200) {
                        var newCount = parseInt(this.responseText);
                        document.getElementById('likeCount').innerText = newCount;
                    }
                }
            };

            xmlhttp.open("POST", "/nutriblog/content/", true);
            xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xmlhttp.send("action=like&currentCount=" + encodeURIComponent(currentCount));
        }
    </script>
</head>

<body class="bg-gray-100 w-full h-screen overflow-x-hidden">

    <?php
    /*
        if !preview mod:
            display navbar
        else 
            remove navbar and footer
    */
    if ($ispreview == 0) {
        blog_navbar(content: 'Daily Tips For Everyone');
    } else {
        print
            ("
            <script>
                AOS.init();
            </script>

            <div data-aos='fade-right' data-aos-delay='400' class='absolute mt-32 text hidden md:block'>
                    <h1 class='lg:ml-32 text-white text-6xl font-bold'>
                        <span>
                            Daily Tips For Everyone
                        </span>
                    </h1>
            </div>
        ");
    } ?>

    <!-- 
        this section contains:
            blog background image
            blog title
            blog writer and date
            blog descriptions
            blog content
    -->
    <div class="bg-[url('<?= $content['cover_url'] ?>')] bg-no-repeat bg-cover w-screen h-1/2 hidden md:block"></div>
    <section>
        <div data-aos="fade-up" class="relative w-screen">
            <div
                class="absolute lg:left-1/2 lg:-translate-x-1/2 md:translate-y-9 bg-white text_accent border border-[#ddd] lg:w-11/12 sm:w-screen p-8 shadow-lg overflow-x-hidden">

                <h1 class="text-center text-4xl font-bold mb-6 leading-tight">
                    <?= $content['blog_title'] ?>
                </h1>

                <p class="text-center text-xs mb-5 ml-5 text-[#4a4a4a]">
                    By <span class=" underline"><?= $content['user_id'] ?></span>/
                    <span class="underline">
                        <?= explode(" ", $content['created_at'])[0] ?>
                    </span>
                </p>

                <p class="text-[#4a4a4a] text-center mb-4">
                    <?= $content['blog_description'] ?>
                </p>

                <?= content(content: $content['blog_content']) ?>

                <?php
                /*
                    if preview not enabled
                        if user authenticated
                            enable likes and comments
                    else
                        display a message: sign in to like and comments
                    read and display all comments from database [311-328]
                        loop threw all comments
                            if the comment own by logged in user 
                                display a delete message
                            display comments
                */
                if (!$ispreview) {
                    if ($_SESSION['auth']) {
                        likes(count: intval($content['Likes_count']));
                        write_comment();
                    } else {
                        print
                            ("
                                <div class='text-center mt-32 items-center mb-6'>
                                    <h2 class='text-center text-lg lg:text-2xl  text-gray-400 '>
                                            <i>sign in to like and comment</i> 🔒
                                    </h2>
                                </div>
                            ");
                    }
                    $comments =
                        sql_read(
                            query: "SELECT comment_id,comment_text,created_at,user_id
                                FROM Comments
                                WHERE blog_id={$content['blog_id']}"
                        );
                    print (
                        " 
                        <section class='bg-white py-8 lg:py-16 antialiased'>
                            <div class=' mx-auto px-4'>
                                <div class='flex justify-between items-center mb-6'>
                                    <h2 class='text-lg lg:text-2xl font-bold text-gray-900 '>
                                        Comments
                                    </h2>
                                </div>
                    "
                    );

                    while ($comment = mysqli_fetch_assoc($comments)) {
                        $own = false;
                        $name = mysqli_fetch_assoc(
                            sql_read(
                                query: "SELECT first_name,last_name FROM Users
                                    WHERE user_id='{$comment['user_id']}'"
                            )
                        );
                        if (
                            $_SESSION['auth'] &&
                            isset($_SESSION['user']) &&
                            $comment['user_id'] == $_SESSION['user']
                        ) {
                            $user_own_comment = mysqli_fetch_assoc(
                                sql_read(
                                    query: "SELECT first_name FROM Users
                                        WHERE user_id='{$_SESSION['user']}'"
                                )
                            );
                            if (!empty($user_own_comment)) {
                                $own = true;
                            }
                        }
                        comments_box(
                            comment_id: $comment['comment_id'],
                            date: explode(" ", $comment['created_at'])[0],
                            name: "{$name['first_name']} {$name['last_name']}",
                            comment: $comment['comment_text'],
                            own_comment: $own
                        );
                    }
                    print ("</div> </section> ");
                }
                ?>
                <?= !$ispreview ? footer() : '' ?>
            </div>
    </section>

</body>

</html>