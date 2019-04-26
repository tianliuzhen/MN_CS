package com.aaa.entity;

public class SpinfoType {
private Integer sptId;
private String sptName;
private String sptImage;
public Integer getSptId() {
	return sptId;
}
public void setSptId(Integer sptId) {
	this.sptId = sptId;
}
public String getSptName() {
	return sptName;
}
public void setSptName(String sptName) {
	this.sptName = sptName;
}
public String getSptImage() {
	return sptImage;
}
public void setSptImage(String sptImage) {
	this.sptImage = sptImage;
}
@Override
public String toString() {
	return "SpinfoType [sptId=" + sptId + ", sptName=" + sptName
			+ ", sptImage=" + sptImage + "]";
}
public SpinfoType(Integer sptId, String sptName, String sptImage) {
	super();
	this.sptId = sptId;
	this.sptName = sptName;
	this.sptImage = sptImage;
}
public SpinfoType() {
	super();
	// TODO Auto-generated constructor stub
}

}
