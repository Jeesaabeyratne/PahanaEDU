<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Help & Support</title>
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
        .sidebar nav a.back:hover { background-color: #1f6390; }

        .sidebar nav a.logout {
            background-color: #e74c3c;
        }
        .sidebar nav a.logout:hover { background-color: #c0392b; }

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

        /* ---------- HELP CONTENT ---------- */
        .help-section {
            background: white;
            padding: 25px;
            border-radius: 12px;
            margin-bottom: 20px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        .help-section h3 {
            margin-top: 0;
            color: #2c3e50;
        }

        .help-section ul {
            padding-left: 20px;
        }

        .help-section li {
            margin-bottom: 10px;
        }
    </style>
</head>
<body>

<!-- Sidebar -->
<div class="sidebar">
    <div class="brand">Help Center</div>
    <nav>
        <a href="javascript:history.back()" class="back"><i class="fa fa-arrow-left"></i> Back</a>
        <a href="logout.jsp" class="logout"><i class="fa fa-sign-out-alt"></i> Logout</a>
    </nav>
</div>

<!-- Main Content -->
<div class="main">
    <header>
        <h2>Help & Support</h2>
        <p>Find guidance for using the system</p>
    </header>

    <!-- Sections -->
    <div class="help-section">
        <h3><i class="fa fa-circle-info"></i> General Guidance</h3>
        <ul>
            <li>Use the <b>Sidebar</b> to navigate between sections (Books, Customers, Billing, Categories).</li>
            <li>Always <b>log out</b> after using the system for security purposes.</li>
            <li>If you encounter errors, try refreshing or logging in again.</li>
        </ul>
    </div>

    <div class="help-section">
        <h3><i class="fa fa-book"></i> Book Management</h3>
        <ul>
            <li><b>Add Book:</b> Enter book details such as title, author, ISBN, price, stock, and category.</li>
            <li><b>Edit Book:</b> Update book details whenever stock or price changes.</li>
            <li><b>View Books:</b> Browse the complete list of books in stock.</li>
        </ul>
    </div>

    <div class="help-section">
        <h3><i class="fa fa-users"></i> Customer Management</h3>
        <ul>
            <li><b>Add Customer:</b> Register new customers with their personal details.</li>
            <li><b>View Customers:</b> View all customer records.</li>
            <li><b>Update Customer:</b> Modify existing customer information.</li>
        </ul>
    </div>

    <div class="help-section">
        <h3><i class="fa fa-file-invoice-dollar"></i> Billing</h3>
        <ul>
            <li><b>Create Bill:</b> Generate invoices for customer purchases.</li>
            <li><b>View Bills:</b> Access previously generated invoices for reference.</li>
        </ul>
    </div>

    <div class="help-section">
        <h3><i class="fa fa-envelope"></i> Contact Support</h3>
        <p>If you need further assistance, please contact the system administrator:</p>
        <ul>
            <li>Email: <a href="mailto:support@bookshop.com">support@bookshop.com</a></li>
            <li>Phone: +94 77 123 4567</li>
        </ul>
    </div>
</div>

</body>
</html>
