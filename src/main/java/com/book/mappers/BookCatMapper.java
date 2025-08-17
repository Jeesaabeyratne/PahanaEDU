package com.book.mappers;

import com.book.dto.BookCatDTO;
import com.book.model.BookCat;

public class BookCatMapper {

    public static BookCatDTO toDTO(BookCat category) {
        return new BookCatDTO(category.getId(), category.getCategoryName());
    }

    public static BookCat toEntity(BookCatDTO dto) {
        BookCat category = new BookCat();
        category.setId(dto.getId());
        category.setCategoryName(dto.getCategoryName());
        return category;
    }
}