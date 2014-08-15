package com.seaport.dto;

import java.math.BigInteger;

public class GroupReportDTO {
//	SELECT b.group_id, b.name, COUNT(*) AS count
	Integer groupId;
	String name;
	BigInteger count;
	
	
	public Integer getGroupId() {
		return groupId;
	}
	public void setGroupId(Integer groupId) {
		this.groupId = groupId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public BigInteger getCount() {
		return count;
	}
	public void setCount(BigInteger count) {
		this.count = count;
	}
	

}
