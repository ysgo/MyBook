package com.mc.mybook.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mc.mybook.model.Review;

public interface ReviewsRepository extends JpaRepository<Review, Integer> {

}
