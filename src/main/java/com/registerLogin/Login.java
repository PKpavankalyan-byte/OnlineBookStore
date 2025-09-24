package com.registerLogin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/login")
public class Login extends HttpServlet {
    public void service(HttpServletRequest req,HttpServletResponse res) throws IOException, ServletException {
        String email = req.getParameter("email");
        String pass = req.getParameter("password");
        String role = req.getParameter("role");  // NEW

        res.setContentType("text/html");
        PrintWriter show = res.getWriter();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/register", "root", "root");

            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM register1 WHERE email=? AND password=? AND role=?");

            ps.setString(1, email);
            ps.setString(2, pass);
            ps.setString(3, role);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                HttpSession session = req.getSession();
                session.setAttribute("name_key", rs.getString("fullname"));
                session.setAttribute("email_key", rs.getString("email"));
                session.setAttribute("role_key", rs.getString("role"));

                if ("admin".equalsIgnoreCase(role)) {
                    RequestDispatcher rd = req.getRequestDispatcher("adminDashboard.jsp");
                    rd.forward(req, res);
                } else {
                    RequestDispatcher rd = req.getRequestDispatcher("customerDashboard.jsp");
                    rd.forward(req, res);
                }
            } else {
                show.print("<h2 Style='color:red'>Invalid credentials or role mismatch</h2>");
                RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
                rd.include(req, res);
            }
        } catch(Exception ex) {
            ex.printStackTrace();
            show.print("<h2 Style='color:red'>Exception Occurred: "+ex.getMessage()+"</h2>");
            RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
            rd.include(req, res);
        }
    }
}
