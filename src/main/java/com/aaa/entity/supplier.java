package com.aaa.entity;

public class supplier {
  private int supId;
  private String supName;
  private String supAddress;
  private String supPhone;
  private String supState;
public int getSupId() {
	return supId;
}
public void setSupId(int supId) {
	this.supId = supId;
}
public String getSupName() {
	return supName;
}
public void setSupName(String supName) {
	this.supName = supName;
}
public String getSupAddress() {
	return supAddress;
}
public void setSupAddress(String supAddress) {
	this.supAddress = supAddress;
}
public String getSupPhone() {
	return supPhone;
}
public void setSupPhone(String supPhone) {
	this.supPhone = supPhone;
}
public String getSupState() {
	return supState;
}
public void setSupState(String supState) {
	this.supState = supState;
}
public supplier(int supId, String supName, String supAddress, String supPhone,
		String supState) {
	super();
	this.supId = supId;
	this.supName = supName;
	this.supAddress = supAddress;
	this.supPhone = supPhone;
	this.supState = supState;
}
public supplier() {
	super();
	// TODO Auto-generated constructor stub
}
  
}
