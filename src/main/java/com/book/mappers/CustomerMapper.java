package com.book.mappers;

import com.book.dto.CustomerDTO;
import com.book.model.Customer;

public class CustomerMapper {

    public static CustomerDTO toDTO(Customer customer) {
        return new CustomerDTO(
                customer.getId(),
                customer.getEmail(),
                customer.getName(),
                customer.getAddress(),
                customer.getTelephone(),
                customer.getUnitsConsumed(),
                customer.getCreatedAt()
        );
    }

    public static Customer toEntity(CustomerDTO dto) {
        Customer customer = new Customer();
        customer.setId(dto.getId());
        customer.setEmail(dto.getEmail());
        customer.setName(dto.getName());
        customer.setAddress(dto.getAddress());
        customer.setTelephone(dto.getTelephone());
        customer.setUnitsConsumed(dto.getUnitsConsumed());
        customer.setCreatedAt(dto.getCreatedAt());
        return customer;
    }
}