<%@ page import="com.book.model.Customer" %>
<%@ page import="com.book.service.CustomerService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Create Bill</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f6f8;
      margin: 0;
      padding: 20px;
    }
    h2, h3 {
      color: #2c3e50;
    }
    .container {
      background: white;
      padding: 20px;
      border-radius: 8px;
      max-width: 900px;
      margin: auto;
      box-shadow: 0px 3px 8px rgba(0,0,0,0.1);
    }
    form {
      margin-bottom: 20px;
    }
    label {
      font-weight: bold;
    }
    input, select, button {
      margin: 5px 0;
      padding: 8px;
      font-size: 14px;
    }
    button {
      background-color: #1abc9c;
      color: white;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      padding: 8px 15px;
    }
    button:hover {
      background-color: #16a085;
    }
    table {
      width: 100%;
      margin-top: 15px;
      border-collapse: collapse;
    }
    th, td {
      padding: 10px;
      border: 1px solid #ddd;
      text-align: center;
    }
    th {
      background-color: #2c3e50;
      color: white;
    }
    .btn-remove {
      background-color: #e74c3c;
      padding: 5px 10px;
      border: none;
      color: white;
      border-radius: 4px;
    }
    .btn-remove:hover {
      background-color: #c0392b;
    }
    .summary {
      margin-top: 20px;
    }
    .final-amount {
      font-size: 16px;
      font-weight: bold;
      color: #27ae60;
    }
    .error {
      color: red;
      font-weight: bold;
    }
  </style>

  <script>
    function addRow() {
      const table = document.getElementById("itemsTable").getElementsByTagName('tbody')[0];
      const row = table.insertRow();

      row.innerHTML = `
                <td>
                  <input type="text" name="bookTitle" placeholder="Search book..." oninput="searchBook(this)" required>
                  <input type="hidden" name="bookId">
                </td>
                <td><input type="number" name="quantity" min="1" value="1" required oninput="updateTotals()"></td>
                <td><input type="number" name="price" min="0" step="0.01" readonly required></td>
                <td><button type="button" class="btn-remove" onclick="removeRow(this)">Remove</button></td>
            `;
      updateTotals();
    }

    function removeRow(btn) {
      btn.closest("tr").remove();
      updateTotals();
    }

    function searchBook(input) {
      const row = input.closest("tr");
      const hiddenId = row.querySelector("input[name='bookId']");
      const priceInput = row.querySelector("input[name='price']");

      fetch("searchBooks?q=" + encodeURIComponent(input.value))
              .then(res => res.json())
              .then(data => {
                if (data.length === 1) {
                  input.value = data[0].title;
                  hiddenId.value = data[0].id;
                  priceInput.value = data[0].price;
                } else {
                  hiddenId.value = "";
                  priceInput.value = "";
                }
                updateTotals();
              });
    }

    function updateTotals() {
      let total = 0;
      document.querySelectorAll("#itemsTable tbody tr").forEach(row => {
        const quantity = parseFloat(row.querySelector("input[name='quantity']").value) || 0;
        const price = parseFloat(row.querySelector("input[name='price']").value) || 0;
        total += quantity * price;
      });
      document.getElementById("totalAmount").value = total.toFixed(2);
      updateFinalAmount();
    }

    function updateFinalAmount() {
      const total = parseFloat(document.getElementById("totalAmount").value) || 0;
      const discount = parseFloat(document.getElementById("discount").value) || 0;
      const final = Math.max(total - discount, 0);
      document.getElementById("finalAmount").textContent = "Final Amount after Discount: Rs. " + final.toFixed(2);
    }
  </script>
</head>
<body>

<div class="container">
  <h2>Create a New Bill</h2>

  <!-- Search Customer -->
  <form method="get">
    <label>Search Customer by Phone:</label>
    <input type="text" name="phone" placeholder="Enter phone number" required>
    <button type="submit">Search</button>
  </form>

  <%
    Customer customer = null;
    if (request.getParameter("phone") != null) {
      CustomerService customerService = new CustomerService();
      customer = customerService.getCustomerByPhone(request.getParameter("phone"));
      if (customer == null) {
  %>
  <p class="error">Customer not found!</p>
  <%
  } else {
  %>
  <h3>Customer Info</h3>
  <form action="createBill" method="post">
    <input type="hidden" name="customerId" value="<%= customer.getId() %>">
    <p><strong>Name:</strong> <%= customer.getName() %> |
      <strong>Phone:</strong> <%= customer.getTelephone() %> |
      <strong>Units Consumed:</strong> <%= customer.getUnitsConsumed() %>
    </p>

    <!-- Bill Items -->
    <label>Add Book Items:</label>
    <table id="itemsTable">
      <thead>
      <tr>
        <th>Book</th>
        <th>Quantity</th>
        <th>Price per Unit</th>
        <th>Action</th>
      </tr>
      </thead>
      <tbody></tbody>
    </table>
    <button type="button" onclick="addRow()">Add Book</button>

    <!-- Billing Summary -->
    <div class="summary">
      <label>Total Amount:</label>
      <input type="number" name="totalAmount" id="totalAmount" step="0.01" readonly required><br>
      <label>Discount:</label>
      <input type="number" name="discount" id="discount" step="0.01" value="0" oninput="updateFinalAmount()" required>
      <p id="finalAmount" class="final-amount">Final Amount after Discount: Rs. 0.00</p>
    </div>

    <button type="submit">Create Bill</button>
  </form>
  <%
      }
    }
  %>
</div>

</body>
</html>