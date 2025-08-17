package com.book.dao;

import com.book.model.Bill;
import jakarta.persistence.*;

import java.util.List;

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
    public Bill findById(int id) {
        EntityManager em = emf.createEntityManager();
        try {
            return em.find(Bill.class, id);
        } finally {
            em.close();
        }
    }

    public List<Bill> findAll() {
        EntityManager em = emf.createEntityManager();
        try {
            return em.createQuery("SELECT b FROM Bill b", Bill.class).getResultList();
        } finally {
            em.close();
        }
    }

}