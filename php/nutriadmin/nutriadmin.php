<?php
session_start();
require("nutriverse/php/database/database.php");
include("nutriverse/php/components/material_nutriadmin.php");


/** 
 * check the client device 
 * abort for mobiles
 */
$client = $_SERVER['HTTP_SEC_CH_UA_PLATFORM'];
if ($client != "\"macOS\"" && $client != "\"Windows\"")
    abort(message: "Admin panel cannot load on mobiles");


/** 
 * delete past login errors
 * check for authentication and redirect
 */
unset($_SESSION['admin_errors']);
if (!isset($_SESSION['admin_auth'])) {
    header("location: /nutriadmin/login");
}


/** 
 * check for logout request
 *  delete authentication and redirect to login
 */
if ($_SERVER['REQUEST_URI'] == "/nutriadmin/logout") {
    unset($_SESSION['admin_auth']);
    header("location: /nutriadmin/login");
    exit;
}

/** 
 * check for deletion of consulation request
 *  query the delete of requesetd id
 */
if (isset($_GET["delRequest"])) {
    $delRequest = $_GET["delRequest"];
    $del = sql_delete(
        query: "DELETE FROM `ConsultationRequests`
                WHERE request_id='{$delRequest}'"
    );
    if (!$del)
        abort(message: "error when deleting data with request id={$delRequest}");
}


/** 
 * check for deletion of blog by id
 *  query the delete of blog by id
 */
if (isset($_GET["delBlog"])) {
    $delBlogId = $_GET["delBlog"];
    $delB = sql_delete(query: "DELETE FROM `Blogs` WHERE blog_id='{$delBlogId}'");
    if (!$delB)
        abort(message: "error when deleting data with request id={$delBlogId}");
}


/** 
 * check for accpetance of blog by id
 *  query the accept of blog by id
 */
if ($_GET["acceptBlog"]) {
    $acceptBlog = $_GET["acceptBlog"];
    $acceptlB = sql_delete(query: "UPDATE `Blogs` SET `accepted` = 1 WHERE `blog_id`='{$acceptBlog}'");
    if (!$acceptlB)
        abort(message: "error when deleting data with request id={$acceptlB}");
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
    <script>
        function ft_ajax(comp, request, del, conf_message) {
            if (confirm(conf_message)) {
                var xmlhttp = new XMLHttpRequest();

                xmlhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        if (del)
                            document.getElementById(`${comp}`).remove();
                        else
                            document.getElementById(`${comp}`).innerHTML = '';
                    }
                };

                xmlhttp.open("GET", request, true);
                xmlhttp.send();
            }
        }

    </script>
</head>

