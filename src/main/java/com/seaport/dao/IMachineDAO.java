package com.seaport.dao;

import java.util.List;
import java.util.Map;

import com.seaport.domain.Machine;
import com.seaport.domain.MachineModel;
import com.seaport.domain.Manufacturer;
import com.seaport.domain.User;

/**
 * The DAO interface for Machine related requests 
 * 
 * @Author Danil Ozherelyev
 * @version 1.0 12/12/13
 *          
 */
public interface IMachineDAO {
	public Machine getMachine(Integer machineId);
	public List<Machine> getMachines();
	public void saveMachine(Machine machine);
	public List<Machine> getMachines(User user, boolean getArchive);
	public List<MachineModel> getModels();
	public List<MachineModel> getModels(Integer groupId);
	public List<Manufacturer> getManufacturers();
	public Map<Integer, MachineModel> getModelsMap();
	public Map<Integer, Manufacturer> getManufacturerMap();
	public Map<Integer, Integer> getYearMap();
	public Map<Integer, MachineModel> getModelsMap(Integer groupId);
	public MachineModel getModel(Integer modelId);
	public void saveMachineModel(MachineModel machineModel);
	public List<Machine> getMachineByStevedorId(Integer stevedorId);
}
