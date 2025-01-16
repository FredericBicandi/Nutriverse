<?php
include("../components/material_nutriadmin.php");

session_start();

if (isset($_SESSION['admin_auth'])) {
    abort(message: "Already logged in");

}


function validate()
{
    require("../functions/ft_functions.php");
    require("../database/database.php");

    unset($_SESSION['admin_errors']);
    $_SESSION['admin_errors'] = [];
    if (isset($_POST['username'])) {
        $username_field = strtolower($_POST['username']);

        $username_check = mysqli_fetch_assoc(sql_read(query: "SELECT * FROM Admins WHERE username='{$username_field}'"))['username'];
        if (!$username_check)
            return false;
        $password = $_POST['password'];
        $password_hash = mysqli_fetch_assoc(sql_read(query: "SELECT password_hash FROM `Admins` WHERE username='$username_field'"))['password_hash'];
        if (!password_verify($password, $password_hash)) {
            session_unset();
            $_SESSION['admin_errors']['password'] = 'incorrect password';
            return false;
        }
    } else {
        return false;
    }
    return true;
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (!validate()) {
        header("Location: login.php");
    } else {
        session_unset();
        session_destroy();
        session_start();
        $_SESSION['admin_auth'] = 'VALIDATED';
        header("Location: index.php");
        exit();
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
    <main class="lg:mt-32 lg:ml-12 min-h-screen">

        <div class="flex min-h-full flex-col justify-center px-6 py-12 lg:px-8">
            <div class="sm:mx-auto sm:w-full sm:max-w-sm">
                <h2 class="text-center text-4xl font-bold tracking-tight accent">Admin <span class="text">Panel</span>
                </h2>
            </div>

            <div class="mt-10 sm:mx-auto sm:w-full sm:max-w-sm">
                <form class="space-y-6" action="<?= $_SERVER['PHP_SELF'] ?>" method="POST">
                    <div>
                        <label for="username" class="block text-sm/6 font-medium text">username</label>
                        <div class="mt-2">
                            <input type="text" name="username" id="username" autocomplete="username" required
                                class="block w-full rounded-md bg-white px-3 py-1.5 text-base text outline outline-1 -outline-offset-1 outline-[#007bff]  placeholder:text-gray-400 focus:outline-2 focus:-outline-offset-2 focus:outline-[#0162ff] sm:text-sm/6">
                        </div>
                        <?= isset($_SESSION['admin_errors']['username']) ? "<p class='mt-3' style='color:red'>{$_SESSION['admin_errors']['username']}</p>" : ''; ?>
                    </div>

                    <div>
                        <div class="flex items-center justify-between">
                            <label for="password" class="block text-sm/6 font-medium text-gray-900">password</label>
                            <div class="text-sm">
                                <a href="#" class="font-semibold primary">Forgot password?</a>
                            </div>
                        </div>
                        <div class="mt-2">
                            <input type="password" name="password" id="password" autocomplete="current-password"
                                required
                                class="block w-full rounded-md bg-white px-3 py-1.5 text-base text outline outline-1 -outline-offset-1 outline-[#007bff]  placeholder:text-gray-400 focus:outline-2 focus:-outline-offset-2 focus:outline-[#0162ff] sm:text-sm/6">
                        </div>
                        <?= isset($_SESSION['admin_errors']['password']) ? "<p class='mt-3' style='color:red'>{$_SESSION['admin_errors']['password']}</p>" : ''; ?>
                    </div>

                    <div>
                        <button type="submit"
                            class="flex w-full justify-center rounded-md bg-[#007bff] px-3 py-1.5 text-sm/6 font-semibold text-white shadow-sm hover:bg-[#0162ff] focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2">Sign
                            in</button>
                    </div>
                </form>

            </div>
        </div>
    </main>
    <?= footer() ?>
</body>

</html>