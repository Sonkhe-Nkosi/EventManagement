<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.umpdevelopers.registration.EventsBean" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- (Your existing head content, styles, etc.) -->
    <meta charset="UTF-8">
    <title>EVENTS: Dashboard</title>
    <!-- Include JSTL library -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <!-- Your existing styles -->
<style>
        /* General Styles */
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9; /* Light background */
            color: #333; /* Dark text for better readability */
            display: flex;
            min-height: 100vh;
        }

        /* Sidebar */
        .side-nav {
            height: 100vh;
            width: 260px;
            position: fixed;
            top: 0;
            left: 0;
            background-color: #2c3e50; /* Dark sidebar */
            padding-top: 30px;
            overflow-y: auto;
            box-shadow: 2px 0 5px rgba(0,0,0,0.1);
            transition: width 0.3s;
        }

        .side-nav .logo-container {
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 15px;
            margin-bottom: 30px;
        }

        .side-nav img {
            width: 50px;
            height: auto;
        }

        .side-nav .logo-text {
            font-size: 22px;
            margin-left: 10px;
            color: #ecf0f1; /* Light text for contrast */
            font-weight: bold;
        }

        .side-nav a {
            padding: 12px 25px;
            text-decoration: none;
            font-size: 18px;
            color: #bdc3c7; /* Gray text for links */
            display: flex;
            align-items: center;
            transition: background 0.3s, color 0.3s;
        }

        .side-nav a i {
            margin-right: 15px;
            color: #1abc9c; /* Accent color for icons */
        }

        .side-nav a:hover {
            background-color: #34495e; /* Darker on hover */
            color: #ecf0f1; /* Light text on hover */
        }

        /* Main Content */
        .main-content {
            margin-left: 260px; /* Sidebar width */
            padding: 40px 30px;
            flex-grow: 1;
            background-color: #f9f9f9;
        }

        .main-content h1 {
            margin-bottom: 20px;
            color: #2c3e50;
        }

        /* Post Styles */
        .post {
            background-color: #ffffff; /* White background for posts */
            border-radius: 8px;
            padding: 25px;
            margin-bottom: 25px;
            position: relative;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Enhanced shadow */
            transition: transform 0.3s, box-shadow 0.3s;
            display: flex;
            flex-direction: column;
        }

        .post:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        .post-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .post-title {
            font-size: 1.6rem;
            margin-bottom: 10px;
            color: #2c3e50;
        }

        .post-description {
            font-size: 1rem;
            margin-bottom: 15px;
            color: #7f8c8d;
        }

        .post-media img, .post-media video {
            width: 100%;
            max-height: 300px;
            object-fit: cover;
            border-radius: 8px;
            margin-bottom: 10px;
            cursor: pointer;
            transition: transform 0.3s;
        }

        .post-media img:hover, .post-media video:hover {
            transform: scale(1.02);
        }

        .post-date-time {
            font-size: 0.9rem;
            color: #95a5a6;
            margin-bottom: 15px;
        }

        /* Like Button and Counter */
        .like-section {
            display: flex;
            align-items: center;
            margin-top: auto; /* Push to the bottom */
        }

        .like-counter {
            font-size: 1rem;
            color: #7f8c8d;
            margin-right: 15px;
        }

        .like-heart {
            font-size: 1.5rem;
            color: #bdc3c7; /* Gray heart */
            cursor: pointer;
            transition: color 0.3s;
        }

        .like-heart.active {
            color: #e74c3c; /* Red when liked */
        }

        /* Buttons */
        .button-group {
            display: flex;
            gap: 10px;
            margin-top: 15px;
        }

        .add-to-cart-btn {
            background-color: #27ae60; /* Green for Add to Cart */
            color: #ffffff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
            flex: 1;
        }

        .add-to-cart-btn:hover {
            background-color: #219150; /* Darker green on hover */
        }

        .view-btn {
            background-color: #2980b9; /* Blue for View */
            color: #ffffff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
            flex: 1;
        }

        .view-btn:hover {
            background-color: #1f6391; /* Darker blue on hover */
        }

        /* Floating Cart */
        .cart-container {
            position: fixed;
            top: 30px;
            right: 30px;
            background-color: #e74c3c; /* Red for cart */
            border-radius: 50%;
            width: 60px;
            height: 60px;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s;
            z-index: 1000;
        }

        .cart-container:hover {
            background-color: #c0392b; /* Darker red on hover */
            transform: scale(1.1);
        }

        .cart-container i {
            font-size: 1.8rem;
            color: #ffffff;
        }

        .cart-counter {
            position: absolute;
            top: 5px;
            right: 5px;
            background-color: #f1c40f; /* Yellow for counter */
            color: #2c3e50;
            font-size: 0.8rem;
            border-radius: 50%;
            padding: 2px 6px;
            font-weight: bold;
        }

        /* Modal Styles */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 2000; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgba(0,0,0,0.5); /* Black w/ opacity */
            padding-top: 60px; /* Location of the box */
        }

        .modal-content {
            background-color: #ffffff;
            margin: auto;
            padding: 30px;
            border-radius: 8px;
            width: 90%;
            max-width: 600px;
            position: relative;
            box-shadow: 0 5px 15px rgba(0,0,0,0.3);
            animation: fadeIn 0.5s;
            max-height: 80vh;
            overflow-y: auto; /* Scrollbar if content overflows */
        }

        .close {
            color: #7f8c8d;
            position: absolute;
            top: 15px;
            right: 20px;
            font-size: 28px;
            font-weight: bold;
            cursor: pointer;
            transition: color 0.3s;
        }

        .close:hover {
            color: #2c3e50;
        }

        @keyframes fadeIn {
            from {opacity: 0;}
            to {opacity: 1;}
        }

        /* Payment Form Styles */
        .payment-form {
            display: flex;
            flex-direction: column;
            gap: 15px;
            margin-top: 20px;
        }

        .payment-form label {
            font-weight: bold;
            margin-bottom: 5px;
        }

        .payment-form input, .payment-form select {
            padding: 10px;
            border: 1px solid #bdc3c7;
            border-radius: 5px;
            font-size: 1rem;
            width: 100%;
        }

        .payment-form input:focus, .payment-form select:focus {
            border-color: #2980b9;
            outline: none;
        }

        .payment-form .submit-btn {
            background-color: #2980b9; /* Blue for Submit */
            color: #ffffff;
            border: none;
            padding: 12px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1rem;
            transition: background-color 0.3s;
            width: 100%;
        }

        .payment-form .submit-btn:hover {
            background-color: #1f6391; /* Darker blue on hover */
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .side-nav {
                width: 200px;
            }

            .main-content {
                margin-left: 200px;
                padding: 30px 20px;
            }

            .post {
                padding: 20px;
            }

            .cart-container {
                width: 50px;
                height: 50px;
            }

            .cart-container i {
                font-size: 1.5rem;
            }
        }

        @media (max-width: 576px) {
            .side-nav {
                position: relative;
                width: 100%;
                height: auto;
                box-shadow: none;
            }

            .main-content {
                margin-left: 0;
                padding: 20px 10px;
            }

            .cart-container {
                top: 15px;
                right: 15px;
            }

            .like-counter {
                left: 15px;
            }

            .button-group {
                flex-direction: column;
            }
        }
    </style>

