package com.seaport.domain;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Countries 
 */
@Entity
@Table(name = "countries", catalog = "viking")
public class Countries implements java.io.Serializable {
	private static final long serialVersionUID = -4663358365744814774L;
	private int countryId;
	private String nameRus;
	private String nameEn;
	private String archived;
	private String countryNote;
	private Date createDate;
	private String createUserId;
	private Date updateDate;
	private String updateUserId;

	public Countries() {
	}

	public Countries(int countryId, String nameRus, Date createDate,
			String createUserId, Date updateDate, String updateUserId) {
		this.countryId = countryId;
		this.nameRus = nameRus;
		this.createDate = createDate;
		this.createUserId = createUserId;
		this.updateDate = updateDate;
		this.updateUserId = updateUserId;
	}

	public Countries(int countryId, String nameRus, String nameEn,
			String archived, String countryNote, Date createDate,
			String createUserId, Date updateDate, String updateUserId) {
		this.countryId = countryId;
		this.nameRus = nameRus;
		this.nameEn = nameEn;
		this.archived = archived;
		this.countryNote = countryNote;
		this.createDate = createDate;
		this.createUserId = createUserId;
		this.updateDate = updateDate;
		this.updateUserId = updateUserId;
	}

	@Id
	@Column(name = "country_id", unique = true, nullable = false)
	public int getCountryId() {
		return this.countryId;
	}

	public void setCountryId(int countryId) {
		this.countryId = countryId;
	}

	@Column(name = "name_rus", nullable = false, length = 45)
	public String getNameRus() {
		return this.nameRus;
	}

	public void setNameRus(String nameRus) {
		this.nameRus = nameRus;
	}

	@Column(name = "name_en", length = 45)
	public String getNameEn() {
		return this.nameEn;
	}

	public void setNameEn(String nameEn) {
		this.nameEn = nameEn;
	}

	@Column(name = "archived", length = 1)
	public String getArchived() {
		return this.archived;
	}

	public void setArchived(String archived) {
		this.archived = archived;
	}

	@Column(name = "country_note", length = 65535)
	public String getCountryNote() {
		return this.countryNote;
	}

	public void setCountryNote(String countryNote) {
		this.countryNote = countryNote;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "create_date", nullable = false, length = 19)
	public Date getCreateDate() {
		return this.createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	@Column(name = "create_user_id", nullable = false, length = 45)
	public String getCreateUserId() {
		return this.createUserId;
	}

	public void setCreateUserId(String createUserId) {
		this.createUserId = createUserId;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "update_date", nullable = false, length = 19)
	public Date getUpdateDate() {
		return this.updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	@Column(name = "update_user_id", nullable = false, length = 45)
	public String getUpdateUserId() {
		return this.updateUserId;
	}

	public void setUpdateUserId(String updateUserId) {
		this.updateUserId = updateUserId;
	}

	@Override
	public String toString() {
		return "Countries [countryId=" + countryId + ", nameRus=" + nameRus
				+ ", nameEn=" + nameEn + ", archived=" + archived
				+ ", countryNote=" + countryNote + ", createDate=" + createDate
				+ ", createUserId=" + createUserId + ", updateDate="
				+ updateDate + ", updateUserId=" + updateUserId + "]";
	}

}
