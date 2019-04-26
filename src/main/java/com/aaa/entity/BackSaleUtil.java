package com.aaa.entity;

public class BackSaleUtil {
	   private int    bsuUtilId;
	   private int   bsId ;
	   private int   spid ;
	   private int   bsuNum ;
	   private int   sptId ;
	   private int   whid ;
	   private String  BsReason;
	   private Double  bsuPrice;
	   private Double  bsuAllMonery;
	   private String bsgName;
	   private int rtId;
	    
	public int getRtId() {
		return rtId;
	}
	public void setRtId(int rtId) {
		this.rtId = rtId;
	}
	public String getBsgName() {
		return bsgName;
	}
	public void setBsgName(String bsgName) {
		this.bsgName = bsgName;
	}
	public int getBsuUtilId() {
		return bsuUtilId;
	}
	public void setBsuUtilId(int bsuUtilId) {
		this.bsuUtilId = bsuUtilId;
	}
	public int getBsId() {
		return bsId;
	}
	public void setBsId(int bsId) {
		this.bsId = bsId;
	}
	public int getSpid() {
		return spid;
	}
	public void setSpid(int spid) {
		this.spid = spid;
	}
	public int getBsuNum() {
		return bsuNum;
	}
	public void setBsuNum(int bsuNum) {
		this.bsuNum = bsuNum;
	}
	public int getSptId() {
		return sptId;
	}
	public void setSptId(int sptId) {
		this.sptId = sptId;
	}
	public int getWhid() {
		return whid;
	}
	public void setWhid(int whid) {
		this.whid = whid;
	}
	public String getBsReason() {
		return BsReason;
	}
	public void setBsReason(String bsReason) {
		BsReason = bsReason;
	}
	public Double getBsuPrice() {
		return bsuPrice;
	}
	public void setBsuPrice(Double bsuPrice) {
		this.bsuPrice = bsuPrice;
	}
	public Double getBsuAllMonery() {
		return bsuAllMonery;
	}
	public void setBsuAllMonery(Double bsuAllMonery) {
		this.bsuAllMonery = bsuAllMonery;
	}
	@Override
	public String toString() {
		return "BackSaleUtil [bsuUtilId=" + bsuUtilId + ", bsId=" + bsId
				+ ", spid=" + spid + ", bsuNum=" + bsuNum + ", sptId=" + sptId
				+ ", whid=" + whid + ", BsReason=" + BsReason + ", bsuPrice="
				+ bsuPrice + ", bsuAllMonery=" + bsuAllMonery + "]";
	}
	public BackSaleUtil() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BackSaleUtil(int bsuUtilId, int bsId, int spid, int bsuNum,
			int sptId, int whid, String bsReason, Double bsuPrice,
			Double bsuAllMonery) {
		super();
		this.bsuUtilId = bsuUtilId;
		this.bsId = bsId;
		this.spid = spid;
		this.bsuNum = bsuNum;
		this.sptId = sptId;
		this.whid = whid;
		BsReason = bsReason;
		this.bsuPrice = bsuPrice;
		this.bsuAllMonery = bsuAllMonery;
	}
	
	   
}
