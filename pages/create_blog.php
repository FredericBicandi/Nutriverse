<?php

require("nutriverse/php/database/database.php");
include("nutriverse/php/components/material_nutriblog.php");
include("nutriverse/php/functions/ft_functions.php");
session_start();
if (!$_SESSION['auth']) {
    abort(message: 'your are not authenticated');
}

/*
    if POST Connection is received 
    reset the SESSION POST content and errors
    move and get all files names uploaded by the user 
    extract all content from input POST to Session
*/
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST)) {
        unset($_SESSION['success']);
        unset($_SESSION['error']);
        unset($_SESSION['POST']);
        $file_names = move_images($_FILES);

        $_SESSION['POST']['cover'] = explode("?", $_POST['cover'])[0];
        $_SESSION['POST']['img'] = explode("?", $_POST['cover'])[0];
        $_SESSION['POST']['type'] = $_POST['type'];
        $_SESSION['POST']['title'] = $_POST['title'];
        $_SESSION['POST']['desc'] = $_POST['desc'];
        $_SESSION['POST']['content'] = '';

        $file_index = 0;
        foreach ($_POST as $label => $value) {
            $raw_label = explode("-", $label)[0];

            if ($raw_label == "h2") {
                $_SESSION['POST']['content'] = $_SESSION['POST']['content'] .
                    "
                        <h2 class='mt-5 text-black text-3xl'>
                            <strong>{$value}</strong>
                        </h2>
                        <br>
                    ";
            } else if ($raw_label == "pre") {
                $_SESSION['POST']['content'] = $_SESSION['POST']['content'] .
                    "
                        <pre class='ml-12 mt-5 text'>{$value}</pre>
                        <br>
                    ";
            } else if ($raw_label == "url") {
                $_SESSION['POST']['content'] = $_SESSION['POST']['content'] .
                    "
                        <pre class='ml-12 mt-5 text'><a class='text_accent' href='{$value}'>{$value}</a></pre>
                        <br>
                    ";
            } else if ($raw_label == "imgurl" && !empty($value)) {
                $_SESSION['POST']['content'] = $_SESSION['POST']['content'] .
                    "
                        <img 
                            align='center'
                            src='{$value}'
                            width='900' />
                        <br>
                    ";
            } else if (!empty($file_names[$file_index])) {
                $value = $file_names[$file_index++];
                $_SESSION['POST']['content'] = $_SESSION['POST']['content'] .
                    "
                        <img
                            align='center'
                            src='https://bicandy-new.42web.io/nutriverse/pages/images/{$value}'
                            width='900'/>
                        <br>
                    ";
            }
        }
    }

}
/*
    when user click on submit blog
        check the GET request if its accept 
            check if there was any error by parsing
                and check all the session values
        if no session errors 
            import db file
            prepare the data
            Insert data
            echo success or abort

*/
if (
    isset($_GET['accept']) &&
    $_GET['accept'] == "true" &&
    !empty($_SESSION['POST'])
) {
    if (empty($_SESSION['error'])) {
        foreach ($_SESSION['POST'] as $label => $value) {
            if (empty($value)) {
                $_SESSION['error'] = "{$label} cannot be empty";
            }
        }
    }
    if (empty($_SESSION['error'])) {
        $conn = sql_connect();
        $type = mysqli_real_escape_string($conn, $_SESSION['POST']['type']);
        $title = mysqli_real_escape_string($conn, $_SESSION['POST']['title']);
        $desc = mysqli_real_escape_string($conn, $_SESSION['POST']['desc']);
        $content = mysqli_real_escape_string($conn, $_SESSION['POST']['content']);
        $img = mysqli_real_escape_string($conn, $_SESSION['POST']['img']);
        $cover = mysqli_real_escape_string($conn, $_SESSION['POST']['cover']);

        if (
            !sql_create(
                query: "INSERT INTO `Blogs` 
                    (
                    `user_id`, 
                    `blog_type`,
                    `Likes_count`,
                    `blog_title`,
                    `blog_description`,
                    `blog_content`,
                    `image_url`,
                    `cover_url`)
                VALUES (
                    '{$_SESSION['user']}', 
                    '$type',
                    0,
                    '$title',
                    '$desc',
                    '$content',
                    '$img',
                    '$cover'
                )"
            )
        )
            abort(message: "Error When submitting the blog please try again");
        else {
            unset($_SESSION['error']);
            unset($_SESSION['success']);
            unset($_SESSION['POST']);
            $_SESSION['success'] = "Blog Submitted Succesfully";
            header("location: /nutriblog/write");
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nutriblog</title>

    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>

    <!-- AOS (Animate on Scroll) CSS & JS -->
    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
    <script src="https://unpkg.com/aos@next/dist/aos.js"></script>

    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
        rel="stylesheet">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
        }

        .hidden {
            display: none;
        }

        .relative {
            position: relative;
        }
    </style>
</head>

<body class="w-full h-screen overflow-x-hidden">
    <!-- Navbar -->
    <?= blog_navbar(content: false) ?>
    <!-- Main Section -->
    <main class="min-h-screen mt-12 overflow-x-hidden">

        <!-- Page Header -->
        <div class="justify-center items-center text-center md:block">
            <h2 class="text-3xl font-bold text-[#231f20]">
                <span class="bg-[#231f20] text-white lg:px-3">Write</span> your Own Blog.
            </h2>
            <?= add_content_button() ?>
        </div>

        <!-- Blog Form -->
        <div class="flex justify-center mt-6">
            <form method="POST" action="/nutriblog/write" enctype="multipart/form-data" id="blog-form"
                class="space-y-6 text-center">

                <input class="block lg:w-96 p-2 border border-gray-300 rounded mt-6" type="url"
                    placeholder="Your blog cover picture url" id="cover" name="cover" required>

                <input class="block lg:w-96 p-2 border border-gray-300 rounded mt-6" type="text"
                    placeholder="Your blog title" id="title" name="title" required>

                <textarea class="block lg:w-96 p-2 border border-gray-300 rounded mt-6"
                    placeholder="Your blog description" id="desc" name="desc" required></textarea>
                <?= isset($_SESSION['error']) ? "<p class='mt-5 text-red-600'>{$_SESSION['error']}</p>" : ""; ?>

                <div class="flex flex-col items-center" id="form-elements-container"></div>
                <select class="block lg:w-96 p-2 border border-gray-300 rounded mt-6" name="type" id="type" required>
                    <option value="" disabled selected>Select blog type</option>
                    <option value="nutritions">Nutrition</option>
                    <option value="entrepreneur">Entrepreneur</option>
                </select>

                <button type="submit"
                    class="bg-[#231f20] text-white py-2 px-4 rounded hover:bg-[#414040] focus:ring focus:ring-[#231f20]">
                    Preview your blog
                </button>
                <?= isset($_SESSION['success']) ? "<p class='text-green-400'>{$_SESSION['success']}</p>" : "" ?>
            </form>
        </div>

        <?php
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            if (isset($_POST)) {
                print ("
                    <iframe class='mt-12' height='800' width='100%' src='https://bicandy-new.42web.io/nutriblog/content/?preview=true'></iframe>
                    <div class='flex justify-center mt-6'>
                        <a href='/nutriblog/write/?accept=true' class='mt-8'>
                            <button 
                                type='submit'
                                class='bg-[#231f20] text-white py-2 px-4 rounded hover:bg-[#414040] focus:ring focus:ring-[#231f20]'>
                                    Submit Blog
                            </button>
                        </a>
                    </div>
                ");
            }
        }
        ?>
        <!-- Footer -->
        <section class="mt-24">
            <?= footer() ?>
        </section>
    </main>

    <!-- Scripts -->
    <script>
        // Initialize AOS
        AOS.init();

        // Dropdown Menu Toggle
        const dropdownButton = document.getElementById('dropdown-button');
        const dropdownMenu = document.getElementById('dropdown-menu');

        dropdownButton.addEventListener('click', () => {
            dropdownMenu.classList.toggle('hidden');
        });

        // Close dropdown when clicking outside
        document.addEventListener('click', (e) => {
            if (!dropdownButton.contains(e.target) && !dropdownMenu.contains(e.target)) {
                dropdownMenu.classList.add('hidden');
            }
        });

        // Function to dynamically add form elements
        let imgCounter = 0;
        let h2Counter = 0;
        let urlCounter = 0;
        let preCounter = 0;
        let img_urlCounter = 0;
        function addElement(tag) {
            const container = document.getElementById('form-elements-container');
            let element;

            switch (tag) {
                case 'img':
                    imgCounter++;
                    element = document.createElement('input');
                    element.type = 'file';
                    element.id = 'img-' + imgCounter;
                    element.name = 'img-' + imgCounter;
                    element.placeholder = 'Upload an image';
                    // //NEW STUFF
                    // element = document.createElement('input');
                    // element.type = 'text';
                    // element.id = 'imgText-' + imgCounter;
                    // element.name = 'img-' + imgCounter;
                    // element.style = 'hidden';
                    break;
                case 'a':
                    urlCounter++;
                    element = document.createElement('input');
                    element.type = 'url';
                    element.id = 'url-' + urlCounter;
                    element.name = 'url-' + urlCounter;
                    element.placeholder = 'Enter a URL';
                    element = document.createElement('input');
                    element.type = 'url';
                    element.id = 'url-' + urlCounter;
                    element.name = 'url-' + urlCounter;
                    element.placeholder = 'Enter a URL';
                    break;
                case 'h2':
                    h2Counter++;
                    element = document.createElement('input');
                    element.type = 'text';
                    element.id = 'h2-' + h2Counter;
                    element.name = 'h2-' + h2Counter;
                    element.placeholder = 'Subtitle';
                    break;
                case 'pre':
                    preCounter++;
                    element = document.createElement('textarea');
                    element.id = 'pre';
                    element.name = 'pre-' + preCounter;
                    element.id = 'pre-' + preCounter;
                    element.placeholder = 'Write your paragraph';
                    break;
                default:
                    console.error('Invalid tag type');
                    return;
            }

            element.className = 'block lg:w-96 mt-4 p-2 border border-gray-300 rounded';
            if (tag === 'pre') {
                element.className += ' h-32';
            }

            // Add delete button
            const deleteButton = document.createElement('button');
            deleteButton.textContent = 'X';
            deleteButton.className = 'ml-2 bg-red-500 text-white px-2 py-1 rounded';
            deleteButton.onclick = function () {
                container.removeChild(wrapper);
            };

            // Wrap element and delete button
            const wrapper = document.createElement('div');
            wrapper.className = 'items-center mt-4';
            wrapper.appendChild(element);
            wrapper.appendChild(deleteButton);

            if (tag === 'img') {
                const urlInput = document.createElement('input');
                img_urlCounter++;
                urlInput.type = 'url';
                urlInput.id = 'imgurl' + img_urlCounter;
                urlInput.name = 'imgurl-' + img_urlCounter;
                urlInput.placeholder = 'Or enter image URL';
                urlInput.className = element.className;
                wrapper.appendChild(urlInput);
            }

            container.appendChild(wrapper);
        }
    </script>
</body>

</html>