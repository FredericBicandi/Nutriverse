<?php include("../../php/components/material_nutriverse.php"); ?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NutriVerse</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
    <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
    <style>
        .button_color {
            background-color: #f7c761;
            border-color: #f7c761;
            font-family: Geomanist Medium, sans-serif; 
        }
        .button_color:hover {
            background-color: transparent;
            border-color: #f7c761;
            font-family: Geomanist Medium, sans-serif; 
        }
        .button_text {
            color: white;
            font-family: Geomanist Medium, sans-serif;
        }
        .button_text:hover {
            color: #222222;
            font-family: Geomanist Medium, sans-serif;
        }

        .primary {
            color: #f7c761;
            transition: color 0.2s ease;
            font-family: Geomanist Medium, sans-serif;
        }

        .primary:hover {
            color: #222222;
            font-family: Geomanist Medium, sans-serif;
        }

        .text_mobile {
            color: #222222;
            font-family: Geomanist Medium, sans-serif;
        }
        .text {
            color: #222222;
            transition: color 0.1s ease;
            font-family: Geomanist Medium, sans-serif;
        }
        .text:hover {
            color: #f7c761;
            font-family: Geomanist Medium, sans-serif;
        }

        .body_text {
            color: #222222;
            font-family: Geomanist Medium, sans-serif;
        }
       
        .bg_image {
            background-image: url('https://storage.googleapis.com/nutriverse/About_image.jpeg');
            background-size: 100%;
            background-position: center;
        }
    </style>
</head>

