package com.seaport.service;

import java.util.List;
import java.util.Map;

import com.seaport.domain.MachineModel;

/**
 * The Service layer interface for Port requests 
 * 
 * @Author Danil Ozherelyev
 * @version 1.0 09/12/14
 *          
 */
public interface IMachineModelService {
	public Map<Integer, MachineModel> getModelsMap();
	public List<MachineModel> getModels();
	public List<MachineModel> getModels(Integer groupId);
	public Map<Integer, MachineModel> getModelsMap(Integer groupId);
	public MachineModel getModel(Integer modelId);
	public void saveMachineModel(MachineModel machineModel);
	public List<MachineModel> getMachineModels(boolean getArchive);
}
