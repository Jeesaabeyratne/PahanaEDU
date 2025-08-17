package com.book.servlet;

import com.book.dto.BookDTO;
import com.book.service.BookService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/updateBook")
public class UpdateBookServlet extends HttpServlet {

    private BookService service = new BookService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String title = request.getParameter("title");
            String author = request.getParameter("author");
            String isbn = request.getParameter("isbn");
            double price = Double.parseDouble(request.getParameter("price"));
            int stockQuantity = Integer.parseInt(request.getParameter("stockQuantity"));
            int categoryId = Integer.parseInt(request.getParameter("categoryId"));

            // Get existing book DTO
            BookDTO dto = service.getBookById(id);

            // Update fields
            dto.setTitle(title);
            dto.setAuthor(author);
            dto.setIsbn(isbn);
            dto.setPrice(price);
            dto.setStockQuantity(stockQuantity);
            dto.setCategoryId(categoryId);

            // Call service to update
            service.updateBook(dto);

            response.sendRedirect("admin-db.jsp?success=updated");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("admin-db.jsp?error=updateFailed");
        }
    }
}