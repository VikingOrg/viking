package com.seaport.dto;

import java.math.BigInteger;

public class CompanyReportDTO {
	Integer stevidorId;
	String name;
	BigInteger count;
	String math;
	
	public String getMath() {
		return math;
	}
	public void setMath(String math) {
		this.math = math;
	}
	public Integer getStevidorId() {
		return stevidorId;
	}
	public void setStevidorId(Integer stevidorId) {
		this.stevidorId = stevidorId;
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
