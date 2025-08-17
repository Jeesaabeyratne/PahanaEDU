package com.book.service;
import jakarta.persistence.*;
import com.book.dao.BookDAO;
import com.book.dao.BookCatDAO;
import com.book.dto.BookDTO;
import com.book.mappers.BookMapper;
import com.book.model.Book;
import com.book.model.BookCat;
import jakarta.persistence.EntityManager;

import java.util.List;
import java.util.stream.Collectors;

public class BookService {
    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("myPU");

    private BookDAO bookDAO = new BookDAO();
    private BookCatDAO categoryDAO = new BookCatDAO();

    public void addBook(BookDTO dto) {
        BookCat category = categoryDAO.findById(dto.getCategoryId());
        Book book = BookMapper.toEntity(dto, category);
        bookDAO.save(book);
    }

    public List<Book> getAllBooks() {
        return bookDAO.findAll();
    }


    public List<Book> findBooksByTitle(String title) {
        EntityManager em = emf.createEntityManager();
        try {
            return em.createQuery("SELECT b FROM Book b WHERE LOWER(b.title) LIKE :title", Book.class)
                    .setParameter("title", "%" + title.toLowerCase() + "%")
                    .getResultList();
        } finally {
            em.close();
        }
    }
}