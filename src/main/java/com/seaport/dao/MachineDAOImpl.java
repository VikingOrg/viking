package com.seaport.dao;

import java.util.List;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.seaport.domain.Group;
import com.seaport.domain.Machine;
import com.seaport.domain.Manufacturer;
import com.seaport.domain.Model;

/**
 * The DAO class that serves any type of Port requests 
 * 
 * @Author Danil Ozherelyev
 * @version 1.0 12/04/13
 *          
 */
@Repository
public class MachineDAOImpl implements IMachineDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	private Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public Machine getMachine(Integer machineId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Machine> getMachines() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void saveMachine(Machine machine) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Map<Integer, Group> getGroupsMap() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<Integer, Model> getModelsMap() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<Integer, Manufacturer> getManufacturerMap() {
		// TODO Auto-generated method stub
		return null;
	}

	
	
}
