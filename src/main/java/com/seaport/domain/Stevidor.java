package com.seaport.domain;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;


/**
 * The persistent class for the stevidors database table.
 * 
 * @Author Danil Ozherelyev
 * @version 1.0 12/04/13
 *          
 */
@Entity
@Table(name="stevidors")
public class Stevidor implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	@Column(name="stevidor_id")
	private Integer stevidorId;

	private String archived;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="create_date")
	private Date createDate;

	@Column(name="create_user_id")
	private int createUserId;
	
	@NotNull
	@Size(min = 1, max = 25, message = "{validation.size.generic}")
	@Column(name="full_name")
	private String fullName;
	
	@NotNull
	@Size(min = 1, max = 25, message = "{validation.size.generic}")
	private String name;

	@Column(name="name_eng")
	private String nameEng;

	@Column(name="port_id")
	private int portId;

	@Lob
	@Column(name="stevidor_note")
	private String stevidorNote;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="update_date")
	private Date updateDate;

	@Column(name="update_user_id")
	private int updateUserId;
	
	@Transient
	private String portName;
	@Transient
	private String countryName;
	
	public Stevidor() {
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

	public Integer getStevidorId() {
		return this.stevidorId;
	}

	public void setStevidorId(Integer stevidorId) {
		this.stevidorId = stevidorId;
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

	public String getStevidorNote() {
		return this.stevidorNote;
	}

	public void setStevidorNote(String stevidorNote) {
		this.stevidorNote = stevidorNote;
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
		return "stevidor [stevidorId=" + stevidorId + ", archived=" + archived
				+ ", createDate=" + createDate + ", createUserId="
				+ createUserId + ", fullName=" + fullName + ", name=" + name
				+ ", nameEng=" + nameEng + ", portId=" + portId
				+ ", stevidorNote=" + stevidorNote + ", updateDate="
				+ updateDate + ", updateUserId=" + updateUserId + "]";
	}

}