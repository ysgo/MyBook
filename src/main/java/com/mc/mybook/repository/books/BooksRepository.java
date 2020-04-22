package com.mc.mybook.repository.books;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mc.mybook.model.books.Book;

public interface BooksRepository extends JpaRepository<Book, Integer> {
	public List<Book> findAllByUserId(int userId);
}
