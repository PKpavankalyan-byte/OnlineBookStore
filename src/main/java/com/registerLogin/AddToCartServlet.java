package com.registerLogin;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String customerEmail = (String) session.getAttribute("email_key");

        if (customerEmail == null) {
            res.sendRedirect("login.jsp"); // redirect if not logged in
            return;
        }

        int bookId = Integer.parseInt(req.getParameter("book_id"));
        int quantity = Integer.parseInt(req.getParameter("quantity"));

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","root");

            // Check if book already in cart
            PreparedStatement psCheck = con.prepareStatement(
                "SELECT * FROM cart WHERE customer_email=? AND book_id=?");
            psCheck.setString(1, customerEmail);
            psCheck.setInt(2, bookId);
            ResultSet rs = psCheck.executeQuery();

            if (rs.next()) {
                // Update quantity
                int existingQty = rs.getInt("quantity");
                PreparedStatement psUpdate = con.prepareStatement(
                    "UPDATE cart SET quantity=? WHERE customer_email=? AND book_id=?");
                psUpdate.setInt(1, existingQty + quantity);
                psUpdate.setString(2, customerEmail);
                psUpdate.setInt(3, bookId);
                psUpdate.executeUpdate();
            } else {
                // Insert new
                PreparedStatement psInsert = con.prepareStatement(
                    "INSERT INTO cart(customer_email, book_id, quantity) VALUES(?,?,?)");
                psInsert.setString(1, customerEmail);
                psInsert.setInt(2, bookId);
                psInsert.setInt(3, quantity);
                psInsert.executeUpdate();
            }

            res.sendRedirect("viewCart.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            res.getWriter().println("Error adding to cart: " + e.getMessage());
        }
    }
}
