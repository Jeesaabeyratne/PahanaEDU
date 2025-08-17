<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.book.dto.BookDTO" %>
<%@ page import="com.book.service.BookService" %>
<html>
<head>
    <title>Manage Book</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f6f8;
            margin: 0;
            padding: 40px;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 25px;
        }

        form {
            max-width: 500px;
            margin: auto;
            background: #fff;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.08);
        }

        label {
            font-weight: bold;
            display: block;
            margin-bottom: 6px;
            color: #555;
        }

        input[type="text"], input[type="number"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 18px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 15px;
            box-sizing: border-box;
        }

        input[type="text"]:focus, input[type="number"]:focus {
            border-color: #4CAF50;
            outline: none;
            box-shadow: 0 0 5px rgba(76,175,80,0.3);
        }

        input[type="submit"] {
            background: #4CAF50;
            color: white;
            border: none;
            font-size: 16px;
            cursor: pointer;
            padding: 12px;
            border-radius: 5px;
            transition: background 0.3s ease;
            width: 100%;
        }

        input[type="submit"]:hover {
            background: #45a049;
        }

        .success {
            color: green;
            text-align: center;
            font-weight: bold;
            background: #eaf6ea;
            border: 1px solid #c9e8c9;
            padding: 10px;
            border-radius: 5px;
            margin: 15px auto;
            max-width: 500px;
        }

        .error {
            color: red;
            text-align: center;
            font-weight: bold;
            background: #fceaea;
            border: 1px solid #f3c0c0;
            padding: 10px;
            border-radius: 5px;
            margin: 15px auto;
            max-width: 500px;
        }

        hr {
            margin: 30px 0;
        }
    </style>
</head>
<body>

<%
    String message = null;
    BookDTO book = null;
    String titleParam = request.getParameter("title");

    if (titleParam != null && !titleParam.trim().isEmpty()) {
        try {
            BookService service = new BookService();
            book = service.getBookByTitle(titleParam.trim());

            if (book == null) {
                message = "Book not found!";
            }
        } catch (Exception e) {
            message = "Server error occurred!";
            e.printStackTrace();
        }
    }
%>

<h2> Search &  Update Book</h2>

<!--  Search Form -->
<form method="get" action="update-book.jsp">
    <label>Enter Book Title:</label>
    <input type="text" name="title" placeholder="Search by book title" required>
    <input type="submit" value="Search">
</form>

<!-- Message Display -->
<% if (request.getParameter("success") != null) { %>
<p class="success">✅ Book updated successfully!</p>
<% } else if (message != null) { %>
<p class="error"><%= message %></p>
<% } %>

<!-- Update Form (Only if book is found) -->
<% if (book != null) { %>
<hr>
<form method="post" action="updateBook">
    <input type="hidden" name="id" value="<%= book.getId() %>">

    <label>Title:</label>
    <input type="text" name="title" value="<%= book.getTitle() %>" required>

    <label>Author:</label>
    <input type="text" name="author" value="<%= book.getAuthor() %>" required>

    <label>ISBN:</label>
    <input type="text" name="isbn" value="<%= book.getIsbn() %>" required>

    <label>Price:</label>
    <input type="number" step="0.01" name="price" value="<%= book.getPrice() %>" required>

    <label>Stock Quantity:</label>
    <input type="number" name="stockQuantity" value="<%= book.getStockQuantity() %>" required>

    <label>Category ID:</label>
    <input type="number" name="categoryId" value="<%= book.getCategoryId() %>" required>

    <input type="submit" value="Update Book">
</form>
<% } %>

</body>
</html>