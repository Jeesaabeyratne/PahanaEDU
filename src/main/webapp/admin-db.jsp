<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            display: flex;
            background-color: #f4f6f8;
        }

        /* ---------- SIDEBAR ---------- */
        .sidebar {
            width: 200px;
            background: #2c3e50;
            color: white;
            height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            position: fixed;
            box-shadow: 2px 0 10px rgba(0, 0, 0, 0.2);
        }

        .sidebar .brand {
            padding: 20px;
            text-align: center;
            font-size: 20px;
            font-weight: bold;
            background: #1abc9c;
            letter-spacing: 1px;
        }

        .sidebar nav {
            flex-grow: 1;
            display: flex;
            flex-direction: column;
            justify-content: flex-end;
            padding: 20px;
        }

        .sidebar nav a {
            display: block;
            text-align: center;
            margin: 8px 0;
            padding: 10px;
            text-decoration: none;
            color: white;
            border-radius: 5px;
            font-weight: bold;
            transition: 0.3s;
        }

        .sidebar nav a.back {
            background-color: #2980b9;
        }

        .sidebar nav a.back:hover {
            background-color: #1f6390;
        }

        .sidebar nav a.logout {
            background-color: #e74c3c;
        }

        .sidebar nav a.logout:hover {
            background-color: #c0392b;
        }

        /* ---------- MAIN CONTENT ---------- */
        .main {
            margin-left: 200px;
            padding: 30px;
            flex-grow: 1;
        }

        header {
            background: linear-gradient(135deg, #2c3e50, #1abc9c);
            padding: 20px;
            color: white;
            border-radius: 8px;
            margin-bottom: 30px;
            box-shadow: 0px 4px 8px rgba(0,0,0,0.2);
        }

        header h2 {
            margin: 0;
            font-size: 26px;
            letter-spacing: 1px;
        }

        header p {
            margin: 5px 0 0;
            font-size: 16px;
            font-style: italic;
            color: #ecf0f1;
        }

        header span {
            font-weight: bold;
            color: #ffe082;
        }

        /* ---------- DASHBOARD PANELS ---------- */
        .dashboard {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(220px, 1fr));
            gap: 20px;
        }

        .card {
            background: white;
            padding: 30px 20px;
            border-radius: 12px;
            text-align: center;
            color: #2c3e50;
            text-decoration: none;
            font-weight: bold;
            font-size: 16px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            transition: transform 0.3s, background 0.3s;
        }

        .card i {
            font-size: 36px;
            margin-bottom: 10px;
            color: #1abc9c;
        }

        .card:hover {
            transform: translateY(-5px);
            background: #ecf0f1;
        }
    </style>
</head>
<body>

<!-- Sidebar -->
<div class="sidebar">
    <div class="brand">Admin Panel</div>
    <nav>
        <a href="help.jsp" class="help"><i class="fa fa-circle-question"></i> Help & Support</a>
        <a href="javascript:history.back()" class="back"><i class="fa fa-arrow-left"></i> Go Back</a>
        <a href="logout.jsp" class="logout"><i class="fa fa-sign-out-alt"></i> Logout</a>
    </nav>
</div>

<!-- Main Content -->
<div class="main">
    <header>
        <h2>Admin Dashboard</h2>
        <p>Welcome, <span><%= session.getAttribute("userName") %></span></p>
    </header>

    <!-- Dashboard Panels -->
    <div class="dashboard">
        <a href="registerUser.jsp" class="card"><i class="fa fa-user-plus"></i><br>Register Users</a>
        <a href="view-users.jsp" class="card"><i class="fa fa-users"></i><br>View Users</a>
        <a href="delete-user.jsp" class="card"><i class="fa fa-user-gear"></i><br>Manage Users</a>
        <a href="add-category.jsp" class="card"><i class="fa fa-folder-plus"></i><br>Add Category</a>
        <a href="view-category.jsp" class="card"><i class="fa fa-list"></i><br>View Category</a>
        <a href="add-customer.jsp" class="card"><i class="fa fa-user-plus"></i><br>Add Customer</a>
        <a href="view-customer.jsp" class="card"><i class="fa fa-id-card"></i><br>View Customer</a>
        <a href="update-customer.jsp" class="card"><i class="fa fa-user-pen"></i><br>Update Customer</a>
        <a href="add-book.jsp" class="card"><i class="fa fa-book"></i><br>Add Book</a>
        <a href="view-book.jsp" class="card"><i class="fa fa-book-open"></i><br>View Book</a>
        <a href="create-bill.jsp" class="card"><i class="fa fa-file-invoice-dollar"></i><br>Create Bill</a>
        <a href="admin-view-bill.jsp" class="card"><i class="fa fa-receipt"></i><br>View Bill</a>
        <a href="edit-book.jsp" class="card"><i class="fa fa-pen-to-square"></i><br>Edit Book</a>

    </div>
</div>

</body>
</html>
