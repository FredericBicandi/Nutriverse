<?php

function abort($message)
{
    session_start();
    $_SESSION['error_message'] = $message;
    header("location: abort.php");
    exit();
}

function admin_navbar($enable_logout)
{
    $nutriadmin_home = "/project/php/nutriAdmin/";
    $nutriadmin_login = $nutriadmin_home . "?logout";
    print ("
        <script>
            AOS.init();
        </script>
        <!-- Navbar -->
        <nav class='w-screen fixed py-2 top-0 bg-white shadow-md z-50'>
            <div class='bg-white w-screen container mx-auto flex items-center justify-start'>
                <h1 class='lg:ml-32 sm:ml-4 primary text-4xl font-semibold leading-normal'>
                    <a href='{$nutriadmin_home}'><strong><span class='accent'>Nutri</span>Admin</strong></a>
                </h1> 
        ");
    if ($enable_logout)
        echo "
    <div class='ml-auto text-xl mr-8 hidden md:block'> <a href='{$nutriadmin_login}' class='px-2 w-fit primary'> 
        <b>Logout</b></a>
    </div>";
    print ("</nav>");

}

function admin_blogBox($id, $accepted, $image, $title, $describtion, $date)
{
    $nutriblog_content = "../../pages/blog-content.php";
    print ("
        <div id='blog_{$id}' class='border-2 h-fit w-11/12 mt-5 lg:w-3/12'>
            <!-- Col 1  -->
            <a href='{$nutriblog_content}?id={$id}'>
                <img class='hover-steer-left' src='{$image}'>
                <h2 class='text-2xl ml-5 mt-3 title'>{$title}</h2>
            </a>
            <p class='text mt-3 ml-5'>{$describtion}...</p>
            <br>
            <div class='flex justify-between leading-6 mr-8'> 
                <p class='text-xs mb-5 ml-5 text-[#4a4a4a] underline'>$date</p>
                <button onclick='ft_ajax(\"blog_{$id}\", \"index.php?delBlog={$id}\", true, \"Are you sure delete?\")'>
                    <p class='bg-red-500 hover:bg-red-600 rounded-sm w-fit h-fit px-1'>
                        <span class='hover:underline text-white'>Delete</span>🗑
                    </p>
                </button>");
    if (!$accepted)
        printf("
    <button onclick='ft_ajax(\"\", \"index.php?acceptBlog={$id}\", false, \"Are you sure accept this blog?\")'>
                    <p class='bg-green-500 hover:bg-green-600 rounded-sm w-fit h-fit px-1'>
                        <span class='hover:underline text-white'>Accept</span>✅
                    </p>
                </button>");
    print ("</div>
        </div>");
}

function content($content)
{
    $raw_content = htmlspecialchars($content);
    $blog_content = explode("<br>", $content);
    $i = 0;
    while ($i < count($blog_content))
        print $blog_content[$i++];
}


function footer()
{
    print ("
    <footer class='sm:w-screen primary '>
        <div class='container mx-auto px-6 md:px-12 text-center py-12'>
            <p>&copy; <span class='accent font-semibold'>2024 NutriVerse</span> . All Rights Reserved.</p>
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