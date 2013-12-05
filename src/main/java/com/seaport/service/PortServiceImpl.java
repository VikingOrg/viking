package com.seaport.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.seaport.dao.IPortDAO;
import com.seaport.domain.Port;
import com.seaport.domain.Stevedor;

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
	public Stevedor getStevedor(int stevedorId) {
		return portDAO.getStevedor(stevedorId);
	}

	@Override
	public List<Stevedor> getStevedors() {
		return portDAO.getStevedors();
	}

	@Override
	public void saveStevedor(Stevedor stevedor) {
		portDAO.saveStevedor(stevedor);
	}

	@Override
	public Map<Integer, Port> getPortsMap() {
		return portDAO.getPortsMap();
	}

	@Override
	public Map<Integer, Stevedor> getStevedorsMap() {
		return portDAO.getStevedorsMap();
	}
	
	
}
