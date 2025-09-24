package com.registerLogin;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/PlaceOrderServlet")
public class PlaceOrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String customerEmail = (String) session.getAttribute("email_key");

        if (customerEmail == null) {
            res.sendRedirect("login.jsp");
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","root");

            // Insert all cart items into orders
            String insertOrderSQL = "INSERT INTO orders (customer_email, book_id, quantity, total_price) " +
                                    "SELECT c.customer_email, c.book_id, c.quantity, b.price*c.quantity " +
                                    "FROM cart c JOIN books b ON c.book_id = b.id WHERE c.customer_email = ?";
            PreparedStatement psInsert = con.prepareStatement(insertOrderSQL);
            psInsert.setString(1, customerEmail);
            psInsert.executeUpdate();

            // Clear the cart
            PreparedStatement psClear = con.prepareStatement("DELETE FROM cart WHERE customer_email=?");
            psClear.setString(1, customerEmail);
            psClear.executeUpdate();

            res.sendRedirect("viewOrders.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            res.getWriter().println("<p style='color:red;'>Error placing order: "+e.getMessage()+"</p>");
        }
    }
}
