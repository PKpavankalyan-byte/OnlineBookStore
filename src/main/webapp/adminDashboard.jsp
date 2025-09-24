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
    <title>Admin Dashboard</title>
    <style>
        body { font-family: Arial; background: #f8f9fa; }
        h2 { text-align: center; color: #333; }
        ul { list-style-type: none; text-align: center; }
        li { display: inline-block; margin: 10px; }
        .btn { padding: 10px 20px; background: green; color: white; text-decoration: none; border-radius: 5px; }
        .btn:hover { background: darkgreen; }
    </style>
</head>
<body>
    <h2>Welcome, <%= adminName %> &#128104;&#8205;&#128188;</h2>
    <ul>
        <li><a href="addBook.jsp" class="btn">Add New Book</a></li>
        <li><a href="manageBooks.jsp" class="btn">Manage Books</a></li>
        <li><a href="viewAllOrders.jsp" class="btn">View All Orders</a></li>
        <li><a href="logout" class="btn" style="background:red;">Logout</a></li>
    </ul>
</body>
</html>
