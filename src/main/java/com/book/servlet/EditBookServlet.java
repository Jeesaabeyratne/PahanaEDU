package com.book.servlet;

import com.book.dto.BookDTO;
import com.book.service.BookService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/edit-book")
public class EditBookServlet extends HttpServlet {
    private final BookService bookService = new BookService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        try {
            // Get params from form
            int id = Integer.parseInt(request.getParameter("id"));
            String title = request.getParameter("title");
            String author = request.getParameter("author");
            String isbn = request.getParameter("isbn");
            double price = Double.parseDouble(request.getParameter("price"));
            int stockQuantity = Integer.parseInt(request.getParameter("stockQuantity"));
            int categoryId = Integer.parseInt(request.getParameter("categoryId"));

            // Fill DTO
            BookDTO dto = new BookDTO();
            dto.setId(id);
            dto.setTitle(title);
            dto.setAuthor(author);
            dto.setIsbn(isbn);
            dto.setPrice(price);
            dto.setStockQuantity(stockQuantity);
            dto.setCategoryId(categoryId);

            // Update book
            bookService.updateBook(dto);

            // Redirect back to admin dashboard
            response.sendRedirect("admin-db.jsp?editSuccess=true");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("admin-db.jsp?editError=" + e.getMessage());
        }
    }
}
