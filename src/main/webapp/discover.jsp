<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Discover - umpConnect</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4; /* White background for the entire body */
            color: #333; /* Darker text color for better contrast */
            display: flex;
        }

        /* Side Navigation */
        .side-nav {
            height: 100vh; /* Full height of the viewport */
            width: 250px; /* Fixed width */
            position: fixed;
            top: 0;
            left: 0;
            background-color: #f5f5f5; /* Dark background for the sidebar */
            padding-top: 20px;
            overflow-y: auto; /* Enable scrolling for the menu */
        }

        .side-nav .logo-container {
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 10px;
        }

        .side-nav img {
            width: auto;
            height: 50px;
        }

        .side-nav .logo-text {
            font-size: 24px;
            margin-left: 10px;
            color: #000000; /* White text for the logo */
        }

        .side-nav input[type="text"] {
            width: 80%;
            padding: 10px;
            margin: 20px 10%;
            border: none;
            border-radius: 5px;
            background-color: #f5f5f5; /* Dark background for the search bar */
            color: #ffffff; /* White text for input */
        }

        .side-nav input[type="text"]::placeholder {
            color: #cccccc; /* Placeholder color */
        }

        .side-nav a {
            padding: 10px 20px;
            text-decoration: none;
            font-size: 20px;
            color: #000000; /* White text for links */
            display: flex;
            align-items: center;
            margin: 10px 0;
        }

        .side-nav a i {
            margin-right: 10px; /* Space between icon and text */
            color: #00aaff; /* Blue color for the icon */
            font-size: 1.2rem; /* Adjust size of the icon */
        }

        .side-nav a:hover {
            background-color: #f5f5f5; /* Darker hover background */
            color: #f4f4f4; /* Light color for hover text */
        }

        /* Main Content Area */
        .main-content {
            margin-left: 250px; /* Leave space for the side navigation */
            padding: 20px;
            flex-grow: 1;
            background-color: #ffffff; /* White background for the main content */
            color: #333; /* Darker text color */
        }

        h1 {
            margin-bottom: 20px;
            color: #000000; /* Color for the main title */
        }

        .categories {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(200px, 1fr)); /* Adjusted for larger cards */
            gap: 20px; /* Space between cards */
            margin-top: 20px;
        }

        .category-card {
            background-color: #f4f4f4; /* Light background for cards */
            border-radius: 10px;
            padding: 40px; /* Increased padding for larger cards */
            text-align: center;
            transition: transform 0.3s, box-shadow 0.3s;
            cursor: pointer;
            border: 1px solid #2c2c2c; /* Light border for cards */
        }

        .category-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2); /* Slightly darker shadow */
        }

        .category-card i {
            font-size: 40px; /* Increased icon size */
            color: #00aaff; /* Icon color */
            margin-bottom: 15px; /* Increased space between icon and text */
        }

        .category-card h3 {
            font-size: 22px; /* Increased category title size */
            color: #333; /* Dark color for title */
            margin: 0;
        }
    </style>
</head>
<body>

    <!-- Side Navigation -->
    <div class="side-nav">
        <!-- Logo Section with Text -->
        <div class="logo-container">
            <img src="logo1.jpg" alt="Logo">
            <span class="logo-text">eMATE</span>
        </div>
        <!-- Search Bar -->
        <input type="text" placeholder="Search...">
        <!-- Navigation Links -->
        <a href="index.html"><i class="fas fa-home"></i> Home</a>
        <a href="discover.html"><i class="fas fa-compass"></i> Discover</a>
        <a href="Trending.html"><i class="fas fa-fire"></i> Trending Now</a>
        <a href="calender.html"><i class="fas fa-calendar-alt"></i> Events Calendar</a>
        <a href="tickets.html"><i class="fas fa-ticket-alt"></i> My Tickets</a>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <h1>Discover Content</h1>
        <div class="categories">
            <div class="category-card">
                <i class="fas fa-book"></i>
                <h3>Books</h3>
            </div>
            <div class="category-card">
                <i class="fas fa-video"></i>
                <h3>Videos</h3>
            </div>
            <div class="category-card">
                <i class="fas fa-podcast"></i>
                <h3>Podcasts</h3>
            </div>
            <div class="category-card">
                <i class="fas fa-newspaper"></i>
                <h3>News</h3>
            </div>
            <div class="category-card">
                <i class="fas fa-music"></i>
                <h3>Music</h3>
            </div>
            <div class="category-card">
                <i class="fas fa-image"></i>
                <h3>Images</h3>
            </div>
            <div class="category-card">
                <i class="fas fa-calendar"></i>
                <h3>Events</h3>
            </div>
            <div class="category-card">
                <i class="fas fa-laptop"></i>
                <h3>Technology</h3>
            </div>
            <div class="category-card">
                <i class="fas fa-heartbeat"></i>
                <h3>Health</h3>
            </div>
            <div class="category-card">
                <i class="fas fa-graduation-cap"></i>
                <h3>Education</h3>
            </div>
            <div class="category-card">
                <i class="fas fa-paint-brush"></i>
                <h3>Arts</h3>
            </div>
            <div class="category-card">
                <i class="fas fa-soccer-ball-o"></i>
                <h3>Sports</h3>
            </div>
            <div class="category-card">
                <i class="fas fa-utensils"></i>
                <h3>Food</h3>
            </div>
            <div class="category-card">
                <i class="fas fa-briefcase"></i>
                <h3>Careers</h3>
            </div>
            <div class="category-card">
                <i class="fas fa-cogs"></i>
                <h3>DIY Projects</h3>
            </div>
        </div>
    </div>

</body>
</html>
