package com.book.dao;

import com.book.dto.CustomerDTO;
import com.book.model.Customer;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import org.junit.jupiter.api.*;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class CustomerDAOTest {

    private static EntityManagerFactory emf;
    private CustomerDAO customerDAO;

    @BeforeAll
    static void setupClass() {
        // Make sure you have testPU defined in src/test/resources/META-INF/persistence.xml
        emf = Persistence.createEntityManagerFactory("myPU");
    }

    @AfterAll
    static void tearDownClass() {
        if (emf != null) emf.close();
    }

    @BeforeEach
    void setup() {
        customerDAO = new CustomerDAO(); // Uses testPU internally
    }

    @Test
    void testSaveAndFindById() {
        Customer customer = new Customer();
        customer.setName("Alice");
        customer.setEmail("alice@example.com");
        customer.setAddress("123 Street");
        customer.setTelephone("555-1234");

        customerDAO.save(customer);

        Customer saved = customerDAO.findById(customer.getId());
        assertNotNull(saved);
        assertEquals("Alice", saved.getName());
        assertEquals("alice@example.com", saved.getEmail());
    }

    @Test
    void testUpdateCustomer() {
        Customer customer = new Customer();
        customer.setName("Bob");
        customer.setEmail("bob@example.com");
        customerDAO.save(customer);

        // Update
        customer.setEmail("bob.new@example.com");
        customerDAO.update(customer);

        Customer updated = customerDAO.findById(customer.getId());
        assertEquals("bob.new@example.com", updated.getEmail());
    }

    @Test
    void testFindAll() {
        Customer customer1 = new Customer();
        customer1.setName("Charlie");
        customerDAO.save(customer1);

        Customer customer2 = new Customer();
        customer2.setName("David");
        customerDAO.save(customer2);

        List<Customer> customers = customerDAO.findAll();
        assertTrue(customers.size() >= 2);
    }

    @Test
    void testDeleteCustomer() {
        Customer customer = new Customer();
        customer.setName("Eve");
        customerDAO.save(customer);

        int id = customer.getId();
        customerDAO.delete(id);

        Customer deleted = customerDAO.findById(id);
        assertNull(deleted);
    }

    @Test
    void testFindByName() {
        Customer customer = new Customer();
        customer.setName("Frank");
        customer.setEmail("frank@example.com");
        customerDAO.save(customer);

        CustomerDTO dto = customerDAO.findByName("Frank");
        assertNotNull(dto);
        assertEquals("Frank", dto.getName());
    }
}