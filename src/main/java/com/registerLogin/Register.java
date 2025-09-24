package com.registerLogin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/register")
public class Register extends HttpServlet{
	public void service(HttpServletRequest req,HttpServletResponse res) throws IOException, ServletException
	{
		String name = req.getParameter("fullname");
		String email = req.getParameter("email");
		String pass = req.getParameter("password");
		String gender = req.getParameter("gender");
		String city = req.getParameter("city");
		
		res.setContentType("text/html");
		PrintWriter show = res.getWriter();
		
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(
				    "jdbc:mysql://localhost:3306/register", "root", "root");
			PreparedStatement ps = con.prepareStatement("insert into register1 values(?,?,?,?,?,?)");
			ps.setString(1, name);
			ps.setString(2, email);
			ps.setString(3, pass);
			ps.setString(4, gender);
			ps.setString(5, city);
			ps.setString(6, "customer");

			
			int count = ps.executeUpdate();
			
			if(count > 0)
			{
				show.print("<h3 style='color:green'>Registration Successful now you can login with your credentials</h3>");
				RequestDispatcher rd = req.getRequestDispatcher("/Register.jsp");
				rd.include(req, res);
			}
			else
			{
				show.print("<h3 style='color:red'>Registration not Successful please try again</h3>");
				RequestDispatcher rd = req.getRequestDispatcher("/Register.jsp");
				rd.include(req, res);
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			show.print("<h3 style='color:red'>Exception Occured :"+ ex.getMessage()+"</h3>");
			RequestDispatcher rd = req.getRequestDispatcher("/Register.jsp");
			rd.include(req, res);
		}
		
	}
}
