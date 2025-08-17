<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Pahana EDU Book Shop</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #1abc9c, #3498db);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            background: #ffffff;
            padding: 50px 40px;
            border-radius: 15px;
            text-align: center;
            width: 400px;
            box-shadow: 0px 8px 20px rgba(0,0,0,0.2);
            animation: fadeIn 1s ease-in-out;
        }

        .container h1 {
            margin: 0 0 20px;
            font-size: 28px;
            color: #2c3e50;
            letter-spacing: 1px;
        }

        .container p {
            color: #555;
            font-size: 16px;
            margin-bottom: 25px;
        }

        .button {
            display: inline-block;
            padding: 12px 25px;
            font-size: 16px;
            font-weight: bold;
            color: #fff;
            background: #1abc9c;
            border-radius: 8px;
            text-decoration: none;
            transition: 0.3s ease-in-out;
        }

        .button:hover {
            background: #16a085;
            transform: translateY(-3px);
            box-shadow: 0px 4px 10px rgba(0,0,0,0.2);
        }

        .button i {
            margin-right: 8px;
        }

        @keyframes fadeIn {
            from {opacity: 0; transform: translateY(-20px);}
            to {opacity: 1; transform: translateY(0);}
        }
    </style>
</head>
<body>
<div class="container">
    <h1><i class="fa fa-book"></i> Pahana EDU Book Shop</h1>
    <p>Welcome to your trusted educational bookstore.</p>
    <a href="login.jsp" class="button"><i class="fa fa-sign-in-alt"></i>Login</a>
</div>
</body>
</html>
