package com.seaport.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seaport.dao.IUserDAO;
import com.seaport.domain.User;

@Service
@Transactional
public class UserServiceImpl implements IUserService {
	
	@Autowired
	private IUserDAO userDAO;

	public User getUser(String login) {
		return userDAO.getUser(login);
	}
	public void saveUser(User user){
		userDAO.saveUser(user);
	}
	public List<User> getUser(Object[] params) {
		return userDAO.getUser(params);
	}
	public User getUser(Integer userId){
		return userDAO.getUser(userId);
	}
}
