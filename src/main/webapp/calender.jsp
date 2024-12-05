<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.umpdevelopers.registration.EventsBean" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Events Calendar - eventMate</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #ffffff; /* Change to white */
            color: #000000; /* Change text color to black */
            display: flex;
        }

        /* Side Navigation */
        .side-nav {
            height: 100vh;
            width: 250px;
            position: fixed;
            top: 0;
            left: 0;
            background-color: #f5f5f5; /* Light background for side navigation */
            padding-top: 20px;
            overflow-y: auto;
            border-right: 1px solid #ddd; /* Add a border for separation */
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
            color: #000000; /* Change logo text color */
        }

        .side-nav input[type="text"] {
            width: 80%;
            padding: 10px;
            margin: 20px 10%;
            border: none;
            border-radius: 5px;
            background-color: #e0e0e0; /* Light grey for input */
            color: #000000; /* Change input text color to black */
        }

        .side-nav input[type="text"]::placeholder {
            color: #555555; /* Placeholder text color */
        }

        .side-nav a {
            padding: 10px 20px;
            text-decoration: none;
            font-size: 20px;
            color: #000000; /* Change link color to black */
            display: flex;
            align-items: center;
            margin: 10px 0;
        }

        .side-nav a i {
            margin-right: 10px;
            color: #00aaff; /* Icon color */
            font-size: 1.2rem;
        }

        .side-nav a:hover {
            background-color: #dddddd; /* Light grey hover effect */
            color: #000000; /* Keep text black on hover */
        }

        /* Main Content Area */
        .main-content {
            margin-left: 250px;
            padding: 20px;
            flex-grow: 1;
        }

        h1 {
            margin-bottom: 20px;
        }

        /* Calendar Styles */
        .calendar-navigation {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        .calendar-navigation button {
            background-color: #e0e0e0; /* Light grey for buttons */
            border: none;
            color: #000000; /* Change button text color to black */
            padding: 10px 20px;
            font-size: 18px;
            cursor: pointer;
            border-radius: 5px;
        }

        .calendar-navigation button:hover {
            background-color: #cccccc; /* Darker grey on hover */
        }

        .calendar-navigation h2 {
            margin: 0;
            font-size: 22px;
        }

        .calendar {
            display: grid;
            grid-template-columns: repeat(7, 1fr);
            gap: 10px;
            margin-bottom: 30px;
        }

        .day {
            background-color: #f0f0f0; /* Light grey for calendar days */
            border-radius: 5px;
            padding: 10px;
            text-align: center;
            position: relative;
        }

        .day.event {
            background-color: #00aaff; /* Event day color */
            color: #ffffff; /* White text for event days */
        }

        .day-number {
            font-size: 1.5em;
        }

        /* Posts Styles */
        .event-post {
            background-color: #f9f9f9; /* Light background for event posts */
            border-radius: 10px;
            padding: 15px;
            margin-bottom: 15px;
            transition: background-color 0.3s;
            border: 1px solid #ddd; /* Border for event posts */
        }

        .event-post:hover {
            background-color: #e0e0e0; /* Change background on hover */
        }

        .event-post h3 {
            font-size: 20px;
            margin: 0;
            color: #000000; /* Change post title color to black */
        }

        .event-post p {
            font-size: 14px;
            margin: 5px 0;
            color: #333333; /* Darker text for event details */
        }

        .event-post img {
            max-width: 100%;
            border-radius: 8px;
            margin-top: 10px;
        }

        /* Responsive Styles */
        @media (max-width: 768px) {
            .side-nav {
                width: 200px;
            }

            .main-content {
                margin-left: 200px;
            }

            .day {
                padding: 5px;
            }

            .event-post {
                padding: 10px;
            }
        }
    </style>
</head>
<body>

    <!-- Side Navigation -->
    <div class="side-nav">
        <div class="logo-container">
            <img src="http://localhost:8080/EventsManagement/images/logo1.jpg" alt=" Logo">
            <span class="logo-text">eMATE</span>
        </div>
        
        
 
   
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <h1>Events Calendar</h1>

        <!-- Calendar Navigation -->
        <div class="calendar-navigation">
            <button id="prevMonth">&lt;</button>
            <h2 id="currentMonthYear">March 2024</h2>
            <button id="nextMonth">&gt;</button>
        </div>

        <!-- Calendar -->
        <div id="calendar" class="calendar"></div>


        <!-- Upcoming Events Section -->
        <h2>Upcoming Events</h2>
<c:if test="${not empty eventList}">
    <c:forEach var="event" items="${eventList}">
        
        <div class="event-post">
            <h3>${event.name}</h3>
            <p>${event.date}</p>
            <img src="ImageServlet?id=${event.id}" alt="${event.name}">
            <p>${event.location}</p>
            <p>${event.description}</p>
        </div>
        
</c:forEach>
</c:if>
			
			
			
		</div>	


   <!--     <div class="event-post">
            <h3>Guest Lecture</h3>
            <p>Date: March 6, 2024</p>
            <img src="https://source.unsplash.com/random/300x200/?lecture" alt="Guest Lecture Event">
        </div>
        <div class="event-post">
            <h3>Career Fair</h3>
            <p>Date: March 11, 2024</p>
            <img src="https://source.unsplash.com/random/300x200/?career" alt="Career Fair Event">
        </div>
        <div class="event-post">
            <h3>Art Exhibition</h3>
            <p>Date: March 13, 2024</p>
            <img src="https://source.unsplash.com/random/300x200/?art" alt="Art Exhibition Event">
        </div>
        <div class="event-post">
            <h3>Workshop on Web Development</h3>
            <p>Date: March 19, 2024</p>
            <img src="https://source.unsplash.com/random/300x200/?workshop" alt="Workshop Event">
        </div>
    </div>
-->
    <script src="calenderjs.js"></script>

</body>
</html>
