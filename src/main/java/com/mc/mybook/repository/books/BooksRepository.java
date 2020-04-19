package com.mc.mybook.repository.books;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mc.mybook.model.books.Book;

public interface BooksRepository extends JpaRepository<Book, Integer> {

}
