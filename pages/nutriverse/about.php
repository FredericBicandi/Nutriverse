<?php include("../../php/components/material_nutriverse.php"); ?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Page</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
    <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
    <style>
        .primary {
            color: #f7c761;
            font-family: Geomanist Medium, sans-serif;
        }

        .text {
            color: #222222;
            font-family: Geomanist Medium, sans-serif;
        }

        .accent {
            color: #F2E8CF;
        }

        .bg_image {
            background-image: url('https://storage.googleapis.com/nutriverse/About_image.jpeg');
            background-size: 100%;
            background-position: center;
        }
    </style>
</head>

<body>
    <script>
        AOS.init();
    </script>

    <!-- Mobile -->
    <section class="bg-gradient-to-r from-[#eaedf3] to-[#fafcff] sm:hidden md:hidden lg:hidden">
        <?= nutrinavbar("") ?>
        <div data-aos="fade-up" class="min-h-screen text-[#343a45]">
            <h1 class="ml-12 text-6xl font-bold">
                <br><br><br>
                <b> <span data-aos-delay="200" data-aos="fade-up" class="bg-[#f7c761] text-white px-2">Real</span>
                    <span data-aos-delay="100" data-aos="fade-up"> nutrition</span><br>
                    within everyone's reach</b>
            </h1>
        </div>
    </section>

    <!-- Medium/large screen -->
    <section class="bg_image bg-no-repeat bg-cover bg-center h-screen hidden sm:block">
        <?= nutrinavbar("") ?>
        <div class="absolute inset-y-1/2 left-10 transform -translate-y-1/2 text-white">
            <h1 class="ml-12 text-6xl font-bold">
                <b> <span data-aos-delay="200" data-aos="fade-up" class="bg-[#f7c761] px-2">Real</span>
                    <span data-aos-delay="100" data-aos="fade-up"> nutrition</span><br>
                    within everyone's reach</b>
            </h1>
        </div>
    </section>


    <section class=" bg-gradient-to-r from-[#eaedf3] to-[#fafcff]">
        <br><br><br>
        <!-- Title -->
        <div data-aos="zoom-in" class="text-3xl lg:text-5xl text-[#343a45]  justify-center text-center">
            <br>
            <br>
            <h1>
                <b>Each person is unique.</b><br>
            </h1>
            <p class="text-3xl">So are our solutions</p>
        </div>

        <!-- For companies -->
        <section
            class="mt-12 container mx-auto px-6 md:px-12 py-12 flex flex-col lg:flex-row items-center lg:justify-between">

            <div class="lg:w-1/2 text-center lg:text-left" data-aos="fade-up">
                <h1 class="text-[#343a46] text-3xl md:text-4xl font-semibold leading-tight">
                    <span class="text-white bg-[#f7c761] px-2">For Companies</span> that want to<br>
                    change the lives and health<br>
                    of their employees
                </h1>
                <p class="mt-5 text-[#343a46]">Nutriverse Care is a benefit that combines <b>technology,<br> outstanding
                        dietitians
                        and dynamics </b> to improve<br>
                    employee <b>health</b>.
                </p>
            </div>
            <!-- Welcome Image -->
            <?= side_image(image: "https://storage.googleapis.com/nutriverse/For%20Companies%20offer.png") ?>
        </section>

        <!-- For People -->
        <section
            class="mt-2 container mx-auto px-6 md:px-12 py-12 flex flex-col lg:flex-row items-center lg:justify-between">
            <!-- Welcome Image -->
            <?= side_image(image: "https://storage.googleapis.com/nutriverse/For%20individuals%20Offer.png") ?>

            <div class="hidden sm:block lg:w-1/2 mt-8 lg:mt-0" data-aos="fade-up">
                <img src="" class="w-full max-w-lg mx-auto">
            </div>
            <div class="lg:w-1/2 text-center lg:text-left" data-aos="fade-up">
                <h1 class="text-[#343a46] text-3xl md:text-4xl font-semibold leading-tight">
                    <br>
                    <span class="text-white bg-[#f7c761] px-2">For People</span> who want to <br> improve their eating
                    habits <br>
                    for good<br>
                </h1>
                <p class="mt-5 text-[#343a46]">Improve your health and well-being with nutrition<br>
                    appointments and a <b> dietitian a click away,</b>to help you on a<br> daily
                    basis, whenever you need it.
                </p>
            </div>
        </section>


        <!-- For Dietitians -->
        <section
            class="container mx-auto px-6 md:px-12 py-12 flex flex-col lg:flex-row items-center lg:justify-between">
            <div class="lg:w-1/2 text-center lg:text-left" data-aos="fade-up">
                <h1 class="text-[#343a46] text-3xl md:text-4xl font-semibold leading-tight">


                    <span class="text-white bg-[#f7c761] px-2">For Dietitians</span> who want to<br>
                    grow and optimize their time <br> and resources
                </h1>
                <p class="mt-5 text-[#343a46]">From booking to meal plans, appointments and follow-up,<br>
                    the nutrition software is the <b>number one choice of <br>
                        dietitians around the world. </b>
                </p>
            </div>
            <?= side_image(image: "https://storage.googleapis.com/nutriverse/For%20Dietitians%20Offer.png") ?>
        </section>
    </section>

    <!-- Footer -->
    <?= footer() ?>
</body>

</html>