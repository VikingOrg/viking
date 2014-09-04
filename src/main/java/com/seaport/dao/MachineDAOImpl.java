package com.seaport.dao;

import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Repository;

import com.seaport.domain.Group;
import com.seaport.domain.Machine;
import com.seaport.domain.Manufacturer;
import com.seaport.domain.MachineModel;
import com.seaport.domain.User;
import com.seaport.service.IUserService;
import com.seaport.utils.VikingConstants;

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
	public List<Machine> getMachines(User user, boolean getArchive){
		Criteria criteria = getCurrentSession().createCriteria(Machine.class);
		
		/*Limits records for non-Admin accounts*/
		if (user.getRole().getId().intValue() != VikingConstants.USER_ROLE_ADMIN) {
			criteria.add(Restrictions.eq("stevidorId", user.getStevidorId()));
		}
		/*For test Only*/

//		criteria.add(Restrictions.eq("machineId", 1));
		
//		if (!getArchive) {
//			criteria.add(Restrictions.ne("archived", "Y"));
//		}
		return 	criteria.list();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Machine> getMachineByStevedorId(Integer stevedorId){
		Query query = getCurrentSession().createQuery("from Machine m where m.stevidorId = :stevidorId");
		query.setParameter("stevidorId", stevedorId);
		return query.list();
	}
	
	@Override
	public void saveMachine(Machine machine) {
		Timestamp updateDate = new Timestamp(new Date().getTime());
		User user = userService.getUser(SecurityContextHolder.getContext().getAuthentication().getName());
		
		/*for insert.*/
		if (machine.getMachineId()==null) {
			machine.setCreateUserId(user.getUserId());
			machine.setCreateDate(updateDate);
		}
		machine.setUpdateUserId(user.getUserId());
		machine.setUpdateDate(updateDate);
		getCurrentSession().saveOrUpdate(machine);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<MachineModel> getModels() {
		return getCurrentSession().createCriteria(MachineModel.class).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<MachineModel> getModels(Integer groupId) {
		Query query = getCurrentSession().createQuery("from MachineModel m where m.groupId = :groupId");
		query.setParameter("groupId", groupId);
		return query.list();
	}	

	@Override
	public MachineModel getModel(Integer modelId) {
		Query query = getCurrentSession().createQuery("from MachineModel m where m.modelId = :modelId");
		query.setParameter("modelId", modelId);
		return (MachineModel)query.list().get(0);
	}	
	
	
	@Override
	public Map<Integer, MachineModel> getModelsMap(Integer groupId) {
		Map<Integer, MachineModel> modelMap = new LinkedHashMap<Integer, MachineModel>();
		List<MachineModel> modelList = this.getModels(groupId);
		for (MachineModel machineModel : modelList) {
			modelMap.put(machineModel.getModelId(), machineModel);
		}
		return modelMap;
	}
	
	@Override
	public Map<Integer, MachineModel> getModelsMap() {
		Map<Integer, MachineModel> modelMap = new LinkedHashMap<Integer, MachineModel>();
		List<MachineModel> modelList = this.getModels();
		for (MachineModel machineModel : modelList) {
			modelMap.put(machineModel.getModelId(), machineModel);
		}
		return modelMap;
	}
	
	@Override
	public void saveMachineModel(MachineModel machineModel) {
		Timestamp updateDate = new Timestamp(new Date().getTime());
		User user = userService.getUser(SecurityContextHolder.getContext().getAuthentication().getName());
		
		/*for insert.*/
		if (machineModel.getModelId() ==null) {
			machineModel.setCreateUserId(user.getUserId());
			machineModel.setCreateDate(updateDate);
		}
		machineModel.setUpdateUserId(user.getUserId());
		machineModel.setUpdateDate(updateDate);
		getCurrentSession().saveOrUpdate(machineModel);
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
