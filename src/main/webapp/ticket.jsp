<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Styled Ticket</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .ticket-card {
            background-color: #fff;
            width: 350px;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
            position: relative;
        }
        .ticket-card h1 {
            font-size: 24px;
            margin-bottom: 10px;
        }
        .ticket-info p {
            margin: 5px 0;
            font-size: 16px;
            color: #333;
        }
        .ticket-reference {
            margin-top: 20px;
            padding-top: 10px;
            border-top: 1px solid #ddd;
        }
        .ticket-reference p {
            font-size: 14px;
            color: #777;
            margin-bottom: 15px;
        }
        .icons-container {
            display: flex;
            justify-content: space-around;
            margin-top: 10px;
        }
        .icon {
            width: 60px;
            height: auto;
        }
    </style>
</head>
<body>

<div class="ticket-card">
    <h1>Event Ticket</h1>
    <div class="ticket-info">
        <p><strong>Ticket Name:</strong> ${ticketName}Event Tickets</p>
        <p><strong>Ticket Price:</strong> R${ticketPrice}5.00</p>
        <p><strong>Ticket Date:</strong> ${ticketDate}2024-12-25</p>
        <p><strong>Ticket Location:</strong> ${ticketLocation}Mbombela</p>
    </div>

    <div class="ticket-reference">
        <p>Use the reference number to collect your ticket from:</p>
        <div class="icons-container">
            <img src='http://localhost:8080/EventsManagement3.0/images/SHOPRITE-LOGO.png'  class="icon">
            <img src='http://localhost:8080/EventsManagement3.0/images/Pick-n-Pay-logo-carousel.png'  class="icon">
            <img src='http://localhost:8080/EventsManagement3.0/images/Boxer.jpeg'   class="icon">
        </div>
    </div>
</div>

</body>
</html>
