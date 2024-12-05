package com.umpdevelopers.registration;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class TicketDAO {
    private Connection connection;

    public TicketDAO() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/users?useSSL=false&allowPublicKeyRetrieval=true", "root", "Peterson@50196");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    public void createTicket(Ticket ticket) {
        try (PreparedStatement statement = connection.prepareStatement("INSERT INTO tickets (event_name, event_date, event_location, price, buyer_name, buyer_email) VALUES (?, ?, ?, ?, ?, ?)")) {
            statement.setString(1, ticket.getEventName());
            statement.setString(2, ticket.getEventDate());
            statement.setString(3, ticket.getEventLocation());
            statement.setDouble(4, ticket.getPrice());
            statement.setString(5, ticket.getBuyerName());
            statement.setString(6, ticket.getBuyerEmail());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Ticket getTicket(int id) {
        try (PreparedStatement statement = connection.prepareStatement("SELECT * FROM tickets WHERE id = ?")) {
            statement.setInt(1, id);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    Ticket ticket = new Ticket();
                    ticket.setId(resultSet.getInt("id"));
                    ticket.setEventName(resultSet.getString("event_name"));
                    ticket.setEventDate(resultSet.getString("event_date"));
                    ticket.setEventLocation(resultSet.getString("event_location"));
                    ticket.setPrice(resultSet.getDouble("price"));
                    ticket.setBuyerName(resultSet.getString("buyer_name"));
                    ticket.setBuyerEmail(resultSet.getString("buyer_email"));
                    return ticket;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public Ticket generateTicket(String fullName, String email, String phone, String paymentMethod, double amount) {
        Ticket ticket = new Ticket();
        ticket.setBuyerName(fullName);
        ticket.setBuyerEmail(email);
        ticket.setPrice(amount);
        ticket.setEventName("Your Event Name");
        ticket.setEventDate("Event Date");
        ticket.setEventLocation("Event Location");

        createTicket(ticket); // Save the ticket to the database using the existing createTicket method.

        return ticket; // Return the generated ticket object.
    }

}