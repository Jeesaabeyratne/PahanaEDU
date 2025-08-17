package com.book.mappers;

import com.book.dto.BookDTO;
import com.book.model.Book;
import com.book.model.BookCat;

public class BookMapper {

    public static BookDTO toDTO(Book book) {
        BookDTO dto = new BookDTO();
        dto.setId(book.getId());
        dto.setTitle(book.getTitle());
        dto.setAuthor(book.getAuthor());
        dto.setIsbn(book.getIsbn());
        dto.setPrice(book.getPrice());
        dto.setStockQuantity(book.getStockQuantity());

        if (book.getCategory() != null) {
            dto.setCategoryId(book.getCategory().getId());
            dto.setCategoryName(book.getCategory().getCategoryName());
        }

        return dto;
    }

    public static Book toEntity(BookDTO dto, BookCat category) {
        Book book = new Book();
        book.setId(dto.getId());
        book.setTitle(dto.getTitle());
        book.setAuthor(dto.getAuthor());
        book.setIsbn(dto.getIsbn());
        book.setPrice(dto.getPrice());
        book.setStockQuantity(dto.getStockQuantity());
        book.setCategory(category);
        return book;
    }
}