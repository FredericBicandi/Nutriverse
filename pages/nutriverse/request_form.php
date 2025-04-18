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
                <h1 class="body_text text-6xl leading-tight lg:leading-normal text-[#343a45] font-extrabold lg:font-semibold ">
                    Ready to elevate your <br>
                    <span class="text-white body_text bg-[#f7c761] py-0 px-1">well-being?</span>
                </h1>

                <p class="mt-6 text-lg mb-12 text">
                    Just one step is enough to find out more about <?= Mobile($Device) ? "" : "<br>" ?>
                    <b> how you can change the way you live </b> with healthy <?= Mobile($Device) ? "" : "<br>" ?>eating
                    habits.
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
                        required type="number" name="age" id="age" placeholder="Age*" min="12">

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
                        id="objective_desciption" name="objective_desciption"
                        placeholder="Objective (Optional)"></textarea>

                    <div class="grid grid-cols-2 gap-4">
                        <input
                            class="w-full px-4 py-3 border rounded-md shadow-md focus:ring-2 focus:ring-[#f7c761] focus:outline-none bg-white text-[#8290ac]"
                            id="country_code" name="country_code" type="number" placeholder="country code*">
                        <input
                            class="w-full px-4 py-3 border rounded-md shadow-md focus:ring-2 focus:ring-[#f7c761] focus:outline-none bg-white text-[#8290ac]"
                            id="tel" name="tel" type="tel" placeholder="Mobile phone*">
                    </div>
                    <button algin="center"
                        class="bg-[#f7c761] text-white ml-16 <?= Mobile($Device) ? 'px-16' : 'px-32' ?> py-3 rounded-full text-sm font-medium hover:bg-transparent hover:text-[#363c48] hover:border-[#f7c761] border duration-300"
                        type="submit">Send Request
                    </button>
                </form>
            </div>
        </section>
    </main>

    <?= footer() ?>
</body>

</html>