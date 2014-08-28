package com.seaport.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seaport.dao.IStevidorDAO;
import com.seaport.domain.Stevidor;

/**
 * The Service layer interface for Group requests 
 * 
 * @Author Danil Ozherelyev
 * @version 1.0 08/27/14
 *          
 */
@Service
public class StevidorServiceImpl implements IStevidorService {
	@Autowired
	private IUserService userService;
	@Autowired
	private IStevidorDAO stevidorDAO;

	
	@Override
	public Stevidor getStevidor(int stevidorId) {
		return stevidorDAO.getStevidor(stevidorId);
	}

	@Override
	public List<Stevidor> getStevidors() {
		return stevidorDAO.getStevidors();
	}

	@Override
	public void saveStevidor(Stevidor stevidor) {
		stevidorDAO.saveStevidor(stevidor);
	}

	@Override
	public Map<Integer, Stevidor> getStevidorsMap() {
		return stevidorDAO.getStevidorsMap();
	}
	
}
