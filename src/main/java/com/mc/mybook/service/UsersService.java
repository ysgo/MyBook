package com.mc.mybook.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mc.mybook.model.User;
import com.mc.mybook.repository.UsersRepository;

@Service
public class UsersService {
	@Autowired
	private UsersRepository usersRepository;
	
	public void addUser(User user) {
		usersRepository.save(user);
	}
	
	public Optional<User> findById(User user) {
		return usersRepository.findById(user.getId());
	}
	
	public void editUser(User user) {
		usersRepository.save(user);
	}
}
