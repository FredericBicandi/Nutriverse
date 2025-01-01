<?php include("../php/components/material_nutriblog.php");?>
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
            font-family: Poppins 100;
        }
        .text {
            color: #4a4a4a;
            font-family: Poppins 100;
        }
    </style>
</head>

<body class="bg-gray-100 h-screen">
    <?= blog_navbar(content:'Daily Tips For Everyone') ?>
    <div
        class="bg-[url('https://i0.wp.com/wp.nutrium.com/wp-content/uploads/2024/09/3.png?w=1920&ssl=1')] bg-no-repeat bg-cover w-screen h-1/2 hidden md:block">
    </div>
    
    
    <div data-aos="fade-up" class="relative min-h-screen">
        
        <div class="top-0 left-0 w-full h-full bg-cover bg-center"
            style="background-image: url('your-background-image.jpg'); filter: brightness(80%);"></div>
        <!-- Content Box -->
        <div
            class="absolute lg:left-1/2 lg:-translate-x-1/2 md:translate-y-9 bg-white text-[#bea7a3] border border-[#ddd] lg:w-11/12 sm:w-8/12 p-8 shadow-lg">
            <!-- Title -->
            <h1 class="text-center text-4xl font-bold mb-6 leading-tight">
                Ozempic vs Mounjaro: everything you need to know
            </h1>

            <!-- Time -->
            <p class="text-center text-xs mb-5 ml-5 text-[#4a4a4a]">By <span class=" underline">Manuella Abru </span>
                / <span class="underline"> September 3, 2024</span>
            </p>


            <!-- Description -->
            <p class="text-[#4a4a4a] text-center mb-4">
                GLP-1, Ozempic, Mounjaro. These three words were entirely unfamiliar to most of us just a year ago but
                are now in
                everyone’s mouths and ears.
                
                If you feel that there is too much information on this topic and it's hard to find the answers you need,
                you're in the
                right place.
                
                In this article, we’ll take a closer look at Ozempic vs Mounjaro, exploring how they differ, their
                benefits, side
                effects, costs, and more
            </p>
            <!-- content -->

                <?=content()?>
                <?=likes()?>
                <?=comments()?>

            <div class="text-center bg-white text py-12">
                <footer>
                    <p>&copy; 2024 NutriVerse. All Rights Reserved.</p>
                </footer>
            </div>
        </div>
    </div>

    <script>
        // Like Button Logic
        const likeButton = document.getElementById('likeButton');
        const likeIcon = document.getElementById('likeIcon');
        const likeCount = document.getElementById('likeCount');

        let isLiked = false;
        let count = 0;

        likeButton.addEventListener('click', () => {
            isLiked = !isLiked; // Toggle like state
            count += isLiked ? 1 : -1; // Increment or decrement the like count

            // Update UI
            likeCount.textContent = count;
            likeIcon.setAttribute(
                'fill',
                isLiked ? 'red' : 'none' // Change heart color when liked
            );
            likeIcon.classList.toggle('text-red-500', isLiked); // Apply red color via Tailwind when liked
        });

        const menuToggle = document.getElementById('menu-toggle');
        const mobileMenu = document.getElementById('mobile-menu');

        menuToggle.addEventListener('click', () => {
            mobileMenu.classList.toggle('hidden');
        });
    </script>
</body>

</html>