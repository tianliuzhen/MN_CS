package com.aaa.entity;

public class OutwareHouseUtil {
	private Integer owUtilId;
	private Integer spid;
	private Integer owuPrice;
	private Integer owuNum;
	private Integer owuAllMonery;
	private Integer sptId;
	private String owreason;
	private Integer whId;
	private Integer ocId;
	private String owDate;
	public Integer getOwUtilId() {
		return owUtilId;
	}
	public void setOwUtilId(Integer owUtilId) {
		this.owUtilId = owUtilId;
	}
	public Integer getSpid() {
		return spid;
	}
	public void setSpid(Integer spid) {
		this.spid = spid;
	}
	public Integer getOwuPrice() {
		return owuPrice;
	}
	public void setOwuPrice(Integer owuPrice) {
		this.owuPrice = owuPrice;
	}
	public Integer getOwuNum() {
		return owuNum;
	}
	public void setOwuNum(Integer owuNum) {
		this.owuNum = owuNum;
	}
	public Integer getOwuAllMonery() {
		return owuAllMonery;
	}
	public void setOwuAllMonery(Integer owuAllMonery) {
		this.owuAllMonery = owuAllMonery;
	}
	public Integer getSptId() {
		return sptId;
	}
	public void setSptId(Integer sptId) {
		this.sptId = sptId;
	}
	public String getOwreason() {
		return owreason;
	}
	public void setOwreason(String owreason) {
		this.owreason = owreason;
	}
	public Integer getWhId() {
		return whId;
	}
	public void setWhId(Integer whId) {
		this.whId = whId;
	}
	public Integer getOcId() {
		return ocId;
	}
	public void setOcId(Integer ocId) {
		this.ocId = ocId;
	}
	public String getOwDate() {
		return owDate;
	}
	public void setOwDate(String owDate) {
		this.owDate = owDate;
	}
	@Override
	public String toString() {
		return "OutwareHouseUtil [owUtilId=" + owUtilId + ", spid=" + spid
				+ ", owuPrice=" + owuPrice + ", owuNum=" + owuNum
				+ ", owuAllMonery=" + owuAllMonery + ", sptId=" + sptId
				+ ", owreason=" + owreason + ", whId=" + whId + ", ocId="
				+ ocId + ", owDate=" + owDate + "]";
	}
	public OutwareHouseUtil() {
		super();
		// TODO Auto-generated constructor stub
	}
	public OutwareHouseUtil(Integer owUtilId, Integer spid, Integer owuPrice,
			Integer owuNum, Integer owuAllMonery, Integer sptId,
			String owreason, Integer whId, Integer ocId, String owDate) {
		super();
		this.owUtilId = owUtilId;
		this.spid = spid;
		this.owuPrice = owuPrice;
		this.owuNum = owuNum;
		this.owuAllMonery = owuAllMonery;
		this.sptId = sptId;
		this.owreason = owreason;
		this.whId = whId;
		this.ocId = ocId;
		this.owDate = owDate;
	}
	
	
}
