package com.umpdevelopers.registration;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ImageServlet")
public class ImageServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int eventId = Integer.parseInt(request.getParameter("id"));
        
        // Database connection setup (you can reuse your connection setup from DashboardServlet)
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/users?useSSL=false&allowPublicKeyRetrieval=true", 
                "root", 
                "Peterson@50196"
            );

            String sql = "SELECT event_flyer FROM events WHERE event_id = ?";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setInt(1, eventId);
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                byte[] image = rs.getBytes("event_flyer");
                response.setContentType("image/jpeg");
                response.getOutputStream().write(image);
            } else {
                // No image found, handle this case
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
