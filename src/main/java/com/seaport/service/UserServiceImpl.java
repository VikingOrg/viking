package com.seaport.service;

import org.springframework.transaction.annotation.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seaport.dao.UserDAO;
import com.seaport.domain.User;

@Service
@Transactional
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDAO userDAO;

	public User getUser(String login) {
		return userDAO.getUser(login);
	}
	public void saveUser(User user){
		userDAO.saveUser(user);
	}
}
