package com.seaport.domain;

import java.io.Serializable;

import javax.persistence.*;

import java.util.Date;


/**
 * The persistent class for the machines database table.
 * 
 * @Author Danil Ozherelyev
 * @version 1.0 12/12/13
 *          
 */
@Entity
@Table(name="machines")
@NamedQuery(name="Machine.findAll", query="SELECT m FROM Machine m")
public class Machine implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="machine_id")
	private Integer machineId;

	private String archived;

	@Column(name="bd_year")
	private String bdYear;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="create_date")
	private Date createDate;

	@Column(name="create_user_id")
	private Integer createUserId;

	private String doc;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="in_date")
	private Date inDate;

	@Column(name="inv_number")
	private String invNumber;

	private String location;

	@Column(name="model_id")
	private Integer modelId;

	private String nickname;

	@Lob
	private String note;

	@Column(name="stevidor_id")
	private Integer stevidorId;

	private String tranc;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="update_date")
	private Date updateDate;

	@Column(name="update_user_id")
	private Integer updateUserId;

	@Column(name="zav_number")
	private String zavNumber;

	public Machine() {
	}

	public Integer getMachineId() {
		return machineId;
	}

	public void setMachineId(Integer machineId) {
		this.machineId = machineId;
	}

	public String getArchived() {
		return archived;
	}

	public void setArchived(String archived) {
		this.archived = archived;
	}

	public String getBdYear() {
		return bdYear;
	}

	public void setBdYear(String bdYear) {
		this.bdYear = bdYear;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Integer getCreateUserId() {
		return createUserId;
	}

	public void setCreateUserId(Integer createUserId) {
		this.createUserId = createUserId;
	}

	public String getDoc() {
		return doc;
	}

	public void setDoc(String doc) {
		this.doc = doc;
	}

	public Date getInDate() {
		return inDate;
	}

	public void setInDate(Date inDate) {
		this.inDate = inDate;
	}

	public String getInvNumber() {
		return invNumber;
	}

	public void setInvNumber(String invNumber) {
		this.invNumber = invNumber;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public Integer getModelId() {
		return modelId;
	}

	public void setModelId(Integer modelId) {
		this.modelId = modelId;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public Integer getStevidorId() {
		return stevidorId;
	}

	public void setStevidorId(Integer stevidorId) {
		this.stevidorId = stevidorId;
	}

	public String getTranc() {
		return tranc;
	}

	public void setTranc(String tranc) {
		this.tranc = tranc;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public Integer getUpdateUserId() {
		return updateUserId;
	}

	public void setUpdateUserId(Integer updateUserId) {
		this.updateUserId = updateUserId;
	}

	public String getZavNumber() {
		return zavNumber;
	}

	public void setZavNumber(String zavNumber) {
		this.zavNumber = zavNumber;
	}

}