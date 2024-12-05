<!DOCTYPE html>
<html lang="en">
<head>
    <title>Webpage Design</title>
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        .main {
            width: 100%;
            height: 100vh;
            color: #fff;
            position: relative;
            overflow: hidden; /* Hide overflowing images */
        }

        .content-container {
            background-color: rgba(0, 0, 0, 0.9); /* Semi-transparent background */
            padding: 20px;
            border-radius: 10px;
            width: 80%; /* Responsive width */
            height: auto; /* Allow height to adjust based on content */
            margin: auto;
            position: relative;
            z-index: 1; /* Keep content above the images */
            top: 20%; /* Center it vertically */
        }

        .navbar {
            height: 75px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .icon {
            height: 70px;
        }

        .logo {
            color: #007bff; /* Blue logo */
            font-size: 35px;
            font-family: Arial;
            padding-left: 20px;
            padding-top: 10px;
        }

        .menu {
            height: 70px;
        }

        ul {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        ul li {
            list-style: none;
            margin-left: 62px;
            font-size: 14px;
        }

        ul li a {
            text-decoration: none;
            color: #fff;
            font-family: Arial;
            font-weight: bold;
            transition: 0.4s ease-in-out;
        }

        ul li a:hover {
            color: #007bff; /* Blue on hover */
        }

        .search {
            margin-left: auto; /* Aligns search to the right */
        }

        .srch {
            font-family: 'Times New Roman';
            width: 200px;
            height: 40px;
            background: transparent;
            border: 1px solid #007bff; /* Blue border */
            color: #fff;
            border-right: none;
            font-size: 16px;
            padding: 10px;
            border-bottom-left-radius: 5px;
            border-top-left-radius: 5px;
        }

        .btn {
            width: 100px;
            height: 40px;
            background: #007bff; /* Blue button */
            border: 2px solid #007bff;
            color: #fff;
            font-size: 15px;
            border-bottom-right-radius: 5px;
            border-top-right-radius: 5px;
            transition: 0.2s ease;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #0056b3; /* Darker blue on hover */
            color: #fff;
        }

        .btn:focus,
        .srch:focus {
            outline: none;
        }

        .content {
            color: #fff;
            padding-top: 20px; /* Added padding for spacing */
        }

        .content h1 {
            font-family: 'Times New Roman';
            font-size: 50px;
            margin: 0; /* Remove default margin */
            letter-spacing: 2px;
            color: #007bff; /* Blue heading */
        }

        .content .par {
            padding-bottom: 25px;
            font-family: Arial;
            letter-spacing: 1.2px;
            line-height: 30px;
        }

        .content .cn {
            width: 160px;
            height: 40px;
            background: #007bff; /* Blue button */
            border: none;
            margin-bottom: 10px;
            font-size: 18px;
            border-radius: 10px;
            cursor: pointer;
            transition: 0.4s ease;
        }

        .content .cn a {
            text-decoration: none;
            color: #fff; /* White text */
            transition: 0.3s ease;
        }

        .cn:hover {
            background-color: #0056b3; /* Darker blue on hover */
        }

        .form {
            width: 250px;
            height: 380px;
            background: linear-gradient(to top, rgba(0, 0, 0, 0.9) 50%, rgba(0, 0, 0, 0.9) 50%);
            position: absolute;
            top: -20px;
            left: 870px;
            transform: translate(0%, -5%);
            border-radius: 10px;
            padding: 25px;
            color: #fff;
        }

        .image-slider {
            position: absolute;
            top: 0;
            left: 0;
            width: 300%; /* 3 images, so 300% width */
            height: 100%;
            display: flex; /* Flexbox to display images side by side */
            z-index: 0;
            filter: blur(5px); /* Blur effect for the images */
            transition: transform 1s ease; /* Smooth transition for transform */
        }

        .image-slider img {
            width: 100vw; /* Full viewport width for each image */
            height: 100vh; /* Full viewport height */
        }
    </style>
</head>
<body>

    <div class="main">
        <div class="content-container"> <!-- Updated content container -->
            <div class="navbar">
                <div class="icon">
                    <h2 class="logo">EventMate</h2>
                </div>

                <div class="menu">
                    <ul>
                        <li><a href="index.jsp">HOME</a></li>
                        <li><a href="#">ABOUT</a></li>
                        <li><a href="login.jsp">ADMIN</a></li>
                    </ul>
                </div>

                <div class="search">
                    <input class="srch" type="search" id="searchInput" placeholder="Type To text">
                    <button class="btn" id="searchButton">Search</button>
                </div>
            </div> 

            <div class="content">
                <h1>Event Management & <br><span>Ticket sales</span></h1>
                <p class="par">Event management involves the planning, organization, and execution of events such as conferences, seminars, weddings, concerts, and corporate gatherings. It requires coordinating various aspects, including budgeting, scheduling, venue selection, logistics, and marketing, to ensure that the event runs smoothly.
                    <br>Successful event management also involves working with vendors, managing guest experiences, and handling unforeseen challenges to create memorable and impactful experiences for attendees.</p>
                <a class="cn" href="DashboardServlet">Get Started</a>
            </div>
            
        </div>

        <!-- Image container for sliding background images -->
        <div class="image-slider" id="imageSlider"></div>
    </div>

    <script src="home.js"></script>
 
</body>
</html>
