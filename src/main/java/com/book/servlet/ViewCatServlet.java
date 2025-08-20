package com.book.servlet;

import com.book.model.BookCat;
import com.book.service.BookCatService;
import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/api/viewCategories")
public class ViewCatServlet extends HttpServlet {

    private final BookCatService categoryService = new BookCatService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        List<BookCat> categories = categoryService.getAllCategories();

        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");

        String json = new Gson().toJson(categories);
        resp.getWriter().write(json);
    }
}