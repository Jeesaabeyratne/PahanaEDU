package com.book.dao;

import com.book.dto.BookDTO;
import com.book.mappers.BookMapper;
import com.book.model.Book;
import jakarta.persistence.*;

import java.util.List;

public class BookDAO {

    EntityManagerFactory emf = Persistence.createEntityManagerFactory("myPU");
    private BookMapper mapper = new BookMapper();

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
    public void update(Book book) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction tx = em.getTransaction();

        try {
            tx.begin();
            em.merge(book);  // JPA will update the existing record by ID
            tx.commit();
        } catch (Exception e) {
            tx.rollback();
            throw new RuntimeException("Failed to update customer", e);
        } finally {
            em.close();
        }
    }

    public BookDTO findByName(String title) {
        EntityManager em = emf.createEntityManager();
        BookDTO book = null;

        try {
            TypedQuery<Book> query = em.createQuery(
                    "SELECT b FROM Book b WHERE b.title = :title", Book.class);
            query.setParameter("title", title);
            Book result = query.getSingleResult();

            if (result != null) {
                book = mapper.toDTO(result);
            }
        } catch (NoResultException e) {
            // no customer found, return null
        } finally {
            em.close();
        }
        return book;
    }

    public Book findById(int id) {
        EntityManager em = emf.createEntityManager();
        return em.find(Book.class, id);
    }




}