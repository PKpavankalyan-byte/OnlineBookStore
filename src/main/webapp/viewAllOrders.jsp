<%@ page import="java.sql.*" %>
<%
    String adminName = (String) session.getAttribute("name_key");
    String role = (String) session.getAttribute("role_key");
    if(adminName == null || !"admin".equals(role)){
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Orders</title>
    <style>
        table { width: 90%; border-collapse: collapse; margin: 20px auto; }
        th, td { border:1px solid #ccc; padding:10px; text-align:center; }
        th { background:#f2f2f2; }
        .btn { padding:5px 10px; background:green; color:white; border:none; cursor:pointer; }
        .btn:hover { background:darkgreen; }
    </style>
</head>
<body>
    <h2 style="text-align:center;">All Orders</h2>
    <table>
        <tr>
            <th>Order ID</th>
            <th>Customer</th>
            <th>Book Title</th>
            <th>Quantity</th>
            <th>Total Price</th>
            <th>Order Date</th>
        </tr>
        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/register","root","root");

                String sql = "SELECT o.id, o.customer_email, b.title, o.quantity, o.total_price, o.order_date " +
                             "FROM orders o JOIN books b ON o.book_id=b.id " +
                             "ORDER BY o.order_date DESC";

                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery(sql);

                if(!rs.isBeforeFirst()){
                    out.println("<tr><td colspan='6' style='color:red;'>No orders found</td></tr>");
                } else {
                    while(rs.next()){
        %>
        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("customer_email") %></td>
            <td><%= rs.getString("title") %></td>
            <td><%= rs.getInt("quantity") %></td>
            <td>&#8377;<%= rs.getDouble("total_price") %></td>
            <td><%= rs.getTimestamp("order_date") %></td>
        </tr>
        <%
                    }
                }

            } catch(Exception e){
                out.println("<tr><td colspan='6' style='color:red;'>Error: " + e.getMessage() + "</td></tr>");
            }
        %>
    </table>
    <p style="text-align:center;"><a href="adminDashboard.jsp" class="btn">Back to Dashboard</a></p>
</body>
</html>
