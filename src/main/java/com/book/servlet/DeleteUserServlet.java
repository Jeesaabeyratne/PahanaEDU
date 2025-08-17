package com.book.servlet;

import com.book.service.UserService;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/deleteUser")
public class DeleteUserServlet extends HttpServlet {

    private final UserService userService = new UserService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idParam = request.getParameter("id");
        if (idParam == null || idParam.trim().isEmpty()) {
            response.sendRedirect("delete-user.jsp?error=missingId");
            return;
        }

        try {
            Long id = Long.parseLong(idParam);
            boolean deleted = userService.deleteUserById(id);

            if (deleted) {
                response.sendRedirect("delete-user.jsp?success=deleted");
            } else {
                response.sendRedirect("delete-user.jsp?error=notfound");
            }
        } catch (NumberFormatException e) {
            response.sendRedirect("delete-user.jsp?error=invalidId");
        }
    }

    // Optional: if you want to allow GET requests for testing
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}