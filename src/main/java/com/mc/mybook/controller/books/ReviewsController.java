package com.mc.mybook.controller.books;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mc.mybook.constants.PathConstants;
import com.mc.mybook.model.books.Review;
import com.mc.mybook.service.books.ReviewsService;

@Controller
@RequestMapping("/" + PathConstants.REVIEW_PATH)
public class ReviewsController {
	@Autowired
	private ReviewsService reviewsService;
	
	@PostMapping
	@ResponseBody
	public Review addReview(Review review) {
		review = reviewsService.addReview(review);
		return review;
	}
}
