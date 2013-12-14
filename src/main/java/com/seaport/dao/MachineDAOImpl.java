package com.seaport.dao;

import java.util.LinkedHashMap;
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
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Machine> getMachines() {
		return getCurrentSession().createCriteria(Machine.class).list();
	}
	
	
	@Override
	public void saveMachine(Machine machine) {
		// TODO Auto-generated method stub
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Group> getGroups() {
		return getCurrentSession().createCriteria(Group.class).list();
	}
	
	@Override
	public Map<Integer, Group> getGroupsMap() {
		Map<Integer, Group> groupMap = new LinkedHashMap<Integer, Group>();
		List<Group> portList = this.getGroups();
		for (Group group : portList) {
			groupMap.put(group.getId(), group);
		}
		return groupMap;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Model> getModels() {
		return getCurrentSession().createCriteria(Model.class).list();
	}
	
	@Override
	public Map<Integer, Model> getModelsMap() {
		Map<Integer, Model> modelMap = new LinkedHashMap<Integer, Model>();
		List<Model> modelList = this.getModels();
		for (Model model : modelList) {
			modelMap.put(model.getModelId(), model);
		}
		return modelMap;
	}
	
	@SuppressWarnings("unchecked")
	@Override	
	public List<Manufacturer> getManufacturers(){
		return getCurrentSession().createCriteria(Manufacturer.class).list();
	}
	
	@Override
	public Map<Integer, Manufacturer> getManufacturerMap() {
		Map<Integer, Manufacturer> manufacturerMap = new LinkedHashMap<Integer, Manufacturer>();
		List<Manufacturer> manufacturerList = this.getManufacturers();
		for (Manufacturer manufacturer : manufacturerList) {
			manufacturerMap.put(manufacturer.getId(), manufacturer);
		}
		return manufacturerMap;
	}
	
}
