package com.seaport.domain;

/**
 * The data transfer class for the user database table. 
 * 
 * @Author Danil Ozherelyev
 * @version 1.0 12/04/13
 *          
 */
public class UserDTO {
	private User user;
	private Country countries;
	private Stevidor stevidor;
	private Port port;
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Country getCountries() {
		return countries;
	}
	public void setCountries(Country countries) {
		this.countries = countries;
	}
	public Stevidor getStevidor() {
		return stevidor;
	}
	public void setStevidor(Stevidor stevidor) {
		this.stevidor = stevidor;
	}
	public Port getPort() {
		return port;
	}
	public void setPort(Port port) {
		this.port = port;
	} 

}
