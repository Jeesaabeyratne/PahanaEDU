<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Book Category</title>
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
            max-width: 400px;
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

        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 18px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 15px;
            box-sizing: border-box;
        }

        input[type="text"]:focus {
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
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

<h2>📂 Add Book Category</h2>

<% if (request.getParameter("success") != null) { %>
<p class="success">✅ Category added successfully!</p>
<% } %>

<form method="post" action="addCategory">
    <label>Category Name:</label>
    <input type="text" name="categoryName" placeholder="Enter category name" required>
    <input type="submit" value="Add Category">
</form>

</body>
</html>