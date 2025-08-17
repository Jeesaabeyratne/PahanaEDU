package com.book.servlet;

import com.book.dto.BookDTO;
import com.book.model.Book;
import com.book.service.BookService;
import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/api/viewBooks")
public class ViewBookServlet extends HttpServlet {
    private final BookService bookService = new BookService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        List<Book> dtoList = bookService.getAllBooks();  // Already DTOs

        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");

        String json = new Gson().toJson(dtoList);
        resp.getWriter().write(json);
    }

}