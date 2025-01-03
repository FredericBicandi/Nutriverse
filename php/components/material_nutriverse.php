<?php

function nutrinavbar($style)
{
    $nutriverse_home = "/project/pages/nutriverse/";
    $nutriverse_about = "about.php";
    $nutriverse_blog = "../blog.php";
    $nutriverse_request = "request_form.php";
    print (" 
    <script>
        AOS.init();
    </script>
    <nav class='{$style} px-6 py-4 md:px-12'>
        <div class='container mx-auto flex items-center justify-between'>
            <h1 data-aos='fade-up' class='sm:block hidden ml-32 text-5xl font-semibold leading-normal'>
                <a href='{$nutriverse_home}' class='primary'><strong>NutriVerse</strong></a>
            </h1>
            <div class='hidden md:flex space-x-6 items-center'>
                <a href='{$nutriverse_about}' class='no-underline text px-2 hover:text-[#f7c761]'><b>About</b></a>
                <a href='{$nutriverse_blog}' class='no-underline text px-2 hover:text-[#f7c761]'><b>Blog</b></a>
                <a href='{$nutriverse_request}'
                    class='button_color button_text px-4 py-2 rounded-full text-sm font-medium border duration-300'>
                    <b>Request Consultation</b>
                </a>
            </div>
            <div class='md:hidden'>
                <button id='menu-toggle' class='focus:outline-none'>
                    <svg class='w-6 h-6' fill='none' stroke='currentColor' viewBox='0 0 24 24'
                        xmlns='http://www.w3.org/2000/svg'>
                        <path stroke-linecap='round' stroke-linejoin='round' stroke-width='2'
                            d='M4 6h16M4 12h16m-7 6h7'></path>
                    </svg>
                </button>
            </div>
        </div>


        <!-- Mobile Navbar Version -->
        <div id='mobile-menu' class='hidden md:hidden mt-4'>
            <a href='{$nutriverse_home}' class='block no-underline text_mobile px-2'><b>Home</b></a>
            <hr>
            <a href='{$nutriverse_about}' class='mt-5 block no-underline text_mobile px-2'><b>About</b></a>
            <hr>
            <a href='{$nutriverse_blog}' class='mt-5 block no-underline text_mobile px-2'><b>Blog</b></a>
            <hr>
            <a href='{$nutriverse_request}' class='mt-5 block bg-[#f7c761] text-white px-4 py-2 rounded-full'><b>Request
                    Consultation</b></a>
            <hr>
        </div>
    </nav>
    ");
}

function features_card($delay, $title, $highlited, $describe)
{
    print ("<div data-aos='zoom-in' data-aos-delay='{$delay}'
                    class='bg-white rounded-xl shadow-lg p-8 max-w-80 py-11 mx-auto inline-block mr-5 mt-7'>
                    <h2 class='text-2xl text-gray-800 font-bold'>
                    {$title} <span class='bg-[#F2E8CF] text-gray-800 px-2'>{$highlited}</span>
                    </h2>
                    <p class='mt-4 body_text text-center'>
                        {$describe}</b>
                    </p>
                </div>");
}

function side_image($image)
{
    print ("
    <div class='lg:w-1/2 mt-8 lg:mt-0'>
        <img src='{$image}'class='hidden sm:block w-full max-w-lg mx-auto'>
    </div>");
}

function feedback_card($delay, $image, $feedback, $name)
{
    print (
        "<div data-aos='zoom-in' data-aos-delay='{$delay}' class='p-4 shadow-lg rounded-xl'>
        <img src='{$image}'
        class='mx-auto'>
        <p class='text-center mt-4 text-sm md:text-base'>
        <span class='bg-[#f0ffff] px-2'>
        $feedback<br><strong>$name</strong>
        </span>
        </p>
        </div>"
    );
}

function footer()
{
    print ('
    <footer class="bg-gray-800 py-6">
    <div class="container mx-auto px-6 md:px-12 text-center text-gray-300">
    <p>&copy; 2024 NutriVerse. All Rights Reserved.</p>
    </div>
    </footer>  
    
    <script>
        const menuToggle = document.getElementById("menu-toggle");
        const mobileMenu = document.getElementById("mobile-menu");

        menuToggle.addEventListener("click", () => {
            mobileMenu.classList.toggle("hidden");
        });
    </script>
    ');
}

function FAQ()
{
    print ('
    <!-- FAQ -->
    <section align="center" class="container mx-auto px-6 md:px-12 py-12 items-center lg:justify-between">
        <!-- Title -->
        <div class="text-center">
            <h2 class="body_text text-center text-4xl font-semibold leading-normal">
                Still have questions? We have the answers
            </h2>
        </div>
        <!-- Q1 -->
        <div data-aos="zoom-in"
            class="lg:w-1/2 text-center lg:text-left bg-[#eef3fb] rounded-xl shadow-lg p-5 py-11 w-fit mx-auto inline-block mr-5 mt-16">
            <h2 class="body_text  font-semibold leading-normal">
                How can I access the nutritional monitoring?
            </h2>
            <p data-aos="zoom-in" class="mt-5 px-2 text-gray-700">
                You can access Nutrium Care in three ways: if you have a Gympass subscription, if your company
                enjoys the Nutrium Care
                benefit,<br>
                or if you visit a dietitian who uses this platform.<br>
                <br>
                <br>
                To access nutritional monitoring through Gympass, you must have an active subscription at the
                following levels:<br>
                <br>
            <ul align="left" class="ml-12">
                <li class="list-disc">
                    Silver subscription or higher - Brazil, Mexico and the United States;
                </li>
                <li class="list-disc">
                    Gold subscription or higher - Argentina, Chile, Spain, Italy, Ireland and the United Kingdom;
                </li>
                <li class="list-disc">
                    Premium subscription or higher - Germany.
                </li>
            </ul>

            </p>
        </div>
        <!-- Q2 -->

        <div data-aos="zoom-in"
            class="lg:w-1/2 text-center lg:text-left bg-[#eef3fb] rounded-xl shadow-lg p-5 py-11 w-fit mx-auto inline-block mr-5 mt-8">
            <h2 class="body_text  font-semibold leading-normal">
                How does NutriVerse analyze my food?
            </h2>
            <p data-aos="zoom-in" class="mt-5 px-2 text-gray-700">
                NutriVerse uses advanced machine learning technology to analyze your food plate images. Once you
                upload a photo,our
                system
                identifies the ingredients, calculates approximate calorie content, and provides detailed
                nutritional information.
            </p>
        </div>
        <!-- Q3 -->
        <div data-aos="zoom-in"
            class="lg:w-1/2 text-center lg:text-left bg-[#eef3fb] rounded-xl shadow-lg p-5 py-11 w-fit mx-auto inline-block mr-5 mt-8">
            <h2 class="body_text  font-semibold leading-normal">
                Can I use NutriVerse without a dietician?
            </h2>
            <p data-aos="zoom-in" class="mt-5 px-2 text-gray-700">
                Yes! Individuals can use NutriVerse independently to log meals, receive nutritional insights,
                and set personal goals.
                However, for
                professional guidance, connecting with a dietician through our platform is highly recommended.
            </p>
        </div>
    </section>');
}
?>