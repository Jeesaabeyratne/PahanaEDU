<%@ page import="com.book.service.BookCatService" %>
<%@ page import="com.book.model.BookCat" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Add Book</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f7f8fa;
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
            box-shadow: 0 0 12px rgba(0,0,0,0.1);
        }

        label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
            color: #555;
        }

        input, select {
            width: 100%;
            padding: 10px;
            margin-bottom: 18px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 15px;
            box-sizing: border-box;
        }

        input:focus, select:focus {
            border-color: #4CAF50;
            outline: none;
            box-shadow: 0 0 5px rgba(76,175,80,0.4);
        }

        input[type="submit"] {
            background: #4CAF50;
            color: white;
            border: none;
            font-size: 16px;
            cursor: pointer;
            padding: 12px;
            transition: background 0.3s ease;
        }

        input[type="submit"]:hover {
            background: #45a049;
        }

        p.success {
            color: green;
            text-align: center;
            font-weight: bold;
            background: #eaf6ea;
            border: 1px solid #c9e8c9;
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

<h2>📚 Add New Book</h2>

<%
    BookCatService catService = new BookCatService();
    List<BookCat> categories = catService.getAllCategories();
%>

<% if (request.getParameter("success") != null) { %>
<p class="success">✅ Book added successfully!</p>
<% } %>

<form method="post" action="add-book">
    <label>Title:</label>
    <input type="text" name="title" required>

    <label>Author:</label>
    <input type="text" name="author" required>

    <label>ISBN:</label>
    <input type="text" name="isbn" required>

    <label>Price:</label>
    <input type="number" step="0.01" name="price" required>

    <label>Stock Quantity:</label>
    <input type="number" name="stockQuantity" required>

    <label>Category:</label>
    <select name="categoryId" required>
        <% for (BookCat cat : categories) { %>
        <option value="<%= cat.getId() %>"><%= cat.getCategoryName() %></option>
        <% } %>
    </select>

    <input type="submit" value="Add Book">
</form>

</body>
</html>
