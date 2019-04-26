package com.aaa.entity;

public class backsale {
	  private int bsId;
	  private String bsDate;
	  private int btauts;
	  private int ocId;
	  private String NoReason;
	  private String  checkDate;
	  
	public String getCheckDate() {
		return checkDate;
	}
	public void setCheckDate(String checkDate) {
		this.checkDate = checkDate;
	}
	public int getBsId() {
		return bsId;
	}
	public void setBsId(int bsId) {
		this.bsId = bsId;
	}
	public String getBsDate() {
		return bsDate;
	}
	public void setBsDate(String bsDate) {
		this.bsDate = bsDate;
	}
	public int getBtauts() {
		return btauts;
	}
	public void setBtauts(int btauts) {
		this.btauts = btauts;
	}
	public int getOcId() {
		return ocId;
	}
	public void setOcId(int ocId) {
		this.ocId = ocId;
	}
	public String getNoReason() {
		return NoReason;
	}
	public void setNoReason(String noReason) {
		NoReason = noReason;
	}
	@Override
	public String toString() {
		return "backsale [bsId=" + bsId + ", bsDate=" + bsDate + ", btauts="
				+ btauts + ", ocId=" + ocId + ", NoReason=" + NoReason + "]";
	}
	public backsale() {
		super();
		// TODO Auto-generated constructor stub
	}
	public backsale(int bsId, String bsDate, int btauts, int ocId,
			String noReason) {
		super();
		this.bsId = bsId;
		this.bsDate = bsDate;
		this.btauts = btauts;
		this.ocId = ocId;
		NoReason = noReason;
	}
	  
}
