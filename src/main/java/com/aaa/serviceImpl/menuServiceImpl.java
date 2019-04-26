package com.aaa.serviceImpl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javassist.bytecode.Mnemonic;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.support.DaoSupport;
import org.springframework.stereotype.Service;

import com.aaa.dao.menuDaoMapper;
import com.aaa.entity.Menus;
import com.aaa.entity.Officeclerk;
import com.aaa.entity.Role;
import com.aaa.entity.Treemenu;
import com.aaa.entity.rtMiddle;
import com.aaa.service.menuService;
@Service
public class menuServiceImpl implements menuService{
@Autowired
private  menuDaoMapper menudao;
	
	@Override
	public Officeclerk backLogin(Officeclerk ok) {
		// TODO Auto-generated method stub
		
		 return menudao.backLogin(ok);
	}
	
	@Override
	public List<Menus> getTree(String realname) {
		List<Menus> listAll=new ArrayList<Menus>();//得到所有被封装后的结果
		List<Menus> listResult=new ArrayList<Menus>();//得到listResult，存父节点
		List<Treemenu> treeList=menudao.getTree(realname);//查询到所有的数据
  //将查询结果封装在menus实体类中，然后添加到list中
		for (Treemenu treemenu : treeList) {
			   Menus menu=new Menus();
		       menu.setMenuid(treemenu.getTreeId());
		       menu.setMenuname(treemenu.getTreeName());
		       menu.setParent(treemenu.getTreeParent());
		       menu.setTreeStyle(treemenu.getTreeStyle());
			//封装url
			 menu.getUrl().put("url", treemenu.getTreeUrl());
			listAll.add(menu);
            		
		}	   
		
		//将所有节点进行循环，判断出那个是父节点以及父节点对应的子节点
		for (Menus menu : listAll) {
			if(menu.getParent()==0){//父节点
				listResult.add(menu);
				//存储子节点的集合
				List<Menus> children=new ArrayList<Menus>();
				for (Menus menus2 : listAll) {
					//将结果集循环两次（listAll），用子节点的parent属性匹配父节点的id，如果匹配上说明当前列为当前父节点的一个子节点
					if(menu.getMenuid().equals(menus2.getParent())){
						children.add(menus2);//将节点存储到children集合中
						
					}
				
				}
				menu.setMenus(children);//子级节点放到对应的父级节点中
			}
		}
		
		return listResult;//所有节点（父级节点和子级节点）List<List<Menu>>
	}

	@Override
	public List<Map> test() {
		// TODO Auto-generated method stub
		return menudao.test();
	}

	@Override
	public List<Map> selectRole() {
		// TODO Auto-generated method stub
		return menudao.selectRole();
	}

	@Override
	public boolean addRole(Role r) {
		// TODO Auto-generated method stub
		return menudao.addRole(r);
	}

	@Override
	public boolean deleteRole(Role r) {
		// TODO Auto-generated method stub
		return menudao.deleteRole(r);
	}

	@Override
	public boolean updateRole(Role r) {
		// TODO Auto-generated method stub
		return menudao.updateRole(r);
	}

	@Override
	public List<Menus> getTree2(Integer roleid) {
		List<Menus> listAll=new ArrayList<Menus>();//得到所有被封装后的结果
		List<Menus> listResult=new ArrayList<Menus>();//得到listResult，存父节点
		List<Treemenu> treeList=menudao.getTree2(roleid);//查询到所有的数据
  //将查询结果封装在menus实体类中，然后添加到list中
		for (Treemenu treemenu : treeList) {
			Menus menu=new Menus();
		       menu.setMenuid(treemenu.getTreeId());
		       menu.setMenuname(treemenu.getTreeName());
		       menu.setParent(treemenu.getTreeParent());
			//封装url
			 menu.getUrl().put("url", treemenu.getTreeUrl());
			listAll.add(menu);
            		
		}	   
		
		//将所有节点进行循环，判断出那个是父节点以及父节点对应的子节点
		for (Menus menu : listAll) {
			if(menu.getParent()==0){//父节点
				listResult.add(menu);
				//存储子节点的集合
				List<Menus> children=new ArrayList<Menus>();
				for (Menus menus2 : listAll) {
					//将结果集循环两次（listAll），用子节点的parent属性匹配父节点的id，如果匹配上说明当前列为当前父节点的一个子节点
					if(menu.getMenuid().equals(menus2.getParent())){
						children.add(menus2);//将节点存储到children集合中
						
					}
				
				}
				menu.setMenus(children);//子级节点放到对应的父级节点中
			}
		}
		
		return listResult;//所有节点（父级节点和子级节点）List<List<Menu>>
	}

	@Override
	public boolean addRtmiddle(rtMiddle m) {
		// TODO Auto-generated method stub
		return menudao.addRtmiddle(m);
	}

	@Override
	public boolean deleteRtmiddle(rtMiddle m) {
		// TODO Auto-generated method stub
		return menudao.deleteRtmiddle(m);
	}

	@Override
	public boolean updateTreeMenu(List<Map> list) {
		// TODO Auto-generated method stub
		return menudao.updateTreeMenu(list);
	}

	@Override
	public boolean addtreeMenu(List<Map> list) {
		// TODO Auto-generated method stub
		return menudao.addtreeMenu(list);
	}

	@Override
	public boolean deleteTreeMenu(List<Map> list) {
		// TODO Auto-generated method stub
		return menudao.deleteTreeMenu(list);
	}

	@Override
	public List<Menus> getTreelast() {
		List<Menus> listAll=new ArrayList<Menus>();//得到所有被封装后的结果
		List<Menus> listResult=new ArrayList<Menus>();//得到listResult，存父节点
		List<Treemenu> treeList=menudao.getTreelast();//查询到所有的数据
  //将查询结果封装在menus实体类中，然后添加到list中
		for (Treemenu treemenu : treeList) {
			   Menus menu=new Menus();
		       menu.setMenuid(treemenu.getTreeId());
		       menu.setMenuname(treemenu.getTreeName());
		       menu.setParent(treemenu.getTreeParent());
			//封装url
			 menu.getUrl().put("url", treemenu.getTreeUrl());
			listAll.add(menu);
            		
		}	   
		
		//将所有节点进行循环，判断出那个是父节点以及父节点对应的子节点
		for (Menus menu : listAll) {
			if(menu.getParent()==0){//父节点
				listResult.add(menu);
				//存储子节点的集合
				List<Menus> children=new ArrayList<Menus>();
				for (Menus menus2 : listAll) {
					//将结果集循环两次（listAll），用子节点的parent属性匹配父节点的id，如果匹配上说明当前列为当前父节点的一个子节点
					if(menu.getMenuid().equals(menus2.getParent())){
						children.add(menus2);//将节点存储到children集合中
						
					}
				
				}
				menu.setMenus(children);//子级节点放到对应的父级节点中
			}
		}
		
		return listResult;//所有节点（父级节点和子级节点）List<List<Menu>>
	}

	@Override
	public Integer getMaxtreeId() {
		// TODO Auto-generated method stub
		return menudao.getMaxtreeId();
	}



	


}
