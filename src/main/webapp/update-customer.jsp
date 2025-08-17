<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.book.dto.CustomerDTO" %>
<%@ page import="com.book.model.Customer" %>
<%@ page import="com.book.service.CustomerService" %>
<html>
<head>
  <title>Manage Customer</title>
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
  CustomerDTO customer = null;
  String nameParam = request.getParameter("name");

  if (nameParam != null && !nameParam.trim().isEmpty()) {
    try {
      CustomerService service = new CustomerService();
      customer = service.getCustomerByName(nameParam.trim());

      if (customer == null) {
        message = "Customer not found!";
      }
    } catch (Exception e) {
      message = "Server error occurred!";
      e.printStackTrace();
    }
  }
%>

<h2>🔍 Search & ✏️ Update Customer</h2>

<!-- ✅ Search Form -->
<form method="get" action="update-customer.jsp">
  <label>Enter Customer Name:</label>
  <input type="text" name="name" placeholder="Search by customer name" required>
  <input type="submit" value="Search">
</form>

<!-- ✅ Message Display -->
<% if (request.getParameter("success") != null) { %>
<p class="success">✅ Customer updated successfully!</p>
<% } else if (message != null) { %>
<p class="error"><%= message %></p>
<% } %>

<!-- ✅ Update Form (Only if customer is found) -->
<% if (customer != null) { %>
<hr>
<form method="post" action="updateCustomer">
  <input type="hidden" name="id" value="<%= customer.getId() %>">

  <label>Name:</label>
  <input type="text" name="name" value="<%= customer.getName() != null ? customer.getName() : "" %>" required>

  <label>Email:</label>
  <input type="email" name="email" value="<%= customer.getEmail() != null ? customer.getEmail() : "" %>" required>

  <label>Address:</label>
  <input type="text" name="address" value="<%= customer.getAddress() != null ? customer.getAddress() : "" %>" required>

  <label>Telephone:</label>
  <input type="text" name="telephone" value="<%= customer.getTelephone() != null ? customer.getTelephone() : "" %>" required>

  <input type="submit" value="Update Customer">
</form>
<% } %>

</body>
</html>