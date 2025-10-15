<?php include("nutriverse/php/components/material_nutriverse.php") ?>

<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Meta tags for proper rendering and mobile optimization -->
  <meta charset="UTF-8">
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="apple-mobile-web-app-status-bar-style" content="black">
  <meta name="theme-color" content="#eaedf3">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  
  <!-- External resources: Fonts, Styles, and Icons -->
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
  <link rel="stylesheet" href="https://bicandy-new.42web.io/nutriverse/pages/images/style.css">
  <link rel="icon" type="image/png" href="https://bicandy-new.42web.io/nutriverse/pages/images/nutriverse_logo.png">
  <link
    href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300..800;1,300..800&family=Roboto:ital,wght@0,100..900;1,100..900&family=Story+Script&display=swap"
    rel="stylesheet">

  <!-- Page title -->
  <title> nutriverse </title>

  <!-- JavaScript dependencies -->
  <script src="https://cdn.tailwindcss.com"></script>
  <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
  <script>

    // Wait for <img> tags
    function waitForTagImages() {
      const imgs = Array.from(document.images);
      return Promise.all(imgs.map(img =>
        img.complete ? Promise.resolve() :
          new Promise(res => {
            img.addEventListener('load', res, { once: true });
            img.addEventListener('error', res, { once: true }); // don't block forever on errors
          })
      ));
    }

    // Wait for background-image URLs in computed styles
    function waitForBackgroundImages() {
      const urls = new Set();
      Array.from(document.querySelectorAll('*')).forEach(el => {
        const bg = getComputedStyle(el).backgroundImage;
        const match = bg && bg.match(/url\(([^)]+)\)/g);
        if (match) match.forEach(m => urls.add(m.replace(/^url\(["']?/, '').replace(/["']?\)$/, '')));
      });
      const loaders = Array.from(urls).map(src => new Promise(res => {
        const i = new Image();
        i.onload = i.onerror = res;
        i.src = src;
      }));
      return Promise.all(loaders);
    }

    // Wait for web fonts too
    const fontsReady = ('fonts' in document) ? document.fonts.ready : Promise.resolve();

    // Window 'load' covers most subresources, but we also explicitly wait for bg images & fonts
    const fullReady = Promise.all([
      new Promise(res => window.addEventListener('load', res, { once: true })),
      waitForTagImages(),
      waitForBackgroundImages(),
      fontsReady
    ]);

    fullReady.then(() => {
      // If you initialize AOS or other libs, do it here
      // AOS.init({ once: true });
      const loader = document.getElementById('app-loader');
      if (loader) loader.remove();
      document.documentElement.classList.add('page-loaded');
    });
  </script>
</head>

<!-- Main body with light gradient background -->

<body class="bg-[#eaedf3] bg-gradient-to-r from-[#eaedf3] to-[#fafcff]">

  <!-- Navigation bar component with background gradient matching body -->
  <?= nutrinavbar("bg-gradient-to-r from-[#eaedf3] to-[#fafcff]") ?>
  <div id="app-loader" class="fixed inset-0 z-[99999] flex items-center justify-center bg-white">
    <div class="h-16 w-16 animate-spin rounded-full border-8 border-[#f7c761]/30 border-t-[#f7c761]"></div>
  </div>

  <main>
    <!-- Hero Section: Main welcome screen with title, description and hero image -->
    <section name="welcome screen"
      class="container mx-auto px-6 md:px-12 py-12 flex flex-col lg:flex-row items-center lg:justify-between">

      <section name="mobile navbar" class="bg-gradient-to-r from-[#eaedf3] to-[#fafcff] sm:hidden md:hidden lg:hidden">
        <div data-aos="fade-up" class="min-h-screen text-[#343a45]">
          <h1 class="ml-12 text-6xl font-bold">
            <br><br>
            <b>
              <span data-aos-delay="200" data-aos="fade-up"
                class="bg-[#f7c761] text-white font-extrabold py-0 px-5">Your</span>
              best version just a click away
            </b>
          </h1>
        </div>
      </section>


      <div <?= Mobile($Device) ? "class='hidden'" : "" ?> class="lg:ml-20 lg:w-1/2 text-center lg:text-left"
        data-aos="fade-up">
        <h1
          class="<?= Mobile($Device) ? "text-start text-6xl body_text text-[#343a45] leading-tight lg:leading-normal font-extrabold md:font-bold" : "text-6xl body_text text-[#343a45] leading-tight lg:leading-normal font-extrabold md:font-bold" ?>">
          Your<?= Mobile($Device) ? "<br>" : "" ?>
          <span class="text-white bg-[#f7c761] py-0 px-1 text-6xl">
            best version
          </span>
          <br> <span>just a click</span><?= Mobile($Device) ? "<br>" : "" ?> away
        </h1>

        <p class="<?= Mobile($Device) ? "text-start start mt-6 text text-lg" : "mt-6 text text-lg" ?>">
          The <b>ideal dietitian beside you</b>, where and when you want.<?= Mobile($Device) ? "" : "<br>" ?>
          <b>Your new life begins now!</b>
        </p>
        <?= Mobile($Device) ? "<br><br>" : "" ?>
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
        <span class="text-white bg-[#f7c761] py-0 px-2 font-normal leading-normal">
          <b data-aos="fade-up">
            experience nutrition
          </b>
        </span>
      </h2>

      <!-- Subheading explaining the approach -->
      <p class="mt-6 text text-lg">
        Experience totally personalized nutrition, closer than ever. Because it's easier to achieve
        <b>
          results when you have the right <?= !Mobile($Device) ? "<br>" : "" ?>
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
          <span data-aos="fade-up" class="text-white bg-[#f7c761] py-0 px-2 font-normal">
            <b>everything changes?</b>
          </span>
        </h2>

        <p class="mt-6 text text-lg">
          Achieving your goals is easier with
          <b>personalized guidance and continuous monitoring.</b>
          At NutriVerse, you'll find qualified <?= !Mobile($Device) ? "<br>" : "" ?>
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
            <span class="cursive text-white bg-[#c9e08a] py-0 px-2 font-normal">
              <b data-aos="fade-up" <?= !Mobile($Device) ? "" : "class='text-3xl'" ?>>unlimited appointments</b>
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
          image: "https://bicandy-new.42web.io/nutriverse/pages/images/dietitian.png"
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
            <span class="cursive font-normal text-white bg-[#ccb8b8] px-2 py-0">
              <b data-aos="zoom-in" <?= !Mobile($Device) ? "" : "class='text-xl'" ?>>available on a daily basis</b>
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
            Simplify your diet with the <?= !Mobile($Device) ? "<br>" : "" ?>
            help of
            <?= Mobile($Device) ? "<br>" : "" ?>
            <span data-aos="fade-up" class="cursive text-white font-normal bg-[#e39269] py-0 px-2">
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
          image: "https://bicandy-new.42web.io/nutriverse/pages/images/mmtFeature.png"
        ); ?>
      </section>
    </section>

    <!-- Testimonials Section: Social proof and success stories -->
    <section class="container mx-auto px-6 md:px-12 py-12 justify-between">
      <!-- Section heading and introduction -->
      <div class="text-center">
        <h2 class="body_text text-3xl font-semibold">
          Results you see,
          <?= Mobile($Device) ? "<br>" : "" ?>
          <span class="text-white bg-[#f7c761] px-2 py-0 font-normal">
            <b data-aos="fade-up">health you can feel</b>
          </span>
        </h2>

        <p data-aos="fade-up" class="mt-6 text text-lg">
          people who tested our solutions reported an improve in their lives through simple changes in their eating
          habits.
          <b>
            The next great success story <?= !Mobile($Device) ? "<br>" : "" ?> could be yours.
          </b>
        </p>

        <!-- Testimonial cards - 1 column on mobile, 3 columns on desktop -->
        <div class="mt-12 grid grid-cols-1 md:grid-cols-3 gap-8">
          <!-- Testimonial 1: Susana's story -->
          <?php
          $helena = $home_helena;
          feedback_card(
            delay: 0,
            image: $helena,
            feedback: "
            '“If you use the app over time, you will learn a lot about food and diet.
            You easily get an overview of what you are getting.
            Whether you just want to eat healthy and get clean food, or if you want to lose weight,
            build muscle or gain weight, you get a good overview of the daily intake of nutrients.
            If you want to lose weight, for example, protein is an important macronutrient to get a lot of.
            It costs the body quite a bit to break down and it is very filling”",
            name: "- Helena"
          ) ?>

          <!-- Testimonial 2: Ana's story -->
          <?php
          $Marianne = $home_Marianne;
          feedback_card(
            delay: 100,
            image: $Marianne,
            feedback: "“The best thing about Lifesum is the full overview you get on your nutrition. 
            I’ve learnt how to prioritize my food which makes me even more motivated to continue my journey. 
            I’ve tried other similar apps before, but Lifesum is really easy to use and stick to.”",
            name: "- Marianne"
          ) ?>

          <!-- Testimonial 3: José's story -->
          <?php
          $John = $home_John;
          feedback_card(
            delay: 200,
            image: $John,
            feedback: "“Without Lifesum, my life would have become a roller coaster.
            It had taken significantly more time to find the optimal diet for me.
            And if I found it, it would have been more difficult to get it implemented without Lifesum”",
            name: "- John"
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