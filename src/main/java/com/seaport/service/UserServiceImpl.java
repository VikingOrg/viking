package com.seaport.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.seaport.dao.IUserDAO;
import com.seaport.domain.Country;
import com.seaport.domain.User;


/**
 * The Service layer for User related requests. 
 * 
 * @Author Danil Ozherelyev
 * @version 1.0 12/04/13
 *          
 */
@Service
@Transactional
public class UserServiceImpl implements IUserService {
	
	@Autowired
	private IUserDAO userDAO;
	
	@Override
	public User getUser(String login) {
		return userDAO.getUser(login);
	}
	@Override
	public void saveUser(User user){
		userDAO.saveUser(user);
	}
	@Override
	public List<User> getUsers() {
		return userDAO.getUsers();
	}
	@Override
	public User getUser(Integer userId){
		return userDAO.getUser(userId);
	}
	@Override	
	public List<Country> getContries(){
		return userDAO.getContries();
	}
	@Override
	public Map<Integer, Country> getContriesMap() {
		return userDAO.getContriesMap();
	}
	public boolean hasRole(String role){
		return userDAO.hasRole(role);
	}
}
