package com.seaport.service;

import java.util.List;
import java.util.Map;

import com.seaport.domain.Stevidor;

/**
 * The Service layer interface for User requests 
 * 
 * @Author Danil Ozherelyev
 * @version 1.0 12/04/13
 *          
 */
public interface IStevidorService {
	public Stevidor getStevidor(int stevidorId);
	public List<Stevidor> getStevidors();
	public void saveStevidor(Stevidor stevidor);
	public Map<Integer, Stevidor> getStevidorsMap();	
	public boolean checkIfStevidorExist(Stevidor stevidorToCheck);
}
