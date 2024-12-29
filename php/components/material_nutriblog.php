<?php
function blog_navbar()
{
    $nutriblog_nutriverse = "nutriverse/home.php";
    $nutriblog_home = "blog.php";
    $nutriblog_nutritions = "blog.php?Filter=nutritions";
    $nutriblog_entrepreneur = "blog.php?Filter=entrepreneur";
    $nutriblog_create_user = "create_user.php";
    $nutriblog_sign_in = "sign_in.php";
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
                <div class='absolute mt-96 transform -translate-y-1/2 text hidden md:block'>
                    <h1 class='lg:ml-64 text-white text-6xl font-bold'>
                        <span><b>Daily Tips For Everyone</b></span>
                    </h1>
                </div>
                <div class='primary hidden md:flex space-x-6 items-center ml-6 mt-2'>
                    <a data-aos='zoom-out' href='{$nutriblog_nutriverse}' class='px-2 w-fit'><b>Home</b></a>
                    <a data-aos-delay='100' data-aos='zoom-out' href='{$nutriblog_nutritions}'
                        class='px-2 w-fit'><b>Nutritions</b></a>
                    <a data-aos-delay='200' data-aos='zoom-out' href='{$nutriblog_entrepreneur}'
                        class='px-2 w-fit'><b>Entrepreneur</b></a>
                </div>
                <div class='ml-auto hidden md:block'>
                    <a href='{$nutriblog_create_user}' class='px-2 w-fit'><b>Create</b></a>
                    <a href='{$nutriblog_sign_in}' class='px-2 w-fit'><b>Sign in</b></a>
                </div>
            </div>

            <!-- Mobile Navbar Version -->
            <div id='mobile-menu' class='bg- primary hidden md:hidden mt-4'>
                <a data-aos='zoom-out' href='{$nutriblog_nutriverse}' class='px-2 text-lg w-fit'><b>Home</b></a>
                <br>
                <a data-aos-delay='100' data-aos='zoom-out' href='{$nutriblog_nutritions}'
                    class='px-2 text-lg w-fit'><b>Nutritions</b></a>
                <br>
                <a data-aos-delay='200' data-aos='zoom-out' href='{$nutriblog_entrepreneur}'
                    class='px-2 text-lg w-fit'><b>Entrepreneur</b></a>
                <br>
                <a href='{$nutriblog_create_user}' class='px-2 w-fit'><b>Create</b></a>
                <a href={$nutriblog_sign_in} class='px-2 w-fit'><b>Sign in</b></a>
                <hr>
            </div>
        </nav>");
}

function blogBox($delay,$image, $title, $describtion, $date)
{
    print ("
        <div data-aos-delay='100' data-aos='fade-up' class='border-2 h-fit w-11/12 mt-5 lg:w-3/12'>
            <!-- Col 1  -->
            <img class='hover-steer-left'
                src='https://i0.wp.com/wp.nutrium.com/wp-content/uploads/2024/09/BLOG-DISPLAY-IMAGE.png?resize=800%2C612&ssl=1'>
            <a href='blog-content.html'>
                <h2 class='text-2xl ml-5 mt-3 text-[#4a4a4a] hover:text-[#bea7a3]'><b>Ozempic vs<br> Mounjaro:
                        everything you need to know</b></h2>
                <p class='text-[#4a4a4a] mt-3 ml-5'>GLP-1, Ozempic, Mounjaro. These three words were entirely
                    unfamiliar to most of</p>
                <br>
                <p class='text-xs mb-5 ml-5 text-[#4a4a4a] underline'>September 3, 2024</p>
            </a>
        </div>
    ");
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