<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Polls & Surveys - umpConnect</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #1b1b1b;
            color: #ffffff;
            margin: 0;
            padding: 0;
        }

        /* Side Navigation */
        .side-nav {
            height: 100vh;
            width: 220px;
            position: fixed;
            top: 0;
            left: 0;
            background-color: #2a2a2a;
            padding-top: 20px;
            overflow-y: auto;
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
            color: #ffffff;
        }

        .side-nav input[type="text"] {
            width: 80%;
            padding: 8px;
            margin: 15px 10%;
            border: none;
            border-radius: 5px;
            background-color: #393939;
            color: #ffffff;
        }

        .side-nav input[type="text"]::placeholder {
            color: #cccccc;
        }

        .side-nav a {
            padding: 10px 20px;
            text-decoration: none;
            font-size: 18px;
            color: #ffffff;
            display: flex;
            align-items: center;
            margin: 8px 0;
        }

        .side-nav a i {
            margin-right: 10px;
            color: #00aaff;
            font-size: 1.2rem;
        }

        .side-nav a:hover {
            background-color: #474747;
            color: #f4f4f4;
        }

        /* Main Content */
        .main-content {
            margin-left: 220px;
            padding: 20px;
        }

        h1 {
            text-align: center;
            margin-bottom: 40px;
        }

        /* Polls Section */
        .poll-section {
            margin-bottom: 40px;
        }

        .poll-card {
            background-color: #2a2a2a;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 30px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.4);
        }

        .poll-card h3 {
            margin-bottom: 15px;
            font-size: 1.4rem;
        }

        .poll-options {
            margin-top: 15px;
        }

        .poll-options label {
            display: block;
            font-size: 1rem;
            margin-bottom: 10px;
        }

        .progress {
            background-color: #393939;
            border-radius: 4px;
            margin-bottom: 10px;
            height: 20px;
            position: relative;
        }

        .progress-bar {
            height: 100%;
            background-color: #00aaff;
            border-radius: 4px;
            text-align: center;
            color: #ffffff;
            font-size: 0.85rem;
            line-height: 20px;
        }

        /* Survey Section */
        .survey-section {
            margin-top: 50px;
        }

        .survey-card {
            background-color: #2a2a2a;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.4);
        }

        .survey-card h3 {
            margin-bottom: 15px;
            font-size: 1.4rem;
        }

        .survey-card label {
            display: block;
            margin-bottom: 10px;
            font-size: 1rem;
        }

        .survey-card input[type="text"],
        .survey-card textarea {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: none;
            margin-bottom: 15px;
            background-color: #393939;
            color: #ffffff;
        }

        .survey-card button {
            background-color: #00aaff;
            color: #ffffff;
            border: none;
            border-radius: 5px;
            padding: 10px 15px;
            cursor: pointer;
            font-size: 1rem;
        }

        .survey-card button:hover {
            background-color: #007baa;
        }

        .survey-card textarea {
            height: 100px;
            resize: none;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .main-content {
                margin-left: 200px;
            }
        }
    </style>
</head>
<body>

    <!-- Side Navigation -->
    <div class="side-nav">
        <div class="logo-container">
            <img src="logo.jpeg" alt="University Logo">
            <span class="logo-text">umpConnect</span>
        </div>
        <input type="text" placeholder="Search...">
        <a href="index.html"><i class="fas fa-home"></i> Home</a>
        
        <a href="Trending.html"><i class="fas fa-fire"></i> Trending Now</a>
        
        <a href="calender.html"><i class="fas fa-calendar-alt"></i> Events Calendar</a>
        <a href="tickets.html"><i class="fas fa-ticket-alt"></i> Event Tickets</a>
        <a href="polls.html"><i class="fas fa-poll"></i> Live Polls & Surveys</a>
        
        <a href="contact.html"><i class="fas fa-envelope"></i> Contact Us</a>
       </div>

    <!-- Main Content -->
    <div class="main-content">
        <h1>Polls & Surveys</h1>

        <!-- Polls Section -->
        <div class="poll-section">

            <!-- Poll 1 -->
            <div class="poll-card">
                <h3>What is your favorite event on campus?</h3>
                <div class="poll-options">
                    <label>Concerts</label>
                    <div class="progress">
                        <div class="progress-bar" style="width: 40%;">40%</div>
                    </div>

                    <label>Workshops</label>
                    <div class="progress">
                        <div class="progress-bar" style="width: 30%;">30%</div>
                    </div>

                    <label>Sports Events</label>
                    <div class="progress">
                        <div class="progress-bar" style="width: 20%;">20%</div>
                    </div>

                    <label>Art Exhibitions</label>
                    <div class="progress">
                        <div class="progress-bar" style="width: 10%;">10%</div>
                    </div>
                </div>
            </div>

            <!-- Poll 2 -->
            <div class="poll-card">
                <h3>Do you prefer in-person or virtual classes?</h3>
                <div class="poll-options">
                    <label>In-person</label>
                    <div class="progress">
                        <div class="progress-bar" style="width: 60%;">60%</div>
                    </div>

                    <label>Virtual</label>
                    <div class="progress">
                        <div class="progress-bar" style="width: 40%;">40%</div>
                    </div>
                </div>
            </div>

        </div>

        <!-- Survey Section -->
        <div class="survey-section">

            <div class="survey-card">
                <h3>Campus Feedback Survey</h3>

                <label for="name">Your Name:</label>
                <input type="text" id="name" name="name" placeholder="Enter your name">

                <label for="feedback">Your Feedback:</label>
                <textarea id="feedback" name="feedback" placeholder="Share your thoughts"></textarea>

                <button>Submit Feedback</button>
            </div>

        </div>
    </div>

</body>
</html>
