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

<body class="bg-gradient-to-r from-[#eaedf3] to-[#fafcff] min-h-screen">
    <!-- Initialize AOS -->
    <script>
        AOS.init();
    </script>

    <!-- Navbar -->
    <?= nutrinavbar("bg-gradient-to-r from-[#eaedf3] to-[#fafcff]") ?>
    <!-- Main Section -->
    <main class="min-h-screen">
        <!-- Welcome Screen -->
        <section
            class="container mx-auto px-6 md:px-12 py-12 flex flex-col lg:flex-row items-center lg:justify-between">
            <div class="lg:w-1/2 lg:mb-32 text-center lg:text-left" data-aos="fade-up">
                <h1 class="body_text text-4xl md:text-6xl font-semibold leading-tight">
                    Ready to elevate your <span class="text-white bg-[#f7c761] px-2">well-being?</span>
                </h1>
                <p class="mt-6 text-lg mb-12">
                    Just one step is enough to find out more about <br>
                    <b> how you can change the yout live </b> with healthy<br>
                    eating habits.
                </p>
            </div>
            <!-- Welcome Image -->
            <div data-aos="fade-up" class="lg:w-1/2 lg:mt-32 min-h-fit">
                <form class="max-w-md mx-auto space-y-4">
                    <input required type="text" placeholder="Name*"
                        class="w-full px-5 py-3 border rounded-md shadow-md focus:ring-2 focus:ring-[#f7c761] focus:outline-none bg-white text-[#8290ac]">
                    <input required type="text" placeholder="Last name*"
                        class="w-full px-4 py-3 border rounded-md shadow-md focus:ring-2 focus:ring-[#f7c761] focus:outline-none bg-white text-[#8290ac]">
                    <input required type="number" placeholder="Age*"
                        class="w-full px-4 py-3 border rounded-md shadow-md focus:ring-2 focus:ring-[#f7c761] focus:outline-none bg-white text-[#8290ac]">
                    <input required type="email" placeholder="Email*"
                        class="w-full px-4 py-3 border rounded-md shadow-md focus:ring-2 focus:ring-[#f7c761] focus:outline-none bg-white text-[#8290ac]">
                    <select
                        class="w-full px-4 py-3 border rounded-md shadow-md focus:ring-2 focus:ring-[#f7c761] focus:outline-none bg-white text-[#8290ac]">
                        <option value="" disabled selected>Country</option>
                        <option value="LB">Lebanon 🇱🇧</option>
                        <option value="QA">Qatar 🇶🇦</option>
                        <option value="AE">UAE 🇦🇪</option>
                    </select>
                    <textarea placeholder="Objective (Optional)"
                        class="w-full px-4 py-3 border rounded-md shadow-md focus:ring-2 focus:ring-[#f7c761] focus:outline-none bg-white text-[#8290ac]"></textarea>
                    <div class="grid grid-cols-2 gap-4">
                        <input type="number" placeholder="country code*"
                            class="w-full px-4 py-3 border rounded-md shadow-md focus:ring-2 focus:ring-[#f7c761] focus:outline-none bg-white text-[#8290ac]">
                        <input type="tel" placeholder="Mobile phone*"
                            class="w-full px-4 py-3 border rounded-md shadow-md focus:ring-2 focus:ring-[#f7c761] focus:outline-none bg-white text-[#8290ac]">
                    </div>
                    <button type="submit"
                        class="ml-16 bg-[#f7c761] text-white px-32 py-3 rounded-full text-sm font-medium hover:bg-transparent hover:text-[#363c48] hover:border-[#f7c761] border duration-300">
                        Send Request</button>
                </form>

            </div>
        </section>

    </main>


    <!-- Footer -->
    <?= footer() ?>
</body>

</html>