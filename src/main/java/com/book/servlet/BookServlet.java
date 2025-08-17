package com.book.servlet;

import com.book.dto.BookDTO;
import com.book.service.BookService;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/add-book")
public class BookServlet extends HttpServlet {

    private BookService service = new BookService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String isbn = request.getParameter("isbn");
        double price = Double.parseDouble(request.getParameter("price"));
        int stockQuantity = Integer.parseInt(request.getParameter("stockQuantity"));
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));

        BookDTO dto = new BookDTO();
        dto.setTitle(title);
        dto.setAuthor(author);
        dto.setIsbn(isbn);
        dto.setPrice(price);
        dto.setStockQuantity(stockQuantity);
        dto.setCategoryId(categoryId);

        service.addBook(dto);
        response.sendRedirect("admin-db.jsp?success=true");
    }
}