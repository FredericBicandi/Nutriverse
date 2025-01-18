<?php
session_start();
require("nutriverse/php/database/database.php");
include("nutriverse/php/components/material_nutriverse.php");

/**
 * Summary of request_validation_rule
 * @return array|bool
 * when the user send a post request or click submit
 * [16]call the validation rule:
 *      [18-23]name,lastname,country,objective,country_code,tel_prop=strip any html tags AND spaces, 
 *      [24-25]age,email = check var type (INT), (MAIL)
 *       
 */
function request_validation_rule()
{
    $user_info = [];
    if (isset($_POST)) {
        $user_info['name'] = strip_tags(trim($_POST['name']));
        $user_info['lastname'] = strip_tags(trim($_POST['lastname']));
        $user_info['country'] = strip_tags(trim($_POST['country']));
        $user_info['objective'] = strip_tags(trim($_POST['objective_desciption']));
        $user_info['country_code'] = strip_tags(trim($_POST['country_code']));
        $user_info['telProp'] = strip_tags(trim($_POST['tel']));
        $user_info['age'] = filter_var($_POST['age'], FILTER_VALIDATE_INT);
        $user_info['email'] = filter_var($_POST['email'], FILTER_VALIDATE_EMAIL);

        return $user_info;
    }
    return false;
}

/**
 *  if we recieve a post request:
 *  [40] validate input
 *      return error message
 *  [48] send data to database
 *  [60] redirect to page
 */
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $user_info = request_validation_rule();

    if (!isset($user_info)) {
        $_SESSION['request_error'] = "an error occured please try again";
        header("location: /nutriverse/request_form");
    }

    sql_create(
        query: "INSERT INTO `ConsultationRequests` 
                (`name`, `last_name`, `age`,`email`,`country`,`country_code`,`mobile_phone`) 
                VALUES ( 
                '{$user_info['name']}',
                '{$user_info['lastname']}',
                {$user_info['age']},
                '{$user_info['email']}',
                '{$user_info['country']}',
                '{$user_info['country_code']}',
                '{$user_info['telProp']}')
            "
    );
    unset($_SESSION['request_error']);
    unset($_POST);
    $_SESSION["request_success"] = "submitted succesfully";
    header("location: /nutriverse/request_form");
}
?>
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

    <?= nutrinavbar("bg-gradient-to-r from-[#eaedf3] to-[#fafcff]") ?>

    <main class="min-h-screen">
        <!-- 
            this section contains:
                title:Ready to elevate your well-being?
                Form:
                    input 1: name
                    input 2: lastname
                    input 3: age
                    input 4: email
                    input 5: country
                    input 6: objective
                    input 7-8: country_code mobile_phone
        -->
        <section name="Tilte and form"
            class="container mx-auto px-6 md:px-12 py-12 flex flex-col lg:flex-row items-center lg:justify-between">
            <div class="lg:w-1/2 lg:mb-32 text-center lg:text-left" data-aos="fade-up">
                <h1 class="body_text text-4xl md:text-6xl font-semibold leading-tight">
                    Ready to elevate your
                    <span class="text-white bg-[#f7c761] px-2">well-being?</span>
                </h1>

                <p class="mt-6 text-lg mb-12">
                    Just one step is enough to find out more about <br>
                    <b> how you can change the yout live </b> with healthy<br>eating habits.
                </p>
            </div>

            <div data-aos="fade-up" class="lg:w-1/2 lg:mt-32 min-h-fit">
                <form method="POST" action="/nutriverse/request_form" class="max-w-md mx-auto space-y-4">
                    <input
                        class="w-full px-5 py-3 border rounded-md shadow-md focus:ring-2 focus:ring-[#f7c761] focus:outline-none bg-white text-[#8290ac]"
                        type="text" name="name" id="name" placeholder="Name*" required>

                    <input
                        class="w-full px-4 py-3 border rounded-md shadow-md focus:ring-2 focus:ring-[#f7c761] focus:outline-none bg-white text-[#8290ac]"
                        required type="text" name="lastname" id="lastname" placeholder="Last name*">

                    <input
                        class="w-full px-4 py-3 border rounded-md shadow-md focus:ring-2 focus:ring-[#f7c761] focus:outline-none bg-white text-[#8290ac]"
                        required type="number" name="age" id="age" placeholder="Age*">

                    <input
                        class="w-full px-4 py-3 border rounded-md shadow-md focus:ring-2 focus:ring-[#f7c761] focus:outline-none bg-white text-[#8290ac]"
                        required type="email" name="email" id="email" placeholder="Email*">

                    <select
                        class="w-full px-4 py-3 border rounded-md shadow-md focus:ring-2 focus:ring-[#f7c761] focus:outline-none bg-white text-[#8290ac]"
                        id="country" name="country">
                        <option value="" disabled selected>Country</option>
                        <option value="LB">Lebanon 🇱🇧</option>
                        <option value="QA">Qatar 🇶🇦</option>
                        <option value="AE">UAE 🇦🇪</option>
                    </select>

                    <textarea
                        class="w-full px-4 py-3 border rounded-md shadow-md focus:ring-2 focus:ring-[#f7c761] focus:outline-none bg-white text-[#8290ac]"
                        id="objective_desciption" name="objective_desciption" placeholder="Objective (Optional)">
                    </textarea>

                    <div class="grid grid-cols-2 gap-4">
                        <input
                            class="w-full px-4 py-3 border rounded-md shadow-md focus:ring-2 focus:ring-[#f7c761] focus:outline-none bg-white text-[#8290ac]"
                            id="country_code" name="country_code" type="number" placeholder="country code*">
                        <input
                            class="w-full px-4 py-3 border rounded-md shadow-md focus:ring-2 focus:ring-[#f7c761] focus:outline-none bg-white text-[#8290ac]"
                            id="tel" name="tel" type="tel" placeholder="Mobile phone*">
                    </div>
                    <button
                        class="ml-16 bg-[#f7c761] text-white px-32 py-3 rounded-full text-sm font-medium hover:bg-transparent hover:text-[#363c48] hover:border-[#f7c761] border duration-300"
                        type="submit">
                            Send Request
                    </button>
                </form>
            </div>
        </section>
    </main>

    <?= footer() ?>
</body>
</html>