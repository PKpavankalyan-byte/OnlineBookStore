package com.registerLogin;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/EditBookServlet")
public class EditBookServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String title = req.getParameter("title");
        String author = req.getParameter("author");
        String category = req.getParameter("category");
        double price = Double.parseDouble(req.getParameter("price"));
        int stock = Integer.parseInt(req.getParameter("stock"));

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","root");

            PreparedStatement ps = con.prepareStatement(
                "UPDATE books SET title=?, author=?, category=?, price=?, stock=? WHERE id=?"
            );
            ps.setString(1, title);
            ps.setString(2, author);
            ps.setString(3, category);
            ps.setDouble(4, price);
            ps.setInt(5, stock);
            ps.setInt(6, id);

            ps.executeUpdate();
            res.sendRedirect("manageBooks.jsp");

        } catch(Exception e){
            e.printStackTrace();
            res.getWriter().println("<p style='color:red;'>Error: "+e.getMessage()+"</p>");
        }
    }
}
