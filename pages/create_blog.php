<?php include("../php/components/material_nutriblog.php"); ?>


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
            <form method="POST" action="<?= $_SERVER['PHP_SELF'] ?>" id="blog-form" class="space-y-6 text-center">
                <input class="block lg:w-96 p-2 border border-gray-300 rounded mt-6" type="url"
                    placeholder="Your blog cover picture url" id="cover" name="cover" required>

                <input class="block lg:w-96 p-2 border border-gray-300 rounded mt-6" type="text"
                    placeholder="Your blog title" id="title" name="title" required>

                <textarea class="block lg:w-96 p-2 border border-gray-300 rounded mt-6"
                    placeholder="Your blog description" id="desc" name="desc" required></textarea>

                <div class="flex flex-col items-center" id="form-elements-container"></div>

                <button type="submit"
                    class="bg-[#231f20] text-white py-2 px-4 rounded hover:bg-[#414040] focus:ring focus:ring-[#231f20]">
                    Submit Blog
                </button>
            </form>
        </div>
        <?php
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            if (isset($_POST)) {
                session_start();
                echo "<pre>";
                print_r($_POST);
                echo "</pre>";
                $_SESSION['POST']['cover'] = $_POST['cover'];
                $_SESSION['POST']['title'] = $_POST['title'];
                $_SESSION['POST']['desc'] =$_POST['desc'];
                $_SESSION['POST']['content'] = '';
                if ($_POST['h2']) {
                    $_SESSION['POST']['content'] =  $_SESSION['POST']['content']."
                        <h2 class='mt-5 text-black text-3xl'>
                            <strong>{$_POST['h2']}</strong>
                        </h2>
                    <br>";
                }
                print ("
                <iframe class='mt-12' height='800' width='100%' src='http://100.127.90.108/project/pages/blog-content.php?preview=true'>
                    </iframe>");
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
        function addElement(tag) {
            const container = document.getElementById('form-elements-container');
            let element;

            switch (tag) {
                case 'img':
                    element = document.createElement('input');
                    element.type = 'file';
                    element.id = 'img';
                    element.name = 'img';
                    element.accept = 'image/*';
                    element.placeholder = 'Upload an image';
                    break;
                case 'a':
                    element = document.createElement('input');
                    element.type = 'url';
                    element.id = 'url';
                    element.name = 'url';
                    element.placeholder = 'Enter a URL';
                    break;
                case 'h2':
                    element = document.createElement('input');
                    element.type = 'text';
                    element.id = 'h2';
                    element.name = 'h2';
                    element.placeholder = 'Subtitle';
                    break;
                case 'pre':
                    element = document.createElement('textarea');
                    element.id = 'pre';
                    element.name = 'pre';
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
            wrapper.className = 'flex items-center mt-4';
            wrapper.appendChild(element);
            wrapper.appendChild(deleteButton);

            if (tag === 'img') {
                const urlInput = document.createElement('input');
                urlInput.type = 'url';
                urlInput.id = 'url';
                urlInput.name = 'url';
                urlInput.placeholder = 'Or enter image URL';
                urlInput.className = 'block w-64 p-2 border border-gray-300 rounded ml-4';
                wrapper.appendChild(urlInput);
            }

            container.appendChild(wrapper);
        }
    </script>
</body>

</html>