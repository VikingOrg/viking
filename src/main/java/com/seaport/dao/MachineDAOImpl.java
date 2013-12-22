package com.seaport.dao;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestWrapper;
import org.springframework.stereotype.Repository;

import com.seaport.domain.Group;
import com.seaport.domain.Machine;
import com.seaport.domain.Manufacturer;
import com.seaport.domain.Model;
import com.seaport.domain.User;
import com.seaport.service.IUserService;

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
	@Autowired
	private IUserService userService;
	
	private Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public Machine getMachine(Integer machineId) {
		return (Machine) getCurrentSession().get(Machine.class, machineId);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Machine> getMachines() {
		return getCurrentSession().createCriteria(Machine.class).list();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Machine> getMachines(User user){
		if (user.getRole().getId().intValue() > 1) {
			Query query = getCurrentSession().createQuery("from Machine m where m.stevidorId = :stevidorId");
			query.setParameter("stevidorId", user.getStevidorId());
			return query.list();
		} else {
			return getCurrentSession().createCriteria(Machine.class).list();	
		}
	}
	
	@Override
	public void saveMachine(Machine machine) {
		Timestamp updateDate = new Timestamp(new Date().getTime());
		User user = userService.getUser(SecurityContextHolder.getContext().getAuthentication().getName());
		
		/*for insert.*/
		if (machine.getMachineId()==null) {
			machine.setCreateUserId(user.getUserId());
			machine.setCreateDate(updateDate);
			machine.getModel().setCreateUserId(user.getUserId());
			machine.getModel().setCreateDate(updateDate);
		}
		machine.setUpdateUserId(user.getUserId());
		machine.setUpdateDate(updateDate);
		getCurrentSession().saveOrUpdate(machine);
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
			groupMap.put(group.getGroupId(), group);
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
			manufacturerMap.put(manufacturer.getManufacturerId(), manufacturer);
		}
		return manufacturerMap;
	}
	
	public Map<Integer, Integer> getYearMap() {
		Map<Integer, Integer> yearMap = new LinkedHashMap<Integer, Integer>();
		Calendar now = Calendar.getInstance();
		int year = now.get(Calendar.YEAR);		
		for (int i = 1944; i <= year; i++) {
			yearMap.put(i, i);
		}
		return yearMap;
	}
	
	
	
	
}
