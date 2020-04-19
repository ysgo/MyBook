package com.mc.mybook.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mc.mybook.model.User;

public interface UsersRepository extends JpaRepository<User, Integer> {
	public User findByLoginIdAndPassword(String loginId, String password);
}
