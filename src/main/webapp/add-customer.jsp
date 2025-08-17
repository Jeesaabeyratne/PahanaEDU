<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Add Customer</title>
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
      max-width: 450px;
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

    input[type="text"], input[type="email"] {
      width: 100%;
      padding: 10px;
      margin-bottom: 18px;
      border: 1px solid #ccc;
      border-radius: 5px;
      font-size: 15px;
      box-sizing: border-box;
    }

    input[type="text"]:focus, input[type="email"]:focus {
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

<h2>👤 Add Customer</h2>

<% if ("true".equals(request.getParameter("success"))) { %>
<p class="success">✅ Customer added successfully!</p>
<% } %>

<form method="post" action="addCustomer">
  <label>Email:</label>
  <input type="email" name="email" placeholder="Enter email" required>

  <label>Name:</label>
  <input type="text" name="name" placeholder="Enter full name" required>

  <label>Address:</label>
  <input type="text" name="address" placeholder="Enter address" required>

  <label>Telephone:</label>
  <input type="text" name="telephone" placeholder="Enter phone number" required>

  <input type="submit" value="Add Customer">
</form>

</body>
</html>