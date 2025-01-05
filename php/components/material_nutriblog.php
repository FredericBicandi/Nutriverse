<?php

function abort($message)
{
    session_start();
    $_SESSION['error_message'] = $message;
    header("location: abort.php");
    exit();
}

function add_content_button()
{
    print ("<!-- Dropdown Button -->
   <div class='fixed bottom-4 right-4 md:mt-8 flex justify-center'>
        <button id='dropdown-button'
            class='bg-[#231f20] text-white px-4 py-1 rounded-full items-center space-x-2 hover:bg-[#414040]'>
            <span class='text-lg font-bold'>+</span>
            <span class='hidden md:inline text-sm font-semibold'>Add Content</span>
        </button>

        <!-- Dropdown Menu -->
        <div id='dropdown-menu'
            class='hidden left-0 mt-2 bg-white border border-gray-200 shadow-lg rounded-md w-48 z-10'>
            <ul class='py-2'>
                <li>
                    <button onclick=\"addElement('h2')\" class='block w-full px-4 py-2 hover:bg-gray-100'>SubTitle</button>
                </li>
                <li>
                    <button onclick=\"addElement('pre')\" class='block w-full px-4 py-2 hover:bg-gray-100'>Paragraph</button>
                </li>
                <li>
                    <button onclick=\"addElement('img')\" class='block w-full px-4 py-2 hover:bg-gray-100'>Image</button>
                </li>
                <li>
                    <button onclick=\"addElement('a')\" class='block w-full px-4 py-2 hover:bg-gray-100'>URL</button>
                </li>
            </ul>
        </div>
    </div>");
}

function blog_navbar($content)
{
    $nutriblog_nutriverse = "nutriverse/";
    session_start();
    $nutriblog_home = !isset($_SESSION['auth']) ? "blog.php" : "member.php";
    $nutriblog_nutritions = "{$_SERVER['PHP_SELF']}?filter=nutritions";
    $nutriblog_entrepreneur = "{$_SERVER['PHP_SELF']}?filter=entrepreneur";
    $uri = explode('.php', $_SERVER['PHP_SELF'])[0];
    if ($uri != '/project/pages/member' && $uri != '/project/pages/blog') {
        $nutriblog_nutritions = "/project/pages/blog.php?filter=nutritions";
        $nutriblog_entrepreneur = "/project/pages/blog.php?filter=entrepreneur";
    }
    $nutriblog_create_user = "create_user.php";
    $nutriblog_sign_in = "sign_in.php";
    $create_blog = "create_blog.php";
    print ("
    <script>
        AOS.init();
    </script>
        <!-- Navbar -->
        <nav class='px-6 py-2'>
            <div class='container mx-auto flex items-center justify-start'>
                <div class='md:hidden lg:hidden'>
                    <button id='menu-toggle' class='focus:outline-none'>
                        <svg class='w-6 h-6' fill='none' stroke='currentColor' viewBox='0 0 24 24'
                            xmlns='http://www.w3.org/2000/svg'>
                            <path stroke-linecap='round' stroke-linejoin='round' stroke-width='2'
                                d='M4 6h16M4 12h16m-7 6h7'>
                            </path>
                        </svg>
                    </button>
                </div>
                <h1 class='lg:ml-32 sm:ml-4 primary text-4xl font-semibold leading-normal'>
                    <a href='{$nutriblog_home}'><strong>NutriBlog</strong></a>
                </h1>
                <div data-aos='fade-right' data-aos-delay='400' class='absolute mt-96 transform -translate-y-1/2 text hidden md:block'>
                    <h1 class='lg:ml-32 text-white text-6xl font-bold'>
                        <span>
                            {$content} 
                        </span>
                    </h1>
                </div>
                <div class='primary hidden md:flex space-x-6 items-center ml-6 mt-2'>
                    <a data-aos='zoom-out' href='{$nutriblog_nutriverse}' class='px-2 w-fit hover:underline'><b>Home</b></a>
                    <a data-aos-delay='100' data-aos='zoom-out' href='{$nutriblog_nutritions}'
                        class='hover:underline px-2 w-fit'><b>Nutritions</b></a>
                    <a data-aos-delay='200' data-aos='zoom-out' href='{$nutriblog_entrepreneur}'
                        class='hover:underline px-2 w-fit'><b>Entrepreneur</b></a>
                </div>
                <div class='mt-3 ml-auto hidden md:block'>");
    if (!isset($_SESSION['auth'])) {
        print ("
                <a href='{$nutriblog_create_user}' class='px-2 w-fit'><b>Create</b></a>
                <a href='{$nutriblog_sign_in}' class='px-2 w-fit'><b>Sign in</b></a>");
    } else {
        if ($_SERVER['PHP_SELF'] != '/project/pages/create_blog.php')
            print ("<a href='{$create_blog}' class='px-2 w-fit'><b>Write your blog</b></a><hr>");
    }
    print ("
                </div>
            </div>
            <!-- Mobile Navbar Version -->
            <div id='mobile-menu' class='bg-primary hidden md:hidden mt-4'>
                <a data-aos='zoom-out' href='{$nutriblog_nutriverse}' class='px-2 text-lg w-fit'><b>Home</b></a>
                <br>
                <a data-aos-delay='100' data-aos='zoom-out' href='{$nutriblog_nutritions}'
                class='px-2 text-lg w-fit'><b>Nutritions</b></a>
                <br>
                <a data-aos-delay='200' data-aos='zoom-out' href='{$nutriblog_entrepreneur}'
                    class='px-2 text-lg w-fit'><b>Entrepreneur</b></a>
                <br>");
    if (!isset($_SESSION['auth'])) {
        print ("
                <a href='{$nutriblog_create_user}' class='px-2 w-fit'><b>Create</b></a>
                <a href='{$nutriblog_sign_in}' class='px-2 w-fit'><b>Sign in</b></a>
            ");
    } else {
        if ($_SERVER['PHP_SELF'] != '/project/pages/create_blog.php')
            print ("<a href='{$create_blog}' class='px-2 text-lg w-fit'><b>Write your blog</b></a><hr>");
    }
    print ("
            </div>
        </nav>");
}

function blogBox($delay, $id, $image, $title, $describtion, $date)
{
    $nutriblog_content = "blog-content.php";
    print ("
        <div data-aos-delay='{$delay}' data-aos='fade-up' class='border-2 h-fit w-11/12 mt-5 lg:w-3/12'>
            <!-- Col 1  -->
            <a href='{$nutriblog_content}?id={$id}'>
                <img class='hover-steer-left' src='{$image}'>
                <h2 class='text-2xl ml-5 mt-3 title'>{$title}</h2>
            </a>
            <p class='text mt-3 ml-5'>{$describtion}...</p>
            <br>
            <p class='text-xs mb-5 ml-5 text-[#4a4a4a] underline'>$date</p>
        </div>
    ");
}

function content($content)
{
    $raw_content = htmlspecialchars($content);
    $blog_content = explode("<br>", $content);
    $i = 0;
    while ($i < count($blog_content))
        print $blog_content[$i++];
}

function likes()
{
    print ('
    <div class="mt-12 flex items-center space-x-2">
        <!-- Like Button -->
        <button id="likeButton"
            class="flex items-center space-x-2 px-4 py-2 rounded-lg bg-gray-200 hover:bg-gray-300 text-gray-700">
            <!-- Heart Icon -->
            <svg id="likeIcon" xmlns="http://www.w3.org/2000/svg" class="w-6 h-6 text-gray-700"
                viewBox="0 0 24 24" fill="none">
                <path
                    d="M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 6.42 3.42 5 5.5 5c1.74 0 3.41 1.01 4.13 2.44h1.74C15.09 6.01 16.76 5 18.5 5 20.58 5 22 6.42 22 8.5c0 3.78-3.4 6.86-8.55 11.54L12 21.35z" />
            </svg>
            <!-- Like Count -->
            <span id="likeCount" class="text-sm font-medium">0</span>
        </button>
    </div>');
}

function comments()
{
    print ('
            <section class="bg-white dark:bg-gray-900 py-8 lg:py-16 antialiased">
                <div class=" mx-auto px-4">
                    <div class="flex justify-between items-center mb-6">
                        <h2 class="text-lg lg:text-2xl font-bold text-gray-900 dark:text-white">comments</h2>
                    </div>
                    <form class="mb-6">
                        <div
                            class="py-2 px-4 mb-4 bg-white rounded-lg rounded-t-lg border border-gray-200 dark:bg-gray-800 dark:border-gray-700">
                            <label for="comment" class="sr-only">Your comment</label>
                            <textarea id="comment" rows="6"
                                class="px-0 w-full text-sm text-gray-900 border-0 focus:ring-0 focus:outline-none dark:text-white dark:placeholder-gray-400 dark:bg-gray-800"
                                placeholder="Write a comment..." required></textarea>
                        </div>
                        <button type="submit"
                            class="inline-flex items-center py-2.5 px-4 text-xs font-medium text-center text-white bg-primary-700 rounded-lg focus:ring-4 focus:ring-primary-200 dark:focus:ring-primary-900 hover:bg-primary-800">
                            Post comment
                        </button>
                    </form>
                    <article class="p-6 text-base bg-white rounded-lg dark:bg-gray-900">
                        <footer class="flex justify-between items-center mb-2">
                            <div class="flex items-center">
                                <p
                                    class="inline-flex items-center mr-3 text-sm text-gray-900 dark:text-white font-semibold">
                                    <img class="mr-2 w-6 h-6 rounded-full"
                                        src="https://flowbite.com/docs/images/people/profile-picture-2.jpg"
                                        alt="Michael Gough">Michael Gough
                                </p>
                                <p class="text-sm text-gray-600 dark:text-gray-400"><time pubdate datetime="2022-02-08"
                                        title="February 8th, 2022">Feb. 8, 2022</time></p>
                            </div>
                            <button id="dropdownComment1Button" data-dropdown-toggle="dropdownComment1"
                                class="inline-flex items-center p-2 text-sm font-medium text-center text-gray-500 dark:text-gray-400 bg-white rounded-lg hover:bg-gray-100 focus:ring-4 focus:outline-none focus:ring-gray-50 dark:bg-gray-900 dark:hover:bg-gray-700 dark:focus:ring-gray-600"
                                type="button">
                                <svg class="w-4 h-4" aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
                                    fill="currentColor" viewBox="0 0 16 3">
                                    <path
                                        d="M2 0a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3Zm6.041 0a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3ZM14 0a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3Z" />
                                </svg>
                                <span class="sr-only">Comment settings</span>
                            </button>
                            <!-- Dropdown menu -->
                            <div id="dropdownComment1"
                                class="hidden z-10 w-36 bg-white rounded divide-y divide-gray-100 shadow dark:bg-gray-700 dark:divide-gray-600">
                                <ul class="py-1 text-sm text-gray-700 dark:text-gray-200"
                                    aria-labelledby="dropdownMenuIconHorizontalButton">
                                    <li>
                                        <a href="#"
                                            class="block py-2 px-4 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Edit</a>
                                    </li>
                                    <li>
                                        <a href="#"
                                            class="block py-2 px-4 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Remove</a>
                                    </li>
                                    <li>
                                        <a href="#"
                                            class="block py-2 px-4 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Report</a>
                                    </li>
                                </ul>
                            </div>
                        </footer>
                        <p class="text-gray-500 dark:text-gray-400">Very straight-to-point article. Really worth time
                            reading. Thank
                            you! But tools are just the
                            instruments for the UX designers. The knowledge of the design tools are as important as the
                            creation of the design strategy.</p>
                        <div class="flex items-center mt-4 space-x-4">
                            <button type="button"
                                class="flex items-center text-sm text-gray-500 hover:underline dark:text-gray-400 font-medium">
                                <svg class="mr-1.5 w-3.5 h-3.5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
                                    fill="none" viewBox="0 0 20 18">
                                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"
                                        stroke-width="2"
                                        d="M5 5h5M5 8h2m6-3h2m-5 3h6m2-7H2a1 1 0 0 0-1 1v9a1 1 0 0 0 1 1h3v5l5-5h8a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1Z" />
                                </svg>
                                Reply
                            </button>
                        </div>
                    </article>
                    <article class="p-6 mb-3 ml-6 lg:ml-12 text-base bg-white rounded-lg dark:bg-gray-900">
                        <footer class="flex justify-between items-center mb-2">
                            <div class="flex items-center">
                                <p
                                    class="inline-flex items-center mr-3 text-sm text-gray-900 dark:text-white font-semibold">
                                    <img class="mr-2 w-6 h-6 rounded-full"
                                        src="https://flowbite.com/docs/images/people/profile-picture-5.jpg"
                                        alt="Jese Leos">Jese
                                    Leos
                                </p>
                                <p class="text-sm text-gray-600 dark:text-gray-400"><time pubdate datetime="2022-02-12"
                                        title="February 12th, 2022">Feb. 12, 2022</time></p>
                            </div>
                            <button id="dropdownComment2Button" data-dropdown-toggle="dropdownComment2"
                                class="inline-flex items-center p-2 text-sm font-medium text-center text-gray-500 dark:text-gray-40 bg-white rounded-lg hover:bg-gray-100 focus:ring-4 focus:outline-none focus:ring-gray-50 dark:bg-gray-900 dark:hover:bg-gray-700 dark:focus:ring-gray-600"
                                type="button">
                                <svg class="w-4 h-4" aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
                                    fill="currentColor" viewBox="0 0 16 3">
                                    <path
                                        d="M2 0a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3Zm6.041 0a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3ZM14 0a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3Z" />
                                </svg>
                                <span class="sr-only">Comment settings</span>
                            </button>
                            <!-- Dropdown menu -->
                            <div id="dropdownComment2"
                                class="hidden z-10 w-36 bg-white rounded divide-y divide-gray-100 shadow dark:bg-gray-700 dark:divide-gray-600">
                                <ul class="py-1 text-sm text-gray-700 dark:text-gray-200"
                                    aria-labelledby="dropdownMenuIconHorizontalButton">
                                    <li>
                                        <a href="#"
                                            class="block py-2 px-4 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Edit</a>
                                    </li>
                                    <li>
                                        <a href="#"
                                            class="block py-2 px-4 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Remove</a>
                                    </li>
                                    <li>
                                        <a href="#"
                                            class="block py-2 px-4 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Report</a>
                                    </li>
                                </ul>
                            </div>
                        </footer>
                        <p class="text-gray-500 dark:text-gray-400">Much appreciated! Glad you liked it ☺️</p>
                        <div class="flex items-center mt-4 space-x-4">
                            <button type="button"
                                class="flex items-center text-sm text-gray-500 hover:underline dark:text-gray-400 font-medium">
                                <svg class="mr-1.5 w-3.5 h-3.5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
                                    fill="none" viewBox="0 0 20 18">
                                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"
                                        stroke-width="2"
                                        d="M5 5h5M5 8h2m6-3h2m-5 3h6m2-7H2a1 1 0 0 0-1 1v9a1 1 0 0 0 1 1h3v5l5-5h8a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1Z" />
                                </svg>
                                Reply
                            </button>
                        </div>
                    </article>
                    <article
                        class="p-6 mb-3 text-base bg-white border-t border-gray-200 dark:border-gray-700 dark:bg-gray-900">
                        <footer class="flex justify-between items-center mb-2">
                            <div class="flex items-center">
                                <p
                                    class="inline-flex items-center mr-3 text-sm text-gray-900 dark:text-white font-semibold">
                                    <img class="mr-2 w-6 h-6 rounded-full"
                                        src="https://flowbite.com/docs/images/people/profile-picture-3.jpg"
                                        alt="Bonnie Green">Bonnie Green
                                </p>
                                <p class="text-sm text-gray-600 dark:text-gray-400"><time pubdate datetime="2022-03-12"
                                        title="March 12th, 2022">Mar. 12, 2022</time></p>
                            </div>
                            <button id="dropdownComment3Button" data-dropdown-toggle="dropdownComment3"
                                class="inline-flex items-center p-2 text-sm font-medium text-center text-gray-500 dark:text-gray-40 bg-white rounded-lg hover:bg-gray-100 focus:ring-4 focus:outline-none focus:ring-gray-50 dark:bg-gray-900 dark:hover:bg-gray-700 dark:focus:ring-gray-600"
                                type="button">
                                <svg class="w-4 h-4" aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
                                    fill="currentColor" viewBox="0 0 16 3">
                                    <path
                                        d="M2 0a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3Zm6.041 0a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3ZM14 0a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3Z" />
                                </svg>
                                <span class="sr-only">Comment settings</span>
                            </button>
                            <!-- Dropdown menu -->
                            <div id="dropdownComment3"
                                class="hidden z-10 w-36 bg-white rounded divide-y divide-gray-100 shadow dark:bg-gray-700 dark:divide-gray-600">
                                <ul class="py-1 text-sm text-gray-700 dark:text-gray-200"
                                    aria-labelledby="dropdownMenuIconHorizontalButton">
                                    <li>
                                        <a href="#"
                                            class="block py-2 px-4 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Edit</a>
                                    </li>
                                    <li>
                                        <a href="#"
                                            class="block py-2 px-4 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Remove</a>
                                    </li>
                                    <li>
                                        <a href="#"
                                            class="block py-2 px-4 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Report</a>
                                    </li>
                                </ul>
                            </div>
                        </footer>
                        <p class="text-gray-500 dark:text-gray-400">The article covers the essentials, challenges, myths
                            and stages
                            the UX designer should consider while creating the design strategy.</p>
                        <div class="flex items-center mt-4 space-x-4">
                            <button type="button"
                                class="flex items-center text-sm text-gray-500 hover:underline dark:text-gray-400 font-medium">
                                <svg class="mr-1.5 w-3.5 h-3.5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
                                    fill="none" viewBox="0 0 20 18">
                                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"
                                        stroke-width="2"
                                        d="M5 5h5M5 8h2m6-3h2m-5 3h6m2-7H2a1 1 0 0 0-1 1v9a1 1 0 0 0 1 1h3v5l5-5h8a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1Z" />
                                </svg>
                                Reply
                            </button>
                        </div>
                    </article>
                    <article
                        class="p-6 text-base bg-white border-t border-gray-200 dark:border-gray-700 dark:bg-gray-900">
                        <footer class="flex justify-between items-center mb-2">
                            <div class="flex items-center">
                                <p
                                    class="inline-flex items-center mr-3 text-sm text-gray-900 dark:text-white font-semibold">
                                    <img class="mr-2 w-6 h-6 rounded-full"
                                        src="https://flowbite.com/docs/images/people/profile-picture-4.jpg"
                                        alt="Helene Engels">Helene Engels
                                </p>
                                <p class="text-sm text-gray-600 dark:text-gray-400"><time pubdate datetime="2022-06-23"
                                        title="June 23rd, 2022">Jun. 23, 2022</time></p>
                            </div>
                            <button id="dropdownComment4Button" data-dropdown-toggle="dropdownComment4"
                                class="inline-flex items-center p-2 text-sm font-medium text-center text-gray-500 dark:text-gray-40 bg-white rounded-lg hover:bg-gray-100 focus:ring-4 focus:outline-none focus:ring-gray-50 dark:bg-gray-900 dark:hover:bg-gray-700 dark:focus:ring-gray-600"
                                type="button">
                                <svg class="w-4 h-4" aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
                                    fill="currentColor" viewBox="0 0 16 3">
                                    <path
                                        d="M2 0a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3Zm6.041 0a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3ZM14 0a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3Z" />
                                </svg>
                            </button>
                            <!-- Dropdown menu -->
                            <div id="dropdownComment4"
                                class="hidden z-10 w-36 bg-white rounded divide-y divide-gray-100 shadow dark:bg-gray-700 dark:divide-gray-600">
                                <ul class="py-1 text-sm text-gray-700 dark:text-gray-200"
                                    aria-labelledby="dropdownMenuIconHorizontalButton">
                                    <li>
                                        <a href="#"
                                            class="block py-2 px-4 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Edit</a>
                                    </li>
                                    <li>
                                        <a href="#"
                                            class="block py-2 px-4 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Remove</a>
                                    </li>
                                    <li>
                                        <a href="#"
                                            class="block py-2 px-4 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Report</a>
                                    </li>
                                </ul>
                            </div>
                        </footer>
                        <p class="text-gray-500 dark:text-gray-400">Thanks for sharing this. I do came from the Backend
                            development
                            and explored some of the tools to design my Side Projects.</p>
                        <div class="flex items-center mt-4 space-x-4">
                            <button type="button"
                                class="flex items-center text-sm text-gray-500 hover:underline dark:text-gray-400 font-medium">
                                <svg class="mr-1.5 w-3.5 h-3.5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
                                    fill="none" viewBox="0 0 20 18">
                                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"
                                        stroke-width="2"
                                        d="M5 5h5M5 8h2m6-3h2m-5 3h6m2-7H2a1 1 0 0 0-1 1v9a1 1 0 0 0 1 1h3v5l5-5h8a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1Z" />
                                </svg>
                                Reply
                            </button>
                        </div>
                    </article>
                </div>
            </section>
            <script>
                   // Like Button Logic
                const likeButton = document.getElementById("likeButton");
                const likeIcon = document.getElementById("likeIcon");
                const likeCount = document.getElementById("likeCount");

                let isLiked = false;
                let count = 0;

                likeButton.addEventListener("click", () => {
                    isLiked = !isLiked; // Toggle like state
                    count += isLiked ? 1 : -1; // Increment or decrement the like count

                    // Update UI
                    likeCount.textContent = count;
                    likeIcon.setAttribute(
                        "fill",
                        isLiked ? "red" : "none" // Change heart color when liked
                    );
                    likeIcon.classList.toggle("text-red-500", isLiked); // Apply red color via Tailwind when liked
                });</script>
            ');
}

function footer()
{
    print ("
    <footer class='sm:w-screen text-[#4a4a4a] border-[#231f20]'>
        <div class='container mx-auto px-6 md:px-12 text-center py-12'>
            <p>&copy; 2024 NutriVerse. All Rights Reserved.</p>
        </div>
    </footer>
    <script>
        const menuToggle = document.getElementById('menu-toggle');
        const mobileMenu = document.getElementById('mobile-menu');

        menuToggle.addEventListener('click', () => {
            mobileMenu.classList.toggle('hidden');
        });
    </script>");
}
?>