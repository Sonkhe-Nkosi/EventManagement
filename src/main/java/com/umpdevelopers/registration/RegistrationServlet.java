package com.umpdevelopers.registration;

import java.io.IOException;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/register")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username = request.getParameter("name");
		String userpassword = request.getParameter("pass");
		String Reuserpassword = request.getParameter("re_pass");
		String email = request.getParameter("email");
		String phone = request.getParameter("contact");
		
		RequestDispatcher dispatcher = null;
		Connection con = null;
		
			if(username == null || username.equals("")) {
			
			request.setAttribute("status","invalidName");
			dispatcher = request.getRequestDispatcher("registration.jsp");
			dispatcher.forward(request, response);

			}
			if(userpassword == null || userpassword.equals("")) {
				
				request.setAttribute("status","invalidPassword");
				dispatcher = request.getRequestDispatcher("registration.jsp");
				dispatcher.forward(request, response);

				}else if(!userpassword.equals(Reuserpassword)) {
					
					request.setAttribute("status","invalidConfirmPassword");
					dispatcher = request.getRequestDispatcher("registration.jsp");
					dispatcher.forward(request, response);
					
				}
			
			if(email == null || email.equals("")) {
				
				request.setAttribute("status","invalidEmail");
				dispatcher = request.getRequestDispatcher("registration.jsp");
				dispatcher.forward(request, response);

				}
			if(phone == null || phone.equals("")) {
				
				request.setAttribute("status","invalidMobile");
				dispatcher = request.getRequestDispatcher("registration.jsp");
				dispatcher.forward(request, response);

				}else if(phone.length() > 10){
					request.setAttribute("status","invalidMobileLength");
					dispatcher = request.getRequestDispatcher("registration.jsp");
					dispatcher.forward(request, response);
				}
		

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users?useSSL=false","root","Peterson@50196");
			PreparedStatement pst = con.prepareStatement("insert into clients(username,userpassword,email,phone) values(?,?,?,?)");
			pst.setString(1, username);
			pst.setString(2, userpassword);
			pst.setString(3, email);
			pst.setString(4, phone);
			
			int rowCount = pst.executeUpdate();
			dispatcher = request.getRequestDispatcher("registration.jsp");
			
			if( rowCount > 0 ){
				request.setAttribute("status", "Success");
			}else {
				request.setAttribute("status", "Failed");
			}
			
			dispatcher.forward(request, response);
			
		}catch(Exception e) {
			
			e.printStackTrace();
		}finally {
			
			try {
			con.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
	}

}
