package com.mc.mybook.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mc.mybook.model.Book;

public interface BooksRepository extends JpaRepository<Book, Integer> {

}
