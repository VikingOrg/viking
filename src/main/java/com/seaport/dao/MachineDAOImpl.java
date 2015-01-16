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

import com.seaport.domain.Machine;
import com.seaport.domain.User;
import com.seaport.service.IMachineModelService;
import com.seaport.service.IStevidorService;
import com.seaport.service.IUserService;
import com.seaport.utils.VikingConstant;

/**
 * The DAO class that serves any type of Machine requests 
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
	@Autowired
	private IStevidorService stevidorService;
	@Autowired
	private IMachineModelService machineModelService;	
	
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
	public List<Machine> getMachines(User user, String recordType){
		Criteria criteria = getCurrentSession().createCriteria(Machine.class);
		
		/*Limits records for non-Admin accounts*/
		if (user.getRole().getId().intValue() != VikingConstant.USER_ROLE_ADMIN) {
			criteria.add(Restrictions.eq("stevidorId", user.getStevidorId()));
		}
		/*if request has record type parameter - add criteria below.*/
		if (recordType.equalsIgnoreCase(VikingConstant.RECORD_TYPE_ACTIVE)) {
			criteria.add(Restrictions.ne("archived", "Y"));
			criteria.add(Restrictions.ne("archived", "R"));
		} else if (recordType.equalsIgnoreCase(VikingConstant.RECORD_TYPE_ARCHIVED)) {
			criteria.add(Restrictions.eq("archived", "Y"));
		} else if (recordType.equalsIgnoreCase(VikingConstant.RECORD_TYPE_RETIRED)) {
			criteria.add(Restrictions.eq("archived", "R"));
		}

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
			machine.setArchived(VikingConstant.RECORD_TYPE_ACTIVE);
			/*Setting missing objects for Hibernate*/
			machine.setStevidor(stevidorService.getStevidor(machine.getStevidorId()));
		 	machine.setMachineModel(machineModelService.getModel(machine.getModelId()));
		}
		machine.setUpdateUserId(user.getUserId());
		machine.setUpdateDate(updateDate);
		/*Setting end date flag*/
		if (machine.getEndDate() != null) {
			machine.setArchived(VikingConstant.RECORD_TYPE_RETIRED);
		}
		getCurrentSession().saveOrUpdate(machine);
	}

	public Map<Integer, Integer> getYearMap() {
		Map<Integer, Integer> yearMap = new LinkedHashMap<Integer, Integer>();
		Calendar now = Calendar.getInstance();
		int year = now.get(Calendar.YEAR);		
		for (int i = year ; i >= 1944; i--) {
			yearMap.put(i, i);
		}
		return yearMap;
	}
		
	
}
