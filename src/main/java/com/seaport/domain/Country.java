package com.seaport.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * The persistent class for the ports database table. 
 * 
 * @Author Danil Ozherelyev
 * @version 1.0 12/04/13
 *          
 */
@Entity
@Table(name = "countries")
public class Country implements java.io.Serializable {
	private static final long serialVersionUID = -4663358365744814774L;
	
	@Id
	@GeneratedValue
	@Column(name="country_id")	
	private Integer countryId;
	
	@Column(name = "name_rus", nullable = false, length = 45)
	private String nameRus;
	
	@Column(name = "name_en", length = 45)
	private String nameEn;
	
	@Column(name = "archived", length = 1)
	private String archived;
	
	@Column(name = "country_note", length = 65535)
	private String countryNote;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "create_date", nullable = false, length = 19)
	private Date createDate;
	
	@Column(name = "create_user_id", nullable = false, length = 45)
	private Integer createUserId;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "update_date", nullable = false, length = 19)
	private Date updateDate;
	
	@Column(name = "update_user_id", nullable = false, length = 45)
	private Integer updateUserId;

	public Country() {
	}
	
	public Integer getCreateUserId() {
		return createUserId;
	}
	public void setCreateUserId(Integer createUserId) {
		this.createUserId = createUserId;
	}
	public Integer getUpdateUserId() {
		return updateUserId;
	}
	public void setUpdateUserId(Integer updateUserId) {
		this.updateUserId = updateUserId;
	}
	public Integer getCountryId() {
		return countryId;
	}
	public void setCountryId(Integer countryId) {
		this.countryId = countryId;
	}
	public String getNameRus() {
		return this.nameRus;
	}
	public void setNameRus(String nameRus) {
		this.nameRus = nameRus;
	}
	public String getNameEn() {
		return this.nameEn;
	}

	public void setNameEn(String nameEn) {
		this.nameEn = nameEn;
	}
	public String getArchived() {
		return this.archived;
	}

	public void setArchived(String archived) {
		this.archived = archived;
	}
	
	public String getCountryNote() {
		return this.countryNote;
	}

	public void setCountryNote(String countryNote) {
		this.countryNote = countryNote;
	}

	public Date getCreateDate() {
		return this.createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}



	public Date getUpdateDate() {
		return this.updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}




}
