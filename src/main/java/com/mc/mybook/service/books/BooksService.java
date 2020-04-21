package com.mc.mybook.service.books;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mc.mybook.model.books.Book;
import com.mc.mybook.repository.books.BooksRepository;

@Service
public class BooksService {
	@Autowired
	private BooksRepository booksRepository;
	
	public Book addBook(Book book) {
		return booksRepository.save(book);
	}
}
