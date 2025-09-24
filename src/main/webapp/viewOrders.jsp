<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%
    String customerEmail = (String) session.getAttribute("email_key");
    if(customerEmail == null){
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Orders</title>
    <style>
        table { width: 70%; border-collapse: collapse; margin: 20px auto; }
        th, td { border: 1px solid #ccc; padding: 10px; text-align: center; }
        th { background: #f2f2f2; }
        .btn { padding: 5px 10px; background: green; color: white; border: none; cursor: pointer; }
        .btn:hover { background: darkgreen; }
    </style>
</head>
<body>
    <h2 style="text-align:center;">My Orders</h2>
    <%
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","root");

            PreparedStatement ps = con.prepareStatement(
                "SELECT o.id, b.title, b.author, o.quantity, o.total_price, o.order_date " +
                "FROM orders o JOIN books b ON o.book_id = b.id " +
                "WHERE o.customer_email=? ORDER BY o.order_date DESC");
            ps.setString(1, customerEmail);
            ResultSet rs = ps.executeQuery();

            if(!rs.isBeforeFirst()){
                out.println("<p style='text-align:center;color:red;'>You have no orders yet</p>");
            } else {
    %>
    <table>
        <tr>
            <th>Order ID</th>
            <th>Book Title</th>
            <th>Author</th>
            <th>Quantity</th>
            <th>Total Price</th>
            <th>Order Date</th>
        </tr>
        <%
            while(rs.next()){
        %>
        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("title") %></td>
            <td><%= rs.getString("author") %></td>
            <td><%= rs.getInt("quantity") %></td>
            <td>&#8377;<%= rs.getDouble("total_price") %></td>
            <td><%= rs.getTimestamp("order_date") %></td>
        </tr>
        <% } %>
    </table>
    <%
            }
        } catch(Exception e){
            out.println("<p style='color:red;text-align:center;'>Error: "+e.getMessage()+"</p>");
        }
    %>
    <p style="text-align:center;"><a href="customerDashboard.jsp" class="btn">Back to Dashboard</a></p>
</body>
</html>
