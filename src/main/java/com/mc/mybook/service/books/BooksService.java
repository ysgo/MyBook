package com.mc.mybook.service.books;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mc.mybook.model.books.Book;
import com.mc.mybook.repository.books.BooksRepository;

@Service
public class BooksService {
	@Autowired
	private BooksRepository booksRepository;
	
	public Book save(Book book) {
		return booksRepository.save(book);
	}
	
	public List<Book> findAllByUserId(int userId) {
		return booksRepository.findAllByUserId(userId);
	}
	
	public Book findById(int id) {
		return booksRepository.findById(id).orElse(null);
	}
	
	public void deleteById(int id) {
		booksRepository.deleteById(id);
	}
}
