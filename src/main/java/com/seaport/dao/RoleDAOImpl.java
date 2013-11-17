package com.seaport.dao;

import javax.persistence.EntityManager;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.seaport.domain.Role;

@Repository
public class RoleDAOImpl implements RoleDAO {
	
    @Autowired
    private EntityManager entityManager;

	public Role getRole(int id) {
		
	    CriteriaBuilder builder = entityManager.getCriteriaBuilder();
	    CriteriaQuery<Role> criteria = builder.createQuery(Role.class);
	    Root<Role> role = criteria.from(Role.class);
	    criteria.select(role).where(builder.equal(role.get("id"), id));
	    return entityManager.createQuery(criteria).getSingleResult();		
	}

}
