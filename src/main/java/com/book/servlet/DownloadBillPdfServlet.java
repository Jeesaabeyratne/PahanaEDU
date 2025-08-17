package com.book.servlet;

import com.book.dto.BillDTO;
import com.book.dto.BillItemDTO;
import com.book.service.BillService;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.math.BigDecimal;

@WebServlet("/downloadBill")
public class DownloadBillPdfServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String billIdParam = request.getParameter("billId");
        if (billIdParam == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Bill ID is required");
            return;
        }

        try {
            int billId = Integer.parseInt(billIdParam);

            // Fetch Bill data
            BillService billService = new BillService();
            BillDTO bill = billService.getBillById(billId); // Implement in your BillService

            if (bill == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Bill not found");
                return;
            }

            // PDF setup
            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition", "attachment; filename=bill_" + billId + ".pdf");

            Document document = new Document();
            PdfWriter.getInstance(document, response.getOutputStream());
            document.open();

            // Title
            Font titleFont = new Font(Font.FontFamily.HELVETICA, 20, Font.BOLD);
            Paragraph title = new Paragraph("Pahana Edu Book Store - Bill", titleFont);
            title.setAlignment(Element.ALIGN_CENTER);
            document.add(title);

            document.add(new Paragraph(" "));
            document.add(new Paragraph("Bill ID: " + bill.getId()));
            document.add(new Paragraph("Customer: " + bill.getCustomerId()));
            document.add(new Paragraph("Date: " + bill.getBillDateTime()));
            document.add(new Paragraph(" "));

            // Table for items
            PdfPTable table = new PdfPTable(4); // columns: Book, Qty, Price, Total Price
            table.setWidthPercentage(100);
            table.setSpacingBefore(10f);
            table.setSpacingAfter(10f);

            table.addCell("Book");
            table.addCell("Quantity");
            table.addCell("Price");
            table.addCell("Total Price");

            BigDecimal grandTotal = BigDecimal.ZERO;
            for (BillItemDTO item : bill.getItems()) {
                table.addCell(String.valueOf(item.getBookId()));  // Show Book ID instead of title
                table.addCell(String.valueOf(item.getQuantity()));
                table.addCell(String.format("%.2f", item.getPrice()));
                table.addCell(String.format("%.2f", item.getTotalPrice()));
                grandTotal = grandTotal.add(item.getTotalPrice());
            }

            // Total Amount row
            PdfPCell totalCell = new PdfPCell(new Phrase("Total Amount"));
            totalCell.setColspan(3);
            totalCell.setHorizontalAlignment(Element.ALIGN_RIGHT);
            table.addCell(totalCell);
            table.addCell(String.format("%.2f", bill.getTotalAmount()));

            // Discount row
            PdfPCell discountCell = new PdfPCell(new Phrase("Discount"));
            discountCell.setColspan(3);
            discountCell.setHorizontalAlignment(Element.ALIGN_RIGHT);
            table.addCell(discountCell);
            table.addCell(String.format("%.2f", bill.getDiscount()));

            // Final Amount row
            PdfPCell finalCell = new PdfPCell(new Phrase("Final Amount"));
            finalCell.setColspan(3);
            finalCell.setHorizontalAlignment(Element.ALIGN_RIGHT);
            table.addCell(finalCell);
            table.addCell(String.format("%.2f", bill.getFinalAmount()));

            document.add(table);

            document.add(new Paragraph("Thank you for shopping with us!"));
            document.close();

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error generating PDF");
        }
    }
}