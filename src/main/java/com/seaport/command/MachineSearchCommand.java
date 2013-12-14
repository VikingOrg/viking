package com.seaport.command;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.seaport.domain.Country;
import com.seaport.domain.Group;
import com.seaport.domain.Machine;
import com.seaport.domain.Port;
import com.seaport.domain.Stevidor;


/**
 * The abstract form class contains common data to be shared by others 
 * form classes in the presentation layer.<P>
 *
 * @Author       Danil Ozherelyev
 * @version      1.0 12/05/13 <P>
 */

public class MachineSearchCommand {
	private List<Machine> machineList = new ArrayList<Machine>();
	private Map<Integer, Port> userPort = new LinkedHashMap<Integer,Port>();
	private Map<Integer, Stevidor> userStevidor = new LinkedHashMap<Integer,Stevidor>();
	private Map<Integer, Country> userCountry = new LinkedHashMap<Integer,Country>();
	private Map<Integer, Group> groupMap = new LinkedHashMap<Integer, Group>();
	
	private Integer groupId;
	private Integer portId;
	private Integer countryId;
	private Integer stevidorId;
	

	public List<Machine> getMachineList() {
		return machineList;
	}
	public void setMachineList(List<Machine> machineList) {
		this.machineList = machineList;
	}
	public Map<Integer, Group> getGroupMap() {
		return groupMap;
	}
	public void setGroupMap(Map<Integer, Group> groupMap) {
		this.groupMap = groupMap;
	}
	public Integer getGroupId() {
		return groupId;
	}
	public void setGroupId(Integer groupId) {
		this.groupId = groupId;
	}
	public Map<Integer, Port> getUserPort() {
		return userPort;
	}
	public void setUserPort(Map<Integer, Port> userPort) {
		this.userPort = userPort;
	}
	public Map<Integer, Stevidor> getUserStevidor() {
		return userStevidor;
	}
	public void setUserStevidor(Map<Integer, Stevidor> userStevidor) {
		this.userStevidor = userStevidor;
	}
	public Map<Integer, Country> getUserCountry() {
		return userCountry;
	}
	public void setUserCountry(Map<Integer, Country> userCountry) {
		this.userCountry = userCountry;
	}
	public Integer getPortId() {
		return portId;
	}
	public void setPortId(Integer portId) {
		this.portId = portId;
	}
	public Integer getCountryId() {
		return countryId;
	}
	public void setCountryId(Integer countryId) {
		this.countryId = countryId;
	}
	public Integer getStevidorId() {
		return stevidorId;
	}
	public void setStevidorId(Integer stevidorId) {
		this.stevidorId = stevidorId;
	}
	
}
