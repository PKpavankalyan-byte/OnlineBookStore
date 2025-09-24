package com.registerLogin;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/RemoveFromCartServlet")
public class RemoveFromCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String customerEmail = (String) session.getAttribute("email_key");

        if(customerEmail == null){
            res.sendRedirect("login.jsp");
            return;
        }

        int bookId = Integer.parseInt(req.getParameter("book_id"));

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","root");

            PreparedStatement ps = con.prepareStatement("DELETE FROM cart WHERE customer_email=? AND book_id=?");
            ps.setString(1, customerEmail);
            ps.setInt(2, bookId);
            ps.executeUpdate();

            res.sendRedirect("viewCart.jsp");

        } catch(Exception e) {
            e.printStackTrace();
            res.getWriter().println("<p style='color:red;'>Error removing from cart: "+e.getMessage()+"</p>");
        }
    }
}
