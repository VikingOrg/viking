package com.seaport.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.seaport.dao.IPortDAO;
import com.seaport.domain.Port;
import com.seaport.domain.Stevidor;

/**
 * The Service layer for Port requests. 
 * 
 * @Author Danil Ozherelyev
 * @version 1.0 12/04/13
 *          
 */
@Service
@Transactional
public class PortServiceImpl implements IPortService {
	
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
		portDAO.savePort(port);
	}

	@Override
	public Stevidor getStevidor(int stevidorId) {
		return portDAO.getStevidor(stevidorId);
	}

	@Override
	public List<Stevidor> getStevidors() {
		return portDAO.getStevidors();
	}

	@Override
	public void saveStevidor(Stevidor stevidor) {
		portDAO.saveStevidor(stevidor);
	}

	@Override
	public Map<Integer, Port> getPortsMap() {
		return portDAO.getPortsMap();
	}

	@Override
	public Map<Integer, Stevidor> getStevidorsMap() {
		return portDAO.getStevidorsMap();
	}
	
	
}
