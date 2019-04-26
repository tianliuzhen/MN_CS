package com.aaa.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aaa.entity.Menus;
import com.aaa.entity.Officeclerk;
import com.aaa.entity.Role;
import com.aaa.entity.rtMiddle;
import com.aaa.service.menuService;
import com.alibaba.fastjson.JSON;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class menuController {
	@Autowired
	private menuService menuService;
	
    @RequestMapping("/backStage")
    public String backStage(Officeclerk ok,HttpSession httpSession){
    /*	//System.out.println(99);
        //System.out.println(ok.getOcPassword());1*/
    	 //System.out.println(ok.getOcPassword());
    	 //System.out.println(ok.getOcName());
        try {
           	menuService.backLogin(ok);
        	 ////System.out.println(menuService.backLogin(ok).getOcRealName());
            httpSession.setAttribute("ocId", menuService.backLogin(ok).getOcId());
             httpSession.setAttribute("relaname", menuService.backLogin(ok).getOcRealName());
             httpSession.setAttribute("ocnamefaceId", menuService.backLogin(ok).getOcName());
          return "index";
		} catch (Exception e) {
			 return "backStage/login";
		}
        
        
       
    }
    @RequestMapping("/getMenuTree")
    public   void getMenuTree(HttpSession httpSession,HttpServletResponse response) throws IOException{
    String realname=	(String) httpSession.getAttribute("ocnamefaceId");
     //   //System.out.println(menuService.getTree(realname));
       String str=JSON.toJSONString(menuService.getTree(realname));
    //   //System.out.println(str);
       response.setCharacterEncoding("utf-8");
        response.getWriter().print(str);
    //    //System.out.println(111);
        
    }
    @RequestMapping("/getMenuTreelast")
    public   void getMenuTreelast(HttpServletResponse response) throws IOException{
       String str=JSON.toJSONString(menuService.getTreelast());
       response.setCharacterEncoding("utf-8");
        response.getWriter().print(str);
        
    }
    @RequestMapping("/test")
    @ResponseBody
    public  List<Map> test(){
    	//System.out.println(menuService.test());
    	////System.out.println(menuService.test());
		return menuService.test();
    	
    	
    }
    /*
     * 角色管理
     * */
    @RequestMapping("/selectRole")
    @ResponseBody
    public  List<Map> selectRole(){
    	////System.out.println(menuService.test());
//    	//System.out.println(menuService.selectRole());
		return menuService.selectRole();
    	
    	
    }
    @RequestMapping("/deleteRole")
    @ResponseBody
    public  String deleteRole(Integer roleId){
    	////System.out.println(menuService.test());
    	//System.out.println("delete");
    	//System.out.println(roleId );
    	Role r=new Role();
    	r.setRoleId(roleId);
    	menuService.deleteRole(r);
		return "true";
    	
    	
    }
    @RequestMapping("/addRole")
    public  String addRole(Role role){
    
    	menuService.addRole(role);
		return "backStage/tlz/Mrole";
    }
    @RequestMapping("/updateRole")
    @ResponseBody
    public  String updateRole(Role role,Integer roleId){
    	//System.out.println(role.getRoleId());
    	//System.out.println(role.getRoleDesc());
    	//System.out.println("updateRole");
    	menuService.updateRole(role);
		return "true";
    }
    @RequestMapping("/getMenuTree2")  //获取对应权限的菜单
    public   void getMenuTree2(HttpSession httpSession,HttpServletResponse response,Integer roleid) throws IOException{
    //System.out.println(roleid);
    	String str=JSON.toJSONString(menuService.getTree2(roleid));
        //System.out.println(str);
        response.setCharacterEncoding("utf-8");
        response.getWriter().print(str);
    }
    @RequestMapping("/deleteRtMiddle")  //删除对应权限的菜单
    @ResponseBody
    public   String  deleteRtMiddle(String rtMiddleId,String roleId) throws IOException{
    	 List list=JSON.parseArray(rtMiddleId);
    	//System.out.println(roleId+"_8888888");
    	//System.out.println(rtMiddleId);
    	for (Object object : list) {
    		
    		rtMiddle  r=new rtMiddle();
    		r.setRoleId(Integer.parseInt(roleId));
    		r.setTreeId(Integer.parseInt(String.valueOf(object)));
    		menuService.deleteRtmiddle(r);
			//System.out.println(Integer.parseInt(String.valueOf(object)));
		}
		return "true";
    }
    @RequestMapping("/addRtMiddle")  //添加对应权限的菜单
    @ResponseBody
    public   String  addRtMiddle(String rtMiddleId,String roleId) throws IOException{
    	  List list=JSON.parseArray(rtMiddleId);
    	//System.out.println("ddd");
    	//System.out.println(roleId);
    	//System.out.println(rtMiddleId);
    	for (Object object : list) {
    		rtMiddle  r=new rtMiddle();
    		r.setRoleId(Integer.parseInt(roleId));
    		r.setTreeId(Integer.parseInt(String.valueOf(object)));
    		menuService.addRtmiddle(r);
			//System.out.println(Integer.parseInt(String.valueOf(object)));
		}
		return "true";
    }
    
    @RequestMapping("/updateTreeMenu")  //更新对应权限的菜单
    @ResponseBody
    public   String  updateTreeMenu(@RequestBody List<Map> listMap) throws IOException{
    
		//System.out.println(listMap);
		
	boolean b=	menuService.updateTreeMenu(listMap);
	//System.out.println(b);
		return "true";
    }
    
    @RequestMapping("/deleteTreeMenu")  //删除对应权限的菜单
    @ResponseBody
    public   String  deleteTreeMenu(@RequestBody List<Map> listMap) throws IOException{
    //System.out.println("deleteTreeMenu");
		//System.out.println(listMap);
		
	boolean b=	menuService.deleteTreeMenu(listMap);
	//System.out.println(b);
		return "true";
    }
    
    @RequestMapping("/addTreeMenu")  //删除对应权限的菜单
    @ResponseBody
    public   String  addTreeMenu(@RequestBody List<Map> listMap) throws IOException{
    
		//System.out.println(listMap);
		
	boolean b=	menuService.addtreeMenu(listMap);
	//System.out.println(b);
		return "true";
    }
    
    @RequestMapping("/getMaxTreeid")  //删除对应权限的菜单
    @ResponseBody
    public   Integer  getMaxTreeid() throws IOException{
    
	 int max=menuService.getMaxtreeId();
	 int newMax=max+1;
	 
		return newMax;
    }
}
