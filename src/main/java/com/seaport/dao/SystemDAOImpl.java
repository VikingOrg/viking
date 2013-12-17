package com.seaport.dao;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.seaport.service.IUserService;
import com.seaport.utils.SessionConstants;

@Repository
public class SystemDAOImpl implements ISystemDAO {
	@Autowired
	private SessionConstants sessionConstants;
	@Autowired
	private IUserService userService;

	@Override
	public boolean isLocalConfig() {
		return sessionConstants.isLocalConfig();
	}
}
