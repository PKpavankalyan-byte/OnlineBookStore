package com.registerLogin;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/AddBookServlet")
public class AddBookServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String title = req.getParameter("title");
        String author = req.getParameter("author");
        String category = req.getParameter("category");
        double price = Double.parseDouble(req.getParameter("price"));
        int stock = Integer.parseInt(req.getParameter("stock"));
        String description = req.getParameter("description");
        String image = req.getParameter("image");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","root");

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO books (title, author, category, price, stock, description, image) VALUES (?,?,?,?,?,?,?)"
            );
            ps.setString(1, title);
            ps.setString(2, author);
            ps.setString(3, category);
            ps.setDouble(4, price);
            ps.setInt(5, stock);
            ps.setString(6, description);
            ps.setString(7, image);

            int count = ps.executeUpdate();
            if(count > 0) {
                res.sendRedirect("manageBooks.jsp");
            } else {
                res.getWriter().println("<p style='color:red;'>Failed to add book.</p>");
            }

        } catch(Exception e) {
            e.printStackTrace();
            res.getWriter().println("<p style='color:red;'>Error: "+e.getMessage()+"</p>");
        }
    }
}
