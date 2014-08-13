package com.seaport.command;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.seaport.domain.Country;
import com.seaport.domain.Manufacturer;


/**
 * The abstract form class contains common data to be shared by others 
 * form classes in the presentation layer.<P>
 *
 * @Author       Danil Ozherelyev
 * @version      1.0 08/12/14 <P>
 */

public class ManufacturerCommand {
	private List<Manufacturer> manufacturerList = new ArrayList<Manufacturer>();
	private Manufacturer currentManufacturer = new Manufacturer();
	private Map<Integer, Country> countryMap = new LinkedHashMap<Integer,Country>();
	private String successFlag = "false";
	private Integer countryId;
	
	public Integer getCountryId() {
		return countryId;
	}
	public void setCountryId(Integer countryId) {
		this.countryId = countryId;
	}
	public List<Manufacturer> getManufacturerList() {
		return manufacturerList;
	}
	public void setManufacturerList(List<Manufacturer> manufacturerList) {
		this.manufacturerList = manufacturerList;
	}
	public Manufacturer getCurrentManufacturer() {
		return currentManufacturer;
	}
	public void setCurrentManufacturer(Manufacturer currentManufacturer) {
		this.currentManufacturer = currentManufacturer;
	}
	public Map<Integer, Country> getCountryMap() {
		return countryMap;
	}
	public void setCountryMap(Map<Integer, Country> countryMap) {
		this.countryMap = countryMap;
	}
	public String getSuccessFlag() {
		return successFlag;
	}
	public void setSuccessFlag(String successFlag) {
		this.successFlag = successFlag;
	}
	
}
