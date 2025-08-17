package com.book.service;

import jakarta.persistence.*;
import com.book.dao.BookDAO;
import com.book.dao.BookCatDAO;
import com.book.dto.BookDTO;
import com.book.mappers.BookMapper;
import com.book.model.Book;
import com.book.model.BookCat;

import java.util.List;
import java.util.stream.Collectors;

public class BookService {
    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("myPU");

    private BookDAO bookDAO = new BookDAO();
    private BookCatDAO categoryDAO = new BookCatDAO();

    // Add a new book
    public void addBook(BookDTO dto) {
        BookCat category = categoryDAO.findById(dto.getCategoryId());
        Book book = BookMapper.toEntity(dto, category);
        bookDAO.save(book);
    }

    // Get all books
    public List<BookDTO> getAllBooks() {
        return bookDAO.findAll()
                .stream()
                .map(BookMapper::toDTO)
                .collect(Collectors.toList());
    }

    // Find books by title
    public List<Book> findBooksByTitle(String title) {
        EntityManager em = emf.createEntityManager();
        try {
            return em.createQuery(
                            "SELECT b FROM Book b WHERE LOWER(b.title) LIKE :title", Book.class)
                    .setParameter("title", "%" + title.toLowerCase() + "%")
                    .getResultList();
        } finally {
            em.close();
        }
    }

    public void updateBook(BookDTO dto) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();

            // Find existing book
            Book existingBook = em.find(Book.class, dto.getId());
            if (existingBook == null) {
                throw new IllegalArgumentException("Book with ID " + dto.getId() + " not found.");
            }

            // Update fields
            existingBook.setTitle(dto.getTitle());
            existingBook.setAuthor(dto.getAuthor());
            existingBook.setIsbn(dto.getIsbn());
            existingBook.setPrice(dto.getPrice());
            existingBook.setStockQuantity(dto.getStockQuantity());

            // Update category if needed
            if (dto.getCategoryId() != 0) {
                BookCat category = categoryDAO.findById(dto.getCategoryId());
                existingBook.setCategory(category);
            }

            em.merge(existingBook);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            throw e;
        } finally {
            em.close();
        }
    }




}
