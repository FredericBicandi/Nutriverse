<?php

function nutrinavbar($style)
{
    $uri = explode("?=", $_SERVER['REQUEST_URI']);
    $text_white = " hover:text-[#f7c761] ";
    $title_white = "hover:text-transparent hover:[-webkit-text-stroke:2px_#f7c761] transition-all duration-300";
    $text_title = "Nutriverse";
    $request_cons = "button_color button_text px-4 py-2 rounded-full text-sm font-medium border duration-300 hover:{$text_white}";
    $mobile_menu = "";
    if ($uri[0] == "/nutriverse/about") {
        $text_white = "text-white hover:text-[#f7c761] transition-all duration-300";
    }
    if ($uri[0] == "/nutriverse/products") {
        $text_title = "NutriTracker";
        $title_white = "text-white hover:text-transparent hover:[-webkit-text-stroke:0.9px_white] transition-all duration-300";
        $mobile_menu = "text-white hover:text-[#FFFFFF]";
        $text_white = "text-white hover:text-[#212121] transition-all duration-300";
        $request_cons = "px-4 py-2 rounded-full text-sm font-medium border duration-300 bg-white text-[#5FA69B] md:hover:bg-transparent md:hover:text-white";
    }
    $nutriverse_home = "/nutriverse/";
    $nutriverse_about = "/nutriverse/about";
    $nutriverse_blog = "/nutriblog";
    $nutriverse_products = "/nutriverse/products";
    $nutriverse_request = "/nutriverse/request_form";
    print (" 
    <script>
        AOS.init();
    </script>
    <nav class='{$style} px-6 py-4 md:px-12'>

        <div class='container mx-auto flex items-center justify-between'>
            <h1 class='lg:block hidden ml-32 text-6xl font-semibold leading-normal'>
                <a href='{$nutriverse_home}' class='primary $title_white'><strong>$text_title</strong></a>
            </h1>

            <div class='hidden lg:flex space-x-6 items-center'>
                <a href='{$nutriverse_blog}' class='no-underline text px-2 text-xl $text_white'><b>Blogs</b> </a>
                <a href='{$nutriverse_products}' class='no-underline text px-2 text-xl $text_white '><b>Products</b> </a>
                <a href='{$nutriverse_about}' class='no-underline text px-2 text-xl $text_white'><b>About</b></a>
               ");
    printf("<a href='{$nutriverse_request}' class='{$request_cons}'><b>Request Consultation</b></a>
                </div>");

    printf("
            <div class='lg:hidden'>
                <button id='menu-toggle' class='focus:outline-none'>
                    <svg class='w-6 h-6 $mobile_menu' fill='none' stroke='currentColor' viewBox='0 0 24 24'
                        xmlns='http://www.w3.org/2000/svg'>
                        <path stroke-linecap='round' stroke-linejoin='round' stroke-width='2'
                            d='M4 6h16M4 12h16m-7 6h7'></path>
                    </svg>
                </button>
            </div>
        </div>

        <!-- Mobile Navbar Version -->
        <div id='mobile-menu' class='hidden lg:hidden mt-4'>
            <a href='{$nutriverse_home}' class='block no-underline text px-2 $mobile_menu text-lg'><b>Home</b></a>
            <hr> 
            <a href='{$nutriverse_about}' class='mt-5 block no-underline text px-2 $mobile_menu text-lg'><b>About</b></a>
            <hr>
            <a href='{$nutriverse_blog}' class='mt-5 block no-underline text px-2 $mobile_menu text-lg'><b>Blog</b></a>
            <hr>
            ");

    printf("
           <a href='{$nutriverse_products}' class='mt-5 block no-underline text px-2 $mobile_menu text-lg'><b>Products</b></a>
            <hr>
        ");
    if($uri[0] == "/nutriverse/products")
        printf("
            <div class='text-center'>
         <a href='{$nutriverse_request}' class='mt-5 block  bg-white text-[#1ab394] px-4 py-2 rounded-full'>
                <b>Request Consultation</b></a>");
    else
        printf("
            <div class='text-center'>
         <a href='{$nutriverse_request}' class='mt-5 block  bg-[#f7c761] text-white px-4 py-2 rounded-full'>
                <b>Request Consultation</b></a>");
    print ("
                <hr> 
            </div>
        </nav>");
}



function features_card($delay, $title, $highlited, $describe)
{

    print ("<div data-aos='zoom-in' data-aos-delay='{$delay}' class='bg-white body_text rounded-xl shadow-lg p-8 max-w-80 py-11 mx-auto inline-block mr-5 mt-7'>

                    <h2 class='text-2xl text-gray-800 font-bold'>
                        {$title}
                        <span class='bg-[#F2E8CF] text text-gray-800 px-2'>
                            {$highlited}
                        </span>
                    </h2>

                    <p class='mt-4 body_text text-center'>
                        {$describe}</b>
                    </p>
                </div>");

}



function side_image($image)
{
    print (
        "
        <div class='lg:w-1/2 mt-8 lg:mt-0'>
            <img src='{$image}'class='hidden sm:block w-full max-w-lg mx-auto' data-aos='fade-up'>
        </div>
    ");

}

function side_image2($image)
{
    print (
        "
        <div data-aos='fade-up'  class='w-10/12 mt-8 lg:mt-0 justify-center'>
            <img src='{$image}'class='w-full max-w-lg mx-auto'>
        </div>
    ");

}



function feedback_card($delay, $image, $feedback, $name)
{
    print (
        "<div data-aos='zoom-in' data-aos-delay='{$delay}' class='p-4 shadow-lg rounded-xl'>
            <img src='{$image}' class='mx-auto'>
                <p class='text-center body_text mt-4 text-sm md:text-base'>
                    <span class='bg-[#f0ffff] px-2'>
                        $feedback<br>
                        <strong>$name</strong>
                    </span>
                </p>
        </div>
        "
    );

}



function footer()
{
    print (
        '
        <footer class="bg-gray-800 py-6">
            <div class="container mx-auto px-6 text leading-tight md:px-12 text-center text-gray-300">
                <p>
                    &copy; 2025 NutriVerse. All Rights Reserved.
                </p>
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

    print (
        '
    <!-- FAQ -->
    <section align="center" class="container mx-auto px-6 md:px-12 py-12 items-center lg:justify-between">
        <div class="text-center">
            <h2 class="body_text text-center text-4xl font-semibold leading-normal">
                Still have questions? We have the answers
            </h2>
        </div>

        <!-- Q1 -->
        <div data-aos="zoom-in"
            class="lg:w-auto text-center lg:text-left bg-[#eef3fb] rounded-xl shadow-lg p-5 py-11 w-full mx-auto mt-8">
            <h2 class="body_text  font-semibold leading-normal">
                How can I access the nutritional monitoring?
            </h2>

            <p data-aos="zoom-in" class="mt-5 px-2 text-gray-700">
            You can access Nutriverse Care in three ways: you can request consultions with a dietitian through this page,
                <br> if you do no have a dietiation yet working with you we can help you find one that fits your needs,
                <br> once your request for consultation our team will redirect you to the nearest dietation in your area.
                <br> <br>
                
                You can also access Nutriverse Care through our phone app,
                <br>
            if your are and individual you benefit from our app,
                <br> or if you visit a dietitian who uses this platform.
            </p>
        </div>

        <!-- Q2 -->
        <div data-aos="zoom-in"
            class="lg:w-auto text-center lg:text-left bg-[#eef3fb] rounded-xl shadow-lg p-5 py-11 w-fit mx-auto inline-block mr-5 mt-8">

            <h2 class="body_text  font-semibold leading-normal">
                How does NutriVerse analyze my food?
            </h2>

            <p data-aos="zoom-in" class="mt-5 px-2 text-gray-700">
                NutriVerse uses advanced machine learning technology to analyze your food plate images.
                Once you upload a photo,
                our system identifies the ingredients,
                calculates approximate calorie content,
                and provides detailed nutritional information.
            </p>
        </div>

        <!-- Q3 -->
        <div data-aos="zoom-in"
            class="lg:w-auto text-center lg:text-left bg-[#eef3fb] rounded-xl shadow-lg p-5 py-11 w-fit mx-auto inline-block mr-5 mt-8">

            <h2 class="body_text  font-semibold leading-normal">
                Can I use NutriVerse without a dietician?
            </h2>

            <p data-aos="zoom-in" class="mt-5 px-2 text-gray-700">
                Yes! Individuals can use NutriVerse independently to log meals, receive nutritional insights,
                and set personal goals.
                However, for professional guidance,
                connecting with a dietician through our platform is highly recommended.
            </p>
        </div>
    </section>');

}
?>