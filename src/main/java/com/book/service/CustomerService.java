package com.book.service;

import com.book.dao.CustomerDAO;
import com.book.dao.UserDAO;
import com.book.dto.CustomerDTO;
import com.book.mappers.CustomerMapper;
import com.book.model.Customer;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.NoResultException;
import jakarta.persistence.Persistence;

import java.time.LocalDateTime;

import java.util.List;

public class CustomerService {
    private CustomerDAO dao = new CustomerDAO();
    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("myPU");

    public void addCustomer(String email, String name, String address, String telephone) {
        Customer c = new Customer();
        c.setEmail(email);
        c.setName(name);
        c.setAddress(address);
        c.setTelephone(telephone);
        c.setUnitsConsumed(0); // default
        c.setCreatedAt(LocalDateTime.now()); // auto-set date/time
        dao.save(c);
    }

    public List<Customer> getAllCustomers() {
        return dao.findAll();
    }

    public Customer getCustomerByPhone(String phone) {
        EntityManager em = emf.createEntityManager();
        try {
            return em.createQuery("SELECT c FROM Customer c WHERE c.telephone = :phone", Customer.class)
                    .setParameter("phone", phone)
                    .getSingleResult();
        } catch (NoResultException e) {
            return null; // customer not found
        } finally {
            em.close();
        }
    }

    public CustomerDTO getCustomerById(int id) {
        Customer customer = dao.findById(id);
        return CustomerMapper.toDTO(customer);
    }

    public CustomerDTO getCustomerByName(String name) {
        CustomerDAO dao = new CustomerDAO();
        return dao.findByName(name);
    }

    public void updateCustomer(CustomerDTO dto) {
        Customer customer = CustomerMapper.toEntity(dto);
        dao.update(customer);
    }

    public void deleteCustomer(int id) {
        dao.delete(id);
    }
}