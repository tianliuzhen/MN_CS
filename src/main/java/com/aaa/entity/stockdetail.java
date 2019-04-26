package com.aaa.entity;

public class stockdetail {
  private int sdId;
  private int stkId;
  private int spId;
  private String spName;
  private int spNumber;
  private int spNumberdan;
  private int supId;
  private int gmId;
  private int gmIdMark;
  
  public int getSpNumberdan() {
	return spNumberdan;
}
public void setSpNumberdan(int spNumberdan) {
	this.spNumberdan = spNumberdan;
}
public int getGmId() {
	return gmId;
}
public void setGmId(int gmId) {
	this.gmId = gmId;
}
public int getGmIdMark() {
	return gmIdMark;
}
public void setGmIdMark(int gmIdMark) {
	this.gmIdMark = gmIdMark;
}
public int getSupId() {
	return supId;
}
public void setSupId(int supId) {
	this.supId = supId;
}
private Double spPrice;
  private int whId;
  private Double sdDebt;
  private Double sumMoney;
  private String rtbegDate;
  private String rtPeriod;
  private String rtEndDate;
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
public int getSdId() {
	return sdId;
}
public void setSdId(int sdId) {
	this.sdId = sdId;
}
public int getStkId() {
	return stkId;
}
public void setStkId(int stkId) {
	this.stkId = stkId;
}
public int getSpId() {
	return spId;
}
public void setSpId(int spId) {
	this.spId = spId;
}
public String getSpName() {
	return spName;
}
public void setSpName(String spName) {
	this.spName = spName;
}
public int getSpNumber() {
	return spNumber;
}
public void setSpNumber(int spNumber) {
	this.spNumber = spNumber;
}
public Double getSpPrice() {
	return spPrice;
}
public void setSpPrice(Double spPrice) {
	this.spPrice = spPrice;
}
public int getWhId() {
	return whId;
}
public void setWhId(int whId) {
	this.whId = whId;
}
public Double getSdDebt() {
	return sdDebt;
}
public void setSdDebt(Double sdDebt) {
	this.sdDebt = sdDebt;
}
public Double getSumMoney() {
	return sumMoney;
}
public void setSumMoney(Double sumMoney) {
	this.sumMoney = sumMoney;
} 
public stockdetail() {
	super();
	// TODO Auto-generated constructor stub
}
public stockdetail(int sdId, int stkId, int spId, String spName, int spNumber,
		Double spPrice, int whId, Double sdDebt, Double sumMoney,
		String rtbegDate, String rtPeriod, String rtEndDate) {
	super();
	this.sdId = sdId;
	this.stkId = stkId;
	this.spId = spId;
	this.spName = spName;
	this.spNumber = spNumber;
	this.spPrice = spPrice;
	this.whId = whId;
	this.sdDebt = sdDebt;
	this.sumMoney = sumMoney;
	this.rtbegDate = rtbegDate;
	this.rtPeriod = rtPeriod;
	this.rtEndDate = rtEndDate;
} 
}
