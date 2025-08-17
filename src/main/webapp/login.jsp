<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login | Pahana EDU Book Shop</title>
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
            background: #ffffff;
            padding: 35px 30px;
            border-radius: 15px;
            width: 340px;
            box-shadow: 0px 8px 25px rgba(0,0,0,0.2);
            text-align: center;
            animation: fadeIn 0.8s ease-in-out;
        }

        .container h2 {
            margin-bottom: 20px;
            font-size: 22px;
            color: #2c3e50;
        }

        .input-group {
            position: relative;
            margin-bottom: 18px;
        }

        .input-group input {
            width: 100%;
            padding: 12px 40px 12px 12px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 14px;
            box-sizing: border-box;
            transition: border-color 0.3s;
        }

        .input-group input:focus {
            outline: none;
            border-color: #1abc9c;
            box-shadow: 0 0 5px rgba(26,188,156,0.4);
        }

        .input-group i {
            position: absolute;
            right: 12px;
            top: 50%;
            transform: translateY(-50%);
            color: #888;
            font-size: 14px;
        }

        .login-btn {
            width: 100%;
            padding: 12px;
            background: #1abc9c;
            border: none;
            border-radius: 8px;
            font-size: 15px;
            font-weight: bold;
            color: #fff;
            cursor: pointer;
            transition: 0.3s;
        }

        .login-btn:hover {
            background: #16a085;
            transform: translateY(-2px);
            box-shadow: 0px 4px 12px rgba(0,0,0,0.2);
        }

        .links {
            margin-top: 15px;
            font-size: 13px;
        }

        .links a {
            color: #3498db;
            text-decoration: none;
        }

        .links a:hover {
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
    <h2><i class="fa fa-sign-in-alt"></i> User Login</h2>
    <form method="post" action="login">
        <div class="input-group">
            <input type="email" name="email" placeholder="Email" required>
            <i class="fa fa-envelope"></i>
        </div>
        <div class="input-group">
            <input type="password" name="password" placeholder="Password" required>
            <i class="fa fa-lock"></i>
        </div>
        <button type="submit" class="login-btn">Login</button>
    </form>
</div>
</body>
</html>
