package com.book.servlet;

import com.book.dto.*;
import com.book.service.BillService;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.*;

@WebServlet("/createBill")
public class BillServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int customerId = Integer.parseInt(request.getParameter("customerId"));
        BigDecimal total = new BigDecimal(request.getParameter("totalAmount"));
        BigDecimal discount = new BigDecimal(request.getParameter("discount"));
        BigDecimal finalAmount = total.subtract(discount);

        BillDTO bill = new BillDTO();
        bill.setCustomerId(customerId);
        bill.setTotalAmount(total);
        bill.setDiscount(discount);
        bill.setFinalAmount(finalAmount);

        List<BillItemDTO> items = new ArrayList<>();

        String[] bookIds = request.getParameterValues("bookId");
        String[] quantities = request.getParameterValues("quantity");
        String[] prices = request.getParameterValues("price");

        for (int i = 0; i < bookIds.length; i++) {
            BillItemDTO item = new BillItemDTO();
            item.setBookId(Integer.parseInt(bookIds[i]));
            item.setQuantity(Integer.parseInt(quantities[i]));
            item.setPrice(new BigDecimal(prices[i]));
            item.setTotalPrice(item.getPrice().multiply(new BigDecimal(item.getQuantity())));
            items.add(item);
        }

        bill.setItems(items);

        BillDTO createdBill = new BillService().createBill(bill); // get bill with generated ID

        // Redirect to Download PDF servlet to trigger download
        response.sendRedirect("downloadBill?billId=" + createdBill.getId());
    }
}