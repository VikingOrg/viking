package com.seaport.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.seaport.dao.IMachineDAO;
import com.seaport.domain.Machine;
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

	public Map<Integer, Integer> getYearMap(){
		return machineDAO.getYearMap();
	}
	public List<Machine> getMachines(User user, String recordType){
		return machineDAO.getMachines(user, recordType);
	}

	public List<Machine> getMachineByStevedorId(Integer stevedorId) {
		return machineDAO.getMachineByStevedorId(stevedorId);
	}
}
