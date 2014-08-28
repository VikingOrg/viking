package com.seaport.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * The persistent class for the stevidor contacts database table. 
 * 
 * @Author Danil Ozherelyev
 * @version 1.0 08/27/13
 *          
 */

@Entity
@Table(name = "contact")
public class Contact implements java.io.Serializable {
	private static final long serialVersionUID = -466212276124656379L;
	
	@Id
	@GeneratedValue
	@Column(name = "contact_id", unique = true, nullable = false)	
	private Integer contactId;
	
	@Column(name = "stevidor_id")
	private Integer stevidorId;
	
	@Column(name = "npp")
	private Integer npp;
	
	@Column(name = "JobTitle", length = 100)
	private String jobTitle;
	
	@Column(name = "FNS", length = 100)
	private String fns;
	
	@Column(name = "Phone", length = 50)
	private String phone;
	
	@Column(name = "MobPhone", length = 50)
	private String mobPhone;
	
	@Column(name = "Fax", length = 50)
	private String fax;
	
	@Column(name = "Email", length = 50)
	private String email;
	
	@Column(name = "Comments")
	private String comments;
	
	@Column(name = "archived", length = 1)
	private String archived;
	
	@Column(name = "create_user_id")
	private Integer createUserId;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "create_date", length = 19)
	private Date createDate;
	
	@Column(name = "update_user_id")
	private Integer updateUserId;
	

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "update_date", length = 19)
	private Date updateDate;

    @ManyToOne
    @JoinColumn(name="stevidor_id", insertable=false, updatable=false, nullable=false)
    private Stevidor stevidor;
	
	public Contact() {
	}

	public Contact(Integer stevidorId, Integer npp, String jobTitle,
			String fns, String phone, String mobPhone, String fax,
			String email, String comments, String archived,
			Integer createUserId, Date createDate, Integer updateUserId,
			Date updateDate) {
		this.stevidorId = stevidorId;
		this.npp = npp;
		this.jobTitle = jobTitle;
		this.fns = fns;
		this.phone = phone;
		this.mobPhone = mobPhone;
		this.fax = fax;
		this.email = email;
		this.comments = comments;
		this.archived = archived;
		this.createUserId = createUserId;
		this.createDate = createDate;
		this.updateUserId = updateUserId;
		this.updateDate = updateDate;
	}

	public Stevidor getStevidor() {
		return stevidor;
	}
	public void setStevidor(Stevidor stevidor) {
		this.stevidor = stevidor;
	}
	public Integer getContactId() {
		return this.contactId;
	}
	public void setContactId(Integer contactId) {
		this.contactId = contactId;
	}
	public Integer getStevidorId() {
		return this.stevidorId;
	}

	public void setStevidorId(Integer stevidorId) {
		this.stevidorId = stevidorId;
	}
	public Integer getNpp() {
		return this.npp;
	}

	public void setNpp(Integer npp) {
		this.npp = npp;
	}
	public String getJobTitle() {
		return this.jobTitle;
	}

	public void setJobTitle(String jobTitle) {
		this.jobTitle = jobTitle;
	}
	public String getFns() {
		return this.fns;
	}

	public void setFns(String fns) {
		this.fns = fns;
	}
	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getMobPhone() {
		return this.mobPhone;
	}

	public void setMobPhone(String mobPhone) {
		this.mobPhone = mobPhone;
	}
	public String getFax() {
		return this.fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	public String getComments() {
		return this.comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}
	public String getArchived() {
		return this.archived;
	}

	public void setArchived(String archived) {
		this.archived = archived;
	}
	public Integer getCreateUserId() {
		return this.createUserId;
	}

	public void setCreateUserId(Integer createUserId) {
		this.createUserId = createUserId;
	}
	public Date getCreateDate() {
		return this.createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Integer getUpdateUserId() {
		return this.updateUserId;
	}

	public void setUpdateUserId(Integer updateUserId) {
		this.updateUserId = updateUserId;
	}
	public Date getUpdateDate() {
		return this.updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	@Override
	public String toString() {
		return "Contact [contactId=" + contactId + ", stevidorId=" + stevidorId
				+ ", npp=" + npp + ", jobTitle=" + jobTitle + ", fns=" + fns
				+ ", phone=" + phone + ", mobPhone=" + mobPhone + ", fax="
				+ fax + ", email=" + email + ", comments=" + comments
				+ ", archived=" + archived + ", createUserId=" + createUserId
				+ ", createDate=" + createDate + ", updateUserId="
				+ updateUserId + ", updateDate=" + updateDate + ", stevidor="
				+ stevidor + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((contactId == null) ? 0 : contactId.hashCode());
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
		Contact other = (Contact) obj;
		if (contactId == null) {
			if (other.contactId != null)
				return false;
		} else if (!contactId.equals(other.contactId))
			return false;
		return true;
	}


}
