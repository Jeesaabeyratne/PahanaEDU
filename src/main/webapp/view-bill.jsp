<%@ page import="com.book.service.BillService"%>
<%@ page import="com.book.dto.BillDTO"%>
<%@ page import="java.util.List"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>All Bills</title>
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

        /* ---------- TABLE ---------- */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0px 4px 8px rgba(0,0,0,0.1);
        }

        th, td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
            text-align: center;
        }

        th {
            background-color: #2c3e50;
            color: white;
            font-size: 16px;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .no-data {
            margin-top: 20px;
            font-size: 18px;
            color: #7f8c8d;
        }
    </style>
</head>
<body>

<!-- Sidebar -->
<div class="sidebar">
    <div class="brand">Panel</div>
    <nav>
        <a href="help.jsp" class="help"><i class="fa fa-circle-question"></i> Help & Support</a>
        <a href="javascript:history.back()" class="back"><i class="fa fa-arrow-left"></i> Go Back</a>
        <a href="logout.jsp" class="logout"><i class="fa fa-sign-out-alt"></i> Logout</a>
    </nav>
</div>

<!-- Main Content -->
<div class="main">
    <header>
        <h2>All Bills</h2>
        <p>Welcome, <span><%= session.getAttribute("userName") %></span></p>
    </header>

    <%
        BillService billService = new BillService();
        List<BillDTO> bills = billService.getAllBills();
        if (bills == null || bills.isEmpty()) {
    %>
    <p class="no-data">No bills found.</p>
    <%
    } else {
    %>
    <table>
        <thead>
        <tr>
            <th>Bill ID</th>
            <th>Customer ID</th>
            <th>Date</th>
            <th>Total Amount</th>
            <th>Discount</th>
            <th>Final Amount</th>
        </tr>
        </thead>
        <tbody>
        <%
            for (BillDTO bill : bills) {
        %>
        <tr>
            <td><%= bill.getId() %></td>
            <td><%= bill.getCustomerId() %></td>
            <td><%= bill.getBillDateTime() %></td>
            <td>Rs. <%= bill.getTotalAmount() %></td>
            <td>Rs. <%= bill.getDiscount() %></td>
            <td>Rs. <%= bill.getFinalAmount() %></td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
    <%
        }
    %>
</div>

</body>
</html>
