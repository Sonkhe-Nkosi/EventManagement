<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Analysis Page - Ticket Sales</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #ffffff; /* White background */
            color: #121212; /* Dark text color */
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
            margin: 0; /* Remove default margin */
            position: relative; /* Allow absolute positioning for menu */
        }
        .container {
            max-width: 1200px; /* Limit max width */
            width: 100%;
        }
        h1 {
            text-align: center;
        }
        .grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr)); /* Responsive grid */
            gap: 20px; /* Space between grid items */
            margin-top: 20px;
        }
        .section {
            padding: 20px;
            border: 1px solid #ddd; /* Light border */
            border-radius: 4px; /* Rounded corners */
            background-color: #f9f9f9; /* Light background */
        }
        canvas {
            max-width: 100%; /* Responsive chart */
        }
        /* Hamburger Menu Styles */
        .menu {
            position: fixed;
            top: 20px;
            left: 20px;
            z-index: 1000; /* Above other elements */
        }
        .menu .hamburger {
            cursor: pointer;
            font-size: 24px;
            color: #121212; /* Dark text color for contrast */
        }
        .nav {
            position: fixed; /* Keep the nav fixed */
            top: 60px; /* Adjust top to avoid overlap */
            left: 20px;
            background-color: #f4f4f4; /* Background for dropdown */
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            border-radius: 4px;
            z-index: 999; /* Ensure dropdown appears above everything */
            display: none; /* Hidden by default */
        }
        .nav a {
            display: block;
            padding: 10px;
            color: #121212; /* Dark text color for links */
            text-decoration: none;
        }
        .nav a:hover {
            background-color: #dddddd; /* Change background on hover */
        }
    </style>
</head>
<body>

<!-- Hamburger Menu -->
<div class="menu">
    <i class="fas fa-bars hamburger" id="hamburger"></i>
    <div class="nav" id="navMenu">
        <a href="admin.jsp"><i class="fas fa-home"></i> Home</a>
        
        
    </div>
</div>

<div class="container">
    <h1>Analysis Dashboard</h1>

    <!-- Grid for Charts -->
    <div class="grid">
        <!-- Ticket Sales Analysis -->
        <div class="section">
            <h2>Ticket Sales Analysis</h2>
            <canvas id="salesChart"></canvas>
        </div>

        <!-- User Engagement Analysis -->
        <div class="section">
            <h2>User Engagement</h2>
            <canvas id="engagementChart"></canvas>
        </div>

        <!-- Revenue Analysis -->
        <div class="section">
            <h2>Revenue Analysis</h2>
            <canvas id="revenueChart"></canvas>
        </div>

        <!-- Additional Analysis Sections -->
        <div class="section">
            <h2>Other Metrics</h2>
            <p>Display additional metrics or KPIs here.</p>
            <canvas id="otherMetricsChart"></canvas>
        </div>
    </div>
</div>
<script src="reportsjs.js"></script>


</body>
</html>
