package com.book.dao;

import com.book.model.BookCat;

import jakarta.persistence.*;
import java.util.List;

public class BookCatDAO {

    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("myPU");

    public void save(BookCat category) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            em.persist(category);
            tx.commit();
        } catch (Exception e) {
            if (tx.isActive()) tx.rollback();
            throw new RuntimeException("Failed to save category", e);
        } finally {
            em.close();
        }
    }

    public List<BookCat> findAll() {
        EntityManager em = emf.createEntityManager();
        return em.createQuery("SELECT c FROM BookCat c", BookCat.class).getResultList();
    }

    public BookCat findById(int id) {
        EntityManager em = emf.createEntityManager();
        return em.find(BookCat.class, id);
    }

    public void delete(int id) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            BookCat category = em.find(BookCat.class, id);
            if (category != null) {
                em.remove(category);
            }
            tx.commit();
        } catch (Exception e) {
            if (tx.isActive()) tx.rollback();
            throw new RuntimeException("Failed to delete category", e);
        } finally {
            em.close();
        }
    }


}