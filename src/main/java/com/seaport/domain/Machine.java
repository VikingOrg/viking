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
	private int machineId;

	private String archived;

	@Column(name="bd_year")
	private String bdYear;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="create_date")
	private Date createDate;

	@Column(name="create_user_id")
	private int createUserId;

	private String doc;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="in_date")
	private Date inDate;

	@Column(name="inv_number")
	private String invNumber;

	private String location;

	@Column(name="model_id")
	private int modelId;

	private String nickname;

	@Lob
	private String note;

	@Column(name="stevidor_id")
	private int stevidorId;

	private String tranc;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="update_date")
	private Date updateDate;

	@Column(name="update_user_id")
	private int updateUserId;

	@Column(name="zav_number")
	private String zavNumber;

	public Machine() {
	}

	public int getMachineId() {
		return this.machineId;
	}

	public void setMachineId(int machineId) {
		this.machineId = machineId;
	}

	public String getArchived() {
		return this.archived;
	}

	public void setArchived(String archived) {
		this.archived = archived;
	}

	public String getBdYear() {
		return this.bdYear;
	}

	public void setBdYear(String bdYear) {
		this.bdYear = bdYear;
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

	public String getDoc() {
		return this.doc;
	}

	public void setDoc(String doc) {
		this.doc = doc;
	}

	public Date getInDate() {
		return this.inDate;
	}

	public void setInDate(Date inDate) {
		this.inDate = inDate;
	}

	public String getInvNumber() {
		return this.invNumber;
	}

	public void setInvNumber(String invNumber) {
		this.invNumber = invNumber;
	}

	public String getLocation() {
		return this.location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public int getModelId() {
		return this.modelId;
	}

	public void setModelId(int modelId) {
		this.modelId = modelId;
	}

	public String getNickname() {
		return this.nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getNote() {
		return this.note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public int getStevidorId() {
		return this.stevidorId;
	}

	public void setStevidorId(int stevidorId) {
		this.stevidorId = stevidorId;
	}

	public String getTranc() {
		return this.tranc;
	}

	public void setTranc(String tranc) {
		this.tranc = tranc;
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

	public String getZavNumber() {
		return this.zavNumber;
	}

	public void setZavNumber(String zavNumber) {
		this.zavNumber = zavNumber;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((invNumber == null) ? 0 : invNumber.hashCode());
		result = prime * result + machineId;
		result = prime * result + modelId;
		result = prime * result + stevidorId;
		result = prime * result
				+ ((zavNumber == null) ? 0 : zavNumber.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Machine other = (Machine) obj;
		if (invNumber == null) {
			if (other.invNumber != null)
				return false;
		} else if (!invNumber.equals(other.invNumber))
			return false;
		if (machineId != other.machineId)
			return false;
		if (modelId != other.modelId)
			return false;
		if (stevidorId != other.stevidorId)
			return false;
		if (zavNumber == null) {
			if (other.zavNumber != null)
				return false;
		} else if (!zavNumber.equals(other.zavNumber))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Machine [machineId=" + machineId + ", archived=" + archived
				+ ", bdYear=" + bdYear + ", createDate=" + createDate
				+ ", createUserId=" + createUserId + ", doc=" + doc
				+ ", inDate=" + inDate + ", invNumber=" + invNumber
				+ ", location=" + location + ", modelId=" + modelId
				+ ", nickname=" + nickname + ", note=" + note + ", stevidorId="
				+ stevidorId + ", tranc=" + tranc + ", updateDate="
				+ updateDate + ", updateUserId=" + updateUserId
				+ ", zavNumber=" + zavNumber + "]";
	}

}