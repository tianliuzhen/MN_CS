package com.aaa.entity;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Menus {
	private Integer menuid;//加载id
	private String menuname;//显示文本内容
	private int parent;//父级元素id
	private String treeStyle;
	private Map<String,String> url=new HashMap<String,String>(0);//:存储url属性的 
	private List<Menus> menus= new ArrayList<Menus>(0);//: 子菜单
	public Integer getMenuid() {
		return menuid;
	}
	public void setMenuid(Integer menuid) {
		this.menuid = menuid;
	}
	public String getMenuname() {
		return menuname;
	}
	public void setMenuname(String menuname) {
		this.menuname = menuname;
	}
	public int getParent() {
		return parent;
	}
	public void setParent(int parent) {
		this.parent = parent;
	}
	public String getTreeStyle() {
		return treeStyle;
	}
	public void setTreeStyle(String treeStyle) {
		this.treeStyle = treeStyle;
	}
	public Map<String, String> getUrl() {
		return url;
	}
	public void setUrl(Map<String, String> url) {
		this.url = url;
	}
	public List<Menus> getMenus() {
		return menus;
	}
	public void setMenus(List<Menus> menus) {
		this.menus = menus;
	}
	public Menus() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Menus(Integer menuid, String menuname, int parent, String treeStyle,
			Map<String, String> url, List<Menus> menus) {
		super();
		this.menuid = menuid;
		this.menuname = menuname;
		this.parent = parent;
		this.treeStyle = treeStyle;
		this.url = url;
		this.menus = menus;
	}
	
	
	
	
}
