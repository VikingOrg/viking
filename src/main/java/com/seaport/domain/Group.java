package com.seaport.domain;

import java.io.Serializable;

import javax.persistence.*;

import org.codehaus.jackson.map.annotate.JsonSerialize;
import org.springframework.format.annotation.DateTimeFormat;

import com.seaport.utils.CustomDateSerializer;

import java.util.Date;


/**
 * The persistent class for the groups database table.
 * 
 * @Author Danil Ozherelyev
 * @version 1.0 12/12/13
 *          
 */
@Entity
@Table(name="groups")
@NamedQuery(name="Group.findAll", query="SELECT g FROM Group g")
public class Group implements Serializable {
	private static final long serialVersionUID = -7693200082841883559L;

	@Id
	@GeneratedValue
	@Column(name="group_id")	
	private Integer groupId;
	
	@Column(name="group_note")
	private String groupNote;
	
	private String archived;
	private String name;
	
	@Column(name="group_order")
	private Integer groupOrder;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="create_date")
	private Date createDate;

	@Column(name="create_user_id")
	private Integer createUserId;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="update_date")
	@JsonSerialize(using = CustomDateSerializer.class)
	@DateTimeFormat(pattern = "dd.MM.yyyy")
	private Date updateDate;

	@Column(name="update_user_id")
	private Integer updateUserId;

	public Group() {
	}

	public Integer getGroupOrder() {
		return groupOrder;
	}
	public void setGroupOrder(Integer groupOrder) {
		this.groupOrder = groupOrder;
	}

	public String getGroupNote() {
		return groupNote;
	}

	public void setGroupNote(String groupNote) {
		this.groupNote = groupNote;
	}

	public String getArchived() {
		return archived;
	}

	public void setArchived(String archived) {
		this.archived = archived;
	}

	public Integer getGroupId() {
		return groupId;
	}

	public void setGroupId(Integer groupId) {
		this.groupId = groupId;
	}

	public Date getCreateDate() {
		return this.createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Integer getCreateUserId() {
		return this.createUserId;
	}

	public void setCreateUserId(Integer createUserId) {
		this.createUserId = createUserId;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getUpdateDate() {
		return this.updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public Integer getUpdateUserId() {
		return this.updateUserId;
	}

	public void setUpdateUserId(Integer updateUserId) {
		this.updateUserId = updateUserId;
	}

	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((createDate == null) ? 0 : createDate.hashCode());
		result = prime * result
				+ ((createUserId == null) ? 0 : createUserId.hashCode());
		result = prime * result + ((groupId == null) ? 0 : groupId.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
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
		Group other = (Group) obj;
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
		if (groupId == null) {
			if (other.groupId != null)
				return false;
		} else if (!groupId.equals(other.groupId))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Group [id=" + groupId + ", createDate=" + createDate
				+ ", createUserId=" + createUserId + ", name=" + name
				+ ", updateDate=" + updateDate + ", updateUserId="
				+ updateUserId + "]";
	}

}