<?php include("../php/components/material_nutriblog.php"); ?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nutriblog</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
    <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
        rel="stylesheet">
    <style>
        .bg_image {
            background-image: url('https://storage.googleapis.com/nutriverse/blog-home.png');
            background-size: 120%;
            background-position: center;
        }

        .primary {
            color: #231f20;
            font-family: Poppins 100;
        }

        .text {
            color: #4a4a4a;
            font-family: Poppins 100;
        }

        .hover-steer-left {
            transition: transform 0.5s ease;
            /* Smooth animation effect */
        }

        .hover-steer-left:hover {
            transform: translateX(-20px);
            /* Moves the image 20px to the left */
        }
    </style>
</head>

<body class="h-screen">
 

    <!-- navbar -->
    <section>
        <?= blog_navbar() ?>
        <div class="container mx-auto flex items-center justify-start border-b-2 border-[#231f20]">
    </section>

    <main class="lg:mt-32 lg:ml-12 min-h-screen">
        <div class="flex min-h-full flex-col justify-center px-6 py-12 lg:px-8">
            <div class="sm:mx-auto sm:w-full sm:max-w-sm">
                <h2 class="text-center text-2xl/9 font-bold tracking-tight text-[#231f20]">Sign in to your account
                </h2>
            </div>

            <div class="mt-10 sm:mx-auto sm:w-full sm:max-w-sm">
                <form class="space-y-6" action="<?=$_SERVER['PHP_SELF']?>" method="POST">
                    <div data-aos="zoom-out">
                        <label for="email" class="block text-sm/6 font-medium text-gray-900">Email address</label>
                        <div class="mt-2">
                            <input type="email" name="email" id="email" autocomplete="email" required
                                class="block w-full rounded-md bg-white px-3 py-1.5 text-base text-gray-900 outline outline-1 -outline-offset-1 outline-gray-300 placeholder:text-gray-400 focus:outline-2 focus:-outline-offset-2 focus:outline-[#231f20] sm:text-sm/6">
                        </div>
                    </div>

                    <div data-aos-delay="100" data-aos="zoom-out">
                        <div class="flex items-center justify-between">
                            <label for="password" class="block text-sm/6 font-medium text-gray-900">Password</label>
                            <div class="text-sm">
                                <a href="#" class="font-semibold text-[#231f20] hover:text-[#757575]">Forgot
                                    password?</a>
                            </div>
                        </div>
                        <div class="mt-2">
                            <input type="password" name="password" id="password" autocomplete="current-password"
                                required
                                class="block w-full rounded-md bg-white px-3 py-1.5 text-base text-gray-900 outline outline-1 -outline-offset-1 outline-gray-300 placeholder:text-gray-400 focus:outline-2 focus:-outline-offset-2 focus:outline-[#231f20] sm:text-sm/6">
                        </div>
                    </div>

                    <div data-aos-delay="200" data-aos="zoom-out">
                        <button type="submit"
                            class="flex w-full justify-center rounded-md bg-[#231f20] px-3 py-1.5 text-sm/6 font-semibold text-white shadow-sm hover:bg-[#414040] focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2">Sign
                            in</button>
                    </div>
                </form>

                <p class="mt-10 text-center text-sm/6 text-gray-500">
                    Not a member?
                    <a href="create_user.php" class="font-semibold text-[#231f20] hover:text-[#757575]">Create your
                        account</a>
                </p>
            </div>
        </div>
    </main>
    <!-- Footer -->
    <?= footer() ?>
</body>

</html>

<?php

if (isset($_POST)) {
    print ("TRUE POST");
} else  {
    print ("<h3 style='color:red'>test</h3>");
}

?>