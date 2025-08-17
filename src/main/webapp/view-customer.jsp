<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>View Customers - JSON</title>
  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-color: #f4f6f8;
      margin: 0;
      padding: 40px 20px;
      color: #333;
      display: flex;
      flex-direction: column;
      align-items: center;
    }
    h2 {
      margin-bottom: 30px;
      color: #222;
      font-weight: 700;
      font-size: 2rem;
      text-align: center;
    }
    table {
      width: 100%;
      max-width: 1100px;
      border-collapse: collapse;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
      background-color: #fff;
      border-radius: 8px;
      overflow: hidden;
    }
    thead {
      background-color: #007BFF;
      color: white;
      text-transform: uppercase;
      letter-spacing: 0.05em;
    }
    th, td {
      padding: 12px 16px;
      text-align: left;
      border-bottom: 1px solid #e0e0e0;
      font-size: 0.95rem;
    }
    tbody tr:hover {
      background-color: #f1f9ff;
      cursor: pointer;
    }
    @media (max-width: 768px) {
      table { font-size: 0.9rem; }
      th, td { padding: 10px 12px; }
    }
  </style>
</head>
<body>

<h2>Customers List</h2>

<table id="customersTable" aria-label="Customers List Table">
  <thead>
  <tr>
    <th scope="col">ID</th>
    <th scope="col">Email</th>
    <th scope="col">Name</th>
    <th scope="col">Address</th>
    <th scope="col">Telephone</th>
    <th scope="col">Units Consumed</th>
    <th scope="col">Created At</th>
  </tr>
  </thead>
  <tbody>
  <!-- Filled dynamically by JS -->
  </tbody>
</table>

<script>
  (function() {
    const contextPath = '<%= request.getContextPath() %>';
    fetch(contextPath + '/api/viewCustomers')
            .then(response => {
              if (!response.ok) throw new Error('HTTP ' + response.status);
              return response.json();
            })
            .then(customers => {
              const tbody = document.getElementById('customersTable').getElementsByTagName('tbody')[0];
              tbody.innerHTML = '';
              customers.forEach(c => {
                const row = tbody.insertRow();
                row.insertCell(0).textContent = c.id;
                row.insertCell(1).textContent = c.email || '';
                row.insertCell(2).textContent = c.name || '';
                row.insertCell(3).textContent = c.address || '';
                row.insertCell(4).textContent = c.telephone || '';
                row.insertCell(5).textContent = (typeof c.unitsConsumed === 'number') ? c.unitsConsumed : '';
                // c.createdAt is ISO string from servlet; show as-is or format
                row.insertCell(6).textContent = c.createdAt || '';
              });
            })
            .catch(error => {
              console.error('Error fetching customers:', error);
              const tbody = document.getElementById('customersTable').getElementsByTagName('tbody')[0];
              const row = tbody.insertRow();
              const cell = row.insertCell(0);
              cell.colSpan = 7;
              cell.style.color = 'red';
              cell.textContent = 'Failed to load customer data.';
            });
  })();
</script>

</body>
</html>