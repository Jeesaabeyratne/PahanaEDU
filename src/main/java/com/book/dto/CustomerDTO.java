package com.book.dto;

import java.time.LocalDateTime;

public class CustomerDTO {
    private int id;
    private String email;
    private String name;
    private String address;
    private String telephone;
    private int unitsConsumed;
    private LocalDateTime createdAt;

    public CustomerDTO() {
    }

    public CustomerDTO(int id, String email, String name, String address, String telephone, int unitsConsumed, LocalDateTime createdAt) {
        this.id = id;
        this.email = email;
        this.name = name;
        this.address = address;
        this.telephone = telephone;
        this.unitsConsumed = unitsConsumed;
        this.createdAt = createdAt;
    }

// Getters and Setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public int getUnitsConsumed() {
        return unitsConsumed;
    }

    public void setUnitsConsumed(int unitsConsumed) {
        this.unitsConsumed = unitsConsumed;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }
}