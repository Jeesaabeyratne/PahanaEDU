package com.book.servlet;

import com.book.service.CustomerService;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/addCustomer")
public class CustomerServlet extends HttpServlet {

    private CustomerService customerService = new CustomerService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String telephone = request.getParameter("telephone");

        customerService.addCustomer(email, name, address, telephone);

        response.sendRedirect("user-db.jsp?success=true");
    }
}
