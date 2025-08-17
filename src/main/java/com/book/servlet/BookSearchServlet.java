package com.book.servlet;

import com.book.model.Book;
import com.book.service.BookService;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/searchBooks")
public class BookSearchServlet extends HttpServlet {
    private final BookService bookService = new BookService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String query = request.getParameter("q");

        if (query == null || query.trim().isEmpty()) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("[]");
            return;
        }

        List<Book> books = bookService.findBooksByTitle(query);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        try (PrintWriter out = response.getWriter()) {
            out.print("[");
            for (int i = 0; i < books.size(); i++) {
                Book b = books.get(i);
                String safeTitle = b.getTitle().replace("\\", "\\\\").replace("\"", "\\\"");
                out.print("{");
                out.print("\"id\":" + b.getId() + ",");
                out.print("\"title\":\"" + safeTitle + "\",");
                out.print("\"price\":" + b.getPrice());
                out.print("}");
                if (i < books.size() - 1) out.print(",");
            }
            out.print("]");
        }
    }
}