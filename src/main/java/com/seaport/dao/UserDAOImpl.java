package com.seaport.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.seaport.domain.Countries;
import com.seaport.domain.User;

@Repository
public class UserDAOImpl implements IUserDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	private Session openSession() {
		return sessionFactory.getCurrentSession();
	}
	
	@SuppressWarnings("unchecked")
	public User getUser(String login) {
		List<User> userList = new ArrayList<User>();
		Query query = openSession().createQuery("from User u where u.login = :login");
		query.setParameter("login", login);
		userList = query.list();
		if (userList.size() > 0)
			return userList.get(0);
		else
			return null;	
	}

	public User getUser(Integer userId) {
		return (User)openSession().get(User.class, userId);
	}

	@SuppressWarnings("unchecked")
	public List<User> getUser(Object[] params){
		return sessionFactory.getCurrentSession().createCriteria(User.class).list();
	}
	
	public void saveUser(User user){
		openSession().saveOrUpdate(user);
	}
	
	@SuppressWarnings("unchecked")
	public List<Countries> getContries(){
		return sessionFactory.getCurrentSession().createCriteria(Countries.class).list();
	}
}
