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
    <title>My Cart</title>
    <style>
        table { width: 70%; border-collapse: collapse; margin: 20px auto; }
        th, td { border: 1px solid #ccc; padding: 10px; text-align: center; }
        th { background: #f2f2f2; }
        .btn { padding: 5px 10px; background: green; color: white; border: none; cursor: pointer; }
        .btn:hover { background: darkgreen; }
        .btn-red { background: red; }
        .btn-red:hover { background: darkred; }
    </style>
</head>
<body>
    <h2 style="text-align:center;">My Cart</h2>

    <%
        double total = 0;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","root");

            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT c.book_id, c.quantity, b.title, b.author, b.price FROM cart c JOIN books b ON c.book_id=b.id WHERE c.customer_email='"+customerEmail+"'");

            if(!rs.isBeforeFirst()){
                out.println("<p style='text-align:center;color:red;'>Your cart is empty</p>");
            } else {
    %>
        <table>
            <tr>
                <th>Book Title</th>
                <th>Author</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Total</th>
                <th>Action</th>
            </tr>
            <%
                while(rs.next()){
                    int quantity = rs.getInt("quantity");
                    double price = rs.getDouble("price");
                    double subtotal = price * quantity;
                    total += subtotal;
            %>
            <tr>
                <td><%= rs.getString("title") %></td>
                <td><%= rs.getString("author") %></td>
                <td>&#8377;<%= price %></td>
                <td><%= quantity %></td>
                <td>&#8377;<%= subtotal %></td>
                <td>
                    <form action="RemoveFromCartServlet" method="post">
                        <input type="hidden" name="book_id" value="<%= rs.getInt("book_id") %>">
                        <input type="submit" value="Remove" class="btn btn-red">
                    </form>
                </td>
            </tr>
            <% } %>
            <tr>
                <th colspan="4">Total Amount</th>
                <th colspan="2">&#8377;<%= total %></th>
            </tr>
        </table>
        <form action="PlaceOrderServlet" method="post" style="text-align:center;">
            <input type="submit" value="Place Order" class="btn">
        </form>
    <%
            }
        } catch(Exception e){
            out.println("<p style='color:red;'>Error: "+e.getMessage()+"</p>");
        }
    %>
    <p style="text-align:center;"><a href="customerDashboard.jsp" class="btn">Back to Dashboard</a></p>
</body>
</html>

