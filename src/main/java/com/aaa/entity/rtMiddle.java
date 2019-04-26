package com.aaa.entity;

/**
 * MiddleId entity. @author MyEclipse Persistence Tools
 */

public class rtMiddle implements java.io.Serializable {

	// Fields

	private Integer roleId;
	private Integer treeId;

	// Constructors

	/** default constructor */
	public rtMiddle() {
	}

	/** full constructor */
	public rtMiddle(Integer roleId, Integer treeId) {
		this.roleId = roleId;
		this.treeId = treeId;
	}

	// Property accessors

	public Integer getRoleId() {
		return this.roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	public Integer getTreeId() {
		return this.treeId;
	}

	public void setTreeId(Integer treeId) {
		this.treeId = treeId;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof rtMiddle))
			return false;
		rtMiddle castOther = (rtMiddle) other;

		return ((this.getRoleId() == castOther.getRoleId()) || (this
				.getRoleId() != null && castOther.getRoleId() != null && this
				.getRoleId().equals(castOther.getRoleId())))
				&& ((this.getTreeId() == castOther.getTreeId()) || (this
						.getTreeId() != null && castOther.getTreeId() != null && this
						.getTreeId().equals(castOther.getTreeId())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getRoleId() == null ? 0 : this.getRoleId().hashCode());
		result = 37 * result
				+ (getTreeId() == null ? 0 : this.getTreeId().hashCode());
		return result;
	}

}