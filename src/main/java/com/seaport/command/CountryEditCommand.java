package com.seaport.command;

import com.seaport.domain.Country;


/**
 * The abstract form class contains common data to be shared by others 
 * form classes in the presentation layer.<P>
 *
 * @Author       Danil Ozherelyev
 * @version      1.0 07/09/14 <P>
 */

public class CountryEditCommand {
	private Country country = new Country();

	public Country getCountry() {
		return country;
	}

	public void setCountry(Country country) {
		this.country = country;
	}

	
}