</head>
<body>

    <!-- Sidebar Navigation -->
    <div class="side-nav">
        <div class="logo-container">
            <img src="https://via.placeholder.com/100" alt="Logo">
            <span class="logo-text">EVENTS</span>
        </div>
        <a href="index.jsp"><i class="fas fa-home"></i>Home</a>
        <a href="DashboardServlet"><i class="fas fa-calendar-alt"></i>Events</a>
        <a href="CalenderServlet"><i class="fas fa-calendar-alt"></i> Events Calendar</a>
        <!-- Add more navigation links as needed -->
    </div>

    <!-- Main Content Area -->
    <div class="main-content">
        <h1>Upcoming Events</h1>

    
        
        
       <!-- Iterate Over eventList -->
<c:if test="${not empty eventList}">
    <c:forEach var="event" items="${eventList}">
        <div class="post">
            <div class="post-header">
                <h2 class="post-title">Event: ${event.name}</h2>
            </div>
            <p class="post-description">${event.description}</p>
            <p class="post-description">${event.location}</p>
            <div class="post-media">
                <img src="ImageServlet?id=${event.id}" alt="${event.name}">
            </div>
            <p class="post-date-time">${event.date}</p>
            <div class="like-section">
                <span class="like-counter">0 Likes</span>
                <i class="fas fa-heart like-heart" onclick="likePost(this)"></i>
            </div>
            <div class="button-group">
                <button class="add-to-cart-btn" onclick="addToCart('${event.name}', 20.00)">Add to Cart</button>
                <button class="view-btn" onclick="openModal('${event.name}', '${event.date}', '${event.location}', '${event.description}', '${event.image}', 20.00)">View Details</button>
            </div>
        </div>
    </c:forEach>
