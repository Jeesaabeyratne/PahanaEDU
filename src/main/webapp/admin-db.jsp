<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="style.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            background-color: #f4f6f8;
        }
        header {
            background-color: #2c3e50;
            padding: 15px 30px;
            color: white;
            text-align: center;
        }
        header h2 {
            margin: 0;
        }
        nav {
            background-color: #34495e;
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
        }
        nav a {
            color: white;
            padding: 14px 20px;
            text-decoration: none;
            display: block;
            transition: background 0.3s;
        }
        nav a:hover {
            background-color: #1abc9c;
        }
        main {
            padding: 20px;
            text-align: center;
        }
        .dashboard-links {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
            gap: 20px;
            margin-top: 30px;
        }
        .card {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 3px 6px rgba(0,0,0,0.1);
            transition: transform 0.2s;
        }
        .card:hover {
            transform: translateY(-5px);
        }
        .card a {
            text-decoration: none;
            color: #2c3e50;
            font-weight: bold;
        }
        .logout {
            background-color: #e74c3c;
            color: white !important;
            padding: 10px 15px;
            border-radius: 5px;
        }
        .logout:hover {
            background-color: #c0392b;
        }
    </style>
</head>
<body>

<header>
    <h2>Welcome Admin, <%= session.getAttribute("userName") %></h2>
</header>

<nav>
    <a href="view-users.jsp">View Users</a>
    <a href="delete-user.jsp">Manage Users</a>
    <a href="add-category.jsp">Add Category</a>
    <a href="view-category.jsp">View Category</a>
    <a href="add-customer.jsp">Add Customer</a>
    <a href="view-customer.jsp">View Customer</a>
    <a href="update-customer.jsp">Update Customer</a>
    <a href="add-book.jsp">Add Book</a>
    <a href="view-book.jsp">View Book</a>
    <a href="create-bill.jsp">Create Bill</a>
    <a href="logout.jsp" class="logout">Logout</a>
</nav>

<main>
    <h3>Admin Dashboard</h3>
    <div class="dashboard-links">
        <div class="card"><a href="add-category.jsp">📚 Add Book Category</a></div>
        <div class="card"><a href="add-customer.jsp">👤 Add Customer</a></div>
        <div class="card"><a href="update-customer.jsp">✏️ Update Customer</a></div>
        <div class="card"><a href="add-book.jsp">📖 Add Book</a></div>
        <div class="card"><a href="create-bill.jsp">🧾 Create Bill</a></div>
    </div>
</main>

</body>
</html>