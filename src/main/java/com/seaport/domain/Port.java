package com.seaport.domain;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;

/**
 * The persistent class for the ports database table. 
 * 
 * @Author Danil Ozherelyev
 * @version 1.0 12/04/13
 *          
 */
@Entity
@Table(name="ports")
public class Port implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="port_id")
	private int portId;

	private String archived;

	@Column(name="country_id")
	private int countryId;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="create_date")
	private Date createDate;

	@Column(name="create_user_id")
	private int createUserId;

	@Column(name="full_name")
	private String fullName;

	private String name;

	@Lob
	@Column(name="port_note")
	private String portNote;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="update_date")
	private Date updateDate;

	@Column(name="update_user_id")
	private int updateUserId;

	public Port() {
	}

	public int getPortId() {
		return this.portId;
	}

	public void setPortId(int portId) {
		this.portId = portId;
	}

	public String getArchived() {
		return this.archived;
	}

	public void setArchived(String archived) {
		this.archived = archived;
	}

	public int getCountryId() {
		return this.countryId;
	}

	public void setCountryId(int countryId) {
		this.countryId = countryId;
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

	public String getPortNote() {
		return this.portNote;
	}

	public void setPortNote(String portNote) {
		this.portNote = portNote;
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
		return "Port [portId=" + portId + ", archived=" + archived
				+ ", countryId=" + countryId + ", createDate=" + createDate
				+ ", createUserId=" + createUserId + ", fullName=" + fullName
				+ ", name=" + name + ", portNote=" + portNote + ", updateDate="
				+ updateDate + ", updateUserId=" + updateUserId + "]";
	}

}