</c:if>
        
        
        
        
        
    </div>

    
 <!-- Floating Cart Icon -->
    <div class="cart-container" onclick="openCartModal()">
        <i class="fas fa-shopping-cart"></i>
        <span class="cart-counter">0</span>
    </div>

    <!-- Event Details Modal -->
    <div id="detailsModal" class="modal" aria-hidden="true" onclick="closeDetailsModal(event)">
        <div class="modal-content" onclick="event.stopPropagation()">
            <span class="close" onclick="closeDetailsModal()">&times;</span>
            <h2 id="modal-event-name">Event Name</h2>
            <p><strong>Date:</strong> <span id="modal-event-date">Date</span></p>
            <p><strong>Location:</strong> <span id="modal-event-location">Location</span></p>
            <p><strong>Description:</strong> <span id="modal-event-description">Description</span></p>
            <p><strong>Ticket Price:</strong> R<span id="modal-event-price">Price</span></p>
            <button class="add-to-cart-btn" onclick="addToCartFromModal()">Add to Cart</button>
        </div>
    </div>

    <!-- Cart Modal -->
    <div id="cartModal" class="modal" aria-hidden="true" onclick="closeCartModal(event)">
        <div class="modal-content" onclick="event.stopPropagation()">
            <span class="close" onclick="closeCartModal()">&times;</span>
            <h2>Your Cart</h2>
            <div id="cart-items">
                <!-- Cart items will be dynamically added here -->
            </div>
            <p><strong>Total Amount:</strong> R<span id="total-amount">0.00</span></p>
            <form id="paymentForm" class="payment-form" onsubmit="return handlePayment(event)">
                <h3>Payment Details</h3>
                <label for="fullName">Full Name *</label>
                <input type="text" id="fullName" name="fullName" required placeholder="John Doe">

                <label for="email">Email Address *</label>
                <input type="email" id="email" name="email" required placeholder="john.doe@example.com">

                <label for="phone">Phone Number *</label>
                <input type="tel" id="phone" name="phone" required pattern="^\+?[\d\s\-]{7,15}$" placeholder="e.g., +27 123 456 789">

                <label for="paymentMethod">Payment Method *</label>
                <select id="paymentMethod" name="paymentMethod" required>
                    <option value="" disabled selected>Select a payment method</option>
                    <option value="PayFast">PayFast</option>
                    <!-- Add more payment methods if needed -->
                </select>

                <button type="submit" class="submit-btn">Proceed to Payment</button>
            </form>
        </div>
    </div>

    <script src="dashboardjs.js"></script>

</body>
</html>
