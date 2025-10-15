<?php include("nutriverse/php/components/material_nutriverse.php"); ?>

<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Meta tags for proper rendering and mobile optimization -->
    <meta charset="UTF-8">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="theme-color" content="#eaedf3">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
    <link rel="stylesheet" href="https://bicandy-new.42web.io/nutriverse/pages/images/style.css">
    <link rel="icon" type="image/png" href="https://bicandy-new.42web.io/nutriverse/pages/images/nutriverse_logo.png">
    <link
        href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300..800;1,300..800&family=Roboto:ital,wght@0,100..900;1,100..900&family=Story+Script&display=swap"
        rel="stylesheet">

    <title>
        nutriverse
    </title>
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


<body class="bg-[#eaedf3] bg-gradient-to-r from-[#eaedf3] to-[#fafcff]">

    <script>
        AOS.init();
    </script>
    <div id="app-loader" class="fixed inset-0 z-[99999] flex items-center justify-center bg-white">
        <div class="h-16 w-16 animate-spin rounded-full border-8 border-[#f7c761]/30 border-t-[#f7c761]"></div>
    </div>

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
                    <span data-aos-delay="200" data-aos="fade-up"
                        class="bg-[#f7c761] text-white font-extrabold py-0 px-5">Real</span>
                    <div class="mt-2">
                        <span data-aos-delay="100" data-aos="fade-up">
                            nutrition
                        </span>
                        <br>
                        within everyone's reach
                </b>
        </div>
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
            <h1 class="ml-64 text-6xl body_text leading-tight lg:leading-normal text-white ">
                <b>
                    <span data-aos-delay="200" data-aos="fade-up"
                        class="bg-[#f7c761] text-white font-bold px-2 py-0">Real</span>
                    <span data-aos-delay="100" data-aos="fade-up" class="font-bold text-white"> nutrition<br>
                        within everyone's reach
                </b></span>
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

        <div name="section title" class="text-3xl lg:text-5xl text-[#343a45]  justify-center text-center">
            <br><br>
            <h1>
                <b>Each person is unique.</b><br>
            </h1>
            <p class="text-3xl">So are our solutions</p>
        </div>

        <section name="For companies"
            class="mt-12 container mx-auto px-6 md:px-12 py-12 flex flex-col lg:flex-row items-center lg:justify-between">
            <div class="lg:w-1/2 text-left ml-12">
                <h1 class="body_text text-4xl font-semibold leading-normal">
                    <span data-aos="fade-up" class="cursive text-white bg-[#f7c761] px-2 py-0 text">For Companies</span>
                    <span <?= Mobile($Device) ? "data-aos='fade-up' data-aos-delay='100'" : "" ?>>
                        that want to<?= !Mobile($Device) ? "<br>" : "" ?>
                    </span>
                    <span <?= Mobile($Device) ? "data-aos='fade-up' data-aos-delay='200'" : "" ?>>
                        change the lives and health <?= !Mobile($Device) ? "<br>" : "" ?>
                    </span>
                    <span <?= Mobile($Device) ? "data-aos='fade-up' data-aos-delay='300'" : "" ?>>
                        of their employees
                    </span>

                </h1>

                <p class="mt-5 px-2 body_text text-md" data-aos="fade-up">Nutriverse Care is a benefit that combines
                    <b>technology,<?= !Mobile($Device) ? "<br>" : "" ?>
                        outstanding
                        dietitians and dynamics </b> to improve <?= !Mobile($Device) ? "<br>" : "" ?>
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

            <div class="lg:w-1/2 text-left ml-12 mt-32">
                <h1 class="body_text text-4xl font-semibold leading-normal">
                    <span data-aos="fade-up" class="cursive text-white bg-[#f7c761] px-2 py-0 text">For People</span>
                    <?= Mobile($Device) ? "<br>" : "" ?>
                    <span <?= Mobile($Device) ? "data-aos='fade-up' data-aos-delay='100'" : "" ?>>
                        who want to <?= !Mobile($Device) ? "<br>" : "" ?>
                    </span>
                    <span <?= Mobile($Device) ? "data-aos='fade-up' data-aos-delay='200'" : "" ?>>
                        improve their eating habits <?= !Mobile($Device) ? "<br>" : "" ?>
                    </span>
                    <span <?= Mobile($Device) ? "data-aos='fade-up' data-aos-delay='300'" : "" ?>>
                        <?= Mobile($Device) ? "<br>" : "" ?> for good<?= !Mobile($Device) ? "<br>" : "" ?>
                    </span>
                </h1>

                <p class="mt-5 px-2 body_text text-md" data-aos="fade-up">
                    Improve your health and well-being with nutrition<?= !Mobile($Device) ? "<br>" : "" ?>
                    appointments and a <b> dietitian a click away,</b>
                    to help you on a<?= !Mobile($Device) ? "<br>" : "" ?>
                    daily basis, whenever you need it.
                </p>
            </div>
        </section>

        <section name="For Dietitians"
            class="container mx-auto px-6 md:px-12 py-12 flex flex-col lg:flex-row items-center lg:justify-between">
            <div class="lg:w-1/2 text-left mb-64 ml-12 mt-32 lg:block">

                <h1 class="body_text text-4xl font-semibold leading-normal">
                    <span class="cursive text-white bg-[#f7c761] px-2 py-0 text">For Dietitians</span>
                    <span <?= Mobile($Device) ? "data-aos='fade-up' data-aos-delay='100'" : "" ?>>
                        who want to<?= !Mobile($Device) ? "<br>" : "" ?>
                    </span>
                    <span <?= Mobile($Device) ? "data-aos='fade-up' data-aos-delay='200'" : "" ?>>
                        grow and optimize their time<?= !Mobile($Device) ? "<br>" : "" ?>
                    </span>
                    <span <?= Mobile($Device) ? "data-aos='fade-up' data-aos-delay='300'" : "" ?>>
                        and resources
                    </span>
                </h1>

                <p class="mt-5 px-2 body_text text-md" data-aos="fade-up">
                    From booking to meal plans, appointments and follow-up,<?= !Mobile($Device) ? "<br>" : "" ?>
                    the nutrition software is the
                    <b>
                        number one choice of <?= !Mobile($Device) ? "<br>" : "" ?>
                        dietitians around the world.
                    </b>
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