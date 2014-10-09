package com.seaport.domain;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import javax.validation.constraints.Min;

import org.codehaus.jackson.annotate.JsonProperty;
import org.codehaus.jackson.map.annotate.JsonSerialize;
import org.springframework.format.annotation.DateTimeFormat;

import com.seaport.utils.CustomDateSerializer;


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
	@Column(name="model_id")
	private Integer modelId;
	
	@Column(name="inventory_numb")
	private String inventoryNumb;

	@Column(name="nom_no")
	private String nomNo;
	
	@Column(name="reg_no")
	private String regNo;
	
	private String location;

	private String details;

	private String name;

	private String note;

	@Column(name="release_year")
	private String releaseYear;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="start_date")
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	@JsonSerialize(using = CustomDateSerializer.class)
	private Date startDate;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="end_date")
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	@JsonSerialize(using = CustomDateSerializer.class)
	private Date endDate;
	
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
	@JsonSerialize(using = CustomDateSerializer.class)
	private Date updateDate;

	@Column(name="update_user_id")
	private int updateUserId;
	
	@OneToOne()
	@JoinColumn(name = "stevidor_id", insertable = false, updatable = false)
	private Stevidor stevidor;
	
//	@Valid
//	@OneToOne(cascade = CascadeType.ALL)
	@OneToOne()
	@JoinColumn(name = "model_id", insertable = false, updatable = false)
	private MachineModel machineModel;

	@Transient
	private Integer DT_RowId;
	
	/**
	 * Public constructor
	 */
	public Machine() {
	}
	
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	@JsonProperty("DT_RowId")
	public Integer getDT_RowId() {
		return machineId;
	}
	public String getRegNo() {
		return regNo;
	}

	public void setRegNo(String regNo) {
		this.regNo = regNo;
	}

	public String getNomNo() {
		return nomNo;
	}
	public void setNomNo(String nomNo) {
		this.nomNo = nomNo;
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
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((machineId == null) ? 0 : machineId.hashCode());
		result = prime * result + ((modelId == null) ? 0 : modelId.hashCode());
		result = prime * result
				+ ((stevidorId == null) ? 0 : stevidorId.hashCode());
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
		if (machineId == null) {
			if (other.machineId != null)
				return false;
		} else if (!machineId.equals(other.machineId))
			return false;
		if (modelId == null) {
			if (other.modelId != null)
				return false;
		} else if (!modelId.equals(other.modelId))
			return false;
		if (stevidorId == null) {
			if (other.stevidorId != null)
				return false;
		} else if (!stevidorId.equals(other.stevidorId))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Machine [machineId=" + machineId + ", archived=" + archived
				+ ", doc=" + doc + ", factoryNumb=" + factoryNumb
				+ ", modelId=" + modelId + ", inventoryNumb=" + inventoryNumb
				+ ", nomNo=" + nomNo + ", regNo=" + regNo + ", location="
				+ location + ", details=" + details + ", name=" + name
				+ ", note=" + note + ", releaseYear=" + releaseYear
				+ ", startDate=" + startDate + ", endDate=" + endDate
				+ ", stevidorId=" + stevidorId + ", transNumb=" + transNumb
				+ ", createDate=" + createDate + ", createUserId="
				+ createUserId + ", updateDate=" + updateDate
				+ ", updateUserId=" + updateUserId + ", DT_RowId=" + DT_RowId
				+ "]";
	}

	
}