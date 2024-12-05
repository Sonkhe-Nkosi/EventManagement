<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">

    <!-- Added SweetAlert CSS -->
    <link rel="stylesheet" href="https://unpkg.com/sweetalert/dist/sweetalert.css">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>eVENTS: Home</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        /* General Styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #ffffff;
            color: #000000;
            display: flex;
        }

        /* Sidebar */
        .side-nav {
            height: 100vh;
            width: 250px;
            position: fixed;
            top: 0;
            left: 0;
            background-color: #f5f5f5;
            padding-top: 20px;
            overflow-y: auto;
            border-right: 1px solid #ddd;
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
            color: #000000;
        }

        .side-nav a {
            padding: 10px 20px;
            text-decoration: none;
            font-size: 20px;
            color: #000000;
            display: flex;
            align-items: center;
            margin: 10px 0;
        }

        .side-nav a i {
            margin-right: 10px;
            color: #00aaff;
        }

        .side-nav a:hover {
            background-color: #e0e0e0;
        }

        /* Main Content */
        .main-content {
            margin-left: 250px;
            padding: 50px;
            flex-grow: 1;
            width: calc(100% - 250px);
            background-color: #f0f0f0; /* Background color to make the main content visible */
            border: 1px solid red; /* Temporary debug border */
        }

        .post {
            background-color: #ffffff;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 20px;
            position: relative;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .post-title {
            font-size: 1.5rem;
            margin-bottom: 10px;
            color: #000000;
        }

        .post-description {
            font-size: 1rem;
            margin-bottom: 15px;
            color: #333333;
        }

        .post-media img,
        .post-media video {
            width: 100%;
            max-height: 300px;
            object-fit: cover;
            border-radius: 10px;
            margin-bottom: 10px;
            cursor: pointer;
        }

        .post-date-time {
            font-size: 0.8rem;
            color: #777777;
            margin-bottom: 10px;
        }

        /* Like Button and Counter */
        .like-heart {
            position: absolute;
            bottom: 15px;
            right: 20px;
            font-size: 1.5rem;
            color: transparent;
            cursor: pointer;
        }

        .like-heart.active {
            color: red;
        }

        .like-counter {
            position: absolute;
            bottom: 17px;
            left: 750px;
            font-size: 1rem;
            color: #333333;
        }

        /* Floating Cart */
        .cart-container {
            position: fixed;
            top: 20px;
            right: 20px;
            background-color: #f5f5f5;
            border-radius: 50%;
            width: 60px;
            height: 60px;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            cursor: pointer;
        }

        .cart-container i {
            font-size: 1.8rem;
            color: #000000;
        }

        .cart-counter {
            position: absolute;
            top: 5px;
            right: 5px;
            background-color: #ff4500;
            color: #ffffff;
            font-size: 1rem;
            border-radius: 50%;
            padding: 5px 10px;
        }

        /* Draggable Form Container */
        .draggable {
            position: absolute;
            top: 50px;
            left: 50px;
            width: 600px;
            background-color: #f0f0f0;
            border-radius: 8px;
            padding: 20px;
            z-index: 1000;
            border: 1px solid #ccc;
            cursor: grab;
        }

        .draggable:active {
            cursor: grabbing;
        }

        .drag-handle {
            background-color: #007bff;
            padding: 10px;
            color: white;
            cursor: move;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        /* Event Registration Form */
        #registrationForm input[type="text"],
        #registrationForm input[type="date"],
        #registrationForm input[type="file"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        #registrationForm input[type="submit"] {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 4px;
        }

        #registrationForm input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>

<body>

    <!-- Side Navigation -->
    <div class="side-nav">
        <div class="logo-container">
            <img src="http://localhost:8080/EventsManagement/images/logo1.jpg" alt="Logo">
            <span class="logo-text">eMATE</span>
        </div>

        <a href="CalenderServlet"><i class="fas fa-calendar-alt"></i> Events Calendar</a>
        <a href="#" id="addEventIcon"><i class="fas fa-plus-circle"></i> Add Event</a>
        
        <a href="reports.jsp"><i class="fas fa-file-alt"></i> Reports</a>
        <a href="#" id="logoutButton"><i class="fas fa-sign-out-alt"></i> Logout</a> <!-- Logout Button -->
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <h1>Home Feed</h1>
        <div class="post">
            <h2 class="post-title">Upcoming Event</h2>
            <p class="post-description">Details about the upcoming event.</p>
        </div>

        <!-- Draggable Event Registration Form -->
        <div id="registrationFormContainer" class="draggable" style="display: none;">
            <div id="dragHandle" class="drag-handle">
                <h2>Event Registration Form</h2>
                <span class="close">&times;</span>
            </div>
            <!-- Updated Form Tag with method and action -->
            <form id="register-form" method="post" action="registerEvent" class="register-form" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="event_name">Event Name:
                        <i class="zmdi zmdi-account material-icon-name"></i>
                    </label>
                    <input type="text" id="event_name" name="event_name" required="required" />
                </div>

                <div class="form-group">
                    <label for="event_date">Event Date:
                        <i class="zmdi zmdi-event_date"></i>
                    </label>
                    <input type="date" id="event_date" name="event_date" required="required" />
                </div>

                <div class="form-group">
                    <label for="event_location">Event Location:
                        <i class="zmdi zmdi-event_location"></i>
                    </label>
                    <input type="text" id="event_location" name="event_location" required="required" />
                </div>

                <div class="form-group">
                    <label for="event_description">Event Description:
                        <i class="zmdi zmdi-event_description"></i>
                    </label>
                    <input type="text" id="event_description" name="event_description" required="required" />
                </div>

                <div class="form-group">
                    <label for="event_flyer">Upload Event Flyer:
                        <i class="zmdi zmdi-upload"></i>
                    </label>
                    <input type="file" id="event_flyer" name="event_flyer" required="required" />
                </div>

                <input type="submit" value="Register Event">
            </form>
        </div>
    </div>

    <!-- JavaScript to handle logout click -->
    <script type="text/javascript">
        document.getElementById('logoutButton').addEventListener('click', function() {
            // Redirect to login page
            window.location.href = 'login.jsp';  // Replace 'login.jsp' with the actual login page URL
        });

        // Draggable Form Logic
        const dragHandle = document.getElementById('dragHandle');
        const formContainer = document.getElementById('registrationFormContainer');

        dragHandle.addEventListener('mousedown', function(e) {
            let offsetX = e.clientX - formContainer.getBoundingClientRect().left;
            let offsetY = e.clientY - formContainer.getBoundingClientRect().top;

            function mouseMoveHandler(e) {
                formContainer.style.left = e.clientX - offsetX + 'px';
                formContainer.style.top = e.clientY - offsetY + 'px';
            }

            function mouseUpHandler() {
                window.removeEventListener('mousemove', mouseMoveHandler);
                window.removeEventListener('mouseup', mouseUpHandler);
            }

            window.addEventListener('mousemove', mouseMoveHandler);
            window.addEventListener('mouseup', mouseUpHandler);
        });

        // Show the form container when the add event icon is clicked
        document.getElementById('addEventIcon').addEventListener('click', function() {
            formContainer.style.display = 'block';
        });

        // Close the form when the close button is clicked
        dragHandle.querySelector('.close').addEventListener('click', function() {
            formContainer.style.display = 'none';
        });
    </script>
</body>

</html>

             	
             	
              <!-- // <input type="hidden" id="status" value="<%= request.getAttribute("status") %>">//-->
                
             <!--
                <label for="event_name">Event Name:</label>
                <input type="text" id="event_name" name="event_name" required>

                <label for="event_date">Event Date:</label>
                <input type="date" id="event_date" name="event_date" required>
                
                <label for="event_location">Event Location:</label>
                <input type="text" id="event_location" name="event_location" required>
                
                <label for="event_description">Event Description:</label>
                <input type="text" id="event_description" name="event_description" required>
                
                <label for="event_flyer">Upload Event Flyer:</label>
                <input type="file" id="event_flyer" name="event_flyer" accept="image/*" required>
				
				<div class="form-group form-button">
                <input type="submit" class="form-submit" value="Register Event">
                </div>
               -->
            </form>
        </div>
    </div>

    <!-- Included SweetAlert JS -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <!-- Link to SweetAlert CSS if not already included in the head -->
    <!-- <link rel="stylesheet" href="https://unpkg.com/sweetalert/dist/sweetalert.css"> -->

    <!-- Existing JS -->
    <script src="adminjs.js"></script>

    <!-- Added JavaScript for Handling Status and Displaying Alerts -->
    <script type="text/javascript">
        document.addEventListener("DOMContentLoaded", function() {
            var statusElement = document.getElementById("status");
            if (statusElement) {
                var status = statusElement.value;
                if (status === "Success") {
                    swal("Congrats!", "Event registered successfully", "success");
                } else if (status === "invalidEventName") {
                    swal("Error!", "Please enter a valid event name", "error");
                } else if (status === "invalidEventDate") {
                    swal("Error!", "Please select a valid event date", "error");
                } else if (status === "invalidEventLocation") {
                    swal("Error!", "Please enter a valid event location", "error");
                } else if (status === "invalidEventDescription") {
                    swal("Error!", "Please enter a valid event description", "error");
                } else if (status === "invalidEventFlyer") {
                    swal("Error!", "Please upload a valid event flyer", "error");
                }
                // Add more status cases as needed
            }
        });
    </script>

</body>

</html>
