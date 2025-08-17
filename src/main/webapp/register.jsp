<!DOCTYPE html>
<html>
<head>
  <title>Register</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="container">
  <h2>User Registration</h2>
  <form method="post" action="register">
    <input type="text" name="name" placeholder="Full Name" required>
    <input type="email" name="email" placeholder="Email" required>
    <input type="password" name="password" placeholder="Password" required>
    <select name="role">
      <option value="User">User</option>
      <option value="Admin">Admin</option>
    </select>
    <input type="submit" value="Register">
  </form>
</div>
</body>
</html>