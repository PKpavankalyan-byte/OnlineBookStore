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
    <title>Add New Book</title>
    <style>
        body { font-family: Arial; background: #f8f9fa; display:flex; justify-content:center; align-items:center; height:100vh;}
        form { background: white; padding: 20px; border-radius: 10px; width: 400px; }
        input, select, textarea { width: 100%; padding: 8px; margin: 5px 0; }
        .btn { padding: 10px 20px; background: green; color: white; border: none; cursor: pointer; }
        .btn:hover { background: darkgreen; }
    </style>
</head>
<body>
    <form action="AddBookServlet" method="post">
        <h2>Add New Book</h2>
        <input type="text" name="title" placeholder="Book Title" required>
        <input type="text" name="author" placeholder="Author" required>
        <input type="text" name="category" placeholder="Category" required>
        <input type="number" step="0.01" name="price" placeholder="Price" required>
        <input type="number" name="stock" placeholder="Stock" required>
        <textarea name="description" placeholder="Description"></textarea>
        <input type="text" name="image" placeholder="Image URL">
        <input type="submit" value="Add Book" class="btn">
    </form>
</body>
</html>