<body class="min-h-screen overflow-x-auto bg-gray-100">
    <?php admin_navbar(enable_logout: true) ?>

    <main class='overflow-x-auto flex flex-col antialiased text-gray-600  p-4'>
        <?php
        /**
         * if requested to see more info
         *      create the table design
         *      request all info of the requested id
         *      display info
         */
        if (isset($_GET["more_info"])) {
            printf(
                "
            <div class='w-screen mt-32 h-full'>

                <div align='left' class='bg-white shadow-lg rounded-sm border border-gray-200'>
                    <header class='px-5 py-4 border-b border-gray-100'>
                        <h2 class='text-center font-semibold text-3xl'>More info</h2>
                    </header>
                
                    <div class='p-3 '>
                    <div class='overflow-x-auto'>
                        <table class='table-auto w-full'>
                            <tbody class='text-m font-semibold  text-gray-600 '>
            "
            );

            $client = mysqli_fetch_assoc(
                sql_read(query: "SELECT * FROM ConsultationRequests
                WHERE request_id='{$_GET["more_info"]}'")
            );
            if (!$client)
                abort(message: "error when reading more info of request id ={$_GET["more_info"]}");

            printf("
            <tr class='p-2 uppercase whitespace-nowrap bg-gray-50'>
                <th class='font-semibold text-left '>First name:
                    <td class='text-left text'>{$client['name']}</td>
                </th>
            </tr>");

            printf("
                <tr class='p-2 uppercase whitespace-nowra'>
                    <th class='font-semibold text-left'>last name:
                        <td class='text-left text'>{$client['last_name']}</td>
                    </th>
                </tr>");

            printf("
                <tr class='p-2 uppercase whitespace-nowrap bg-gray-50'>
                    <th class='font-semibold text-left'>age:
                        <td class='text-left text'>{$client['age']}</td>
                    </th>
                </tr>");

            printf("
                <tr class='p-2 uppercase whitespace-nowrap'>
                    <th class='font-semibold text-left'>EMAIl:
                        <td class='text-left text'>{$client['email']}</td>
                    </th>
                </tr>");

            printf("
                <tr class='p-2 uppercase whitespace-nowrap bg-gray-50'>
                    <th class='font-semibold text-left'>Country:
                        <td class='text-left text'>{$client['country']}</td>
                    </th>
                </tr>");

            printf("
                <tr class='p-2 uppercase whitespace-nowrap'>
                    <th class='font-semibold text-left'>Telprop:
                        <td class='text-left text'>[{$client['country_code']}] {$client['mobile_phone']}</td>
                    </th>
                </tr>");

            printf("
                <tr class='p-2 uppercase whitespace-nowrap bg-gray-50'>
                    <th class='font-semibold text-left'>objective:
                        <td class='text-left text'>{$client['objective']}</td>
                    </th>
                </tr>");

            printf("
                <tr class='p-2 uppercase whitespace-nowrap'>
                    <th class='font-semibold text-left'>requested at:
                        <td class='text-left accent font-semibold '>{$client['created_at']}</td>
                    </th>
                </tr>");

            print ("</tbody> </table></div></div></div></div>");
            print "
            <a href='/nutriadmin/' class='flex justify-center mt-12'>
                <button class='flex w-12 justify-center rounded-md bg-[#007bff] px-3 py-1.5 text-sm/6 font-semibold text-white shadow-sm hover:bg-[#0162ff] focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2'>
                    close
                </button>
            </a>";
        } ?>


        <?php
        /**
         * if the url is main route page
         *      create the table for requested consultations
         *      read all consultation request from database
         *      loop threw each row and print it
         *      request all blogs based on filter
         *      print all blogs
         */
        if ($request[1] == 'nutriadmin' || $request[1] == 'nutriadmin/') {
            printf(
                "
                <div class='w-screen mt-32 h-full'>
                    <div align='left' class='bg-white shadow-lg rounded-sm border border-[#0162ff]'>
                    <header class='px-5 py-4 border-b border-[#0162ff]'>
                        <h2 class='text-center text-3xl font-semibold accent'>Requested Consulations</h2>
                    </header>
                
                <div class='p-3 '>
                    <div class='overflow-x-auto'>
                        <table class='table-auto w-full'>

                            <tbody class='text-m font-semibold  text-white '>
                                <tr class='p-2 uppercase whitespace-nowrap bg-[#007bff]'>
                                    <th class='font-semibold text-center'>First name</th>
                                    <th class='font-semibold text-center'>Last Name</th>
                                    <th class='font-semibold uppercase text-center'>Age</th>
                                    <th class='font-semibold uppercase text-center'>Country</th>
                                    <th class='font-semibold uppercase text-center'>Requested at</th>
                                    <th class='font-semibold uppercase text-center'> </th>
                                    <th class='font-semibold uppercase text-center'> </th>
                                </tr>
                            </tbody>
        "
            );

            $clients = sql_read(query: "SELECT * FROM ConsultationRequests");
            if (!$clients)
                abort("error when reading data of Consulation Requests");

            while ($client = mysqli_fetch_assoc($clients)) {
                printf("
                        <tr id='row_{$client['request_id']}'>
                            <td class='text text-center'>{$client['name']}</td>
                            <td class='text text-center'>{$client['last_name']}</td>
                            <td class='text text-center'>{$client['age']}</td>
                            <td class='text text-center'>{$client['country']}</td>
                            <td class='text text-center'>{$client['created_at']}</td>
                            <td class='text text-left'>
                                <a
                                    class='text-[#007bff] font-semibold hover:underline'
                                    href='/nutriadmin/?more_info={$client['request_id']}'>
                                    more_info
                                </a>
                            </td>
                            <td class='text text-left'>
                                <button
                                    class='text-[#007bff] font-semibold hover:underline'
                                    onclick='ft_ajax(
                                                \"row_{$client['request_id']}\",
                                                \"index.php?delRequest={$client['request_id']}\",
                                                true,
                                                \"Are you sure you want to delete this request?\")'>delete
                                </button>
                            </td>
                        </tr>");
            }
            printf("
                    </table>
                </div>
                </div>
                </div>
                </div>
        ");
            printf("<div class='w-screen mt-32 h-full'>
        <!-- Table -->
        <div align='left'  class='bg-white shadow-lg rounded-sm border border-[#0162ff]'>
            <header class='px-5 py-4 border-b border-[#0162ff]'>
                <h2 class='text-3xl text-center font-semibold accent'>Recent Blogs Post</h2>
            </header>

            <div class='p-3 '>
                <div class='overflow-x-auto'>
                    <table class='table-auto w-full'>

                        <tbody class='text-m font-semibold text '>
                            <tr class='p-2 uppercase whitespace-nowrap '>
                            <th class='font-semibold text-center'>Filter by:</th>
                                <th class='font-semibold text-center'><a href='/nutriadmin/'>All</a></th>
                                <th class='font-semibold text-center'><a href='/nutriadmin/?filter=pending'>pending</a></th>
                                <th class='font-semibold text-center'><a href='/nutriadmin/?filter=nutritions'>nutritions</a></th>
                                <th class='font-semibold text-center'><a href='/nutriadmin/?filter=enterpreuner'>enterpreuner</a></th>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    ");
            $filter = $_GET['filter'];
            if (!isset($filter))
                $blogs = sql_read(query: "SELECT * FROM Blogs");
            else if ($filter == 'pending')
                $blogs = sql_read(query: "SELECT * FROM `Blogs` WHERE accepted=0");
            else if ($filter == 'nutritions')
                $blogs = sql_read(query: "SELECT * FROM `Blogs` WHERE accepted=0 AND blog_type='nutritions'");
            else if ($filter == 'enterpreuner')
                $blogs = sql_read(query: "SELECT * FROM `Blogs` WHERE accepted=0 AND blog_type='entrepreneur'");

            if (!$blogs)
                abort("error when reading data of blog posts");

            $i = 1;
            while ($blog = mysqli_fetch_assoc($blogs)) {
                if ($i == 1) {
                    print ("<div class='ml-5 md:flex justify-center mt-12 gap-12'>");
                }

                admin_blogBox(
                    image: "{$blog['image_url']}",
                    accepted: $blog['accepted'],
                    id: "{$blog['blog_id']}",
                    title: "<b>{$blog['blog_title']}</b>",
                    describtion: substr($blog['blog_description'], 0, 80),
                    date: explode(" ", $blog['created_at'])[0]
                );

                $i++;
                if ($i == 4) {
                    print ("</div>");
                    $i = 1;
                }
            }
        }
        ?>
    </main>
</body>

</html>