<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin - View Bills</title>
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
            box-shadow: 2px 0 10px rgba(0,0,0,0.2);
        }

        .sidebar .brand {
            padding: 20px;
            text-align: center;
            font-size: 20px;
            font-weight: bold;
            background: #1abc9c;
        }

        .sidebar nav {
            flex-grow: 1;
            display: flex;
            flex-direction: column;
            padding: 20px;
        }

        .sidebar nav a {
            display: block;
            margin: 8px 0;
            padding: 10px;
            text-decoration: none;
            color: white;
            border-radius: 5px;
            font-weight: bold;
            transition: 0.3s;
            text-align: center;
        }

        .sidebar nav a:hover {
            background-color: #16a085;
        }

        .sidebar nav a.back {
            background-color: #2980b9;
        }

        .sidebar nav a.logout {
            background-color: #e74c3c;
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
        }

        header p {
            margin: 5px 0 0;
            font-size: 16px;
            font-style: italic;
            color: #ecf0f1;
        }

        /* ---------- TABLE STYLING ---------- */
        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        th, td {
            padding: 12px 15px;
            text-align: center;
        }

        th {
            background-color: #1abc9c;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f4f6f8;
        }

        tr:hover {
            background-color: #ecf0f1;
        }

        a.view-btn {
            padding: 6px 12px;
            background: #2980b9;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            transition: 0.3s;
        }

        a.view-btn:hover {
            background: #1f6390;
        }
    </style>
</head>
<body>

<!-- Sidebar -->
<div class="sidebar">
    <div class="brand">Admin Panel</div>
    <nav>
        <a href="admin-db.jsp" class="back">🏠 Dashboard</a>
        <a href="logout.jsp" class="logout">🚪 Logout</a>
    </nav>
</div>

<!-- Main Content -->
<div class="main">
    <header>
        <h2>All Bills</h2>
        <p>Manage and review all customer bills</p>
    </header>

    <table>
        <tr>
            <th>Bill ID</th>
            <th>Customer ID</th>
            <th>Date</th>
            <th>Total</th>
            <th>Final Amount</th>
            <th>Action</th>
        </tr>
        <%
            java.util.List<com.book.dto.BillDTO> bills =
                    (java.util.List<com.book.dto.BillDTO>) request.getAttribute("bills");
            if (bills != null) {
                for (com.book.dto.BillDTO bill : bills) {
        %>
        <tr>
            <td><%= bill.getId() %></td>
            <td><%= bill.getCustomerId() %></td>
            <td><%= bill.getBillDateTime() %></td>
            <td><%= bill.getTotalAmount() %></td>
            <td><%= bill.getFinalAmount() %></td>
            <td><a class="view-btn" href="viewBill?billId=<%= bill.getId() %>">View</a></td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="6">No bills found.</td>
        </tr>
        <% } %>
    </table>
</div>

</body>
</html>
