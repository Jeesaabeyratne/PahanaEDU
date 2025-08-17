package com.book.servlet;

import com.book.dto.BillDTO;
import com.book.service.BillService;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/viewBill")
public class ViewBillServlet extends HttpServlet {
    private BillService billService = new BillService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String billIdParam = request.getParameter("billId");

        if (billIdParam != null) {
            // View a specific bill
            int billId = Integer.parseInt(billIdParam);
            BillDTO bill = billService.getBillById(billId);
            request.setAttribute("bill", bill);
            RequestDispatcher dispatcher = request.getRequestDispatcher("view-bill.jsp");
            dispatcher.forward(request, response);
        } else {
            // View all bills
            List<BillDTO> bills = billService.getAllBills();
            request.setAttribute("bills", bills);
            RequestDispatcher dispatcher = request.getRequestDispatcher("view-bills.jsp");
            dispatcher.forward(request, response);
        }
    }
}
