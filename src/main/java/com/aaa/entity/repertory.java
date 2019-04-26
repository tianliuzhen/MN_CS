package com.aaa.entity;

public class repertory {
	private Integer rtId;
	private Integer spId;
	private Integer rtNumber;
	private String rtPrice;
	private Integer whId;
	private String rtbegDate;
	private String rtPeriod;
	private String rtEndDate;
	private String rtStatus;
	public Integer getRtId() {
		return rtId;
	}
	public void setRtId(Integer rtId) {
		this.rtId = rtId;
	}
	public Integer getSpId() {
		return spId;
	}
	public void setSpId(Integer spId) {
		this.spId = spId;
	}
	public Integer getRtNumber() {
		return rtNumber;
	}
	public void setRtNumber(Integer rtNumber) {
		this.rtNumber = rtNumber;
	}
	public String getRtPrice() {
		return rtPrice;
	}
	public void setRtPrice(String rtPrice) {
		this.rtPrice = rtPrice;
	}
	public Integer getWhId() {
		return whId;
	}
	public void setWhId(Integer whId) {
		this.whId = whId;
	}
	public String getRtbegDate() {
		return rtbegDate;
	}
	public void setRtbegDate(String rtbegDate) {
		this.rtbegDate = rtbegDate;
	}
	public String getRtPeriod() {
		return rtPeriod;
	}
	public void setRtPeriod(String rtPeriod) {
		this.rtPeriod = rtPeriod;
	}
	public String getRtEndDate() {
		return rtEndDate;
	}
	public void setRtEndDate(String rtEndDate) {
		this.rtEndDate = rtEndDate;
	}
	public String getRtStatus() {
		return rtStatus;
	}
	public void setRtStatus(String rtStatus) {
		this.rtStatus = rtStatus;
	}
	@Override
	public String toString() {
		return "repertory [rtId=" + rtId + ", spId=" + spId + ", rtNumber="
				+ rtNumber + ", rtPrice=" + rtPrice + ", whId=" + whId
				+ ", rtbegDate=" + rtbegDate + ", rtPeriod=" + rtPeriod
				+ ", rtEndDate=" + rtEndDate + ", rtStatus=" + rtStatus + "]";
	}
	public repertory() {
		super();
		// TODO Auto-generated constructor stub
	}
	public repertory(Integer rtId, Integer spId, Integer rtNumber,
			String rtPrice, Integer whId, String rtbegDate, String rtPeriod,
			String rtEndDate, String rtStatus) {
		super();
		this.rtId = rtId;
		this.spId = spId;
		this.rtNumber = rtNumber;
		this.rtPrice = rtPrice;
		this.whId = whId;
		this.rtbegDate = rtbegDate;
		this.rtPeriod = rtPeriod;
		this.rtEndDate = rtEndDate;
		this.rtStatus = rtStatus;
	}
	
	}
