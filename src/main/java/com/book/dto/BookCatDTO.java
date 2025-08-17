package com.book.dto;

public class BookCatDTO {
    private int id;
    private String categoryName;

    // Constructors
    public BookCatDTO() {
    }

    public BookCatDTO(int id, String categoryName) {
        this.id = id;
        this.categoryName = categoryName;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }
}