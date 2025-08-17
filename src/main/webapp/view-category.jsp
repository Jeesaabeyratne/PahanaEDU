<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>View Book Categories</title>
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
      max-width: 600px;
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
      padding: 14px 20px;
      text-align: left;
      border-bottom: 1px solid #e0e0e0;
      font-size: 1rem;
    }

    tbody tr:hover {
      background-color: #f1f9ff;
      cursor: pointer;
    }
  </style>
</head>
<body>

<h2>📚 Book Categories</h2>

<table id="categoriesTable">
  <thead>
  <tr>
    <th>ID</th>
    <th>Category Name</th>
  </tr>
  </thead>
  <tbody>
  <!-- Data will be inserted dynamically -->
  </tbody>
</table>

<script>
  fetch('api/viewCategories')
          .then(response => response.json())
          .then(categories => {
            const tbody = document.getElementById('categoriesTable').getElementsByTagName('tbody')[0];
            categories.forEach(cat => {
              const row = tbody.insertRow();
              row.insertCell(0).textContent = cat.id;
              row.insertCell(1).textContent = cat.category_name;
            });
          })
          .catch(error => {
            console.error('Error fetching categories:', error);
            const tbody = document.getElementById('categoriesTable').getElementsByTagName('tbody')[0];
            const row = tbody.insertRow();
            const cell = row.insertCell(0);
            cell.colSpan = 2;
            cell.style.color = 'red';
            cell.textContent = 'Failed to load category data.';
          });
</script>

</body>
</html>