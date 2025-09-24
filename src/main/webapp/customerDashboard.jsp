<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String customerName = (String) session.getAttribute("name_key");
    String customerEmail = (String) session.getAttribute("email_key");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customer Dashboard</title>
    <style>
        body { font-family: Arial; background: #f8f9fa; }
        h2 { color: #333; }
        .book-card {
            border: 1px solid #ccc;
            padding: 15px;
            margin: 10px;
            background: white;
            display: inline-block;
            width: 200px;
            text-align: center;
            border-radius: 10px;
        }
        .btn {
            padding: 8px 15px;
            background: green;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            text-decoration: none;
        }
        .btn:hover { background: darkgreen; }
    </style>
</head>
<body>
    <h2>Welcome, <%= customerName %></h2>
    <h3>Available Books</h3>

    <div>
    <%
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/register", "root", "root");
            st = con.createStatement();
            rs = st.executeQuery("SELECT * FROM books");

            while (rs.next()) {
    %>
        <div class="book-card">
            <h4><%= rs.getString("title") %></h4>
            <p>Author: <%= rs.getString("author") %></p>
            <p>Category: <%= rs.getString("category") %></p>
            <p>Price: &#8377;<%= rs.getDouble("price") %></p>
            <form action="AddToCartServlet" method="post">
                <input type="hidden" name="book_id" value="<%= rs.getInt("id") %>">
                <input type="number" name="quantity" value="1" min="1" max="<%= rs.getInt("stock") %>">
                <input type="submit" class="btn" value="Add to Cart">
            </form>
        </div>
    <%
            }
        } catch (Exception e) {
            out.print("<p style='color:red;'>Error loading books: " + e.getMessage() + "</p>");
        } finally {
            if (rs != null) try { rs.close(); } catch(Exception e){}
            if (st != null) try { st.close(); } catch(Exception e){}
            if (con != null) try { con.close(); } catch(Exception e){}
        }
    %>
    </div>
    <br>
    <a href="viewCart.jsp" class="btn">View Cart</a>
    <a href="viewOrders.jsp" class="btn">My Orders</a>
    <a href="logout" class="btn" style="background:red;">Logout</a>

</body>
</html>
