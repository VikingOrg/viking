package com.seaport.dao;

import java.util.List;
import java.util.Map;

import com.seaport.domain.MachineModel;

/**
 * The DAO interface for Machine Model related requests 
 * 
 * @Author Danil Ozherelyev
 * @version 1.0 09/12/14
 *          
 */
public interface IMachineModelDAO {
	public List<MachineModel> getModels();
	public List<MachineModel> getModels(Integer groupId);
	public Map<Integer, MachineModel> getModelsMap();
	public Map<Integer, MachineModel> getModelsMap(Integer groupId);
	public MachineModel getModel(Integer modelId);
	public void saveMachineModel(MachineModel machineModel);
	public List<MachineModel> getMachineModels(boolean getArchive);
}
