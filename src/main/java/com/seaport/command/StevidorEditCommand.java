package com.seaport.command;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import com.seaport.domain.Port;
import com.seaport.domain.Position;
import com.seaport.domain.Stevidor;

/**
 * The abstract form class contains common data to be shared by others 
 * form classes in the presentation layer.<P>
 *
 * @Author       Danil Ozherelyev
 * @version      1.0 12/11/13 <P>
 */

public class StevidorEditCommand {

	@Valid
	private Stevidor stevidor;
	private List<Position> positionList = new ArrayList<Position>();
	
	private Map<Integer, Port> userPort = new LinkedHashMap<Integer,Port>();
	private String formType = "N";
	
	public List<Position> getPositionList() {
		return positionList;
	}
	public void setPositionList(List<Position> positionList) {
		this.positionList = positionList;
	}
	public Stevidor getStevidor() {
		return stevidor;
	}
	public void setStevidor(Stevidor stevidor) {
		this.stevidor = stevidor;
	}
	public Map<Integer, Port> getUserPort() {
		return userPort;
	}
	public void setUserPort(Map<Integer, Port> userPort) {
		this.userPort = userPort;
	}
	public String getFormType() {
		return formType;
	}
	public void setFormType(String formType) {
		this.formType = formType;
	} 
	
	
}
