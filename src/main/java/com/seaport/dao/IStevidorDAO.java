package com.seaport.dao;

import java.util.List;
import java.util.Map;

import com.seaport.domain.Stevidor;

/**
 * The DAO interface for Country requests
 * 
 * @Author Danil Ozherelyev
 * @version 1.0 08/26/14
 *          
 */
public interface IStevidorDAO {
	public Stevidor getStevidor(int stevidorId);
	public List<Stevidor> getStevidors();
	public void saveStevidor(Stevidor stevidor);
	public Map<Integer, Stevidor> getStevidorsMap();}
