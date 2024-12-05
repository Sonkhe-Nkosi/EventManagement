package com.umpdevelopers.registration;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class AdminServlet
 */
@WebServlet("/registerEvent")
@MultipartConfig(maxFileSize = 16177215) // 16MB
public class AdminServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database credentials and URL
 /*   private static final String DB_URL = "jdbc:mysql://localhost:3306/users?useSSL=false";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Peterson@50196";
*/
    /**
     * Handles the HTTP POST request for event registration.
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Log the start of the method
        System.out.println("AdminServlet: doPost method invoked.");

        // Retrieve form fields
        String eventName = request.getParameter("event_name");
        String eventDate = request.getParameter("event_date");
        String eventLocation = request.getParameter("event_location");
        String eventDescription = request.getParameter("event_description");
        Part filePart = request.getPart("event_flyer"); // Retrieves <input type="file" name="event_flyer">
/*
        System.out.println("Received Event Name: " + eventName);
        System.out.println("Received Event Date: " + eventDate);
        System.out.println("Received Event Location: " + eventLocation);
        System.out.println("Received Event Description: " + eventDescription);
        System.out.println("Received File Part: " + (filePart != null ? "Yes" : "No"));
*/
        RequestDispatcher dispatcher = null;
        Connection con = null;

        // Basic validation
        if(eventName == null || eventName.equals("")) {
            //System.out.println("Validation Failed: Invalid Event Name");
            request.setAttribute("status", "invalidEventName");
            dispatcher = request.getRequestDispatcher("admin.jsp");
            dispatcher.forward(request, response);
           
        }

        if(eventDate == null || eventDate.equals("")) {
           // System.out.println("Validation Failed: Invalid Event Date");
            request.setAttribute("status", "invalidEventDate");
            dispatcher = request.getRequestDispatcher("admin.jsp");
            dispatcher.forward(request, response);
            
        }

        if(eventLocation == null || eventLocation.equals("")) {
            //System.out.println("Validation Failed: Invalid Event Location");
            request.setAttribute("status", "invalidEventLocation");
            dispatcher = request.getRequestDispatcher("admin.jsp");
            dispatcher.forward(request, response);
           
        }

        if(eventDescription == null || eventDescription.equals("")) {
           // System.out.println("Validation Failed: Invalid Event Description");
            request.setAttribute("status", "invalidEventDescription");
            dispatcher = request.getRequestDispatcher("admin.jsp");
            dispatcher.forward(request, response);
            
        }

        if(filePart == null || filePart.getSize() == 0) {
           // System.out.println("Validation Failed: Invalid Event Flyer");
            request.setAttribute("status", "invalidEventFlyer");
            dispatcher = request.getRequestDispatcher("admin.jsp");
            dispatcher.forward(request, response);
           
        }

        try {
            // Load JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
           // System.out.println("JDBC Driver Loaded.");

            // Establish connection
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users?useSSL=false", "root", "Peterson@50196");
            System.out.println("Database Connection Established.");

            // Prepare SQL statement
           // String sql = "INSERT INTO events (event_name, event_date, event_location, event_description, event_image) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement pst = con.prepareStatement("INSERT INTO events (event_name, event_date, event_location, event_description, event_flyer) VALUES (?, ?, ?, ?, ?)");
            pst.setString(1, eventName);
            pst.setString(2, eventDate);
            pst.setString(3, eventLocation);
            pst.setString(4, eventDescription);

            // Convert uploaded file to InputStream
            InputStream inputStream = null;
            if (filePart != null) {
                inputStream = filePart.getInputStream();
                System.out.println("File InputStream Obtained.");
            }

            if (inputStream != null) {
                pst.setBlob(5, inputStream);
                System.out.println("Event Flyer Set in PreparedStatement.");
            } else {
                pst.setNull(5, java.sql.Types.BLOB);
                System.out.println("Event Flyer Set as NULL.");
            }

            // Execute update
            int rowCount = pst.executeUpdate();
            System.out.println("Executed Insert Statement. Rows Affected: " + rowCount);

            dispatcher = request.getRequestDispatcher("admin.jsp");

            if(rowCount > 0) {
                request.setAttribute("status", "Success");
                System.out.println("Event Registered Successfully.");
            } else {
                request.setAttribute("status", "Failed");
                System.out.println("Event Registration Failed.");
            }

            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Exception Occurred: " + e.getMessage());
            // Optionally set a failure status
            request.setAttribute("status", "Failed");
            dispatcher = request.getRequestDispatcher("admin.jsp");
            dispatcher.forward(request, response);
        } finally {
            // Close connection
            try {
                if(con != null && !con.isClosed()) {
                    con.close();
                    System.out.println("Database Connection Closed.");
                }
            } catch(SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
