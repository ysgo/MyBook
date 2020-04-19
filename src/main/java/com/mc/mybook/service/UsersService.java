package com.mc.mybook.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mc.mybook.model.User;
import com.mc.mybook.repository.UsersRepository;

@Service
public class UsersService {
	@Autowired
	private UsersRepository usersRepository;
	
	public User addUser(User user) {
		user = usersRepository.save(user);
		return user;
	}
	
	public User findByLoginIdAndPassword(User user) {
		return usersRepository.findByLoginIdAndPassword(user.getLoginId(), user.getPassword());
	}
	
	public void editUser(User user) {
		usersRepository.save(user);
	}
	
	public void signOut(HttpSession session) {
		session.invalidate();
	}
}
