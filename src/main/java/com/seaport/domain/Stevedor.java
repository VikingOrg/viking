package com.seaport.domain;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;


/**
 * The persistent class for the stevedors database table.
 * 
 * @Author Danil Ozherelyev
 * @version 1.0 12/04/13
 *          
 */
@Entity
@Table(name="stevedors")
public class Stevedor implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="stevedor_id")
	private int stevedorId;

	private String archived;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="create_date")
	private Date createDate;

	@Column(name="create_user_id")
	private int createUserId;

	@Column(name="full_name")
	private String fullName;

	private String name;

	@Column(name="name_eng")
	private String nameEng;

	@Column(name="port_id")
	private int portId;

	@Lob
	@Column(name="stevedor_note")
	private String stevedorNote;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="update_date")
	private Date updateDate;

	@Column(name="update_user_id")
	private int updateUserId;
	
	@Transient
	private String portName;
	@Transient
	private String countryName;
	
	public Stevedor() {
	}

	public String getPortName() {
		return portName;
	}

	public void setPortName(String portName) {
		this.portName = portName;
	}

	public String getCountryName() {
		return countryName;
	}

	public void setCountryName(String countryName) {
		this.countryName = countryName;
	}

	public int getStevedorId() {
		return this.stevedorId;
	}

	public void setStevedorId(int stevedorId) {
		this.stevedorId = stevedorId;
	}

	public String getArchived() {
		return this.archived;
	}

	public void setArchived(String archived) {
		this.archived = archived;
	}

	public Date getCreateDate() {
		return this.createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public int getCreateUserId() {
		return this.createUserId;
	}

	public void setCreateUserId(int createUserId) {
		this.createUserId = createUserId;
	}

	public String getFullName() {
		return this.fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNameEng() {
		return this.nameEng;
	}

	public void setNameEng(String nameEng) {
		this.nameEng = nameEng;
	}

	public int getPortId() {
		return this.portId;
	}

	public void setPortId(int portId) {
		this.portId = portId;
	}

	public String getStevedorNote() {
		return this.stevedorNote;
	}

	public void setStevedorNote(String stevedorNote) {
		this.stevedorNote = stevedorNote;
	}

	public Date getUpdateDate() {
		return this.updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public int getUpdateUserId() {
		return this.updateUserId;
	}

	public void setUpdateUserId(int updateUserId) {
		this.updateUserId = updateUserId;
	}

	@Override
	public String toString() {
		return "Stevedor [stevedorId=" + stevedorId + ", archived=" + archived
				+ ", createDate=" + createDate + ", createUserId="
				+ createUserId + ", fullName=" + fullName + ", name=" + name
				+ ", nameEng=" + nameEng + ", portId=" + portId
				+ ", stevedorNote=" + stevedorNote + ", updateDate="
				+ updateDate + ", updateUserId=" + updateUserId + "]";
	}

}