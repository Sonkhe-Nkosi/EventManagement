<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Event Registration</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 500px;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        h2 {
            text-align: center;
            color: #333;
        }

        label {
            display: block;
            margin: 10px 0 5px;
            color: #555;
        }

        input, select {
            width: 100%;
            padding: 10px;
            margin: 5px 0 20px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }

        button {
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Register for Event</h2>
        <form id="registrationForm">
            <label for="user_id">User ID</label>
            <input type="text" id="user_id" name="user_id" required>

            <label for="event_id">Event ID</label>
            <input type="text" id="event_id" name="event_id" required>

            <label for="payment_status">Payment Status</label>
            <select id="payment_status" name="payment_status">
                <option value="paid">Paid</option>
                <option value="pending">Pending</option>
            </select>

            <label for="ticket_number">Ticket Number</label>
            <input type="text" id="ticket_number" name="ticket_number" required>

            <label for="registration_date">Registration Date</label>
            <input type="date" id="registration_date" name="registration_date" required>

            <button type="submit">Submit Registration</button>
        </form>
    </div>

    <script src="registrationjs.js"></script>

</body>
</html>
