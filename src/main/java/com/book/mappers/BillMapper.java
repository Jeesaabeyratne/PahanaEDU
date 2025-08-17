package com.book.mappers;

import com.book.dto.BillDTO;
import com.book.dto.BillItemDTO;
import com.book.model.Bill;
import com.book.model.BillItem;

import java.util.List;
import java.util.stream.Collectors;

public class BillMapper {
    public BillDTO toDTO(Bill bill) {
        BillDTO dto = new BillDTO();
        dto.setId(bill.getId());
        dto.setCustomerId(bill.getCustomer().getId());
        dto.setBillDateTime(bill.getBillDateTime());
        dto.setTotalAmount(bill.getTotalAmount());
        dto.setDiscount(bill.getDiscount());
        dto.setFinalAmount(bill.getFinalAmount());
        dto.setItems(bill.getItems().stream().map(this::toItemDTO).collect(Collectors.toList()));
        return dto;
    }

    public BillItemDTO toItemDTO(BillItem item) {
        BillItemDTO dto = new BillItemDTO();
        dto.setId(item.getId());
        dto.setBillId(item.getBill().getId());
        dto.setBookId(item.getBook().getId());
        dto.setQuantity(item.getQuantity());
        dto.setPrice(item.getPrice());
        dto.setTotalPrice(item.getTotalPrice());
        return dto;
    }
}