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
	
	public List<Book> findAllByUserIdAndInterestedTrue(int userId) {
		return booksRepository.findAllByUserIdAndInterestedTrue(userId);
	}
	
	public List<Book> findAllByUserIdAndReviewIdNotNull(int userId) {
		return booksRepository.findAllByUserIdAndReviewIdNotNull(userId);
	}
	
	public Book findById(int id) {
		return booksRepository.findById(id).orElse(null);
	}
	
	public Book findTop1ByUserIdAndImageAndInterestedFalse(int userId, String image) {
		return booksRepository.findTop1ByUserIdAndImageAndInterestedFalse(userId, image);
	}
	
	public void deleteById(int id) {
		booksRepository.deleteById(id);
	}
}
