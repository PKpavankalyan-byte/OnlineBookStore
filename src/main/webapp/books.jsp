<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%
    String customerEmail = (String) session.getAttribute("email_key");
    String customerName = (String) session.getAttribute("name_key");

    if(customerEmail == null){
        response.sendRedirect("login.jsp");
        return;
    }

    // Get search parameters
    String searchTitle = request.getParameter("searchTitle");
    String filterCategory = request.getParameter("filterCategory");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Browse Books</title>
    <style>
        body { font-family: Arial; background: #f8f9fa; }
        h2 { color: #333; text-align: center; }
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
        form { text-align: center; margin-bottom: 20px; }
        input[type="text"], select { padding: 5px; margin-right: 5px; }
    </style>
</head>
<body>
    <h2>Welcome, <%= customerName %>! Browse Books</h2>

    <!-- Search and Filter Form -->
    <form method="get" action="books.jsp">
        <input type="text" name="searchTitle" placeholder="Search by title" value="<%= searchTitle != null ? searchTitle : "" %>">
        <select name="filterCategory">
            <option value="">All Categories</option>
            <option value="Fiction" <%= "Fiction".equals(filterCategory) ? "selected" : "" %>>Fiction</option>
            <option value="Science" <%= "Science".equals(filterCategory) ? "selected" : "" %>>Science</option>
            <option value="Technology" <%= "Technology".equals(filterCategory) ? "selected" : "" %>>Technology</option>
            <option value="History" <%= "History".equals(filterCategory) ? "selected" : "" %>>History</option>
        </select>
        <input type="submit" class="btn" value="Search">
    </form>

    <div>
    <%
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","root");

            String sql = "SELECT * FROM books WHERE 1=1";
            if(searchTitle != null && !searchTitle.trim().isEmpty()){
                sql += " AND title LIKE ?";
            }
            if(filterCategory != null && !filterCategory.trim().isEmpty()){
                sql += " AND category=?";
            }

            ps = con.prepareStatement(sql);

            int paramIndex = 1;
            if(searchTitle != null && !searchTitle.trim().isEmpty()){
                ps.setString(paramIndex++, "%" + searchTitle + "%");
            }
            if(filterCategory != null && !filterCategory.trim().isEmpty()){
                ps.setString(paramIndex++, filterCategory);
            }

            rs = ps.executeQuery();

            boolean hasBooks = false;
            while(rs.next()){
                hasBooks = true;
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
            if(!hasBooks){
                out.println("<p style='text-align:center;color:red;'>No books found</p>");
            }
        } catch(Exception e){
            out.println("<p style='color:red;text-align:center;'>Error loading books: "+e.getMessage()+"</p>");
        } finally {
            if(rs!=null) try{rs.close();}catch(Exception e){}
            if(ps!=null) try{ps.close();}catch(Exception e){}
            if(con!=null) try{con.close();}catch(Exception e){}
        }
    %>
    </div>

    <p style="text-align:center;">
        <a href="viewCart.jsp" class="btn">🛒 View Cart</a>
        <a href="customerDashboard.jsp" class="btn">Back to Dashboard</a>
        <a href="logout" class="btn" style="background:red;">Logout</a>

    </p>
</body>
</html>
