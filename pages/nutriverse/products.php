<?php include("nutriverse/php/components/material_nutriverse.php");
$hover = 'hover:text-transparent hover:[-webkit-text-stroke:1px_#1ab394] transition-all duration-300';
?>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Meta tags for proper rendering and mobile optimization -->
    <meta charset="UTF-8">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="theme-color" content="#1ab394">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


  <!-- External CSS and Font resources -->
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
  <link rel="stylesheet" href="https://bicandy-new.42web.io/nutriverse/pages/images/style.css">
  <link rel="stylesheet" href="https://bicandy-new.42web.io/nutriverse/pages/images/blogstyle.css">
  <link rel="icon" type="image/png" href="https://bicandy-new.42web.io/nutriverse/pages/images/nutriproduct_logo.png">
  <link
    href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300..800;1,300..800&family=Roboto:ital,wght@0,100..900;1,100..900&family=Story+Script&display=swap"
    rel="stylesheet">
  <title>nutritracker</title>

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

<!-- Body with overflow-x-hidden to prevent horizontal scrolling -->

<body class="w-full overflow-x-hidden">
  <!-- Initialize AOS (Animate on Scroll) library -->
  <script>
    AOS.init();
  </script>

  <div id="app-loader" class="fixed inset-0 z-[99999] flex items-center justify-center bg-white">
    <div class="h-16 w-16 animate-spin rounded-full border-8 border-[#5FA69B]/30 border-t-[#1ab394]"></div>
  </div>
  <!-- Hero Section with gradient background -->
  <div
    class="bg-gradient-to-r from-[#5FA69B] via-[#1ab394] to-[#5FA69B] [background-size:200%_100%] [background-position:85%_0] overflow-x-hidden">
    <!-- Navigation Bar -->
    <?= nutrinavbar("") ?>


    <!-- Main Hero Content -->
    <main>
      <section name="Mobile" class="md:hidden">
        <div data-aos="fade-up" class="min-h-screen text-[#343a45]">
          <h1 class="ml-12 text-6xl text-white font-extrabold">
            <br><br><br>
            <b>
              Nutrition <br>
              tracking <br>
              for
              <span data-aos-delay="200" data-aos="fade-up"
                class="bg-white text-[#1ab394] text-5xl font-extrabold py-0 px-3">
                Real Life
              </span>
            </b>
        </div>
      </section>
      <section
        class="hidden container mx-auto px-6 md:px-12 py-12 lg:flex flex-col lg:flex-row items-center lg:justify-between">
        <!-- Hero Text Content -->
        <div class="lg:ml-32 lg:w-1/2 text-center lg:text-left">
          <h1 class="text-6xl text-white font-extrabold md:font-bold leading-normal">
            Nutrition tracking <br> for
            <?= Mobile($Device) ? "<br>" : "" ?>
            <span class="text_accent bg-white py-0 px-1">
              Real Life
            </span>
          </h1>
          <p class="text-white text-lg mt-2">
            Make progress with the all-in-one food, hydration, and calorie tracker.
            <br>
            <button onclick="document.getElementById('welcome').scrollIntoView({ behavior: 'smooth' });"
              class='mt-5 px-10 py-2 rounded-full text-lg font-medium border duration-300 bg-white text-[#5FA69B] md:hover:bg-transparent md:hover:text-white'>
              <b>START TODAY</b>
            </button>
          </p>
        </div>

        <!-- Hero Image -->
        <div class="w-1/2 mt-8 lg:mt-0 flex justify-center" data-aos="fade-up">
          <img class='max-w-full' src="https://bicandy-new.42web.io/nutriverse/pages/images/nutritracker.png"
            alt="App Welcome image">
        </div>
      </section>
    </main>
  </div>

  <!-- PHP Variables for consistent styling -->
  <?php
  $side_by_side = 'lg:w-1/2 lg:text-left';
  $goal_number = 'text-7xl font-bold leading-normal text-center text_accent';
  $goal_title = 'text-4xl font-semibold leading-normal text-center text-[#212121]';
  $goal_desc = 'text-xl font-normal leading-normal mt-2 text-[#6c6c70] ';
  ?>

  <!-- Feature Section 1: Track calories -->
  <section
    class="mt-32 container mx-auto px-6 md:px-12 py-12 flex flex-col lg:flex-row items-center lg:justify-between overflow-hidden">
    <!-- Left image on desktop, bottom on mobile -->
    <div class="order-last lg:order-first w-full flex justify-center items-center">
      <?= side_image2(
        image: 'https://www.myfitnesspal.com/_next/image?url=%2F_next%2Fstatic%2Fmedia%2Ftrack-food-large.8aa19a25.png&w=512&q=75'
      ); ?>
    </div>

    <!-- Feature 1 text content -->
    <div class="<?= $side_by_side ?> order-first">
      <h1 class="<?= $goal_number ?> <?= $hover ?> lg:text-start">
        1
      </h1>
      <p class="<?= $goal_title ?> text-start ml-12 md:ml-0">
        <span <?= Mobile($Device) ? "data-aos='fade-up' data-aos-delay='100'" : "" ?>>
          Track calories,
        </span>
        <span <?= Mobile($Device) ? "data-aos='fade-up' data-aos-delay='200'" : "" ?>>
          <br> macros & more
        </span>
      </p>
      <p data-aos="fade-up" data-aos-delay="200" class="<?= $goal_desc ?> text-center lg:text-start">
        Log even faster with tools like <?= !Mobile($Device) ? "<br>" : "" ?>
        AI food name nutrifacts & the NEW AI image scan.
      </p>
    </div>
  </section>

  <!-- Feature Section 2: Follow your progress -->
  <section
    class="container mx-auto px-6 md:px-12 py-12 flex flex-col lg:flex-row items-center lg:justify-between overflow-hidden">
    <!-- Feature 2 text content -->
    <div class="<?= $side_by_side ?> order-first">
      <h1 class="<?= $goal_number ?> <?= $hover ?> lg:text-end">
        2
      </h1>
      <p class="<?= $goal_title ?> text-start ml-12 lg:ml-0 lg:text-end">
        <span <?= Mobile($Device) ? "data-aos='fade-up' data-aos-delay='100'" : "" ?>>
          Follow your
        </span>
        <span <?= Mobile($Device) ? "data-aos='fade-up' data-aos-delay='200'" : "" ?>>
          progress <?= !Mobile($Device) ? "<br>" : "" ?>
        </span>

      </p>
      <p data-aos="fade-up" data-aos-delay="200" class="<?= $goal_desc ?> text-start">
        <span class=" lg:ml-28 ">Forget perfection. This is about building<?= !Mobile($Device) ? "<br>" : "" ?></span>
        <span class=" lg:ml-28 ">long-term habit and enjoying<br></span>
        <span class=" lg:ml-28 ">the journey.</span>
      </p>

    </div>

    <!-- Right image on desktop, top on mobile -->
    <div class="order-first lg:order-last w-full flex justify-center items-center">
      <?= side_image2(
        image: 'https://www.myfitnesspal.com/_next/image?url=%2F_next%2Fstatic%2Fmedia%2Flearn-what-works-large.e541991a.png&w=512&q=75'
      ); ?>
    </div>
  </section>

  <!-- Feature Section 3: Eat better and hit your goals -->
  <section
    class="container mx-auto px-6 md:px-12 py-12 flex flex-col lg:flex-row items-center lg:justify-between overflow-hidden">
    <!-- Left image on desktop, bottom on mobile -->
    <div class="order-last lg:order-first w-full flex justify-center items-center">
      <?= side_image2(
        image: 'https://www.myfitnesspal.com/_next/image?url=%2F_next%2Fstatic%2Fmedia%2Fmeal-planning-large.cffea1dd.png&w=512&q=75'
      ); ?>
    </div>

    <!-- Feature 3 text content -->
    <div class="<?= $side_by_side ?> order-first">
      <h1 class="<?= $goal_number ?> <?= $hover ?> lg:text-start">
        3
      </h1>
      <p class="<?= $goal_title ?> lg:text-start">
        <span <?= Mobile($Device) ? "data-aos='fade-up' data-aos-delay='100'" : "" ?>>Eat better and hit</span>
        <span <?= Mobile($Device) ? "data-aos='fade-up' data-aos-delay='200'" : "" ?>>your goals</span>
      </p>
      <p data-aos="fade-up" data-aos-delay="200" class="<?= $goal_desc ?> text-center lg:text-start">
        Learn which foods help you feel your best,<?= Mobile($Device) ? "" : "<br>" ?> and get AI suggestions weekly
        meal
        plans!
      </p>
    </div>
  </section>

  <!-- Get Started Section with gradient background -->
  <div
    class="mt-96 bg-gradient-to-r from-[#5FA69B] via-[#1ab394] to-[#5FA69B] [background-size:200%_100%] [background-position:85%_0] overflow-x-hidden">
    <section id="goals" class="container flex flex-col lg:flex-row items-center justify-center md:h-[80vh]">
      <!-- Get Started text content -->
      <div class="<?= $side_by_side ?> lg:text-end ml-5">
        <h1 class="mt-32 font-semibold lg:text-start text-white text-3xl text-center">
          <h1 class="mt-32 font-semibold lg:text-start text-white text-3xl text-center">
            <h1 class="mt-32 font-semibold lg:text-start text-white text-6xl text-center">
              Get Started
            </h1>
            <p class="font-bold sm:font-extrabold mt-2 text-3xl md:text-3xl lg:text-start text-white">
              Starting is the hard part
            </p>
            <p class="font-normal mt-2 text-2xl md:text-3xl lg:text-start cursive text-white">
              We make it easy
            </p>
      </div>

      <!-- App survey image -->
      <img data-aos="fade-up" class="w-1/3 lg:w-1/6 lg:self-end mt-32 lg:mt-0 rounded-t-xl"
        src="https://bicandy-new.42web.io/nutriverse/pages/images/app%20survey.jpg">
    </section>
  </div>

  <!-- Philosophy Section: Knowledge is power -->
  <section class="mt-32 md:mt-64 mb-32 md:mb-64 container flex flex-col lg:flex-row items-center justify-center">
    <!-- Triple image display -->
    <div class="container flex flex-row items-center justify-center self-center">
      <img data-aos="fade-up" data-aos-delay='200' class=" w-24 lg:w-1/6 lg:self-center "
        src="https://www.myfitnesspal.com/_next/image?url=%2F_next%2Fstatic%2Fmedia%2Frunning-full.47a28cc6.png&w=512&q=75">
      <img data-aos="fade-up" class="rounded-3xl w-32 lg:w-1/3 lg:self-end ml-5 mr-5"
        src="https://www.myfitnesspal.com/_next/image?url=%2F_next%2Fstatic%2Fmedia%2Fdietician-large.b7f105f2.png&w=1080&q=75">
      <img data-aos="fade-up" data-aos-delay='100' class="w-24 lg:w-1/6 lg:self-center lg:mr-10"
        src="https://www.myfitnesspal.com/_next/image?url=%2F_next%2Fstatic%2Fmedia%2Ffood-full.9c63c65e.png&w=512&q=75">
    </div>

    <!-- Philosophy text content -->
    <div class="<?= $side_by_side ?> lg:text-end">
      <h1 class="<?= $goal_desc ?>font-semibold text-center text-2xl mt-2">
        Our Philosophy
      </h1>
      <h1 class="<?= $goal_title ?> font-extrabold lg:text-start text-5xl">
        Knowledge is power
      </h1>
      <p class="<?= $goal_desc ?> font-bold mt-2 text-md lg:text-3xl text-center lg:text-start p-8 lg:p-0">
        "Studies show people who keep a food diary are more likely to hit their goals. Nutritracker simplifies
        nutrition and calorie tracking, provides the data you want, and helps you make sense of it all.
      </p>
      <p class="<?= $goal_desc ?> font-normal mt-2 text-md lg:text-3xl text-center lg:text-start p-8 lg:p-0">
        Healthy eating is a continuous journey of self-discovery. And the more you track, the more empowered you'll
        become to make healthy choices that support your goals."
      </p>
    </div>
  </section>

  <!-- Welcome Section Header -->
  <div id="welcome" class="justify-center items-center text-center">
    <h1 class="<?= $goal_desc ?> text-3xl">
      Welcome to
    </h1>
    <h1 class="body_text font-bold leading-normal text-center text-[#1BB394] text-6xl <?= $hover ?>">
      Nutritracker
    </h1>
  </div>

  <!-- Value Proposition Section: Three columns with images and text -->
  <div class="mt-12 md:mt-12 md:mb-8 flex flex-col md:flex-row self-center items-center justify-center">
    <!-- Value prop 1 -->
    <div class="flex flex-col items-center justify-center self-center mb-12">
      <img data-aos="fade-up" data-aos-delay="200" class="w-1/2 lg:w-72 rounded-3xl mb-2"
        src="https://www.myfitnesspal.com/_next/image?url=%2F_next%2Fstatic%2Fmedia%2Fvalue-prop-1.51bb606c.png&w=1200&q=75">
      <h1 class="<?= $goal_desc ?> font-extrabold lg:text-center">
        Ready for some wins?<br> Start tracking, it's easy!
      </h1>
    </div>

    <!-- Value prop 2 -->
    <div class="flex flex-col items-center justify-center self-center mb-12">
      <img data-aos="fade-up" class="rounded-3xl w-1/2 lg:w-72 mb-2 lg:mr-12 lg:ml-12"
        src="https://www.myfitnesspal.com/_next/image?url=%2F_next%2Fstatic%2Fmedia%2Fvalue-prop-2.66444795.png&w=1200&q=75">
      <h1 class="<?= $goal_desc ?> font extrabold lg:text-center">
        Discover the impact of<br> your food and fitness
      </h1>
    </div>

    <!-- Value prop 3 -->
    <div class="flex flex-col items-center justify-center self-center mb-12">
      <img data-aos="fade-up" data-aos-delay="100" class="w-1/2 lg:w-72 rounded-3xl mb-2"
        src="https://www.myfitnesspal.com/_next/image?url=%2F_next%2Fstatic%2Fmedia%2Fvalue-prop-3.258be271.png&w=1200&q=75">
      <h1 class="<?= $goal_desc ?> font-extrabold lg:text-center">
        And make mindful eating<br> a habit for life
      </h1>
    </div>
  </div>

  <!-- Download App Section Header -->
  <div id="welcome" class="justify-center items-center text-center">
    <h1 class="<?= $goal_desc ?> text-3xl">
      Scan The Qr Code below To
    </h1>
    <h1 class="body_text font-bold leading-normal text-center text- text-6xl text-transparent [-webkit-text-stroke:1px_#212121] transition-all duration-300">
      Download The App
    </h1>
  </div>

  <!-- Download QR Code Section -->
  <div class="mt-12 md:mt-12 md:mb-64 flex flex-col md:flex-row self-center items-center justify-center">
    <!-- Android QR Code -->
    <div class="flex flex-col items-center justify-center self-center mb-12">
      <img data-aos="fade-up" data-aos-delay="200" class="w-1/3 lg:w-32 rounded-3xl mb-2"
        src="https://bicandy-new.42web.io/nutriverse/pages/images/qr_code.png">
      <h1 class="<?= $goal_desc ?> font-extrabold lg:text-center">
        Android
      </h1>
    </div>

    <!-- iOS QR Code -->
    <div class="flex flex-col items-center justify-center md:ml-32 self-center mb-12">
      <img data-aos="fade-up" data-aos-delay="200" class="w-1/3 lg:w-32 rounded-3xl mb-2"
        src="https://bicandy-new.42web.io/nutriverse/pages/images/qr_code.png">

      <h1 class="<?= $goal_desc ?> font-extrabold lg:text-center">
        ios
      </h1>
    </div>
  </div>

  <!-- Footer Section -->
  <?= footer() ?>
</body>

</html>