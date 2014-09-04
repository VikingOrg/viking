package com.seaport.dto;

import java.math.BigInteger;

public class ManufacturerReportDTO {
	Integer manufacturerId;
	String name;
	BigInteger count;
	String math;
	
	public String getMath() {
		return math;
	}
	public void setMath(String math) {
		this.math = math;
	}
	public Integer getManufacturerId() {
		return manufacturerId;
	}
	public void setManufacturerId(Integer manufacturerId) {
		this.manufacturerId = manufacturerId;
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
