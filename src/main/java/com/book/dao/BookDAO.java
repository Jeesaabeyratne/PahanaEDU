package com.book.dao;

import com.book.model.Book;
import jakarta.persistence.*;

import java.util.List;

public class BookDAO {

    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("myPU");

    public void save(Book book) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction tx = em.getTransaction();

        try {
            tx.begin();
            em.persist(book);
            tx.commit();
        } catch (Exception e) {
            if (tx.isActive()) tx.rollback();
            e.printStackTrace();
        } finally {
            em.close();
        }
    }

    public List<Book> findAll() {
        EntityManager em = emf.createEntityManager();
        return em.createQuery("SELECT b FROM Book b", Book.class).getResultList();
    }




}