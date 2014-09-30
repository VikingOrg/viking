package com.seaport.domain;

import static javax.persistence.GenerationType.IDENTITY;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.codehaus.jackson.annotate.JsonBackReference;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.springframework.format.annotation.DateTimeFormat;

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
	@GeneratedValue(strategy = IDENTITY)
	@Column(name="stevidor_id", unique = true, nullable = false)
	private Integer stevidorId;

	private String archived;
	
	@NotNull
	@Size(min = 3, max = 100, message = "{validation.size.generic}")
	@Column(name="full_name")
	private String fullName;
	
	@NotNull
	@Size(min = 3, max = 45, message = "{validation.size.generic}")
	private String name;

	@Column(name="name_eng")
	private String nameEng;

	@Column(name="port_id")
	private int portId;

	@Column(name="post_code")
	private String postCode;

	private String region;
	private String area;
	private String city;
	private String street;
	private String building;
	private String phone;
	private String fax;
	private String email;
	private String url;
	@Column(name="activity_place")
	private String activityPlace;
	@Column(name="moorage_count")
	private String moorageCount;
	private String specialization;
	
	@Lob
	@Column(name="stevidor_note")
	private String stevidorNote;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="create_date")
	private Date createDate;

	@Column(name="create_user_id")
	private int createUserId;
	
	@Column(name="update_date")
	@DateTimeFormat(pattern ="dd.MM.yyyy")
	private Date updateDate;

	@Column(name="update_user_id")
	private int updateUserId;

	@OneToOne()
	@JoinColumn(name = "port_id", insertable = false, updatable = false)
	private Port port;
	
    @OneToMany(cascade={CascadeType.ALL}, fetch=FetchType.EAGER)
    @Fetch( FetchMode.SELECT)
    @JoinColumn(name="stevidor_id")
    //@IndexColumn(name="idx")
	@JsonBackReference
    private List<Contact> contacts = new ArrayList<Contact>();
    
	public Stevidor() {
		
	}

	public List<Contact> getContacts() {
		return contacts;
	}
	public void setContacts(List<Contact> contacts) {
		this.contacts = contacts;
	}
	public String getPostCode() {
		return postCode;
	}
	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getBuilding() {
		return building;
	}

	public void setBuilding(String building) {
		this.building = building;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getActivityPlace() {
		return activityPlace;
	}

	public void setActivityPlace(String activityPlace) {
		this.activityPlace = activityPlace;
	}

	public String getMoorageCount() {
		return moorageCount;
	}

	public void setMoorageCount(String moorageCount) {
		this.moorageCount = moorageCount;
	}

	public String getSpecialization() {
		return specialization;
	}

	public void setSpecialization(String specialization) {
		this.specialization = specialization;
	}

	public Port getPort() {
		return port;
	}

	public void setPort(Port port) {
		this.port = port;
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