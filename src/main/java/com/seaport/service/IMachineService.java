package com.seaport.service;

import java.util.List;
import java.util.Map;

import com.seaport.domain.Group;
import com.seaport.domain.Machine;
import com.seaport.domain.Manufacturer;
import com.seaport.domain.MachineModel;
import com.seaport.domain.User;

/**
 * The Service layer interface for Port requests 
 * 
 * @Author Danil Ozherelyev
 * @version 1.0 12/04/13
 *          
 */
public interface IMachineService {
	public Machine getMachine(Integer machineId);
	public List<Machine> getMachines();
	public void saveMachine(Machine machine);
	public Map<Integer, Integer> getYearMap();
	public List<Machine> getMachines(User user);	
	public Map<Integer, Group> getGroupsMap();
	public Map<Integer, MachineModel> getModelsMap();
	public Map<Integer, Manufacturer> getManufacturerMap();
	public List<MachineModel> getModels();
	public List<MachineModel> getModels(Integer groupId);
	public Map<Integer, MachineModel> getModelsMap(Integer groupId);
	public MachineModel getModel(Integer modelId);
	public void saveMachineModel(MachineModel machineModel);
}
