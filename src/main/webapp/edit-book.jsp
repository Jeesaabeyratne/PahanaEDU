<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">

<style>
    body {
        margin: 0;
        font-family: Arial, sans-serif;
        background-color: #f4f6f8;
        display: flex;
    }

    /* ---------- SIDEBAR ---------- */
    .sidebar {
        width: 220px;
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
    .main-content {
        margin-left: 220px; /* sidebar width */
        padding: 30px;
        width: 100%;
    }
</style>

<body>
<!-- Sidebar -->
<div class="sidebar">
    <div class="brand">Admin Panel</div>
    <nav>
        <a href="javascript:history.back()" class="back"><i class="fa fa-arrow-left"></i> Go Back</a>
        <a href="logout.jsp" class="logout"><i class="fa fa-sign-out-alt"></i> Logout</a>
    </nav>
</div>


<div class="main-content">
    <div class="container">
        <div class="card shadow-lg border-0 rounded-4">
            <div class="card-header bg-dark text-white text-center rounded-top-4">
                <h3>Edit Book Details</h3>
            </div>
            <div class="card-body p-4">
                <form action="edit-book" method="post" class="row g-3">
                    <input type="hidden" name="id" value="${book.id}">

                    <!-- Title -->
                    <div class="col-md-6">
                        <label class="form-label">Title</label>
                        <input type="text" class="form-control" name="title" value="${book.title}" required>
                    </div>

                    <!-- Author -->
                    <div class="col-md-6">
                        <label class="form-label">Author</label>
                        <input type="text" class="form-control" name="author" value="${book.author}" required>
                    </div>

                    <!-- ISBN -->
                    <div class="col-md-6">
                        <label class="form-label">ISBN</label>
                        <input type="text" class="form-control" name="isbn" value="${book.isbn}" required>
                    </div>

                    <!-- Price -->
                    <div class="col-md-6">
                        <label class="form-label">Price (USD)</label>
                        <input type="number" step="0.01" class="form-control" name="price" value="${book.price}" required>
                    </div>

                    <!-- Stock -->
                    <div class="col-md-6">
                        <label class="form-label">Stock</label>
                        <input type="number" class="form-control" name="stockQuantity" value="${book.stockQuantity}" required>
                    </div>

                    <!-- Category -->
                    <div class="col-md-6">
                        <label class="form-label">Category ID</label>
                        <input type="number" class="form-control" name="categoryId" value="${book.categoryId}" required>
                    </div>

                    <!-- Submit Button -->
                    <div class="col-12 text-center mt-4">
                        <button type="submit" class="btn btn-success px-4 py-2 rounded-pill shadow-sm">
                            <i class="fa fa-save"></i> Update Book
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
