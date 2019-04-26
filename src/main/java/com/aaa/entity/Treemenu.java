package com.aaa.entity;

/**
 * Treemenu entity. @author MyEclipse Persistence Tools
 */

public class Treemenu implements java.io.Serializable {

	// Fields

	private Integer treeId;
	private String treeName;
	private String treeUrl;
	private Integer treeParent;
	private String treeStyle;
	// Constructors
	public Integer getTreeId() {
		return treeId;
	}
	public void setTreeId(Integer treeId) {
		this.treeId = treeId;
	}
	public String getTreeName() {
		return treeName;
	}
	public void setTreeName(String treeName) {
		this.treeName = treeName;
	}
	public String getTreeUrl() {
		return treeUrl;
	}
	public void setTreeUrl(String treeUrl) {
		this.treeUrl = treeUrl;
	}
	public Integer getTreeParent() {
		return treeParent;
	}
	public void setTreeParent(Integer treeParent) {
		this.treeParent = treeParent;
	}
	public String getTreeStyle() {
		return treeStyle;
	}
	public void setTreeStyle(String treeStyle) {
		this.treeStyle = treeStyle;
	}
	public Treemenu(Integer treeId, String treeName, String treeUrl,
			Integer treeParent, String treeStyle) {
		super();
		this.treeId = treeId;
		this.treeName = treeName;
		this.treeUrl = treeUrl;
		this.treeParent = treeParent;
		this.treeStyle = treeStyle;
	}
	public Treemenu() {
		super();
		// TODO Auto-generated constructor stub
	}

	
}