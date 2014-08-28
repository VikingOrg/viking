package com.seaport.service;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.seaport.dao.IPortDAO;
import com.seaport.domain.Port;
import com.seaport.domain.User;

/**
 * The Service layer for Port requests. 
 * 
 * @Author Danil Ozherelyev
 * @version 1.0 12/04/13
 * @version 2.0 12/27/13         
 *          
 */
@Service
public class PortServiceImpl implements IPortService {
	@Autowired
	private IUserService userService;
	@Autowired
	private IPortDAO portDAO;

	@Override
	public Port getPort(int portId) {
		return portDAO.getPort(portId);
	}

	@Override
	public List<Port> getPorts() {
		return portDAO.getPorts();
	}

	@Override
	public void savePort(Port port) {
		Timestamp updateDate = new Timestamp(new Date().getTime());
		User user = userService.getUser(SecurityContextHolder.getContext().getAuthentication().getName());
		/*for insert.*/
		if (port.getPortId() == null) {
			port.setCreateUserId(user.getUserId());
			port.setCreateDate(updateDate);
		}
		port.setUpdateUserId(user.getUserId());
		port.setUpdateDate(updateDate);			
		portDAO.savePort(port);
	}

	@Override
	public Map<Integer, Port> getPortsMap() {
		return portDAO.getPortsMap();
	}
	
}
