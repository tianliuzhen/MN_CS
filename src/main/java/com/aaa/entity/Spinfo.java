package com.aaa.entity;

public class Spinfo {
	private Integer spId;
	private String spImage;
	private String spBarCode;
	private String spName;
	private Integer gsId;
	private Integer glId;
	private Integer gmId;
	private Integer sptId;
	private Integer whId;
	private String spSalePrice;
	private String spBuyPrice;
	private String spDisPrice;
	private String spDisBegdate;
	private String spDisEndDdate;
	private Integer gdId;
	private Integer dpId;
	private Integer anId;
	private Integer bnId;
	private String spStatu;
	private Integer rtPeriod;
	private Integer spAllNum;
	private Integer spDnNum;
	public Integer getSpId() {
		return spId;
	}
	public void setSpId(Integer spId) {
		this.spId = spId;
	}
	public String getSpImage() {
		return spImage;
	}
	public void setSpImage(String spImage) {
		this.spImage = spImage;
	}
	public String getSpBarCode() {
		return spBarCode;
	}
	public void setSpBarCode(String spBarCode) {
		this.spBarCode = spBarCode;
	}
	public String getSpName() {
		return spName;
	}
	public void setSpName(String spName) {
		this.spName = spName;
	}
	public Integer getGsId() {
		return gsId;
	}
	public void setGsId(Integer gsId) {
		this.gsId = gsId;
	}
	public Integer getGlId() {
		return glId;
	}
	public void setGlId(Integer glId) {
		this.glId = glId;
	}
	public Integer getGmId() {
		return gmId;
	}
	public void setGmId(Integer gmId) {
		this.gmId = gmId;
	}
	public Integer getSptId() {
		return sptId;
	}
	public void setSptId(Integer sptId) {
		this.sptId = sptId;
	}
	public Integer getWhId() {
		return whId;
	}
	public void setWhId(Integer whId) {
		this.whId = whId;
	}
	public String getSpSalePrice() {
		return spSalePrice;
	}
	public void setSpSalePrice(String spSalePrice) {
		this.spSalePrice = spSalePrice;
	}
	public String getSpBuyPrice() {
		return spBuyPrice;
	}
	public void setSpBuyPrice(String spBuyPrice) {
		this.spBuyPrice = spBuyPrice;
	}
	public String getSpDisPrice() {
		return spDisPrice;
	}
	public void setSpDisPrice(String spDisPrice) {
		this.spDisPrice = spDisPrice;
	}
	public String getSpDisBegdate() {
		return spDisBegdate;
	}
	public void setSpDisBegdate(String spDisBegdate) {
		this.spDisBegdate = spDisBegdate;
	}
	public String getSpDisEndDdate() {
		return spDisEndDdate;
	}
	public void setSpDisEndDdate(String spDisEndDdate) {
		this.spDisEndDdate = spDisEndDdate;
	}
	public Integer getGdId() {
		return gdId;
	}
	public void setGdId(Integer gdId) {
		this.gdId = gdId;
	}
	public Integer getDpId() {
		return dpId;
	}
	public void setDpId(Integer dpId) {
		this.dpId = dpId;
	}
	public Integer getAnId() {
		return anId;
	}
	public void setAnId(Integer anId) {
		this.anId = anId;
	}
	public Integer getBnId() {
		return bnId;
	}
	public void setBnId(Integer bnId) {
		this.bnId = bnId;
	}
	public String getSpStatu() {
		return spStatu;
	}
	public void setSpStatu(String spStatu) {
		this.spStatu = spStatu;
	}
	public Integer getRtPeriod() {
		return rtPeriod;
	}
	public void setRtPeriod(Integer rtPeriod) {
		this.rtPeriod = rtPeriod;
	}
	public Integer getSpAllNum() {
		return spAllNum;
	}
	public void setSpAllNum(Integer spAllNum) {
		this.spAllNum = spAllNum;
	}
	public Integer getSpDnNum() {
		return spDnNum;
	}
	public void setSpDnNum(Integer spDnNum) {
		this.spDnNum = spDnNum;
	}
	@Override
	public String toString() {
		return "Spinfo [spId=" + spId + ", spImage=" + spImage + ", spBarCode="
				+ spBarCode + ", spName=" + spName + ", gsId=" + gsId
				+ ", glId=" + glId + ", gmId=" + gmId + ", sptId=" + sptId
				+ ", whId=" + whId + ", spSalePrice=" + spSalePrice
				+ ", spBuyPrice=" + spBuyPrice + ", spDisPrice=" + spDisPrice
				+ ", spDisBegdate=" + spDisBegdate + ", spDisEndDdate="
				+ spDisEndDdate + ", gdId=" + gdId + ", dpId=" + dpId
				+ ", anId=" + anId + ", bnId=" + bnId + ", spStatu=" + spStatu
				+ ", rtPeriod=" + rtPeriod + ", spAllNum=" + spAllNum
				+ ", spDnNum=" + spDnNum + "]";
	}
	public Spinfo(Integer spId, String spImage, String spBarCode,
			String spName, Integer gsId, Integer glId, Integer gmId,
			Integer sptId, Integer whId, String spSalePrice, String spBuyPrice,
			String spDisPrice, String spDisBegdate, String spDisEndDdate,
			Integer gdId, Integer dpId, Integer anId, Integer bnId,
			String spStatu, Integer rtPeriod, Integer spAllNum, Integer spDnNum) {
		super();
		this.spId = spId;
		this.spImage = spImage;
		this.spBarCode = spBarCode;
		this.spName = spName;
		this.gsId = gsId;
		this.glId = glId;
		this.gmId = gmId;
		this.sptId = sptId;
		this.whId = whId;
		this.spSalePrice = spSalePrice;
		this.spBuyPrice = spBuyPrice;
		this.spDisPrice = spDisPrice;
		this.spDisBegdate = spDisBegdate;
		this.spDisEndDdate = spDisEndDdate;
		this.gdId = gdId;
		this.dpId = dpId;
		this.anId = anId;
		this.bnId = bnId;
		this.spStatu = spStatu;
		this.rtPeriod = rtPeriod;
		this.spAllNum = spAllNum;
		this.spDnNum = spDnNum;
	}
	public Spinfo() {
		super();
		// TODO Auto-generated constructor stub
	}

}
