<?php

function abort($message)
{
    session_start();
    $_SESSION['error_message'] = $message;
    header("location: /nutriblog/abort");
    exit();
}

function add_content_button()
{

    print ("
        <div class='fixed bottom-4 right-4 md:mt-8 flex justify-center'>

        <button 
            id='dropdown-button'
            class='bg-[#231f20] text-white px-4 py-1 rounded-full items-center space-x-2 hover:bg-[#414040]'>
                <span class='text-lg font-bold'>
                        +
                </span>

                <span class='hidden md:inline text-sm font-semibold'>
                    Add Content
                </span>
        </button>


        <div
            id='dropdown-menu'
            class='hidden left-0 mt-2 bg-white border border-gray-200 shadow-lg rounded-md w-48 z-10'>
            <ul class='py-2'>
                <li>
                    <button 
                        onclick=\"addElement('h2')\"
                        class='block w-full px-4 py-2 hover:bg-gray-100'>
                            SubTitle
                    </button>
                </li>

                <li>
                    <button 
                        onclick=\"addElement('pre')\"
                        class='block w-full px-4 py-2 hover:bg-gray-100'>
                            Paragraph
                    </button>
                </li>

                <li>
                    <button 
                        onclick=\"addElement('img')\"
                        class='block w-full px-4 py-2 hover:bg-gray-100'>
                            Image
                    </button>
                </li>

                <li>
                    <button
                        onclick=\"addElement('a')\"
                        class='block w-full px-4 py-2 hover:bg-gray-100'>
                            URL
                    </button>
                </li>
            </ul>
        </div>
    </div>");

}



function blog_navbar($content)
{
    session_start();
    $nutriblog_nutriverse = "/nutriverse/";
    $nutriblog_home = !isset($_SESSION['auth']) ? "/nutriblog" : "/nutriblog/member";
    $nutriblog_nutritions = !isset($_SESSION['auth']) ? "/nutriblog/?filter=nutritions" : "/nutriblog/member/?filter=nutritions";
    $nutriblog_entrepreneur = !isset($_SESSION['auth']) ? "/nutriblog/?filter=entrepreneur" : "/nutriblog/member/?filter=entrepreneur";
    $nutriblog_create_user = "/nutriblog/create";
    $nutriblog_sign_in = "/nutriblog/login";
    $create_blog = "/nutriblog/write";

    print ("
    <script>
        AOS.init();
    </script>

        <nav class='px-6 py-2 bg-white'>
            <div class='container mx-auto flex items-center justify-start'>
                <div class='md:hidden lg:hidden'>
                    <button
                        id='menu-toggle'
                        class='focus:outline-none'>
                        <svg class='w-6 h-6' fill='none' stroke='currentColor' viewBox='0 0 24 24'
                            xmlns='http://www.w3.org/2000/svg'>
                            <path stroke-linecap='round' stroke-linejoin='round' stroke-width='2'
                                d='M4 6h16M4 12h16m-7 6h7'>
                            </path>
                        </svg>
                    </button>
                </div>

                <h1
                    class='lg:ml-32 sm:ml-4 text-4xl leading-normal primary'>
                    <a href='{$nutriblog_home}'>
                            <strong>NutriBlog</strong>
                    </a>
                </h1>

                <div 
                    data-aos='fade-right'
                    data-aos-delay='400'
                    class='absolute mt-96 transform -translate-y-1/2 text hidden md:block'>
                    <h1 class='lg:ml-32 text-white text-6xl font-bold'>
                            {$content}
                    </h1>
                </div>

                <div class='body_text hidden md:flex space-x-6 items-center ml-6 mt-2'>
                    <a 
                        data-aos='zoom-out'
                        href='{$nutriblog_nutriverse}'
                        class='px-2 w-fit hover:underline  '>
                            <b>Home</b>
                    </a>

                    <a 
                        data-aos-delay='100'
                        data-aos='zoom-out'
                        href='{$nutriblog_nutritions}'
                        class='hover:underline px-2 w-fit'>
                            <b>Nutritions</b>
                    </a>

                    <a 
                        data-aos-delay='200'
                        data-aos='zoom-out'
                        href='{$nutriblog_entrepreneur}'
                        class='hover:underline px-2 w-fit'>
                            <b>Entrepreneur</b>
                    </a>
                </div>
                <div class='md:flex mt-3 ml-auto hidden'>");

    if (!isset($_SESSION['auth'])) {
        print ("
                <a 
                    href='{$nutriblog_create_user}'
                    class='px-2 w-fit title'>
                        <b>Create</b>
                </a>
                <a
                    href='{$nutriblog_sign_in}'
                    class='px-2 w-fit title'>
                        <b>Sign in</b>
                </a>
            ");

    } else {
        print ("
            <a 
                href='{$create_blog}'
                class='hover:underline px-2 w-fit title'>
                    <b>Write your blog</b>
            </a>
            <a href='/nutriblog/member/?filter=ownBlogs'>
                <svg class='title' xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' width='25' height='25' fill='currentColor'>
                <path d='M12 2a10 10 0 0 0-10 10h2a8 8 0 1 1 8 8 8.1 8.1 0 0 1-7.37-4.74h2.17L4.5 13.5 2 15.26V13a10 10 0 1 0 10-11zm0 5a1 1 0 0 0-1 1v4a1 1 0 0 0 .29.71l3 3 1.42-1.42L13 11.59V8a1 1 0 0 0-1-1z'/>
                </svg>
            </a>
            <hr>
        ");
    }

    print ("
            </div>
            </div>
            <div id='mobile-menu' class='bg-primary hidden md:hidden mt-4'>
                <a 
                    data-aos='zoom-out'
                    href='{$nutriblog_nutriverse}'
                    class='px-2 w-fit text-xl'>
                        <b>Home</b>
                </a>
                <br>
                <a 
                    data-aos-delay='100'
                    data-aos='zoom-out'
                    href='{$nutriblog_nutritions}'
                    class='px-2 text-lg w-fit '>
                        <b>Nutritions</b>
                </a>
                <br>
                <a 
                    data-aos-delay='200'
                    data-aos='zoom-out'
                    href='{$nutriblog_entrepreneur}'
                    class='px-2 text-lg w-fit'>
                        <b>Entrepreneur</b>
                </a>
                <br>");

    if (!isset($_SESSION['auth'])) {
        print ("
                <a 
                    href='{$nutriblog_create_user}'
                    class='px-2 w-fit'>
                        <b>Create</b>
                </a>

                <a
                    href='{$nutriblog_sign_in}'
                    class='px-2 w-fit'>
                        <b>Sign in</b>
                </a>
            ");
    } else {
        if ($_SERVER['PHP_SELF'] != '/project/pages/create_blog.php')
            print ("
        <div class='flex title'>
            <a href='{$create_blog}' class='px-2 w-fit'>
                <b>Write your blog</b>
            </a>
            <a href='/nutriblog/member/?filter=ownBlogs'>
                <svg class='hover:text-[#4a4a4a]' xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' width='25' height='25' fill='currentColor'>
                <path d='M12 2a10 10 0 0 0-10 10h2a8 8 0 1 1 8 8 8.1 8.1 0 0 1-7.37-4.74h2.17L4.5 13.5 2 15.26V13a10 10 0 1 0 10-11zm0 5a1 1 0 0 0-1 1v4a1 1 0 0 0 .29.71l3 3 1.42-1.42L13 11.59V8a1 1 0 0 0-1-1z'/>
                </svg>
            </a>
        </div>
            <hr>
        ");

    }
    print ("
        </div>
        </nav>");

}



function blogBox($delay, $id, $image, $title, $describtion, $date)
{
    $nutriblog_content = "/nutriblog/content/";
    print ("
        <div data-aos-delay='{$delay}' data-aos='fade-up' class='border-2 h-fit w-11/12 mt-5 lg:w-3/12'>
            <a href='{$nutriblog_content}?id={$id}'>
                    <img 
                        class='hover-steer-left'
                        src='{$image}'>
                    <h2 class='text-2xl ml-5 mt-3 title'>
                        {$title}
                    </h2>
            </a>
            <p class='text mt-3 ml-5'>
                {$describtion}...
            </p>
            <br>

            <div class='flex justify-between items-center'>
                <p class='text-xs mb-5 ml-5 text-[#4a4a4a] underline'>
                    $date
                </p>
            ");
    if (isset($_GET["filter"]) && $_GET['filter'] == "ownBlogs") {
        printf("
            <button onclick='ft_ajax(
                            \"blog_{$id}\",
                            \"/nutriblog/?delBlog={$id}\",
                            true,
                            \"Are you sure delete?\")'>
                    <p class='bg-[#231f20] hover:bg-red-600 rounded-sm w-fit h-fit px-3 mb-2 mr-5'>
                        <span class='text-white'>Delete</span>
                    </p>
                </button>
            </div>
            </div>");
    } else {
        printf("
            </div>
        </div>
        ");
    }


}



function content($content)
{
    $blog_content = explode("<br>", $content);
    $i = 0;
    while ($i < count($blog_content))
        print $blog_content[$i++];

}



function likes($count)
{
    if (isset($_SESSION['blogid'])) {
        unset($_SESSION['blogid']);
    }
    $_SESSION['blogid'] = explode("id=", $_SERVER['REQUEST_URI'])[1];
    print ("
    <div class='mt-12 flex items-center space-x-2'>

        <button 
            onclick='like({$count})' 
            id='likeButton'
            class='flex items-center space-x-2 px-4 py-2 rounded-lg bg-gray-200 hover:bg-gray-300 text-gray-700'>

            <svg id='likeIcon' xmlns='http://www.w3.org/2000/svg' class='w-6 h-6 text-gray-700'
                viewBox='0 0 24 24' fill='none'>
                <path d='M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 6.42 3.42 5 5.5 5c1.74 0 3.41 1.01 4.13 2.44h1.74C15.09 6.01 16.76 5 18.5 5 20.58 5 22 6.42 22 8.5c0 3.78-3.4 6.86-8.55 11.54L12 21.35z' />
            </svg>

            <!-- Like Count -->
            <span 
                id='likeCount'
                class='text-sm font-medium'>
                    {$count}
            </span>
        </button>

    </div>

    <script>
        const likeButton = document.getElementById('likeButton');
        const likeIcon = document.getElementById('likeIcon');
        const likeCount = document.getElementById('likeCount');
        let isLiked = false;
        let count = {$count};
        likeButton.addEventListener('click', () => {
            isLiked = !isLiked;
            count += isLiked ? 1 : -1;
            likeCount.textContent = count;
            likeIcon.setAttribute(
                'fill',
                isLiked ? 'red' : 'none'
            );
            likeIcon.classList.toggle('text-red-500', isLiked);
        });
    </script>
    ");

}



function write_comment()
{
    if (isset($_SESSION['blogid']))
        unset($_SESSION['blogid']);
    $_SESSION['blogid'] = explode("id=", $_SERVER['REQUEST_URI'])[1];
    printf("
        <div class='mt-8 flex justify-between items-center mb-6'>
            <h2 
                class='text-lg lg:text-2xl font-bold text-gray-900'>
                    Write your comment
            </h2>
        </div>

        <form method='POST' action='/nutriblog/content/?id={$_GET['id']}'>
            <div class='py-2 px-4 mb-4 bg-white rounded-lg rounded-t-lg border border-gray-200'>
                <label
                    for='comment'
                    class='sr-only'>Your comment</label>
                <textarea
                    name='comment_text'
                    rows='6'
                    class='px-0 w-full text-sm text-gray-900 border-0 focus:ring-0 focus:outline-none'
                    placeholder=''
                    required></textarea>
            </div>
            <button
                type='submit'
                class='py-2.5 px-4 font-medium bg-[#1ab394] text-center text-white rounded-lg focus:ring-4 focus:ring-primary-200'>Post comment</button>
        </form>
");

}



function comments_box($comment_id, $date, $name, $comment, $own_comment)
{

    printf(
        "
    <article id='comment_text_{$comment_id}' class='p-6 text-base  rounded-lg'>
      <footer class='mb-2'>
        <div class='flex items-center justify-between'>
            <div class='flex items-center'>
                    <p class='inline-flex items-center mr-3 text-sm font-semibold text-[#1ab394]'>
                        {$name}
                    </p>

                    <p class='text-sm text-gray-600'>
                        {$date}
                    </p>
            </div>"
    );
    if ($own_comment || $_SESSION['admin_auth'])
        echo "
            <button 
                onclick=\"delete_comment('{$comment_id}')\" 
                class='rounded-full text-sm text-red-500 hover:text-red-700 hover:underline'>
                    delete
            </button>";
    print
        ("
            </div>
        </footer>
        <p class='ml-8 text-gray-900'>
            {$comment}
        </p>
    </article>
    ");
}



function footer()
{

    print ("

    <footer class='sm:w-screen text-[#4a4a4a] border-[#231f20]'>
        <div class='container mx-auto px-6 md:px-12 text-center py-12'>
            <p>
                &copy; 2025 NutriVerse. All Rights Reserved.
            </p>
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