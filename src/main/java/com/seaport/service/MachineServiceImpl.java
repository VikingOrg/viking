package com.seaport.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.seaport.dao.IMachineDAO;
import com.seaport.domain.Group;
import com.seaport.domain.Machine;
import com.seaport.domain.Manufacturer;
import com.seaport.domain.MachineModel;
import com.seaport.domain.User;

/**
 * The Service layer for Port requests. 
 * 
 * @Author Danil Ozherelyev
 * @version 1.0 12/13/13
 *          
 */
@Service
@Transactional
public class MachineServiceImpl implements IMachineService {
	
	@Autowired
	private IMachineDAO machineDAO;

	@Override
	public Machine getMachine(Integer machineId) {
		return machineDAO.getMachine(machineId);
	}

	@Override
	public List<Machine> getMachines() {
		return machineDAO.getMachines();
	}

	@Override
	public void saveMachine(Machine machine) {
		machineDAO.saveMachine(machine);
	}

	@Override
	public Map<Integer, Group> getGroupsMap() {
		return machineDAO.getGroupsMap();
	}

	@Override
	public Map<Integer, MachineModel> getModelsMap() {
		return machineDAO.getModelsMap();
	}

	@Override
	public Map<Integer, Manufacturer> getManufacturerMap() {
		return machineDAO.getManufacturerMap();
	}
	public Map<Integer, Integer> getYearMap(){
		return machineDAO.getYearMap();
	}
	public List<Machine> getMachines(User user){
		return machineDAO.getMachines(user);
	}

	@Override
	public List<MachineModel> getModels() {
		return machineDAO.getModels();
	}

	@Override
	public List<MachineModel> getModels(Integer groupId) {
		return machineDAO.getModels(groupId);
	}

	@Override
	public Map<Integer, MachineModel> getModelsMap(Integer groupId) {
		return machineDAO.getModelsMap(groupId);
	}
	public MachineModel getModel(Integer modelId){
		return machineDAO.getModel(modelId);
	}

	@Override
	public void saveMachineModel(MachineModel machineModel) {
		machineDAO.saveMachineModel(machineModel);
	}
	
}
