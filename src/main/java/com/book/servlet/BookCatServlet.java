package com.book.servlet;

import com.book.dto.BookCatDTO;
import com.book.service.BookCatService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/addCategory")
public class BookCatServlet extends HttpServlet {

    private final BookCatService categoryService = new BookCatService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String categoryName = request.getParameter("categoryName");

        // Create DTO and pass it to the service
        BookCatDTO dto = new BookCatDTO();
        dto.setCategoryName(categoryName);

        categoryService.addCategory(dto);

        response.sendRedirect("admin-db.jsp?success=true");
    }
}