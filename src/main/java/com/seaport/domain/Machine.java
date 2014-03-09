package com.seaport.domain;

import java.io.Serializable;

import javax.persistence.*;
import javax.validation.Valid;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;


/**
 * The persistent class for the machines database table.
 * 
 */
@Entity
@Table(name="machines")
@NamedQuery(name="Machine.findAll", query="SELECT m FROM Machine m")
public class Machine implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	@Column(name="machine_id")
	private Integer machineId;

	private String archived;

	private String doc;

	@Column(name="factory_numb")
	private String factoryNumb;

	@Min(1)
	@Column(name="group_id")
	private Integer groupId;

	@Column(name="inventory_numb")
	private String inventoryNumb;

	private String location;

	private String details;

	private String name;

	private String note;

	@Column(name="release_year")
	private String releaseYear;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="start_date")
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	private Date startDate;

	@Column(name="stevidor_id")
	private Integer stevidorId;
	
	@Column(name="trans_numb")
	private String transNumb;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="create_date")
	private Date createDate;

	@Column(name="create_user_id")
	private int createUserId;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="update_date")
	private Date updateDate;

	@Column(name="update_user_id")
	private int updateUserId;
	
	@OneToOne()
	@JoinColumn(name = "stevidor_id", insertable = false, updatable = false)
	private Stevidor stevidor;
	
	@Min(1)
	@Column(name="model_id")
	private Integer modelId;
	
//	@Valid
//	@OneToOne(cascade = CascadeType.ALL)
	@OneToOne()
	@JoinColumn(name = "model_id", insertable = false, updatable = false)
	private MachineModel machineModel;

	@OneToOne()
	@JoinColumn(name = "group_id", insertable = false, updatable = false)
	private Group group;

	public Machine() {
	}

	
	public Integer getModelId() {
		return modelId;
	}


	public void setModelId(Integer modelId) {
		this.modelId = modelId;
	}


	public String getReleaseYear() {
		return releaseYear;
	}
	public void setReleaseYear(String releaseYear) {
		this.releaseYear = releaseYear;
	}
	public Stevidor getStevidor() {
		return stevidor;
	}


	public void setStevidor(Stevidor stevidor) {
		this.stevidor = stevidor;
	}


	public MachineModel getMachineModel() {
		return machineModel;
	}


	public void setMachineModel(MachineModel machineModel) {
		this.machineModel = machineModel;
	}


	public Group getGroup() {
		return group;
	}


	public void setGroup(Group group) {
		this.group = group;
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


	public String getDoc() {
		return doc;
	}

	public void setDoc(String doc) {
		this.doc = doc;
	}

	public String getFactoryNumb() {
		return factoryNumb;
	}

	public void setFactoryNumb(String factoryNumb) {
		this.factoryNumb = factoryNumb;
	}

	public Integer getGroupId() {
		return groupId;
	}

	public void setGroupId(Integer groupId) {
		this.groupId = groupId;
	}

	public String getInventoryNumb() {
		return inventoryNumb;
	}

	public void setInventoryNumb(String inventoryNumb) {
		this.inventoryNumb = inventoryNumb;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

//	public Integer getModelId() {
//		return modelId;
//	}
//
//	public void setModelId(Integer modelId) {
//		this.modelId = modelId;
//	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}



	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Integer getStevidorId() {
		return stevidorId;
	}

	public void setStevidorId(Integer stevidorId) {
		this.stevidorId = stevidorId;
	}

	public String getTransNumb() {
		return transNumb;
	}

	public void setTransNumb(String transNumb) {
		this.transNumb = transNumb;
	}

	public Date getCreateDate() {
		return createDate;
	}


	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}


	public int getCreateUserId() {
		return createUserId;
	}


	public void setCreateUserId(int createUserId) {
		this.createUserId = createUserId;
	}


	public Date getUpdateDate() {
		return updateDate;
	}


	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}


	public int getUpdateUserId() {
		return updateUserId;
	}


	public void setUpdateUserId(int updateUserId) {
		this.updateUserId = updateUserId;
	}


	public String getDetails() {
		return details;
	}


	public void setDetails(String details) {
		this.details = details;
	}


	@Override
	public String toString() {
		return "Machine [machineId=" + machineId + ", archived=" + archived
				+ ", createDate=" + createDate + ", createUserId="
				+ createUserId + ", doc=" + doc + ", factoryNumb="
				+ factoryNumb + ", groupId=" + groupId + ", inventoryNumb="
				+ inventoryNumb + ", location=" + location + ", modelId="
				+  ", name=" + name + ", note=" + note
				+ ", releaseYear=" + releaseYear + ", startDate=" + startDate
				+ ", stevidorId=" + stevidorId + ", transNumb=" + transNumb
				+ ", updateDate=" + updateDate + ", updateUserId="
				+ updateUserId + "]";
	}

	
}