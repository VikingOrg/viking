package com.seaport.command;

import java.util.LinkedHashMap;
import java.util.Map;

import javax.validation.Valid;

import com.seaport.domain.Country;
import com.seaport.domain.Port;
import com.seaport.domain.Stevidor;
import com.seaport.domain.User;

/**
 * The abstract form class contains common data to be shared by others 
 * form classes in the presentation layer.<P>
 *
 * @Author       Danil Ozherelyev
 * @version      1.0 12/05/13 <P>
 */

public class RegistrationCommand {
	
	@Valid
	private User user = new User();
	private String pswordCheck = "";
	
	private Map<Integer, Port> userPort = new LinkedHashMap<Integer,Port>();
	private Map<Integer, Stevidor> userStevidor = new LinkedHashMap<Integer,Stevidor>();
	private Map<Integer, Country> userCountry = new LinkedHashMap<Integer,Country>();
	private String formType = "N"; 
	private Integer userRole;
	private String recaptcha_response_field;
	private String recaptcha_challenge_field;
	
	/*for password re-set*/
	private String newPassword;
	private String newPasswordCheck; //to keep value on pswordCheck field
	private String oldPassword;
		
	public String getNewPasswordCheck() {
		return newPasswordCheck;
	}
	public void setNewPasswordCheck(String newPasswordCheck) {
		this.newPasswordCheck = newPasswordCheck;
	}
	public String getNewPassword() {
		return newPassword;
	}
	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}
	public String getOldPassword() {
		return oldPassword;
	}
	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}

	public String getRecaptcha_challenge_field() {
		return recaptcha_challenge_field;
	}

	public void setRecaptcha_challenge_field(String recaptcha_challenge_field) {
		this.recaptcha_challenge_field = recaptcha_challenge_field;
	}

	public String getRecaptcha_response_field() {
		return recaptcha_response_field;
	}

	public void setRecaptcha_response_field(String recaptcha_response_field) {
		this.recaptcha_response_field = recaptcha_response_field;
	}

	public String getFormType() {
		return formType;
	}

	public void setFormType(String formType) {
		this.formType = formType;
	}

	public Integer getUserRole() {
		return userRole;
	}

	public void setUserRole(Integer userRole) {
		this.userRole = userRole;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getPswordCheck() {
		return pswordCheck;
	}

	public void setPswordCheck(String pswordCheck) {
		this.pswordCheck = pswordCheck;
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




	
}
