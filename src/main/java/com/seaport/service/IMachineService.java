package com.seaport.service;

import java.util.List;
import java.util.Map;

import com.seaport.domain.Machine;
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
	public List<Machine> getMachines(User user, boolean getArchive);
	public List<Machine> getMachineByStevedorId(Integer stevedorId);
}
