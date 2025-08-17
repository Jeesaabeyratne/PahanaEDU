package com.book.service;

import com.book.dao.BookCatDAO;
import com.book.dto.BookCatDTO;
import com.book.model.BookCat;

import java.util.ArrayList;
import java.util.List;

public class BookCatService {

    private BookCatDAO dao = new BookCatDAO();

    public void addCategory(BookCatDTO dto) {
        BookCat category = toEntity(dto);
        dao.save(category);
    }

    public List<BookCat> getAllCategories() {
        return dao.findAll();
    }

    public BookCat getCategoryById(int id) {
        return dao.findById(id);
    }


    public void deleteCategory(int id) {
        dao.delete(id);
    }


    private BookCatDTO toDTO(BookCat category) {
        return new BookCatDTO(category.getId(), category.getCategoryName());
    }


    private BookCat toEntity(BookCatDTO dto) {
        BookCat category = new BookCat();
        category.setId(dto.getId());
        category.setCategoryName(dto.getCategoryName());
        return category;
    }
}