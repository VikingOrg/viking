package com.seaport.command;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.seaport.domain.Country;
import com.seaport.domain.Group;
import com.seaport.domain.Machine;
import com.seaport.domain.MachineModel;
import com.seaport.domain.Manufacturer;
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
	private Map<Integer, Manufacturer> manufacturerMap = new LinkedHashMap<Integer, Manufacturer>();
	private Map<Integer, Integer> yearMap = new LinkedHashMap<Integer, Integer>();
	private Map<Integer, MachineModel> machineModelMap = new LinkedHashMap<Integer, MachineModel>();
		
	private Integer groupId;
	private Integer portId;
	private Integer countryId;
	private Integer stevidorId;
	private Integer releaseYear;
	private Integer manufacturerId;
	private Integer modelId;
	private String archived;
	
	/*This is for last edited machine object.*/
	private Machine lastMachine;
	
	public Machine getLastMachine() {
		return lastMachine;
	}
	public void setLastMachine(Machine lastMachine) {
		this.lastMachine = lastMachine;
	}
	public String getArchived() {
		return archived;
	}
	public void setArchived(String archived) {
		this.archived = archived;
	}
	private String[] machineSelection;
	
	public String[] getMachineSelection() {
		return machineSelection;
	}
	public void setMachineSelection(String[] machineSelection) {
		this.machineSelection = machineSelection;
	}
	public Integer getModelId() {
		return modelId;
	}
	public void setModelId(Integer modelId) {
		this.modelId = modelId;
	}
	public Map<Integer, MachineModel> getMachineModelMap() {
		return machineModelMap;
	}
	public void setMachineModelMap(Map<Integer, MachineModel> machineModelMap) {
		this.machineModelMap = machineModelMap;
	}
	public Map<Integer, Manufacturer> getManufacturerMap() {
		return manufacturerMap;
	}
	public void setManufacturerMap(Map<Integer, Manufacturer> manufacturerMap) {
		this.manufacturerMap = manufacturerMap;
	}
	public Map<Integer, Integer> getYearMap() {
		return yearMap;
	}
	public void setYearMap(Map<Integer, Integer> yearMap) {
		this.yearMap = yearMap;
	}

	public Integer getReleaseYear() {
		return releaseYear;
	}
	public void setReleaseYear(Integer releaseYear) {
		this.releaseYear = releaseYear;
	}
	public Integer getManufacturerId() {
		return manufacturerId;
	}
	public void setManufacturerId(Integer manufacturerId) {
		this.manufacturerId = manufacturerId;
	}
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
