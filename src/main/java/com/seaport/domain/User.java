package com.seaport.domain;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * The persistent class for the users database table. 
 * 
 * @Author Danil Ozherelyev
 * @version 1.0 12/04/13
 *          
 */
@Entity
@Table(name="users")
public class User implements Serializable {
	
	private static final long serialVersionUID = -6808032045384344779L;

	@Id
	@GeneratedValue
	@Column(name = "ID")
	private Integer userId;
	
	@OneToOne()
	@JoinColumn(name = "STEVIDOR_ID", insertable = false, updatable = false)
	private Stevidor stevidor;
	
	@Column(name="STEVIDOR_ID")
	private int stevidorId;
	
	@Size(min = 2, max = 45, message = "{validation.size.firstName}")
	@Pattern(regexp = "[\\p{L}]*", message = "{validation.context.letters.only}")
	@Column(name = "FIRST_NAME", nullable = false)
	private String firstName;
	
	@Size(min = 2, max = 45, message = "{validation.size.lastName}")
	@Pattern(regexp = "[\\p{L}]*", message = "{validation.context.letters.only}")	
	@Column(name = "LAST_NAME", nullable = false)
	private String lastName;
	
	//@Size(min = 1, max = 45, message = "{validation.size.middleInitial}")
	@Pattern(regexp = "[\\p{L}]*", message = "{validation.context.letters.only}")	
	@Column(name = "MIDDLE_INITIAL")
	private String middleInitial;
	
	@Email(message = "{validation.context.email}")
	@Pattern(regexp=".+@.+\\..+", message = "{validation.context.email}")
	@Column(name = "USER_EMAIL", nullable = false)
	private String userEmail;
	
	@Column(name = "LOGIN", nullable = false)
	private String login;
	
	@Column(name = "PASSWORD", nullable = false)
	private String password;
	
	@Column(name="DIVISION")
	private String division;
	
	@Column(name="OCCUPATION")
	private String occupation;

	@Column(name="USER_NOTE")
	private String userNote;

	private String archived;
	
	private String img;
	private String dev;
 
	@Column(name = "LAST_LOGIN_DATE", nullable = false)
	@DateTimeFormat(pattern = "yyyy.dd.MM HH:mm")
	private Date lastLoginDate;

	@Column(name = "CREATE_DATE", nullable = false)
	private Timestamp createDate;
	
	@Column(name = "UPDATE_USER_ID")
	private Integer updateUserId;

	@Column(name = "UPDATE_DATE", nullable = false)
	private Timestamp updateDate;

	@OneToOne(cascade=CascadeType.ALL)
	@JoinTable(name="user_roles",
		joinColumns = {@JoinColumn(name="user_id", referencedColumnName="id")},
		inverseJoinColumns = {@JoinColumn(name="role_id", referencedColumnName="id")}
	)
	private Role role;

	@Transient
	private String isLoggedIn="";
	@Transient
	private String localUpdateDate;

	public String getLocalUpdateDate() {
		return localUpdateDate;
	}
	public void setLocalUpdateDate(String localUpdateDate) {
		this.localUpdateDate = localUpdateDate;
	}
	public Date getLastLoginDate() {
		return lastLoginDate;
	}
	public void setLastLoginDate(Date lastLoginDate) {
		this.lastLoginDate = lastLoginDate;
	}
	public String getIsLoggedIn() {
		return isLoggedIn;
	}
	public void setIsLoggedIn(String isLoggedIn) {
		this.isLoggedIn = isLoggedIn;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getDev() {
		return dev;
	}

	public void setDev(String dev) {
		this.dev = dev;
	}

	public String getArchived() {
		return archived;
	}

	public void setArchived(String archived) {
		this.archived = archived;
	}


	public Stevidor getStevidor() {
		return stevidor;
	}

	public void setStevidor(Stevidor stevidor) {
		this.stevidor = stevidor;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getMiddleInitial() {
		return middleInitial;
	}

	public void setMiddleInitial(String middleInitial) {
		this.middleInitial = middleInitial;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getOccupation() {
		return occupation;
	}

	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}

	public String getUserNote() {
		return userNote;
	}

	public void setUserNote(String userNote) {
		this.userNote = userNote;
	}

	public Timestamp getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}

	public Integer getUpdateUserId() {
		return updateUserId;
	}

	public void setUpdateUserId(Integer updateUserId) {
		this.updateUserId = updateUserId;
	}

	public Timestamp getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Timestamp updateDate) {
		this.updateDate = updateDate;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public String getDivision() {
		return division;
	}

	public void setDivision(String division) {
		this.division = division;
	}

	public int getStevidorId() {
		return stevidorId;
	}

	public void setStevidorId(int stevidorId) {
		this.stevidorId = stevidorId;
	}
	@Override
	public String toString() {
		return "User [userId=" + userId + ", stevidor=" + stevidor
				+ ", stevidorId=" + stevidorId + ", firstName=" + firstName
				+ ", lastName=" + lastName + ", middleInitial=" + middleInitial
				+ ", userEmail=" + userEmail + ", login=" + login
				+ ", password=" + password + ", division=" + division
				+ ", occupation=" + occupation + ", userNote=" + userNote
				+ ", archived=" + archived + ", img=" + img + ", dev=" + dev
				+ ", lastLoginDate=" + lastLoginDate + ", createDate="
				+ createDate + ", updateUserId=" + updateUserId
				+ ", updateDate=" + updateDate + ", role=" + role
				+ ", isLoggedIn=" + isLoggedIn + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((firstName == null) ? 0 : firstName.hashCode());
		result = prime * result
				+ ((lastName == null) ? 0 : lastName.hashCode());
		result = prime * result + ((login == null) ? 0 : login.hashCode());
		result = prime * result + stevidorId;
		result = prime * result
				+ ((userEmail == null) ? 0 : userEmail.hashCode());
		result = prime * result + ((userId == null) ? 0 : userId.hashCode());
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
		User other = (User) obj;
		if (firstName == null) {
			if (other.firstName != null)
				return false;
		} else if (!firstName.equals(other.firstName))
			return false;
		if (lastName == null) {
			if (other.lastName != null)
				return false;
		} else if (!lastName.equals(other.lastName))
			return false;
		if (login == null) {
			if (other.login != null)
				return false;
		} else if (!login.equals(other.login))
			return false;
		if (stevidorId != other.stevidorId)
			return false;
		if (userEmail == null) {
			if (other.userEmail != null)
				return false;
		} else if (!userEmail.equals(other.userEmail))
			return false;
		if (userId == null) {
			if (other.userId != null)
				return false;
		} else if (!userId.equals(other.userId))
			return false;
		return true;
	}

}
