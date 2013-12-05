package com.seaport.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.seaport.dao.IRoleDAO;
import com.seaport.domain.Role;

/**
 * The Service layer for User role requests 
 * 
 * @Author Danil Ozherelyev
 * @version 1.0 12/04/13
 *          
 */
@Service
@Transactional
public class RoleServiceImpl implements IRoleService {
	
	@Autowired
	private IRoleDAO roleDAO;

	public Role getRole(int id) {
		return roleDAO.getRole(id);
	}

}
