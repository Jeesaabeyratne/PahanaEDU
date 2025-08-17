package com.book.service;

import com.book.dao.BillDAO;
import com.book.dto.BillDTO;
import com.book.dto.BillItemDTO;
import com.book.mappers.BillMapper;
import com.book.model.*;
import jakarta.persistence.*;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class BillService {
    private BillDAO dao = new BillDAO();
    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("myPU");

    public BillDTO createBill(BillDTO dto) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction tx = em.getTransaction();

        try {
            tx.begin();

            Customer customer = em.find(Customer.class, dto.getCustomerId());

            Bill bill = new Bill();
            bill.setCustomer(customer);
            bill.setBillDateTime(LocalDateTime.now());
            bill.setTotalAmount(dto.getTotalAmount());
            bill.setDiscount(dto.getDiscount());
            bill.setFinalAmount(dto.getFinalAmount());

            List<BillItem> items = new ArrayList<>();

            for (BillItemDTO itemDTO : dto.getItems()) {
                Book book = em.find(Book.class, itemDTO.getBookId());
                book.setStockQuantity(book.getStockQuantity() - itemDTO.getQuantity());

                customer.setUnitsConsumed(customer.getUnitsConsumed() + itemDTO.getQuantity());

                BillItem item = new BillItem();
                item.setBill(bill);
                item.setBook(book);
                item.setQuantity(itemDTO.getQuantity());
                item.setPrice(itemDTO.getPrice());
                item.setTotalPrice(itemDTO.getTotalPrice());
                items.add(item);
            }

            bill.setItems(items);
            em.persist(bill);
            tx.commit();

            return new BillMapper().toDTO(bill);
        } catch (Exception e) {
            tx.rollback();
            throw e;
        } finally {
            em.close();
        }
    }

    public BillDTO getBillById(int billId) {
        EntityManager em = emf.createEntityManager();
        try {
            Bill bill = em.find(Bill.class, billId);
            if (bill == null) return null;
            return new BillMapper().toDTO(bill);
        } finally {
            em.close();
        }
    }
}