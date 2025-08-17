<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>View Users - JSON</title>
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
      max-width: 900px;
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

    @media (max-width: 600px) {
      body {
        padding: 20px 10px;
      }
      table {
        font-size: 0.9rem;
      }
      th, td {
        padding: 10px 12px;
      }
    }
  </style>
</head>
<body>

<h2>Users List</h2>

<table id="usersTable" aria-label="Users List Table">
  <thead>
  <tr>
    <th scope="col">ID</th>
    <th scope="col">Name</th>
    <th scope="col">Email</th>
    <th scope="col">Role</th>
  </tr>
  </thead>
  <tbody>
  <!-- Filled dynamically by JS -->
  </tbody>
</table>

<script>
  fetch('api/users')
          .then(response => response.json())
          .then(users => {
            const tbody = document.getElementById('usersTable').getElementsByTagName('tbody')[0];
            users.forEach(user => {
              const row = tbody.insertRow();
              row.insertCell(0).textContent = user.id;
              row.insertCell(1).textContent = user.name;
              row.insertCell(2).textContent = user.email;
              row.insertCell(3).textContent = user.role;
            });
          })
          .catch(error => {
            console.error('Error fetching users:', error);
            const tbody = document.getElementById('usersTable').getElementsByTagName('tbody')[0];
            const row = tbody.insertRow();
            const cell = row.insertCell(0);
            cell.colSpan = 4;
            cell.style.color = 'red';
            cell.textContent = 'Failed to load user data.';
          });
</script>

</body>
</html>