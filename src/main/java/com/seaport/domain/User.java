package com.seaport.domain;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;

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

	@Column(name = "COUNTRY_ID")
	private Integer countryId;
	
	@Column(name="STEVIDOR_ID")
	private int stevidorId;
	
	@Column(name="PORT_ID")
	private int portId;	
	
	
	@NotNull
	@Size(min = 1, max = 25, message = "{validation.size.firstName}")
	@Pattern(regexp = "[\\p{L}]*", message = "{validation.context.letters.only}")
	@Column(name = "FIRST_NAME", nullable = false)
	private String firstName;
	
	@NotNull
	@Size(min = 1, max = 25, message = "{validation.size.lastName}")
	@Pattern(regexp = "[\\p{L}]*", message = "{validation.context.letters.only}")	
	@Column(name = "LAST_NAME", nullable = false)
	private String lastName;
	
	@NotNull
	@Size(min = 1, max = 25, message = "{validation.size.middleInitial}")
	@Pattern(regexp = "[\\p{L}]*", message = "{validation.context.letters.only}")	
	@Column(name = "MIDDLE_INITIAL")
	private String middleInitial;
	
	@Email(message = "{validation.context.email}")
	@Column(name = "USER_EMAIL", nullable = false)
	private String userEmail;
	
//	@Size(min = 4, max = 25, message = "{validation.size.login}")
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

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getCountryId() {
		return countryId;
	}

	public void setCountryId(Integer countryId) {
		this.countryId = countryId;
	}

	public int getstevidorId() {
		return stevidorId;
	}

	public void setstevidorId(int stevidorId) {
		this.stevidorId = stevidorId;
	}

	public int getPortId() {
		return portId;
	}

	public void setPortId(int portId) {
		this.portId = portId;
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

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((countryId == null) ? 0 : countryId.hashCode());
		result = prime * result
				+ ((firstName == null) ? 0 : firstName.hashCode());
		result = prime * result
				+ ((lastName == null) ? 0 : lastName.hashCode());
		result = prime * result + ((login == null) ? 0 : login.hashCode());
		result = prime * result + portId;
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
		if (countryId == null) {
			if (other.countryId != null)
				return false;
		} else if (!countryId.equals(other.countryId))
			return false;
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
		if (portId != other.portId)
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

	@Override
	public String toString() {
		return "User [userId=" + userId + ", countryId=" + countryId
				+ ", stevidorId=" + stevidorId + ", portId=" + portId
				+ ", firstName=" + firstName + ", lastName=" + lastName
				+ ", middleInitial=" + middleInitial + ", userEmail="
				+ userEmail + ", login=" + login + ", password=" + password
				+ ", occupation=" + occupation + ", userNote=" + userNote
				+ ", createDate=" + createDate + ", updateUserId="
				+ updateUserId + ", updateDate=" + updateDate + ", role="
				+ role + "]";
	}


}
