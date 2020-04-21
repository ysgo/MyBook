package com.mc.mybook.service.books;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mc.mybook.model.books.Review;
import com.mc.mybook.repository.books.ReviewsRepository;

@Service
public class ReviewsService {
	@Autowired
	private ReviewsRepository reviewsRepository;
	
	public Review addReview(Review review) {
		return reviewsRepository.save(review);
	}
	
	public List<Review> listAll() {
		return reviewsRepository.findAll();
	}
}
