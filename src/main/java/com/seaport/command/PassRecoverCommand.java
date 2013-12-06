package com.seaport.command;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * The abstract form class contains common data to be shared by others 
 * form classes in the presentation layer.<P>
 *
 * @Author       Danil Ozherelyev
 * @version      1.0 12/05/13 <P>
 */

public class PassRecoverCommand {
	private List<Object> genericList = new ArrayList<Object>();
	private String userId;
	private Map<String, String> generisStingMap;
	private LinkedHashMap<String,Object> genericHashMap = new LinkedHashMap<String,Object>();
	private Set<String> genericSet;
	private Integer companyId;
	private Object someObj;
}
