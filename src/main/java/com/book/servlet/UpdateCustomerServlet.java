package com.book.servlet;

import com.book.dto.CustomerDTO;
import com.book.service.CustomerService;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/updateCustomer")
public class UpdateCustomerServlet extends HttpServlet {

    private CustomerService service = new CustomerService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String telephone = request.getParameter("telephone");

        CustomerDTO dto = service.getCustomerById(id);
        dto.setName(name);
        dto.setEmail(email);
        dto.setAddress(address);
        dto.setTelephone(telephone);

        service.updateCustomer(dto);

        response.sendRedirect("user-db.jsp?success=updated");
    }
}