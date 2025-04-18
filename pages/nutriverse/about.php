<?php include("nutriverse/php/components/material_nutriverse.php"); ?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="theme-color" content="#EEF1F6">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
    <link rel="stylesheet" href="https://bicandy-new.42web.io/nutriverse/pages/images/style.css">
    <link rel="icon" type="image/png" href="https://bicandy-new.42web.io/nutriverse/pages/images/nutriverse_logo.png">
    <link
        href="https://fonts.googleapis.com/css2?family=Arima:wght@100..700&family=Bebas+Neue&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
        rel="stylesheet">
    <title>
        NutriVerse
    </title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
</head>


<body>

    <script>
        AOS.init();
    </script>


    <!-- 
        this section contains the welcome screen of about for mobile:
        navbar
        title:Real nutrition within everyone's reach
    -->
    <section name="mobile navbar" class="bg-gradient-to-r from-[#eaedf3] to-[#fafcff] sm:hidden md:hidden lg:hidden">
        <?= nutrinavbar("") ?>
        <div data-aos="fade-up" class="min-h-screen text-[#343a45]">
            <h1 class="ml-12 text-6xl font-bold">
                <br><br><br>
                <b>
                    <span data-aos-delay="200" data-aos="fade-up" class="bg-[#f7c761] text-white font-extrabold px-2">
                        Real
                    </span>
                    <span data-aos-delay="100" data-aos="fade-up">
                        nutrition
                    </span>
                    <br>
                    within everyone's reach</b>
            </h1>
        </div>
    </section>

    <!-- 
        this section contains the welcome screen of about for large and meduim screens:
        background image
        navbar
        title:Real nutrition within everyone's reach
    -->
    <section name="navbar" class="bg_image bg-no-repeat bg-cover bg-center h-screen hidden sm:block">
        <?= nutrinavbar("") ?>
        <div class="absolute inset-y-1/2 left-10 transform -translate-y-1/2 text-white">
            <h1 class="text-6xl body_text leading-tight lg:leading-normal text-white ">
                <b>
                    <span data-aos-delay="200" data-aos="fade-up"
                        class="bg-[#f7c761] text-white px-1 py-0 font-bold">Real</span>
                    <span data-aos-delay="100" data-aos="fade-up font-bold"> nutrition</span><br>
                    within everyone's reach
                </b>
            </h1>
        </div>
    </section>

    <!-- 
        this section contains the about content different solutions target audience:
            title: Each person is unique. So are our solutions
            Target audience 1 :  For Companies
                image: teamwork
            
            Target audience 2 : For People
                image: individual client
            
            Target audience 3 : For Dietitians
                image: Dietitian
    -->
    <section class=" bg-gradient-to-r from-[#eaedf3] to-[#fafcff]">
        <br><br><br>

        <div name="section title" data-aos="zoom-in"
            class="text-3xl lg:text-5xl text-[#343a45]  justify-center text-center">
            <br><br>
            <h1>
                <b>Each person is unique.</b><br>
            </h1>
            <p class="text-3xl">So are our solutions</p>
        </div>

        <section name="For companies"
            class="mt-12 container mx-auto px-6 md:px-12 py-12 flex flex-col lg:flex-row items-center lg:justify-between">
            <div class="lg:w-1/2 text-center lg:text-left" data-aos="fade-up">
                <h1 class="body_text text-4xl font-semibold leading-normal">
                    <span class="text-white bg-[#f7c761] px-1 py-0 text">For Companies</span>
                    that want to<br>
                    change the lives and health<br>
                    of their employees
                </h1>

                <p class="mt-5 px-2 body_text text-md">Nutriverse Care is a benefit that combines <b>technology,<br>
                        outstanding
                        dietitians and dynamics </b> to improve<br>
                    employee <b>health</b>.
                </p>
            </div>

            <?= side_image(
                image: $about_ForCompanies
            ) ?>
        </section>

        <section name="For people"
            class="mt-2 container mx-auto px-6 md:px-12 py-12 flex flex-col lg:flex-row items-center lg:justify-between">
            <?= side_image(
                image: $about_ForIndividuals
            ) ?>

            <div class="hidden sm:block lg:w-1/2 mt-8 lg:mt-0" data-aos="fade-up">
                <img src="" class="w-full max-w-lg mx-auto">
            </div>

            <div class="lg:w-1/2 text-center lg:text-left" data-aos="fade-up">
                <h1 class="body_text text-4xl font-semibold leading-normal">
                    <span class="text-white bg-[#f7c761] px-1 py-0 text">For People</span>
                    who want to <br> improve their eating habits <br> for good<br>
                </h1>

                <p class="mt-5 px-2 body_text text-md">
                    Improve your health and well-being with nutrition<br>
                    appointments and a <b> dietitian a click away,</b>to help you on a<br>
                    daily basis, whenever you need it.
                </p>
            </div>
        </section>

        <section name="For Dietitians"
            class="container mx-auto px-6 md:px-12 py-12 flex flex-col lg:flex-row items-center lg:justify-between">
            <div class="lg:w-1/2 text-center lg:text-left" data-aos="fade-up">

                <h1 class="body_text text-4xl font-semibold leading-normal">
                    <span class="text-white bg-[#f7c761] px-1 py-0 text">For Dietitians
                    </span> who want to<br> grow and optimize their time <br> and resources
                </h1>

                <p class="mt-5 px-2 body_text text-md">
                    From booking to meal plans, appointments and follow-up,<br>
                    the nutrition software is the <b>number one choice of <br>
                        dietitians around the world. </b>
                </p>
            </div>

            <?= side_image(
                image: $about_ForDietitians
            ) ?>
        </section>
    </section>

    <?= footer() ?>
</body>

</html>