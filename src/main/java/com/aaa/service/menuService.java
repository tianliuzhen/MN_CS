package com.aaa.service;

import java.util.List;
import java.util.Map;

import com.aaa.entity.Menus;
import com.aaa.entity.Officeclerk;
import com.aaa.entity.Role;
import com.aaa.entity.Treemenu;
import com.aaa.entity.rtMiddle;

public interface menuService {
	 public List<Menus> getTree(String realname);
	  public List<Menus> getTreelast();
	    public Officeclerk backLogin(Officeclerk ok);
	    public List<Map>  test();
	    
	    /*
	     * 角色管理1
	     * */
	    public List<Map> selectRole();//查询角色
	   	public boolean addRole(Role r);//添加角色
	   	public boolean deleteRole(Role r);//删除角色
	   	public boolean updateRole(Role r);//更新角色
	    public List<Menus>  getTree2(Integer roleid);//根据角色获取权限
	    
	    public boolean addRtmiddle(rtMiddle m);//添加Rtmiddle(角色权限角色关系表)
		public boolean deleteRtmiddle(rtMiddle m);//删除Rtmiddle(角色权限角色关系表)
		
		 
	    /*
	     * 菜单管理
	     * */
		
		 public boolean updateTreeMenu(List<Map> list);//修改菜单
		    public boolean addtreeMenu(List<Map> list);//添加菜单
		    public boolean deleteTreeMenu(List<Map> list);//删除菜单
		    public Integer getMaxtreeId();//获取最大菜单节点
		
}
