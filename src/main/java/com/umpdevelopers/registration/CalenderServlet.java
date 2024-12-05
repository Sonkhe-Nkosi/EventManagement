package com.umpdevelopers.registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CalenderServlet
 */
@WebServlet("/CalenderServlet")
public class CalenderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        Connection con = null;
	        List<EventsBean> eventList = new ArrayList<>();

	        try {
	            // Load JDBC driver
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            // Connect to the database
	            con = DriverManager.getConnection(
	            	    "jdbc:mysql://localhost:3306/users?useSSL=false&allowPublicKeyRetrieval=true", 
	            	    "root", 
	            	    "Peterson@50196"
	            	);

	            System.out.println("Database Connection Established.");

	            // SQL query to fetch event details
	            Statement prt = con.createStatement();
	            String sql = "SELECT * FROM events";
	            
	           // PreparedStatement pst = con.prepareStatement(sql);

	            // Execute the query
	            
	            ResultSet rs = prt.executeQuery(sql);
	            if (!rs.isBeforeFirst()) {
	                System.out.println("No data found");
	            } else {
	                System.out.println("Data retrieved");
	            }

	            // Process each event and add to the list
	         // Process each event and add to the list
	            while (rs.next()) {
	                int id = rs.getInt("event_id");
	                String name = rs.getString("event_name");
	                java.sql.Date date = rs.getDate("event_date");
	                String location = rs.getString("event_location");
	                String description = rs.getString("event_description");
	                byte[] image = rs.getBytes("event_flyer");

	                EventsBean event = new EventsBean(id, name, date, location, description, image);
	                eventList.add(event);
	            }
	            
	            request.setAttribute("eventList", eventList);
	            RequestDispatcher dispatcher = request.getRequestDispatcher("calender.jsp");
	            dispatcher.forward(request, response);
	            
	            
	          
	            
	    }
	        
	        catch (Exception e) {
	        	
	        	 
	        	
	        	
	        	
	            e.printStackTrace();
	            
	           
	            
	            
	            request.setAttribute("status", "Failed to retrieve events.");
	            
	  
	            RequestDispatcher dispatcher = request.getRequestDispatcher("calender.jsp");
	            dispatcher.forward(request, response);
	            
	            
	            
	        } 
	        
	        
	        finally {
	            // Close the database connection
	            try {
	                if (con != null && !con.isClosed()) {
	                    con.close();
	                }
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	        /*
	       
	        */
	    }
}
