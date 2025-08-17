package com.book.servlet;

import com.book.dto.BillDTO;
import com.book.service.BillService;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/viewBill")
public class ViewBillServlet extends HttpServlet {
    private BillService billService = new BillService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String billIdStr = request.getParameter("billId");
        if (billIdStr == null || billIdStr.isEmpty()) {
            response.sendRedirect("error.jsp");
            return;
        }

        int billId;
        try {
            billId = Integer.parseInt(billIdStr);
        } catch (NumberFormatException e) {
            response.sendRedirect("error.jsp");
            return;
        }

        // Fetch bill from service
        BillDTO bill = billService.getBillById(billId);

        if (bill == null) {
            response.sendRedirect("error.jsp");
            return;
        }



        // Forward to JSP to display the bill
        request.getRequestDispatcher("admin-db.jsp").forward(request, response);
    }
}