<body class="bg-gradient-to-r from-[#eaedf3] to-[#fafcff]">

    <!-- Navbar -->
    <?= nutrinavbar("bg-gradient-to-r from-[#eaedf3] to-[#fafcff]") ?>

    <!-- Main Section -->
    <main>
        <!-- Welcom Section -->
        <section
            class="container mx-auto px-6 md:px-12 py-12 flex flex-col lg:flex-row items-center lg:justify-between">
            <div class="lg:w-1/2 text-center lg:text-left" data-aos="fade-up">

                <!-- Your best version ust a click away -->
                <h1 class="body_text text-6xl font-semibold leading-tight">
                    Your <span class="text-white bg-[#f7c761] px-2">best version<br></b></span> just a click away
                </h1>
                <p class="mt-6 text-lg">
                    The <b>ideal dietitian beside you</b>, where and when you want. <br>
                    <b>Your new life begins now!</b>
                </p>
            </div>

            <!-- Plate Image -->
            <div class="lg:w-1/2 mt-8 lg:mt-0" data-aos="zoom-in">
                <img src="https://storage.googleapis.com/nutriverse/healthy-breakfast-bowl.png"
                    alt="Healthy Breakfast Bowl" class="w-full max-w-lg mx-auto">
            </div>
        </section>


        <!-- Features Section -->
        <section class="container mx-auto px-6 md:px-12 py-12 flex flex-col items-center lg:justify-between">

            <!-- A new way to experience nutrition Title -->
            <h2 class="body_text text-center text-4xl font-semibold leading-normal">
                A new way to
                <span class="text-white bg-[#f7c761] px-2">
                    <b data-aos="fade-up">experience nutrition</b>
                </span>
            </h2>
            <p class="mt-5 px-2 text-xl text-center body_text">
                Experience totally personalized nutrition, closer than ever. Because it's easier to achieve
                <b>results when
                    you have the right <br>
                    help by your side.</b>
            </p>

            <!-- Features-->
            <div class="text-center">
                <!-- Features 1 No Extreme changes -->
                <?= features_card(
                    delay: 0,
                    title: "No",
                    highlited: "Extrem Changes",
                    describe: "A <b>strategy adapted to your routines and tastes</b>, without giving up your
                        social life and eating what you like."
                ) ?>
                <!-- Features 2 With Results -->
                <?= features_card(
                    delay: 100,
                    title: "With",
                    highlited: "results",
                    describe: "Always be accompanied by <b> qualified dietitians </b> with real knowledge and
                        experience."
                ) ?>
                <!-- Features 3 No Tricks -->
                <?= features_card(
                    delay: 150,
                    title: "No",
                    highlited: "Tricks",
                    describe: "Overcome the barriers that prevent you from <strong> transforming your life </strong> and achieving your best version."
                ) ?>
            </div>
        </section>

        <!-- Solutions Section -->
        <section class="container mx-auto px-6 md:px-12 py-12 flex flex-col items-center lg:justify-between">

            <div class="text-center">
                <!-- What if from today everything changes? Title-->
                <h2 class="body_text text-center text-4xl font-semibold leading-normal">
                    What if from today
                    <span data-aos="fade-up" class="text-white bg-[#f7c761] px-2">
                        <b>everything changes?</b>
                    </span>
                </h2>
                <p class="mt-5 px-2 text-xl text-center body_text">
                    Achieving your goals is easier with <b>personalized guidance and continuous monitoring</b>.At
                    NutriVerse,you'll find qualified <br>
                    dietitians who are with you far beyond the appointments.
                </p>
            </div>

            <!-- Point 1 Section-->
            <section
                class="container mx-auto px-6 md:px-12 py-12 flex flex-col lg:flex-row items-center lg:justify-between">
                <div class="lg:w-1/2 text-center lg:text-left">
                    <!--  unlimited appointments  -->
                    <h1 class="body_text text-4xl font-semibold leading-normal">
                        Find the right dietitian for <br>
                        you and get access to<br>
                        <span class="text-white bg-[#c9e08a] px-2">
                            <b data-aos="fade-up">unlimited appointments</b></span><br>
                    </h1>
                    <p class="mt-5 px-2 text-xl" data-aos="zoom-in">
                        We help you choose <b>a specialized dietitian</b> who will <br>
                        create a plan adapted to you and give you consultations <br>
                        whenever you need them, wherever you want.
                    </p>
                </div>

                <!--  Dietitians Image  -->
                <?= side_image(image: "https://storage.googleapis.com/nutriverse/unlimited%20appointments.png"); ?>
            </section>

            <!-- Point 2 Section-->
            <section
                class="mt-12 container mx-auto px-6 md:px-12 py-12 flex flex-col lg:flex-row items-center lg:justify-between">
                <!--  Dietitian Support Image  -->
                <?= side_image(image: "https://storage.googleapis.com/nutriverse/Available%20on%20daily%20basis.webp"); ?>

                <div class="lg:w-1/2 text-center lg:text-left">
                    <!-- available a daily basis -->
                    <h1 class="body_text text-4xl font-semibold leading-normal">
                        Never lose motivation with <br>
                        a dietitian always
                        <span class="text-white bg-[#ccb8b8] px-2"><b data-aos="zoom-in">available
                                on a daily basis</b></span><br>
                    </h1>
                    <p data-aos="zoom-in" class="mt-5 px-2 text-xl">
                        Lack of motivation is the biggest enemy of changing <br>
                        habits, which is why a dietitian will always be by your side<br>
                        to <b>help you overcome the challenges of daily life.</b><br>
                    </p>
                </div>
            </section>

            <!-- Point 3 Section-->
            <section
                class="mt-12 container mx-auto px-6 md:px-12 py-12 flex flex-col lg:flex-row items-center lg:justify-between">
                <!-- recipes,e-books and tips -->
                <div class="lg:w-1/2 text-center lg:text-left">
                    <h1 class="body_text text-4xl font-semibold leading-normal">
                        Simplify your diet with the<br>
                        help of <span data-aos="fade-up" class="text-white bg-[#e39269] px-2">
                            <strong>recipes,e-books and
                                <br> tips</strong></span><br>
                    </h1>
                    <p data-aos="zoom-in" class="mt-5 px-2 text-xl">
                        The dietitian will share <b> personalized resources through<br>
                            our mobile app,</b> to ensure that challenges such as lack of <br>
                        time are never obstacles to success
                    </p>
                </div>
                <!-- phone app image -->
                <?= side_image(image: "https://storage.googleapis.com/nutriverse/Recipes%2Ce-books%2Ctips.png"); ?>
            </section>
        </section>

        <!-- Feedback Section -->
        <section class="container mx-auto px-6 md:px-12 py-12">

            <div class="text-center">
                <!-- Results you see, health you can feel Title -->
                <h2 class="text-center text-4xl font-semibold leading-normal">
                    Results you see,
                    <span class="text-white bg-[#f7c761] px-2">
                        <b data-aos="fade-up"> health you can feel</b>
                    </span>
                </h2>
                <p data-aos="fade-up" class="mt-2 text-md font-semibold leading-normal">
                    We've helped millions of people improve their lives through simple changes in their eating habits.
                    <b>The next great success <br> story could be yours.</b>
                </p>

                <!-- Testimonials Grid -->
                <div class="mt-12 grid grid-cols-1 md:grid-cols-3 gap-8">
                    <!-- Testimonial 1 -->
                    <?php
                    $susana = "https://storage.googleapis.com/nutriverse/client-feedback-Susana.webp";
                    feedback_card(
                        delay: 0,
                        image: $susana,
                        feedback: "'I cycle and didn\'t know what to eat to feel full. I\'ve learned to 
                            eat better and now I can do high-intensity workouts without feeling hungry or lacking in strength.'",
                        name: "- Susana"
                    ) ?>
                    <!-- Testimonial 2 -->
                    <?php
                    $Ana = "https://storage.googleapis.com/nutriverse/client-feedback-Ana.webp";
                    feedback_card(
                        delay: 100,
                        image: $Ana,
                        feedback: "I had mobility issues due to being overweight. With the dietitian's help, I changed my
                                    eating habits, improved my health dramatically, and feel amazing!",
                        name: "- Ana"
                    ) ?>

                    <!-- Testimonial 3 -->
                    <?php
                    $Jose = "https://storage.googleapis.com/nutriverse/client-feedback-Jose.webp";
                    feedback_card(
                        delay: 200,
                        image: $Jose,
                        feedback: "I've had an irritable bowel for 15 years. Thanks to my dietitian, I've learned to
                                improve my food choices and have felt better than ever!",
                        name: "- José"
                    ) ?>
                </div>
            </div>
        </section>
        <?= FAQ() ?>
    </main>
    <!-- Footer -->
    <?= footer() ?>
</body>

</html>