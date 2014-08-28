package com.seaport.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
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
@NamedQuery(name="Country.findAll", query="SELECT c FROM Country c")
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

	@Override
	public String toString() {
		return "Country [countryId=" + countryId + ", nameRus=" + nameRus
				+ ", nameEn=" + nameEn + ", archived=" + archived
				+ ", countryNote=" + countryNote + ", createDate=" + createDate
				+ ", createUserId=" + createUserId + ", updateDate="
				+ updateDate + ", updateUserId=" + updateUserId + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((countryId == null) ? 0 : countryId.hashCode());
		result = prime * result
				+ ((createDate == null) ? 0 : createDate.hashCode());
		result = prime * result
				+ ((createUserId == null) ? 0 : createUserId.hashCode());
		result = prime * result + ((nameEn == null) ? 0 : nameEn.hashCode());
		result = prime * result + ((nameRus == null) ? 0 : nameRus.hashCode());
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
		Country other = (Country) obj;
		if (countryId == null) {
			if (other.countryId != null)
				return false;
		} else if (!countryId.equals(other.countryId))
			return false;
		if (createDate == null) {
			if (other.createDate != null)
				return false;
		} else if (!createDate.equals(other.createDate))
			return false;
		if (createUserId == null) {
			if (other.createUserId != null)
				return false;
		} else if (!createUserId.equals(other.createUserId))
			return false;
		if (nameEn == null) {
			if (other.nameEn != null)
				return false;
		} else if (!nameEn.equals(other.nameEn))
			return false;
		if (nameRus == null) {
			if (other.nameRus != null)
				return false;
		} else if (!nameRus.equals(other.nameRus))
			return false;
		return true;
	}

}
