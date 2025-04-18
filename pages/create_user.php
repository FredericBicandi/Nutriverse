<?php
require("nutriverse/php/functions/ft_functions.php");
require("nutriverse/php/database/database.php");
include("nutriverse/php/components/material_nutriblog.php");
session_start();


function validate()
{
    $_SESSION['errors'] = [];
    $data = [];

    if (isset($_POST['fullName'])) {
        $fullname = strip_tags(trim($_POST['fullName']));
        $firstname = explode(' ', $fullname)[0];
        $lastname = explode(' ', $fullname)[1];
        $password = strip_tags($_POST['password']);
        $email = strtolower(strip_tags($_POST['email']));

        if (
            !user_validation_rules($firstname, 'username') ||
            !user_validation_rules($lastname, 'username')
        ) {
            $_SESSION['errors']['fullName'] = 'Please enter both first and last name.';
            return false;
        }

        if (!user_validation_rules($email, 'email')) {
            $_SESSION['errors']['email'] = 'email already found.';
            return false;
        }

        if (!user_validation_rules($password, 'password')) {
            $_SESSION['errors']['password'] = 'your password must be at least 8 charachters.';
            return false;
        } else {
            if ($password != $_POST['confirm_password']) {
                $_SESSION['errors']['confirm_password'] = 'password does not match';
                return false;
            }
        }
        $data = [
            'firstname' => $firstname,
            'lastname' => $lastname,
            'email' => $email,
            'password' => password_hash($password, PASSWORD_DEFAULT)
        ];
    } else {
        $_SESSION['errors']['fullName'] = 'Full name is required.';
        return false;
    }
    return $data;
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $data = [];
    if (!$data = validate()) {
        header("Location: /nutriblog/create.php");
    } else {
        session_unset();
        session_destroy();
        if (
            sql_create(
                query: "INSERT INTO Users (first_name, last_name, email, password_hash) 
                        VALUES 
                        (
                        '{$data['firstname']}',
                        '{$data['lastname']}',
                        '{$data['email']}',
                        '{$data['password']}'
                        )"
            )
        ) {
            session_start();
            $_SESSION['success']['creation_account'] = 'Account Created Succesfully';
            header("Location: /nutriblog/create");
        } else {
            abort(message: "error while creating new account");
        }
    }

}
?>
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
    <link rel="stylesheet" href="https://bicandy-new.42web.io/nutriverse/pages/images/blogstyle.css">
    <link rel="icon" type="image/png" href="https://bicandy-new.42web.io/nutriverse/pages/images/nutriblog_logo.png">
    <link
        href="https://fonts.googleapis.com/css2?family=Arima:wght@100..700&family=Bebas+Neue&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
        rel="stylesheet">

    <!-- Page title -->
    <title>
        Nutriblog
    </title>

    <!-- JavaScript dependencies -->
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
</head>
<body class="w-full h-screen overflow-x-hidden">

    <section>
        <?= blog_navbar(content: false) ?>
    </section>

    <main class="lg:mt-32 lg:ml-12 min-h-screen">

        <div class="flex min-h-full flex-col justify-center px-6 py-12 lg:px-8">
            <div class="sm:mx-auto sm:w-full sm:max-w-sm">
                <h2 class="text-center text-2xl/9 font-bold tracking-tight text-[#231f20]">Create your account
                </h2>
            </div>
            <div class="mt-10 sm:mx-auto sm:w-full sm:max-w-sm">
                <form class="space-y-6" action="/nutriblog/create" method="POST">
                    <div data-aos="zoom-out">
                        <label for="text" class="block text-sm/6 font-medium text-gray-900">Full Name</label>
                        <div class="mt-2">
                            <input type="text" placeholder="eg: John Smith" name="fullName" id="fullname" required
                                class="block w-full rounded-md bg-white px-3 py-1.5 text-base  text-gray-900 outline outline-1 -outline-offset-1 outline-gray-300 placeholder:text-gray-400 focus:outline-2 focus:-outline-offset-2 focus:outline-[#231f20] sm:text-sm/6">
                        </div>
                        <?= isset($_SESSION['errors']['fullName']) ? "<p class='mt-3' style='color:red'>{$_SESSION['errors']['fullName']}</p>" : '' ?>
                    </div>
                    <div data-aos="zoom-out">
                        <label for="email" class="block text-sm/6 font-medium text-gray-900">Email address</label>
                        <div class="mt-2">
                            <input type="email" placeholder="eg: example@domain.com" name="email" id="email"
                                autocomplete="email" required
                                class="block w-full rounded-md bg-white px-3 py-1.5 text-base  text-gray-900 outline outline-1 -outline-offset-1 outline-gray-300 placeholder:text-gray-400 focus:outline-2 focus:-outline-offset-2 focus:outline-[#231f20] sm:text-sm/6">
                        </div>
                        <?= isset($_SESSION['errors']['email']) ? "<p class='mt-3' style='color:red'>{$_SESSION['errors']['email']}</p>" : '' ?>
                    </div>

                    <div data-aos-delay="100" data-aos="zoom-out">

                        <div class="flex items-center justify-between">
                            <label for="password" class="block text-sm/6 font-medium text-gray-900">Password</label>
                        </div>
                        <div class="mt-2">
                            <input type="password" placeholder="Minimum lenght 8" name="password" id="password"
                                autocomplete="current-password" required
                                class="block w-full rounded-md bg-white px-3 py-1.5 text-base text-gray-900 outline outline-1 -outline-offset-1 outline-gray-300 placeholder:text-gray-400 focus:outline-2 focus:-outline-offset-2 focus:outline-[#231f20] sm:text-sm/6">
                        </div>
                        <?= isset($_SESSION['errors']['password']) ? printf("<p class='mt-3' style='color:red'>{$_SESSION['errors']['password']}</p>") : ''; ?>
                    </div>

                    <div data-aos-delay="100" data-aos="zoom-out">
                        <div class="flex items-center justify-between">
                            <label for="password" class="block text-sm/6 font-medium text-gray-900">Confirm
                                Password</label>
                        </div>
                        <div class="mt-2">
                            <input type="password" name="confirm_password" id="confirm_password"
                                autocomplete="current-password" required
                                class="block w-full rounded-md bg-white px-3 py-1.5 text-base text-gray-900 outline outline-1 -outline-offset-1 outline-gray-300 placeholder:text-gray-400 focus:outline-2 focus:-outline-offset-2 focus:outline-[#231f20] sm:text-sm/6">
                        </div>
                        <?= isset($_SESSION['errors']['confirm_password']) ? "<p class='mt-3' style='color:red'>{$_SESSION['errors']['confirm_password']}</p>" : '' ?>
                    </div>

                    <div data-aos-delay="200" data-aos="zoom-out">
                        <button type="submit"
                            class="flex w-full justify-center rounded-md bg-[#231f20] px-3 py-1.5 text-sm/6 font-semibold text-white shadow-sm hover:bg-[#414040] focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2">Create
                            Account</button>
                    </div>

                </form>
                <p class="mt-10 text-center text-sm/6 text-gray-500">
                    Already a member?
                    <a href="/nutriblog/login" class="font-semibold text-[#231f20] hover:text-[#757575]">Sign in to your
                        account</a>

                    <?= isset($_SESSION['success']['creation_account']) ? "<p class='mt-3 text-center' style='color:green'>{$_SESSION['success']['creation_account']}</p>" : '' ?>
                </p>
            </div>
        </div>
    </main>

    <!-- Footer -->
    <?= footer() ?>
</body>

</html>