package com.seaport.command;

import java.util.ArrayList;
import java.util.List;

import com.seaport.domain.Country;


/**
 * The abstract form class contains common data to be shared by others 
 * form classes in the presentation layer.<P>
 *
 * @Author       Danil Ozherelyev
 * @version      1.0 12/05/13 <P>
 */

public class CountryCommand {
	private List<Country> countryList = new ArrayList<Country>();
	private Country country = new Country();
	private String successFlag = "false";
	
	public String getSuccessFlag() {
		return successFlag;
	}

	public void setSuccessFlag(String successFlag) {
		this.successFlag = successFlag;
	}

	public Country getCountry() {
		return country;
	}

	public void setCountry(Country country) {
		this.country = country;
	}

	public List<Country> getCountryList() {
		return countryList;
	}

	public void setCountryList(List<Country> countryList) {
		this.countryList = countryList;
	}
}
