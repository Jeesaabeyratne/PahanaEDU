package com.book.dao;

import com.book.model.Book;
import org.junit.jupiter.api.*;
import jakarta.persistence.*;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@TestInstance(TestInstance.Lifecycle.PER_CLASS)
public class BookDAOTest {

    private EntityManagerFactory emf;
    private BookDAO bookDAO;

    @BeforeAll
    void setup() {
        // Use test persistence unit
        emf = Persistence.createEntityManagerFactory("myPU");
        bookDAO = new BookDAO();
        // Override emf inside DAO for testing
        bookDAO = new BookDAO() {{
            this.emf = emf;
        }};
    }

    @AfterAll
    void tearDown() {
        emf.close();
    }

    @Test
    void testSaveAndFindById() {
        Book book = new Book();
        book.setTitle("JUnit in Action");
        book.setAuthor("Smith");
        book.setIsbn("1234567890");
        book.setPrice(29.99);
        book.setStockQuantity(5);

        bookDAO.save(book);

        Book savedBook = bookDAO.findById(book.getId());
        assertNotNull(savedBook);
        assertEquals("JUnit in Action", savedBook.getTitle());
    }

    @Test
    void testFindAll() {
        Book book1 = new Book();
        book1.setTitle("Book One");
        book1.setAuthor("Author A");
        book1.setIsbn("1111111111");
        book1.setPrice(10.0);
        book1.setStockQuantity(3);

        Book book2 = new Book();
        book2.setTitle("Book Two");
        book2.setAuthor("Author B");
        book2.setIsbn("2222222222");
        book2.setPrice(15.0);
        book2.setStockQuantity(4);

        bookDAO.save(book1);
        bookDAO.save(book2);

        List<Book> books = bookDAO.findAll();
        assertTrue(books.size() >= 2);
    }

    @Test
    void testUpdate() {
        Book book = new Book();
        book.setTitle("Old Title");
        book.setAuthor("Author C");
        book.setIsbn("3333333333");
        book.setPrice(20.0);
        book.setStockQuantity(7);

        bookDAO.save(book);

        book.setTitle("Updated Title");
        bookDAO.update(book);

        Book updatedBook = bookDAO.findById(book.getId());
        assertEquals("Updated Title", updatedBook.getTitle());
    }

    @Test
    void testFindByName() {
        Book book = new Book();
        book.setTitle("FindMe");
        book.setAuthor("Author D");
        book.setIsbn("4444444444");
        book.setPrice(25.0);
        book.setStockQuantity(6);

        bookDAO.save(book);

        assertNotNull(bookDAO.findByName("FindMe"));
        assertNull(bookDAO.findByName("NotExist"));
    }
}