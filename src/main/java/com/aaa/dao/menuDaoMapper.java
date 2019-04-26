package com.aaa.dao;

import com.aaa.entity.Officeclerk;
import com.aaa.entity.Role;
import com.aaa.entity.Treemenu;
import com.aaa.entity.rtMiddle;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface menuDaoMapper {
    public List<Treemenu> getTree(@Param("ocname")String realname);
    public List<Treemenu> getTreelast();
    public Officeclerk backLogin(Officeclerk ok);
    public List<Map>  test();
    
    
    /*
     * 角色管理
     * */
    public List<Map> selectRole();//查询角色
   	public boolean addRole(Role r);//添加角色
   	public boolean deleteRole(Role r);//删除角色
   	public boolean updateRole(Role r);//更新角色
   
   	
    public List<Treemenu> getTree2(Integer roleid);//查看权限对应权限
    
    public boolean addRtmiddle(rtMiddle m);//添加Rtmiddle(角色权限角色关系表)
	public boolean deleteRtmiddle(rtMiddle m);//删除Rtmiddle(角色权限角色关系表)
	
	 /*
     * 菜单管理
     * */
	
	    public boolean addtreeMenu(List<Map> list);//添加菜单
	    public boolean deleteTreeMenu(List<Map> list);//删除菜单
	    public boolean updateTreeMenu(List<Map> list);//修改菜单
	
	public Integer getMaxtreeId();//获取最大菜单节点
	
   // public PageEntity getOkUtil(PageEntity pageEntity,String name) ;//获取员工信息
    /*  public boolean StopRole(String id);//人员停用
    public boolean StartRole(String id);//人员启用
    public boolean deleteRole(String id);//人员删除
   public boolean addOfficeClerk(Officeclerk ok);//添加员工
    public List    getTreeMenuAll();//查看所有权限
    public boolean addtreeMenu(Treemenu tu);//添加权限
    public boolean deleteTreeMenu(String id);//删除权限
    public boolean updateTreeMenu(Treemenu tu,String id);//修改权限
    public List<Role> selectRole();//查询角色
	public boolean addRole(Role r);//添加角色
	public boolean deleteRole(Role r);//删除角色
	public boolean updateRole(Role r);//更新角色
	public List selectRoleTreemenu(Integer id);//查看角色对应的权限功能
	public boolean addmiddle(rtMiddle m);//添加middle(权限角色关系表)
	public boolean deletemiddle(rtMiddle m);//删除middle(权限角色关系表)
	public List selectAllRoleTreemenuMiddle();//查询所有权限关系菜单
	 public List<Treemenu> getTree2(int roleid);//查看权限对应权限
*/}
