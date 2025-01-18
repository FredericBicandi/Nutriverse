<?php
session_start();
require("nutriverse/php/functions/ft_functions.php");
require("nutriverse/php/database/database.php");
include("nutriverse/php/components/material_nutriadmin.php");

if (isset($_SESSION['admin_auth'])) {
    abort(message: "Already logged in");
}
/**
 * Summary of validate
 * @return bool
 *  verify username
 *  if found
 *     verify password
 *  
 */
function validate()
{
    if (isset($_POST['username'])) {
        $username_field = strtolower($_POST['username']);
        $username_check = mysqli_fetch_assoc(
            sql_read(
                query: "SELECT * FROM Admins WHERE username='{$username_field}'"
            )
        )['username'];
        if (!$username_check)
            return false;

        $password = $_POST['password'];
        $password_hash = mysqli_fetch_assoc(
            sql_read(
                query: "SELECT password_hash FROM `Admins`
                WHERE username='$username_field'"
            )
        )['password_hash'];
        if (!password_verify($password, $password_hash)) {
            return false;
        }
    } else {
        return false;
    }
    return true;
}

/**
 * if post request recieved
 * validate user name and password
 *      if not create error message and redirect to login
 *      else
 *           create success validation key
 *           redirect to admin dashboard
 */
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    unset($_SESSION['admin_errors']);
    if (!validate()) {
        $_SESSION['admin_errors'] = 'incorrect username or password';
        header("Location: /nutriadmin/login");
    } else {
        $_SESSION['admin_auth'] = 'VALIDATED';
        header("Location: /nutriadmin/");
        exit;
    }
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NutriAdmin</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
    <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
        rel="stylesheet">
    <style>
        .primary {
            color: #333333;
            transition: color 0.2s ease;
            font-family: Poppins 100;
        }

        .primary:hover {
            color: #007bff;
            font-family: Poppins 100;
        }

        .accent {
            color: #007bff;
            transition: color 0.2s ease;
            font-family: Poppins 100;
        }

        .text {
            color: #333333;
            font-family: Poppins 100;
        }

        html,
        body {
            margin: 0;
            padding: 0;
        }
    </style>
</head>

<body class="w-full h-screen overflow-x-hidden">
    <?= admin_navbar(enable_logout: false) ?>

    <main class="lg:mt-32 lg:ml-12">
        <!-- 
            this section contains:
                title : Admin Panel
                form:
                    input 1: username
                    input 2: password
                    button : login
        -->
        <div class="flex min-h-full flex-col justify-center px-6 py-12 lg:px-8">
            <div class="sm:mx-auto sm:w-full sm:max-w-sm">
                <h2 class="text-center text-4xl font-bold tracking-tight accent">
                    Admin <span class="text">Panel</span>
                </h2>
            </div>

            <div class="mt-10 sm:mx-auto sm:w-full sm:max-w-sm">
                <form class="space-y-6" action="/nutriadmin/login" method="POST">
                    <div>
                        <label for="username" class="block text-sm/6 font-medium text">username</label>
                        <div class="mt-2">
                            <input
                                class="block w-full rounded-md bg-white px-3 py-1.5 text-base text outline outline-1 -outline-offset-1 outline-[#007bff]  placeholder:text-gray-400 focus:outline-2 focus:-outline-offset-2 focus:outline-[#0162ff] sm:text-sm/6"
                                type="text" name="username" id="username" autocomplete="username" required>
                        </div>
                    </div>

                    <div>
                        <div class="mt-2">
                            <label for="password" class="block text-sm/6 font-medium text-gray-900">password</label>
                            <input
                                class="block w-full rounded-md bg-white px-3 py-1.5 text-base text outline outline-1 -outline-offset-1 outline-[#007bff]  placeholder:text-gray-400 focus:outline-2 focus:-outline-offset-2 focus:outline-[#0162ff] sm:text-sm/6"
                                type="password" name="password" id="password" autocomplete="current-password" required>
                        </div>
                    </div>

                    <div>
                        <?= isset($_SESSION['admin_errors']) ? "<p class='mt-3' style='color:red'>{$_SESSION['admin_errors']}</p>" : ''; ?>

                        <button
                            class="flex w-full justify-center rounded-md bg-[#007bff] px-3 py-1.5 text-sm/6 font-semibold text-white shadow-sm hover:bg-[#0162ff] focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2"
                            type="submit">
                            Log in
                        </button>

                    </div>
                </form>
            </div>
        </div>
    </main>

    <?= footer() ?>
</body>

</html>