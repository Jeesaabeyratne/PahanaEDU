package com.book.model;
import jakarta.persistence.*;

@Entity
@Table(name = "book_category")
public class BookCat {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "category_name", nullable = false, unique = true)
    private String category_name;

    // Getters and Setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCategoryName() {
        return category_name;
    }

    public void setCategoryName(String categoryName) {
        this.category_name = categoryName;
    }
}