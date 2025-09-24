package com.registerLogin;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/DeleteBookServlet")
public class DeleteBookServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String bookId = req.getParameter("id");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","root");
            PreparedStatement ps = con.prepareStatement("DELETE FROM books WHERE id=?");
            ps.setInt(1, Integer.parseInt(bookId));
            ps.executeUpdate();

            res.sendRedirect("manageBooks.jsp");
        } catch(Exception e){
            e.printStackTrace();
            res.getWriter().println("<p style='color:red;'>Error deleting book: "+e.getMessage()+"</p>");
        }
    }
}
