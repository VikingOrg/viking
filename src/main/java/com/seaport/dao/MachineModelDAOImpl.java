package com.seaport.dao;

import java.sql.Timestamp;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Repository;

import com.seaport.domain.MachineModel;
import com.seaport.domain.User;
import com.seaport.service.IUserService;

/**
 * The DAO class that serves any type of Machine Model requests 
 * 
 * @Author Danil Ozherelyev
 * @version 1.0 09/12/14
 *          
 */
@Repository
public class MachineModelDAOImpl implements IMachineModelDAO {
	@Autowired
	private SessionFactory sessionFactory;
	@Autowired
	private IUserService userService;

	
	private Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<MachineModel> getModels() {
		return getCurrentSession().createCriteria(MachineModel.class).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<MachineModel> getModels(Integer groupId) {
		if (groupId != null && groupId.intValue() == 0) {
			return this.getModels();
		}
		Query query = getCurrentSession().createQuery("from MachineModel m where m.groupId = :groupId");
		query.setParameter("groupId", groupId);
		return query.list();
	}	

	@Override
	public MachineModel getModel(Integer modelId) {
		Query query = getCurrentSession().createQuery("from MachineModel m where m.modelId = :modelId");
		query.setParameter("modelId", modelId);
		if (query.list().isEmpty()) {
			return null;
		}
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
	
	@Override
	@SuppressWarnings("unchecked")
	public List<MachineModel> getMachineModels(boolean getArchive){
		Criteria criteria = getCurrentSession().createCriteria(MachineModel.class);
//		if (!getArchive) {
//			criteria.add(Restrictions.ne("archived", "Y"));
//		}
		return 	criteria.list();
	}
	
	
	
}







