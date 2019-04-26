package com.aaa.entity;

public class StockSetPoint {
	private Integer sspId;
	private String sspDate;
	private Integer whId;
	private Integer	spId;
	private Integer	sspNum;
	private Integer	sspDamageNum;
	private Integer	sspLackMonery;
	private Integer	ocId;
	@Override
	public String toString() {
		return "StockSetPoint [sspId=" + sspId + ", sspDate=" + sspDate
				+ ", whId=" + whId + ", spId=" + spId + ", sspNum=" + sspNum
				+ ", sspDamageNum=" + sspDamageNum + ", sspLackMonery="
				+ sspLackMonery + ", ocId=" + ocId + "]";
	}
	public Integer getSspId() {
		return sspId;
	}
	public void setSspId(Integer sspId) {
		this.sspId = sspId;
	}
	public String getSspDate() {
		return sspDate;
	}
	public void setSspDate(String sspDate) {
		this.sspDate = sspDate;
	}
	public Integer getWhId() {
		return whId;
	}
	public void setWhId(Integer whId) {
		this.whId = whId;
	}
	public Integer getSpId() {
		return spId;
	}
	public void setSpId(Integer spId) {
		this.spId = spId;
	}
	public Integer getSspNum() {
		return sspNum;
	}
	public void setSspNum(Integer sspNum) {
		this.sspNum = sspNum;
	}
	public Integer getSspDamageNum() {
		return sspDamageNum;
	}
	public void setSspDamageNum(Integer sspDamageNum) {
		this.sspDamageNum = sspDamageNum;
	}
	public Integer getSspLackMonery() {
		return sspLackMonery;
	}
	public void setSspLackMonery(Integer sspLackMonery) {
		this.sspLackMonery = sspLackMonery;
	}
	public Integer getOcId() {
		return ocId;
	}
	public void setOcId(Integer ocId) {
		this.ocId = ocId;
	}
	public StockSetPoint() {
		super();
		// TODO Auto-generated constructor stub
	}
	public StockSetPoint(Integer sspId, String sspDate, Integer whId,
			Integer spId, Integer sspNum, Integer sspDamageNum,
			Integer sspLackMonery, Integer ocId) {
		super();
		this.sspId = sspId;
		this.sspDate = sspDate;
		this.whId = whId;
		this.spId = spId;
		this.sspNum = sspNum;
		this.sspDamageNum = sspDamageNum;
		this.sspLackMonery = sspLackMonery;
		this.ocId = ocId;
	}
	
}
