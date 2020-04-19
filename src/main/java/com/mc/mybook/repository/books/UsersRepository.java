package com.mc.mybook.repository.books;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mc.mybook.model.books.User;

public interface UsersRepository extends JpaRepository<User, Integer> {
	public User findByLoginIdAndPassword(String loginId, String password);
}
