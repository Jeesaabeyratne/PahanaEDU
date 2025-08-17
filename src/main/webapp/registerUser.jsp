<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
  <title>Register User | Pahana EDU Book Shop</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <style>
    body {
      margin: 0;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background: linear-gradient(135deg, #3498db, #1abc9c);
      height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
    }

    .container {
      max-width: 400px;
      background: #ffffff;
      padding: 35px 40px;
      border-radius: 15px;
      box-shadow: 0 6px 18px rgba(0,0,0,0.2);
      text-align: center;
      animation: fadeIn 0.8s ease-in-out;
    }

    .container h2 {
      margin-bottom: 20px;
      color: #2c3e50;
      font-size: 24px;
    }

    .message {
      margin-bottom: 18px;
      padding: 10px;
      border-radius: 8px;
      color: #155724;
      background-color: #d4edda;
      border: 1px solid #c3e6cb;
      font-size: 14px;
    }

    .input-group {
      position: relative;
      margin-bottom: 15px;
    }

    .input-group input,
    .input-group select {
      width: 100%;
      padding: 12px 40px 12px 12px;
      border: 1px solid #ccc;
      border-radius: 8px;
      font-size: 15px;
      box-sizing: border-box;
    }

    .input-group i {
      position: absolute;
      right: 12px;
      top: 50%;
      transform: translateY(-50%);
      color: #888;
    }

    .input-group input:focus,
    .input-group select:focus {
      outline: none;
      border-color: #1abc9c;
      box-shadow: 0 0 6px rgba(26,188,156,0.4);
    }

    /* Submit Button */
    form input[type="submit"] {
      width: 100%;
      padding: 12px;
      margin-top: 10px;
      background: #1abc9c;
      border: none;
      border-radius: 8px;
      color: white;
      font-size: 16px;
      font-weight: bold;
      cursor: pointer;
      transition: 0.3s;
    }

    form input[type="submit"]:hover {
      background: #16a085;
      transform: translateY(-2px);
      box-shadow: 0px 4px 12px rgba(0,0,0,0.2);
    }

    /* Back Button */
    .back-btn {
      display: inline-block;
      margin-top: 15px;
      color: #2980b9;
      text-decoration: none;
      font-weight: bold;
      font-size: 14px;
    }

    .back-btn:hover {
      text-decoration: underline;
    }

    @keyframes fadeIn {
      from {opacity: 0; transform: translateY(-20px);}
      to {opacity: 1; transform: translateY(0);}
    }
  </style>
</head>
<body>

<div class="container">
  <h2><i class="fa fa-user-plus"></i> Register User</h2>

  <!-- Success Message -->
  <% if(request.getAttribute("message") != null) { %>
  <div class="message">
    <%= request.getAttribute("message") %>
  </div>
  <% } %>

  <form method="post" action="register">
    <div class="input-group">
      <input type="text" name="name" placeholder="Full Name" required>
      <i class="fa fa-user"></i>
    </div>

    <div class="input-group">
      <input type="email" name="email" placeholder="Email" required>
      <i class="fa fa-envelope"></i>
    </div>

    <div class="input-group">
      <input type="password" name="password" placeholder="Password" required>
      <i class="fa fa-lock"></i>
    </div>

    <div class="input-group">
      <select name="role" required>
        <option value="">Select Role</option>
        <option value="User">User</option>
        <option value="Admin">Admin</option>
      </select>
      <i class="fa fa-users"></i>
    </div>

    <input type="submit" value="Register">
  </form>

  <a href="admin-db.jsp" class="back-btn"><i class="fa fa-arrow-left"></i> Back to Dashboard</a>
</div>

</body>
</html>
