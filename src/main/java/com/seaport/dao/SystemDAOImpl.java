package com.seaport.dao;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.seaport.service.IUserService;
import com.seaport.utils.SystemConstants;

@Repository
public class SystemDAOImpl implements ISystemDAO {
	@Autowired
	private SystemConstants sessionConstants;
	@Autowired
	private IUserService userService;

	@Override
	public boolean isLocalConfig() {
		return sessionConstants.isLocalConfig();
	}
}
