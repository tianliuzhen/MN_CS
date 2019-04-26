package com.aaa.entity;

public class stock {
   private int  stkId;
   private int ocId;
   private String stkDate;
   private int supId;
   private int Stauts;
   private int ppId;
   private String NoReason;
   private String checkDate;
   private String checkDate2;
   private String checkDateReason;
   private String checkDate2Reason;
   public String getCheckDate2() {
	return checkDate2;
}
public void setCheckDate2(String checkDate2) {
	this.checkDate2 = checkDate2;
}
public String getCheckDateReason() {
	return checkDateReason;
}
public void setCheckDateReason(String checkDateReason) {
	this.checkDateReason = checkDateReason;
}
public String getCheckDate2Reason() {
	return checkDate2Reason;
}
public void setCheckDate2Reason(String checkDate2Reason) {
	this.checkDate2Reason = checkDate2Reason;
}
private String purDate;
   
public int getStkId() {
	return stkId;
}
public void setStkId(int stkId) {
	this.stkId = stkId;
}
public String getCheckDate() {
	return checkDate;
}
public void setCheckDate(String checkDate) {
	this.checkDate = checkDate;
}
public String getPurDate() {
	return purDate;
}
public void setPurDate(String purDate) {
	this.purDate = purDate;
}
 
public int getOcId() {
	return ocId;
}
public void setOcId(int ocId) {
	this.ocId = ocId;
}
public String getStkDate() {
	return stkDate;
}
public void setStkDate(String stkDate) {
	this.stkDate = stkDate;
}
public int getSupId() {
	return supId;
}
public void setSupId(int supId) {
	this.supId = supId;
}
public int getStauts() {
	return Stauts;
}
public void setStauts(int stauts) {
	Stauts = stauts;
}

public int getPpId() {
	return ppId;
}
public void setPpId(int ppId) {
	this.ppId = ppId;
}
public String getNoReason() {
	return NoReason;
}
public void setNoReason(String noReason) {
	NoReason = noReason;
}
  
public stock(int stkId, int ocId, String stkDate, int supId, int stauts,
		int ppId, String noReason, String checkDate, String checkDate2,
		String checkDateReason, String checkDate2Reason, String purDate) {
	super();
	this.stkId = stkId;
	this.ocId = ocId;
	this.stkDate = stkDate;
	this.supId = supId;
	Stauts = stauts;
	this.ppId = ppId;
	NoReason = noReason;
	this.checkDate = checkDate;
	this.checkDate2 = checkDate2;
	this.checkDateReason = checkDateReason;
	this.checkDate2Reason = checkDate2Reason;
	this.purDate = purDate;
}
public stock() {
	super();
	// TODO Auto-generated constructor stub
}
@Override
public String toString() {
	return "stock [stkId=" + stkId + ", ocId=" + ocId + ", stkDate=" + stkDate
			+ ", supId=" + supId + ", Stauts=" + Stauts + ", ppId=" + ppId
			+ ", NoReason=" + NoReason + "]";
}
 
   
}
