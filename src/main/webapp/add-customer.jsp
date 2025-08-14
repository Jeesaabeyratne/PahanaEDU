<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Add Customer</title>

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
