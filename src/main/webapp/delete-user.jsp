<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.book.model.User" %>
<%@ page import="com.book.service.UserService" %>
<html>
<head>
  <title>Search & Delete User</title>
  <style>
    body { font-family: Arial; background: #f4f6f8; padding: 40px; }
    form { background: #fff; padding: 20px; border-radius: 8px; max-width: 500px; margin: auto; }
    input, select { width: 100%; padding: 10px; margin: 10px 0; }
    input[type="submit"] { background: red; color: white; border: none; cursor: pointer; }
    input[type="submit"]:hover { background: darkred; }
    .success { color: green; text-align: center; }
    .error { color: red; text-align: center; }
  </style>
</head>
<body>

<%
  String message = null;
  User user = null;
  String nameParam = request.getParameter("name");

  if (nameParam != null && !nameParam.trim().isEmpty()) {
    try {
      UserService service = new UserService();
      user = service.getUserByName(nameParam.trim());

      if (user == null) {
        message = "User not found!";
      }
    } catch (Exception e) {
      message = "Server error occurred!";
      e.printStackTrace();
    }
  }
%>

<h2 style="text-align:center;">🔍 Search & 🗑 Delete User</h2>

<form method="get" action="delete-user.jsp">
  <label>Enter User Name:</label>
  <input type="text" name="name" placeholder="Search by name" required>
  <input type="submit" value="Search">
</form>

<% if ("deleted".equals(request.getParameter("success"))) { %>
<p class="success">✅ User deleted successfully!</p>
<% } else if ("notfound".equals(request.getParameter("error"))) { %>
<p class="error">❌ User not found!</p>
<% } else if (message != null) { %>
<p class="error"><%= message %></p>
<% } %>

<% if (user != null) { %>
<hr>
<form method="post" action="deleteUser" onsubmit="return confirm('Are you sure you want to delete user <%= user.getName() %>?');">
  <input type="hidden" name="id" value="<%= user.getId() %>">
  <p><strong>Name:</strong> <%= user.getName() %></p>
  <p><strong>Email:</strong> <%= user.getEmail() %></p>
  <p><strong>Role:</strong> <%= user.getRole() %></p>
  <input type="submit" value="Delete User">
</form>
<% } %>

</body>
</html>