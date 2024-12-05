package com.umpdevelopers.registration;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.google.gson.Gson;
import com.google.gson.JsonObject;

/**
 * Servlet implementation class PaymentServlet
 */
@WebServlet("/PaymentServlet")
public class PaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    // Get the payment data from the request
	    String paymentData = request.getReader().readLine();

	    // Parse the payment data into a JSON object
	    Gson gson = new Gson();
	    JsonObject paymentObject = gson.fromJson(paymentData, JsonObject.class);

	    // Process the payment data
	    String fullName = paymentObject.get("fullName").getAsString();
	    String email = paymentObject.get("email").getAsString();
	    String phone = paymentObject.get("phone").getAsString();
	    String paymentMethod = paymentObject.get("paymentMethod").getAsString();
	    double amount = paymentObject.get("amount").getAsDouble();

	    // Generate the ticket using the TicketDAO class
	    TicketDAO ticketDAO = new TicketDAO();
	    Ticket ticket = ticketDAO.generateTicket(fullName, email, phone, paymentMethod, amount);

	    // Send the ticket data back to the client
	    PrintWriter out = response.getWriter();
	    out.println(gson.toJson(ticket));
	    
	 // ...

	 // Generate the ticket
	 String ticketName = "Event Ticket";
	 String ticketPrice = "20.00";
	 String ticketDate = "2023-03-15";
	 String ticketLocation = "Event Location";
	 String ticketDescription = "Event Description";
	 
	 request.setAttribute("ticketName", ticket.getEventName());
	 request.setAttribute("ticketPrice", ticket.getPrice());
	 request.setAttribute("ticketDate", ticket.getEventDate());
	 request.setAttribute("ticketLocation", ticket.getEventLocation());
	 request.setAttribute("ticketDescription", "Your event description here");

	 


	 // Forward the request to the JSP file
	 RequestDispatcher dispatcher = request.getRequestDispatcher("ticket.jsp");
	 dispatcher.forward(request, response);
	 
	 //dispatcher.forward(request, response);
	}

}
