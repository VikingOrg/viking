package com.seaport.command;

import java.util.LinkedHashMap;
import java.util.Map;

import javax.validation.Valid;

import com.seaport.domain.Country;
import com.seaport.domain.Group;
import com.seaport.domain.MachineModel;
import com.seaport.domain.Manufacturer;

/**
 * The abstract form class contains common data to be shared by others 
 * form classes in the presentation layer.<P>
 *
 * @Author       Danil Ozherelyev
 * @version      1.0 12/05/13 <P>
 */
public class MachineModelEditCommand {
	
	private String successFlag = "false";
	private Map<Integer, Group> groupMap = new LinkedHashMap<Integer, Group>();
	private Map<Integer, Manufacturer> manufacturerMap = new LinkedHashMap<Integer, Manufacturer>();
	private Map<Integer, Country> countryMap = new LinkedHashMap<Integer,Country>();
	@Valid
	private MachineModel machineModel = new MachineModel();
	
	
	public MachineModel getMachineModel() {
		return machineModel;
	}
	public void setMachineModel(MachineModel machineModel) {
		this.machineModel = machineModel;
	}
	private Integer countryId;
	private Integer groupId;
	private Integer manufacturerId;
	
	public String getSuccessFlag() {
		return successFlag;
	}
	public void setSuccessFlag(String successFlag) {
		this.successFlag = successFlag;
	}
	public Integer getCountryId() {
		return countryId;
	}
	public void setCountryId(Integer countryId) {
		this.countryId = countryId;
	}
	public Map<Integer, Country> getCountryMap() {
		return countryMap;
	}
	public void setCountryMap(Map<Integer, Country> countryMap) {
		this.countryMap = countryMap;
	}

	public Map<Integer, Group> getGroupMap() {
		return groupMap;
	}
	public void setGroupMap(Map<Integer, Group> groupMap) {
		this.groupMap = groupMap;
	}
	public Map<Integer, Manufacturer> getManufacturerMap() {
		return manufacturerMap;
	}
	public void setManufacturerMap(Map<Integer, Manufacturer> manufacturerMap) {
		this.manufacturerMap = manufacturerMap;
	}
	public Integer getGroupId() {
		return groupId;
	}
	public void setGroupId(Integer groupId) {
		this.groupId = groupId;
	}
	public Integer getManufacturerId() {
		return manufacturerId;
	}
	public void setManufacturerId(Integer manufacturerId) {
		this.manufacturerId = manufacturerId;
	}

}
