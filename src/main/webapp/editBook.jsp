<%@ page import="java.sql.*" %>
<%
    String adminName = (String) session.getAttribute("name_key");
    String role = (String) session.getAttribute("role_key");
    if(adminName == null || !"admin".equals(role)){
        response.sendRedirect("login.jsp");
        return;
    }

    int bookId = Integer.parseInt(request.getParameter("id"));
    String title="", author="", category="";
    double price=0;
    int stock=0;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","root");
        PreparedStatement ps = con.prepareStatement("SELECT * FROM books WHERE id=?");
        ps.setInt(1, bookId);
        ResultSet rs = ps.executeQuery();
        if(rs.next()){
            title = rs.getString("title");
            author = rs.getString("author");
            category = rs.getString("category");
            price = rs.getDouble("price");
            stock = rs.getInt("stock");
        }
    } catch(Exception e){ out.println(e.getMessage()); }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Book</title>
    <style>
        body { font-family: Arial; display:flex; justify-content:center; align-items:center; height:100vh; background:#f8f9fa;}
        form { background:white; padding:20px; border-radius:10px; width:400px; }
        input, textarea { width:100%; padding:8px; margin:5px 0; }
        .btn { padding:10px 20px; background:green; color:white; border:none; cursor:pointer; }
        .btn:hover { background:darkgreen; }
    </style>
</head>
<body>
    <form action="EditBookServlet" method="post">
        <h2>Edit Book</h2>
        <input type="hidden" name="id" value="<%= bookId %>">
        <input type="text" name="title" value="<%= title %>" required>
        <input type="text" name="author" value="<%= author %>" required>
        <input type="text" name="category" value="<%= category %>" required>
        <input type="number" step="0.01" name="price" value="<%= price %>" required>
        <input type="number" name="stock" value="<%= stock %>" required>
        <input type="submit" value="Update Book" class="btn">
    </form>
</body>
</html>
