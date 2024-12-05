package com.umpdevelopers.registration;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
		// database connectivity
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("username"); 
		String userpassword = request.getParameter("password");
		HttpSession session = request.getSession();
		RequestDispatcher dispatcher = null;
		
		//Validation
		
		if(email == null || email.equals("")) {
			
			request.setAttribute("status","invalidEmail");
			dispatcher = request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);

		}
		if(userpassword == null || userpassword.equals("")) {
			
			request.setAttribute("status","invalidPassword");
			dispatcher = request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);

		}
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users?useSSL=false","root","Peterson@50196");
			PreparedStatement pst = con.prepareStatement("select * from admin where email = ? and userpassword = ?");
			pst.setString(1, email);
			pst.setString(2, userpassword);
			
			ResultSet rs = pst.executeQuery();
			if( rs.next()){
				session.setAttribute("name", rs.getString("username"));
				dispatcher = request.getRequestDispatcher("admin.jsp");
			}else {
				request.setAttribute("status", "Failed");
				dispatcher = request.getRequestDispatcher("login.jsp");
			}
			
			dispatcher.forward(request, response);
			
		}catch(Exception e) {
			
			e.printStackTrace();
		}
	}

}
