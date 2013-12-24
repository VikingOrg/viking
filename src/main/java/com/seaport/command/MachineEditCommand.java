package com.seaport.command;

import java.util.LinkedHashMap;
import java.util.Map;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;

import com.seaport.domain.Group;
import com.seaport.domain.Machine;
import com.seaport.domain.MachineModel;
import com.seaport.domain.Manufacturer;
import com.seaport.domain.Stevidor;


/**
 * The abstract form class contains common data to be shared by others 
 * form classes in the presentation layer.<P>
 *
 * @Author       Danil Ozherelyev
 * @version      1.0 12/05/13 <P>
 */

public class MachineEditCommand {
	@NotNull
	@Valid	
	private Machine machine = new Machine();
	private Map<Integer, Group> groupMap = new LinkedHashMap<Integer, Group>();
	private Map<Integer, Stevidor> stevidorMap = new LinkedHashMap<Integer,Stevidor>();
	private Map<Integer, Manufacturer> manufacturerMap = new LinkedHashMap<Integer, Manufacturer>();
	private Map<Integer, Integer> yearMap = new LinkedHashMap<Integer, Integer>();
	private Map<Integer, MachineModel> machineModelMap = new LinkedHashMap<Integer, MachineModel>();
	
	private String formType = "N";

	public Map<Integer, MachineModel> getMachineModelMap() {
		return machineModelMap;
	}
	public void setMachineModelMap(Map<Integer, MachineModel> machineModelMap) {
		this.machineModelMap = machineModelMap;
	}
	public Map<Integer, Integer> getYearMap() {
		return yearMap;
	}
	public void setYearMap(Map<Integer, Integer> yearMap) {
		this.yearMap = yearMap;
	}
	public Map<Integer, Manufacturer> getManufacturerMap() {
		return manufacturerMap;
	}
	public void setManufacturerMap(Map<Integer, Manufacturer> manufacturerMap) {
		this.manufacturerMap = manufacturerMap;
	}
	public Map<Integer, Stevidor> getStevidorMap() {
		return stevidorMap;
	}
	public void setStevidorMap(Map<Integer, Stevidor> stevidorMap) {
		this.stevidorMap = stevidorMap;
	}
	public Machine getMachine() {
		return machine;
	}
	public void setMachine(Machine machine) {
		this.machine = machine;
	}
	public Map<Integer, Group> getGroupMap() {
		return groupMap;
	}
	public void setGroupMap(Map<Integer, Group> groupMap) {
		this.groupMap = groupMap;
	}
	public String getFormType() {
		return formType;
	}
	public void setFormType(String formType) {
		this.formType = formType;
	}

	
}
