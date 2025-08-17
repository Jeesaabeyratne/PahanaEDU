<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>📖 View Books</title>
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

<h2>📖 Books List</h2>

<table id="booksTable">
  <thead>
  <tr>
    <th>ID</th>
    <th>Title</th>
    <th>Author</th>
    <th>ISBN</th>
    <th>Price</th>
    <th>Stock Quantity</th>
    <th>Category</th>
  </tr>
  </thead>
  <tbody>
  <!-- Data will be inserted dynamically -->
  </tbody>
</table>

<script>
  fetch('api/viewBooks')
          .then(response => response.json())
          .then(books => {
            const tbody = document.getElementById('booksTable').getElementsByTagName('tbody')[0];
            books.forEach(book => {
              const row = tbody.insertRow();
              row.insertCell(0).textContent = book.id;
              row.insertCell(1).textContent = book.title;
              row.insertCell(2).textContent = book.author;
              row.insertCell(3).textContent = book.isbn;
              row.insertCell(4).textContent = book.price;
              row.insertCell(5).textContent = book.stockQuantity;
              row.insertCell(6).textContent = book.categoryId;

            });
          })
          .catch(error => {
            console.error('Error fetching books:', error);
            const tbody = document.getElementById('booksTable').getElementsByTagName('tbody')[0];
            const row = tbody.insertRow();
            const cell = row.insertCell(0);
            cell.colSpan = 7;
            cell.style.color = 'red';
            cell.textContent = 'Failed to load book data.';
          });
</script>

</body>
</html>