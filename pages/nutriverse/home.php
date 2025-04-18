<?php include("nutriverse/php/components/material_nutriverse.php") ?>

<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Meta tags for proper rendering and mobile optimization -->
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="theme-color" content="#EEF1F6">
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">

  <!-- External resources: Fonts, Styles, and Icons -->
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
  <link rel="stylesheet" href="https://bicandy-new.42web.io/nutriverse/pages/images/style.css">
  <link rel="icon" type="image/png" href="https://bicandy-new.42web.io/nutriverse/pages/images/nutriverse_logo.png">
  <link
    href="https://fonts.googleapis.com/css2?family=Arima:wght@100..700&family=Bebas+Neue&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
    rel="stylesheet">

  <!-- Page title -->
  <title>
    Nutriverse
  </title>

  <!-- JavaScript dependencies -->
  <script src="https://cdn.tailwindcss.com"></script>
  <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
</head>

<!-- Main body with light gradient background -->

<body class="bg-gradient-to-r from-[#eaedf3] to-[#fafcff]">

  <!-- Navigation bar component with background gradient matching body -->
  <?= nutrinavbar("bg-gradient-to-r from-[#eaedf3] to-[#fafcff]") ?>

  <main>
    <!-- Hero Section: Main welcome screen with title, description and hero image -->
    <section name="welcome screen"
      class="container mx-auto px-6 md:px-12 py-12 flex flex-col lg:flex-row items-center lg:justify-between">

      <!-- Title and introduction text - centered on mobile, left-aligned on larger screens -->
      <div name="Welcome screen title" class="lg:ml-32 lg:w-1/2 text-center lg:text-left" data-aos="fade-up">
        <h1 class="text-6xl body_text text-[#343a45] leading-tight lg:leading-normal font-extrabold md:font-bold">
          Your<?= Mobile($Device) ? "<br>" : "" ?>
          <span class="text-white body_text bg-[#f7c761] py-0 px-1 text-6xl">
            best version
          </span>
          <br>just a<?= Mobile($Device) ? "<br>" : "" ?> click away
        </h1>

        <p class="mt-6 text text-lg">
          The <b>ideal dietitian beside you</b>, where and when you want. <br>
          <b>Your new life begins now!</b>
        </p>
      </div>

      <!-- Hero image with animation - takes full width on mobile, half on larger screens -->
      <div name="welcome screen image" class="lg:w-1/2 mt-8 lg:mt-0" data-aos="zoom-in">
        <img src=<?= $home_HealthyBreakfastBowl ?> alt="Healthy Breakfast Bowl" class="w-full max-w-lg mx-auto">
      </div>
    </section>

    <!-- Features Section: Highlighting the main value propositions -->
    <section name="features"
      class="container mx-auto px-6 md:px-12 py-12 flex flex-col items-center lg:justify-between">

      <!-- Features section heading with highlighted text -->
      <h2 name="features" class="mt-32 body_text text-center text-3xl font-semibold ">
        A new way to <?= Mobile($Device) ? "<br>" : "" ?>
        <span class="text-white text bg-[#f7c761] py-0 px-1 font-normal leading-normal">
          <b data-aos="fade-up">
            experience nutrition
          </b>
        </span>
      </h2>

      <!-- Subheading explaining the approach -->
      <p class="mt-6 text text-lg">
        Experience totally personalized nutrition, closer than ever. Because it's easier to achieve
        <b>
          results when
          you have the right <br>
          help by your side.
        </b>
      </p>

      <!-- Three feature cards highlighting key benefits -->
      <div class="text-center">
        <!-- Feature 1: No Extreme Changes -->
        <?= features_card(
          delay: 0,
          title: "No",
          highlited: "Extreme Changes",
          describe: "A <b> way adapted to your routines and tastes </b>,
                      without giving up your social life and eating what you like."
        ) ?>

        <!-- Feature 2: With Results -->
        <?= features_card(
          delay: 100,
          title: "With",
          highlited: "results",
          describe: "Always be accompanied by
                    <b> qualified dietitians </b>
                    with real knowledge and experience."
        ) ?>

        <!-- Feature 3: No Tricks -->
        <?= features_card(
          delay: 150,
          title: "No",
          highlited: "Tricks",
          describe: "Overcome the barriers that prevent you from
                    <strong> transforming your life </strong>
                    and achieving your best version."
        ) ?>
      </div>
    </section>

    <!-- Solutions Section: Showing how the service solves user problems -->
    <section name="solutions"
      class="container mx-auto px-6 md:px-12 py-12 flex flex-col items-center lg:justify-between">

      <!-- Solutions section heading and introduction -->
      <div class="text-center">
        <h2 class="body_text text-center text-3xl font-semibold">
          What if from today
          <span data-aos="fade-up" class="text-white text bg-[#f7c761] px-1 py-0 font-normal">
            <b>everything changes?</b>
          </span>
        </h2>

        <p class="mt-6 text text-lg">
          Achieving your goals is easier with
          <b>personalized guidance and continuous monitoring</b>
          .At NutriVerse,you'll find qualified <br>
          dietitians who are with you far beyond the appointments.
        </p>
      </div>

      <!-- Solution 1: Find the right dietitian with unlimited appointments -->
      <section name="solution 1"
        class="container mx-auto px-6 md:px-12 py-12 flex flex-col lg:flex-row items-center lg:justify-between">

        <!-- Solution 1 text content -->
        <div class="lg:w-1/2 text-center lg:text-left">
          <h1 class="body_text text-4xl font-semibold leading-normal">
            Find the right dietitian for <br>
            you and get access to <br>
            <span class="text text-white bg-[#c9e08a] px-1 font-normal">
              <b data-aos="fade-up">unlimited appointments</b>
            </span>
            <br>
          </h1>

          <p class="mt-5 px-2 body_text text-xl" data-aos="zoom-in">
            We help you choose <b>a specialized dietitian</b>
            who will<br>
            create a plan adapted to you and give you consultations<br>
            whenever you need them, wherever you want.
          </p>
        </div>

        <!-- Solution 1 image - right side on desktop, below on mobile -->
        <?= side_image(
          image: $home_UnlimitedAppointments
        ); ?>
      </section>

      <!-- Solution 2: Daily available dietitian -->
      <section name="solution 2"
        class="mt-12 container mx-auto px-6 md:px-12 py-12 flex flex-col lg:flex-row items-center lg:justify-between">

        <!-- Solution 2 image - left side on desktop, above on mobile -->
        <?= side_image(
          image: "$home_AvailableOnDailyBasis"
        ); ?>

        <!-- Solution 2 text content -->
        <div class="lg:w-1/2 text-center lg:text-left">
          <h1 class="body_text text-4xl font-semibold leading-normal">
            Never lose motivation with<br>
            a dietitian always<br>
            <span class="text font-normal text-white bg-[#ccb8b8] px-1 py-0">
              <b data-aos="zoom-in">available on a daily basis</b>
            </span>
            <br>
          </h1>

          <p data-aos="zoom-in" class="mt-5 px-2 body_text text-xl">
            Lack of motivation is the biggest enemy of changing<br>
            habits, which is why a dietitian will always be by your side<br>
            to <b>help you overcome the challenges of daily life.</b>
            <br>
          </p>
        </div>
      </section>

      <!-- Solution 3: Mobile app for simplified diet management -->
      <section name="solution 3"
        class="mt-12 container mx-auto px-6 md:px-12 py-12 flex flex-col lg:flex-row items-center lg:justify-between">

        <!-- Solution 3 text content -->
        <div class="lg:w-1/2 text-center lg:text-left">
          <h1 class="body_text text-4xl font-semibold leading-normal">
            Simplify your diet with the<br>
            help of<br>
            <span data-aos="fade-up" class="text-white text font-normal bg-[#e39269] px-1">
              <strong>Mobile App</strong>
            </span>
            <br>
          </h1>

          <p data-aos="zoom-in" class="mt-5 px-2 body_text text-xl">
            The dietitian will share
            <b>
              personalized resources through<br>
              our mobile app,
            </b>
            to ensure that challenges such as lack of <br>
            time are never obstacles to success
          </p>
        </div>

        <!-- Solution 3 image - right side on desktop, below on mobile -->
        <?= side_image(
          image: $home_RecipesBooksTips
        ); ?>
      </section>
    </section>

    <!-- Testimonials Section: Social proof and success stories -->
    <section class="container mx-auto px-6 md:px-12 py-12">
      <!-- Section heading and introduction -->
      <div class="text-center">
        <h2 class="body_text text-center text-3xl font-semibold">
          Results you see,
          <span class="text-white text bg-[#f7c761] px-1 py-0 font-normal">
            <b data-aos="fade-up">health you can feel</b>
          </span>
        </h2>

        <p data-aos="fade-up" class="mt-6 text text-lg">
          people who tested our solutions reported an improve in their lives through simple changes in their eating
          habits.
          <b>The next great success <br> story could be yours.</b>
        </p>

        <!-- Testimonial cards - 1 column on mobile, 3 columns on desktop -->
        <div class="mt-12 grid grid-cols-1 md:grid-cols-3 gap-8">
          <!-- Testimonial 1: Susana's story -->
          <?php
          $susana = $home_SusanaImage;
          feedback_card(
            delay: 0,
            image: $susana,
            feedback: "
            'I cycle and didn't know what to eat to feel full. I've learned to 
            eat better and now I can do high-intensity workouts without feeling hungry or lacking in strength.'",
            name: "- Susana"
          ) ?>

          <!-- Testimonial 2: Ana's story -->
          <?php
          $Ana = $home_AnaImage;
          feedback_card(
            delay: 100,
            image: $Ana,
            feedback: "I had mobility issues due to being overweight.
            With the dietitian's help,
            I changed my eating habits,
            improved my health dramatically, and feel amazing!",
            name: "- Ana"
          ) ?>

          <!-- Testimonial 3: José's story -->
          <?php
          $Jose = $home_JoseImage;
          feedback_card(
            delay: 200,
            image: $Jose,
            feedback: "I've had an irritable bowel for 15 years.
            Thanks to my dietitian,
            I've learned to improve my food choices and have felt better than ever!",
            name: "- José"
          ) ?>
        </div>
      </div>
    </section>

    <!-- FAQ Section: Common questions and answers -->
    <?= FAQ() ?>
  </main>

  <!-- Footer with links, contact information and copyright -->
  <?= footer() ?>
</body>

</html>