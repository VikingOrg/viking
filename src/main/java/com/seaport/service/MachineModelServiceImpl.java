package com.seaport.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.seaport.dao.IMachineModelDAO;
import com.seaport.domain.MachineModel;

/**
 * The Service layer for Port requests. 
 * 
 * @Author Danil Ozherelyev
 * @version 1.0 09/12/14
 *          
 */
@Service
@Transactional
public class MachineModelServiceImpl implements IMachineModelService {
	
	@Autowired
	private IMachineModelDAO machineModelDAO;


	@Override
	public Map<Integer, MachineModel> getModelsMap() {
		return machineModelDAO.getModelsMap();
	}

	@Override
	public List<MachineModel> getModels() {
		return machineModelDAO.getModels();
	}

	@Override
	public List<MachineModel> getModels(Integer groupId) {
		return machineModelDAO.getModels(groupId);
	}

	@Override
	public Map<Integer, MachineModel> getModelsMap(Integer groupId) {
		return machineModelDAO.getModelsMap(groupId);
	}
	public MachineModel getModel(Integer modelId){
		return machineModelDAO.getModel(modelId);
	}

	@Override
	public void saveMachineModel(MachineModel machineModel) {
		machineModelDAO.saveMachineModel(machineModel);
	}
	@Override
	public List<MachineModel> getMachineModels(boolean getArchive){
		return machineModelDAO.getMachineModels(getArchive);
	}
}
