package com.seaport.domain;

import java.sql.Timestamp;
import javax.persistence.Column;

public abstract class AuthDO {
	
	@Column(name = "create_user_id")
	private Integer createUserId;

	@Column(name = "CREATE_DATE", nullable = false)
	private Timestamp createDate;
	
	@Column(name = "update_user_id")
	private Integer updateUserId;

	@Column(name = "LAST_UPDATE_DATE", nullable = false)
	private Timestamp updateDate;

	public Integer getCreateUserId() {
		return createUserId;
	}

	public void setCreateUserId(Integer createUserId) {
		this.createUserId = createUserId;
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
	
	
}
