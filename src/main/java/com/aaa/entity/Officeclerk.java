package com.aaa.entity;

import java.sql.Timestamp;

/**
 * Officeclerk entity. @author MyEclipse Persistence Tools
 */

public class Officeclerk implements java.io.Serializable {

	// Fields

	private Integer ocId;
	private String ocName;
	private String ocRealName;
	private String ocPassword;
	private Timestamp ocEntryTime;
	private String ocSex;
	private String ocAge;
	private String ocBrithday;
	private Integer dpId;
	private Integer roleId;
	private String ocPhone;
	private String ocAddress;
    private String ocPhoto;
    private String ocFlag;
	// Constructors

	/** default constructor */
	public Officeclerk() {
	}

	/** minimal constructor */
	public Officeclerk(Integer roleId) {
		this.roleId = roleId;
	}

	/** full constructor */
	public Officeclerk(String ocName, String ocRealName, String ocPassword,
			Timestamp ocEntryTime, String ocSex, String ocAge,
			String ocBrithday, Integer dpId, Integer roleId, String ocPhone,
			String ocAddress) {
		this.ocName = ocName;
		this.ocRealName = ocRealName;
		this.ocPassword = ocPassword;
		this.ocEntryTime = ocEntryTime;
		this.ocSex = ocSex;
		this.ocAge = ocAge;
		this.ocBrithday = ocBrithday;
		this.dpId = dpId;
		this.roleId = roleId;
		this.ocPhone = ocPhone;
		this.ocAddress = ocAddress;
	}

	// Property accessors

	public Integer getOcId() {
		return this.ocId;
	}

	public void setOcId(Integer ocId) {
		this.ocId = ocId;
	}

	public String getOcName() {
		return this.ocName;
	}

	public void setOcName(String ocName) {
		this.ocName = ocName;
	}

	public String getOcRealName() {
		return this.ocRealName;
	}

	public void setOcRealName(String ocRealName) {
		this.ocRealName = ocRealName;
	}

	public String getOcPassword() {
		return this.ocPassword;
	}

	public void setOcPassword(String ocPassword) {
		this.ocPassword = ocPassword;
	}

	public Timestamp getOcEntryTime() {
		return this.ocEntryTime;
	}

	public void setOcEntryTime(Timestamp ocEntryTime) {
		this.ocEntryTime = ocEntryTime;
	}

	public String getOcSex() {
		return this.ocSex;
	}

	public void setOcSex(String ocSex) {
		this.ocSex = ocSex;
	}

	public String getOcAge() {
		return this.ocAge;
	}

	public void setOcAge(String ocAge) {
		this.ocAge = ocAge;
	}

	public String getOcBrithday() {
		return this.ocBrithday;
	}

	public void setOcBrithday(String ocBrithday) {
		this.ocBrithday = ocBrithday;
	}

	public Integer getDpId() {
		return this.dpId;
	}

	public void setDpId(Integer dpId) {
		this.dpId = dpId;
	}

	public Integer getRoleId() {
		return this.roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	public String getOcPhone() {
		return this.ocPhone;
	}

	public void setOcPhone(String ocPhone) {
		this.ocPhone = ocPhone;
	}

	public String getOcAddress() {
		return this.ocAddress;
	}

	public void setOcAddress(String ocAddress) {
		this.ocAddress = ocAddress;
	}

}