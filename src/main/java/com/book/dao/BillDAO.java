package com.book.dao;

import com.book.model.Bill;
import jakarta.persistence.*;

public class BillDAO {
    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("myPU");

    public Bill save(Bill bill) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            em.persist(bill);
            tx.commit();
            return bill;
        } catch (Exception e) {
            tx.rollback();
            throw e;
        } finally {
            em.close();
        }
    }
}