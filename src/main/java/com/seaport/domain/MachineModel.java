package com.seaport.domain;

import java.io.Serializable;

import javax.persistence.*;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.codehaus.jackson.annotate.JsonProperty;
import org.codehaus.jackson.map.annotate.JsonSerialize;

import com.seaport.utils.CustomDateSerializer;

import java.util.Date;


/**
 * The persistent class for the models database table.
 * 
 * @Author Danil Ozherelyev
 * @version 1.0 12/12/13
 *          
 */
@Entity
@Table(name="models")
@NamedQuery(name="MachineModel.findAll", query="SELECT m FROM MachineModel m")
public class MachineModel implements Serializable {
	private static final long serialVersionUID = 1L;

	@Min(1)
	@Id
	@GeneratedValue
	@Column(name="model_id")
	private Integer modelId;

	private String archived;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="create_date")
	private Date createDate;

	@Column(name="create_user_id")
	private Integer createUserId;

	private String details;

	@NotNull
	@Min(1)
	@Column(name="group_id")
	private Integer groupId;

	@Column(name="manufacturer_id")
	private Integer manufacturerId;
	
	@NotNull
	@Size(min = 3, max = 60, message = "{validation.size.generic}")
	private String name;

	@Lob
	private String note;
	
	@Column(name="model_img")
	private String modelImg;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="update_date")
	@JsonSerialize(using = CustomDateSerializer.class)
	private Date updateDate;

	@Column(name="update_user_id")
	private Integer updateUserId;

	@OneToOne()
	@JoinColumn(name = "group_id", insertable = false, updatable = false)
	private Group group;
	
	@OneToOne()
	@JoinColumn(name = "manufacturer_id", insertable = false, updatable = false)
	private Manufacturer manufacturer;	
	
	@Transient
	private Integer DT_RowId;
	
	public MachineModel() {
	}

	public String getModelImg() {
		return modelImg;
	}

	public void setModelImg(String modelImg) {
		this.modelImg = modelImg;
	}

	@JsonProperty("DT_RowId")
	public Integer getDT_RowId() {
		return modelId;
	}

	public Integer getModelId() {
		return modelId;
	}

	public void setModelId(Integer modelId) {
		this.modelId = modelId;
	}

	public String getArchived() {
		return archived;
	}

	public void setArchived(String archived) {
		this.archived = archived;
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

	public String getDetails() {
		return details;
	}

	public void setDetails(String details) {
		this.details = details;
	}

	public Integer getGroupId() {
		return groupId;
	}

	public void setGroupId(Integer groupId) {
		this.groupId = groupId;
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

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
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

	public Group getGroup() {
		return group;
	}

	public void setGroup(Group group) {
		this.group = group;
	}

	public Manufacturer getManufacturer() {
		return manufacturer;
	}

	public void setManufacturer(Manufacturer manufacturer) {
		this.manufacturer = manufacturer;
	}

}