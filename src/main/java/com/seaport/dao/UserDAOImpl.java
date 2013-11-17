package com.seaport.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.seaport.domain.User;

@Repository
public class UserDAOImpl implements UserDAO {
    @Autowired
    private EntityManager entityManager;
    
	public User getUser(String login)  {
	    CriteriaBuilder builder = entityManager.getCriteriaBuilder();
	    CriteriaQuery<User> criteria = builder.createQuery(User.class);
	    Root<User> user = criteria.from(User.class);
	    criteria.select(user).where(builder.equal(user.get("login"), login));
	    return entityManager.createQuery(criteria).getSingleResult();
	}
	
//	public List<User> getUserQuery(String login)  {
//		List<User> userList = new ArrayList<User>();
//		Query query = entityManager.createQuery("from User u where u.login = :login");
//		query.setParameter("login", login);
//        return (List<User>) query.getResultList();
//	}

}
