package com.aaa.entity;

import java.util.List;
import java.util.Map;

import javassist.compiler.ast.Keyword;

public class BasePojo {
    private Map map;
    private List<Map> list;
//    封装常用参数
    private String keyWord;
    private Integer pageNum;
    private Integer limit;
    private Integer status;
    private Integer stkId;
    private String dateOne;
    private String dateTwo;
	private String danger;
	public Map getMap() {
		return map;
	}
	public void setMap(Map map) {
		this.map = map;
	}
	public List<Map> getList() {
		return list;
	}
	public void setList(List<Map> list) {
		this.list = list;
	}
	public String getKeyWord() {
		return keyWord;
	}
	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}
	public Integer getPageNum() {
		return pageNum;
	}
	public void setPageNum(Integer pageNum) {
		this.pageNum = pageNum;
	}
	public Integer getLimit() {
		return limit;
	}
	public void setLimit(Integer limit) {
		this.limit = limit;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Integer getStkId() {
		return stkId;
	}
	public void setStkId(Integer stkId) {
		this.stkId = stkId;
	}
	public String getDateOne() {
		return dateOne;
	}
	public void setDateOne(String dateOne) {
		this.dateOne = dateOne;
	}
	public String getDateTwo() {
		return dateTwo;
	}
	public void setDateTwo(String dateTwo) {
		this.dateTwo = dateTwo;
	}
	public String getDanger() {
		return danger;
	}
	public void setDanger(String danger) {
		this.danger = danger;
	}
	@Override
	public String toString() {
		return "BasePojo [map=" + map + ", list=" + list + ", keyWord="
				+ keyWord + ", pageNum=" + pageNum + ", limit=" + limit
				+ ", status=" + status + ", stkId=" + stkId + ", dateOne="
				+ dateOne + ", dateTwo=" + dateTwo + ", danger=" + danger + "]";
	}
	

}
