<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
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
    <title>Manage Books</title>
    <style>
        table { width: 80%; border-collapse: collapse; margin: 20px auto; }
        th, td { border: 1px solid #ccc; padding: 10px; text-align: center; }
        th { background: #f2f2f2; }
        .btn { padding: 5px 10px; background: green; color: white; border: none; cursor: pointer; }
        .btn:hover { background: darkgreen; }
        .btn-red { background: red; }
        .btn-red:hover { background: darkred; }
    </style>
</head>
<body>
    <h2 style="text-align:center;">Manage Books</h2>
    <table>
        <tr>
            <th>ID</th><th>Title</th><th>Author</th><th>Category</th><th>Price</th><th>Stock</th><th>Actions</th>
        </tr>
        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","root");
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("SELECT * FROM books ORDER BY id DESC");

                while(rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("title") %></td>
            <td><%= rs.getString("author") %></td>
            <td><%= rs.getString("category") %></td>
            <td>&#8377;<%= rs.getDouble("price") %></td>
            <td><%= rs.getInt("stock") %></td>
            <td>
                <a href="editBook.jsp?id=<%= rs.getInt("id") %>" class="btn">Edit</a>
                <a href="DeleteBookServlet?id=<%= rs.getInt("id") %>" class="btn btn-red" onclick="return confirm('Are you sure?')">Delete</a>
            </td>
        </tr>
        <% } 
            } catch(Exception e){
                out.println("<p style='color:red;text-align:center;'>Error: "+e.getMessage()+"</p>");
            }
        %>
    </table>
    <p style="text-align:center;"><a href="adminDashboard.jsp" class="btn">Back to Dashboard</a></p>
</body>
</html>
