package com.aaa.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aaa.entity.Spinfo;
import com.aaa.service.WhService;
import com.aaa.serviceImpl.tlzServiceImpl;
import com.github.pagehelper.PageInfo;
import com.sun.org.apache.regexp.internal.recompile;

@Controller
public class tlzController {
	
	@Autowired 
	private tlzServiceImpl service;
	  @RequestMapping("/getAllMapGoodsDept") //查询百货部门
	    public  String getAllMapGoodsDept(Model model,String getGoodsDept_input_Name){
		  if(getGoodsDept_input_Name==null){
			  getGoodsDept_input_Name="";//给初始值"" 模糊查询全部
		  }
		 /* //System.out.println(getGoodsDept_input_Name);
	  //System.out.println(service.getAllMapGoodsDept(getGoodsDept_input_Name));*/
		
		  List<Map<String, Object>> listMap = new ArrayList<Map<String,Object>>();
		  List<Map> map1=service.getAllMapGoodsDept(getGoodsDept_input_Name);
		  List<Map> map2=service.getOrderNeedToShelf();
		
		 for (int i = 0; i <map1.size(); i++) {
			    Map<String,Object> map=new HashMap<String,Object>();
			    map.put("dgStyleColor", map1.get(i).get("dgStyleColor"));
			    map.put("dgStyleImg", map1.get(i).get("dgStyleImg"));
			    map.put("allSpId", map1.get(i).get("allSpId"));
			    map.put("gdName", map1.get(i).get("gdName"));
			    map.put("nospid", map2.get(i).get("nospid"));  //合并List<Map>
			    listMap.add(i, map);
		  }
		 
		// //System.out.println(listMap);
		  
		  model.addAttribute("GoodsDept",listMap);
			return "backStage/tlz/goodsShelf";
	    	
	    }
	  @RequestMapping("/getAllShelfGoodsDept") //查询所有货架商品
	  @ResponseBody
	  public List<Map> getAllShelfGoodsDept(String AllToOneGoodsDeptName){
		 /* //System.out.println(111);
		  //System.out.println(service.getAllGoodsShelf(AllToOneGoodsDeptName));*/
		return service.getAllGoodsShelf(AllToOneGoodsDeptName);
		  
		  
	  }
	  
	  @RequestMapping("/getAllShelfGoodsDeptPageInfo") //查询所有货架商品分页
	  @ResponseBody
	  public PageInfo<Map> getAllShelfGoodsDeptPageInfo(int pageNum,String gdName){
		  if(gdName==null){
			  gdName="化";  
		  }
	/*	  //System.out.println(pageNum+"__");
		  //System.out.println("__"+service.getAllGoodsShelf(pageNum, gdName));*/
		return service.getAllGoodsShelf(pageNum, gdName);
		  
		  
	  }
	  @RequestMapping("/getAllSaleUtilByOneOnGoodSDept")  //根据商品soid查询当天销售信息
	  @ResponseBody
	  public PageInfo<Map> getAllSaleUtilByOneOnGoodSDept(Integer spId,int pageNum){
		  
		//  //System.out.println(service.getAllSaleUtilByOneOnGoodSDept(spId,pageNum));
		  
		return service.getAllSaleUtilByOneOnGoodSDept(spId,pageNum);
		  
	  }
	  
	  
	  
	  
	  
	  
	  @RequestMapping("/getNoShelfGoods")   //查询未上架商品
	  @ResponseBody
	  public List<Map> getNoShelfGoods(){
		  String status="未上架";
		//  //System.out.println(service.getNoShelfGoods(status));
		return service.getNoShelfGoods3(status);
		  
	  } 
	  
	  
	  
	  
	  
	  
	  @RequestMapping("/getNoShelfGoodsLook")   //查询上架(待审核)商品
	  @ResponseBody
	  public List<Map> getNoShelfGoodsLook(String spucId){
		  //System.out.println(spucId);
		  String status="上架（待审核）";
		//  //System.out.println(service.getNoShelfGoods(status));
		//  //System.out.println(service.getNoShelfGoods2(status,spucId));
		return service.getNoShelfGoods2(status,spucId);
		  
	  } 
	  @RequestMapping("/getNoShelfGoodsLook2")   //查询上架(待审核)商品
	  @ResponseBody
	  public List<Map> getNoShelfGoodsLook2(String spucId){
		  //System.out.println(spucId);
		  String status="下架（待审核）";
		//  //System.out.println(service.getNoShelfGoods(status));
		//  //System.out.println(service.getNoShelfGoods2(status,spucId));
		return service.getNoShelfGoods2(status,spucId);
		  
	  } 
	  @RequestMapping("getAllapplyGoodsDept")
	  public String getAllapplyGoodsDept(Model model){  //申请上架  
	//	  //System.out.println(service.getGoodsDeptOne());
		 model.addAttribute("getGoodsDeptOne", service.getGoodsDeptOne());//百货部门表
		   model.addAttribute("getDisplayParseOne", service.getDisplayParseOne());//陈列数量
		   model.addAttribute("getAccessNoOne", service.getAccessNoOne());//通道序列号
		   model.addAttribute("getBayNoOne", service.getBayNoOne());//bay序号
		   //System.out.println("___"+service.getGoodsDeptOne());
		return "backStage/tlz/applyGoodsshelvesGo";
	  }
	  @RequestMapping("/updateApplyGoodsShelf")
	  @ResponseBody
	  public String updateApplyGoodsShelf(@RequestBody List<Map> map,HttpSession session){  //提交上架申请
		  int k=0;
		  //System.out.println(map);
		  SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
	        Date today = new Date();
	        String appId = format.format(today); //时间编号
	        
		for (int i = 0; i < map.size(); i++) {
			k++;
			Map nmap=new HashMap();
			nmap.put("gdId", map.get(i).get("gdId"));
			nmap.put("dpId", map.get(i).get("dpId"));
			nmap.put("anId", map.get(i).get("anId"));
			nmap.put("bnId", map.get(i).get("bnId"));
			nmap.put("spId", map.get(i).get("spId"));
			nmap.put("spucId", appId);
			
			service.updateApplyGoodsShelf(nmap);
		}
		  
		
		  Map umap=new HashMap();
		    String realname=	(String) session.getAttribute("relaname");
		    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		       umap.put("ocId", realname);
			   umap.put("ucDate", df.format(new Date()));
			   umap.put("ucNum", k);
			   umap.put("ucStatus","上架待审核");
			   umap.put("spucId", appId);
			   umap.put("gdName", "xxxx");
			   umap.put("ucReason", "上架");
			   //System.out.println(umap);
			   service.insertUpanddownCheck(umap);
		return "true";
		  
	  }
	  @RequestMapping("/getListMapUpanddownCheck")
	  @ResponseBody
	  public List<Map> getListMapUpanddownCheck(){  //查看上架申请
		//  //System.out.println(map);
		  
		return service.getListMapUpanddownCheck();
	  }
	  @RequestMapping("/getListMapUpanddownCheck2")
	  @ResponseBody
	  public List<Map> getListMapUpanddownCheck2(){  //查看下架申请
		//  //System.out.println(map);
		  
		return service.getListMapUpanddownCheck2("下架待审核");
	  }
	  @RequestMapping("/getListMapUpanddownCheck3")
	  @ResponseBody
	  public List<Map> getListMapUpanddownCheck3(){  //查看下架申请
		//  //System.out.println(map);
		  
		return service.getListMapUpanddownCheck2("下架待处理");
	  }
	  @RequestMapping("/updateApplyGoodsShelf2")
	  @ResponseBody
	  public String updateApplyGoodsShelf2(@RequestBody List<Map> list,HttpSession session){  //提交下架申请
		//  //System.out.println(map);
		  int k=0;
		  SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
	        Date today = new Date();
	        String appId = format.format(today); //时间编号
		for (int i = 0; i < list.size(); i++) {
			k++;
			Map map=new HashMap();
			map.put("spId", list.get(i).get("spId"));
			map.put("spucId", appId);
			service.updateApplyGoodsShelf2(map);
		}
		  Map umap=new HashMap();
		    String realname=	(String) session.getAttribute("relaname");
		    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		       umap.put("ocId", realname);
			   umap.put("ucDate", df.format(new Date()));
			   umap.put("ucNum", k);
			   umap.put("ucStatus","下架待审核");
			   umap.put("spucId", appId);
			   umap.put("gdName", "xxxx");
			   try {
				   umap.put("ucReason", list.get(0).get("ucReason"));
			} catch (Exception e) {
				// TODO: handle exception
			}
			   
			   //System.out.println(umap);
			   service.insertUpanddownCheck(umap);
		return "true";
	  }
	  @RequestMapping("/updateApplyGoodsShelfCheck")
	  @ResponseBody                                    //审核上架
	  public String updateApplyGoodsShelfCheck(@RequestBody List<Map> list){
		//  //System.out.println("__"+GoodsGoShelfcheckiDnNum);
		 //System.out.println(list);
		 for (int i = 0; i < list.size(); i++) {
			service.updateApplyGoodsShelfCheck(Integer.parseInt(String.valueOf(list.get(i).get("spId"))), 11111);
		 }
		 try {
			 service.UpdateUpanddownCheck(String.valueOf(list.get(0).get("spucId")));
			 return "true";
		} catch (Exception e) {
			 return "true";
		}
		
		  
	  }
	  
	  @RequestMapping("/updateApplyGoodsShelfCheck2xx")
	  @ResponseBody                                   
	  public String updateApplyGoodsShelfCheck2xx(@RequestBody List<Map> map){
		  
		  
		  try {  //更新审核单状态
				 service.UpdateUpanddownCheck2xx(String.valueOf(map.get(0).get("spucId")));
				 return "true";
			} catch (Exception e) {
				 return "true";
			}
			
		  
		  
	  }
	 /* 
	  * 
	  * 审核下架
	  * 
	  * */
	  @RequestMapping("/updateApplyGoodsShelfCheck2")
	  @ResponseBody                                   
	  public String updateApplyGoodsShelfCheck2(@RequestBody List<Map> map,HttpSession httpSession){
		  Integer ocId=	(Integer) httpSession.getAttribute("ocId");
		 /*
		  * 
		  * 入库单明细
*/		  List<Map>  ss=service.qureyGoodsShelfRecordUtil3Byspid(Integer.parseInt(String.valueOf(map.get(0).get("spId"))));
		  //System.out.println(ss+"___");
		  Map map3=new HashMap();
			map3.put("whId",Integer.parseInt(String.valueOf( ss.get(0).get("whId"))));
			map3.put("ocId", ocId);
			map3.put("stkId", 8);
			service.createInHouseWarant(map3);
			//System.out.println(map3.get("InId"));	  
		  
		for (int i = 0; i < map.size(); i++) {
			int spid= Integer.parseInt(String.valueOf(map.get(i).get("spId")));
			int srsl=Integer.parseInt(String.valueOf(map.get(i).get("spDnNum")));
			Map spinfo=  service.getSpifoNum(spid);
			int spAllNum= Integer.parseInt(String.valueOf(spinfo.get("spAllNum")));
		    int spDnNum= Integer.parseInt(String.valueOf(spinfo.get("spDnNum")));
		    String spBuyPrice=String.valueOf(spinfo.get("spBuyPrice"));
		    int rtPeriod= Integer.parseInt(String.valueOf(spinfo.get("rtPeriod")));
		    spAllNum=spAllNum+spDnNum; //仓库的数量加上一些货架的数量
		    Map map2=new HashMap();
		    map2.put("spId", spid);
		    map2.put("spAllNum", spAllNum);
		    
		    //更新商品
		    
		      service.updateApplyGoodsShelfCheck2(map2);
		      
	      
		     /* 
		      * 更新仓库不同批次库存
		      * */
		     
		      List<Map> rep=service.qureyGoodsShelfRecordUtil3(spid);  //根据商品 spid 获取不同的 rtid
		      
		      //System.out.println("___rep.size()"+rep.size());
		      for (int j = 0; j < rep.size(); j++) {
		    	  //System.out.println("9999999999999999999");
		    	int rtidlast=  Integer.parseInt(String.valueOf(rep.get(j).get("rtId")));
		    	//System.out.println("____"+rtidlast);
			List<Map>  qsulist=   service.qureyGoodsShelfRecordUtil(rtidlast);   //根据 rtid 获取  货架对应的 不同批次的数量
			int numlast=  Integer.parseInt(String.valueOf(qsulist.get(0).get("guNum")));  
			//System.out.println("_____"+numlast);
			Map m6=new HashMap();
			m6.put("rtNumber", numlast);
			m6.put("rtId", rtidlast);
			//System.out.println(m6+"_____________");
			service.updateBupertory2(m6);   // 把货架将要下架的不同批次存在不同的库存中
			 //System.out.println("9999999999999999999");
		      }
		  		
				
		      //删除货架记录
		      Map map5=new HashMap();//spId=#{spId} and rtId=#{rtId}
		      map5.put("spId", spid);
		     
		      service.deleteGoodsShelfRecordUtil(map5);
		  
		      
		     
		    //#{InId},#{spId},#{spBuyPrice},#{srsl},#{spBuyPrice}*#{srsl},#{rtbegDate},#{rtPeriod},#{rtEndDate})
		List<Map>  ss2=service.qureyGoodsShelfRecordUtil3Byspid(Integer.parseInt(String.valueOf(map.get(i).get("spId"))));
	           	//  spid
		
		/*
		 * 
		 * 入库单详情
		 * */
		Map map4=new HashMap();
		
		map4.put("InId", map3.get("InId"));
		map4.put("spId", spid);
		map4.put("spBuyPrice", spBuyPrice);
		map4.put("srsl", srsl);
		map4.put("rtbegDate", ss2.get(0).get("rtbegDate"));
		map4.put("rtPeriod", rtPeriod);
		map4.put("rtEndDate", ss2.get(0).get("rtEndDate"));
		
		service.createInHouseWarantInfo(map4);
		         
		}
	
		///
		
		 try {  //更新审核单状态
			 service.UpdateUpanddownCheck2(String.valueOf(map.get(0).get("spucId")));
			 return "true";
		} catch (Exception e) {
			 return "true";
		}
		
		 
		  
	  }
	  
	  @RequestMapping("/getAllbackGoodsDept")
	  public String getAllbackGoodsDept(){  //申请下架   打开jsp
	//	 getAlreadyShelfGoods 
		return "backStage/tlz/applyGoodsShelvesBack";
	  }
	  
	  
	  
	  @RequestMapping("/getAlreadyShelfGoods")   //查询已上架商品
	  @ResponseBody
	  public List<Map> getAlreadyShelfGoods(){
		  String status="已上架";
	//	  //System.out.println(service.getNoShelfGoods(status));
		  //System.out.println(service.getNoShelfGoods3(status));
		return service.getNoShelfGoods(status);
		  
	  } 
	  @RequestMapping("/getAllMapGoodsDifferentUtil")  //获取同一商品不同的入库信息
	  @ResponseBody
	  public List<Map> getAllMapGoodsDifferentUtil(Integer spid){
		//  //System.out.println(1111);
		//  //System.out.println(spid);
		//  //System.out.println(service.getAllMapGoodsDifferentUtil(spid));
		  
		return service.getAllMapGoodsDifferentUtil(spid);
		  
	  };  //查询 同一种商品不同的 进货单
	  
	  
	  @RequestMapping("/BackOrder")
	  @ResponseBody
	  public Map BackOrder(@RequestBody Map map,HttpSession httpSession){  //货架补货   
		  //System.out.println(map);
		  int rtId =Integer.parseInt(String.valueOf(map.get("rtId")));  //商品仓库 不同日期的记录
		  
		  int buNum=Integer.parseInt(String.valueOf(map.get("buNum")));  //需要补货数量
		  
		  int rtNumber=Integer.parseInt(String.valueOf(map.get("rtNumber")));  //一次补货数量
		  
		  int  spid=Integer.parseInt(String.valueOf(map.get("spIdbu")));
		  Map spinfo=  service.getSpifoNum(spid);//获取该@商品 信息  
		  
		  int spAllNum= Integer.parseInt(String.valueOf(spinfo.get("spAllNum"))); //@商品剩余数量
		   int spDnNum= Integer.parseInt(String.valueOf(spinfo.get("spDnNum")));  //@陈列数量
		   
		int   newspDnNum=0;  // 补货后的 商品陈列数量
		int   newspAllNum=0;  // 补货后的 该商品库存数量
	/*
	 * 
	 * 1.更新商品
	 * 
	 * */	 
		Map  smap=new HashMap();
		if(buNum<=rtNumber){    //如果此时 当批库存量  大于等于  补货数量
			newspAllNum= spAllNum-buNum;
			 newspDnNum=spDnNum+buNum;
		}else{
			newspAllNum= spAllNum-rtNumber;
			 newspDnNum=spDnNum+rtNumber;		
			 }
		   smap.put("spDnNum", newspDnNum);
		   smap.put("spAllNum", newspAllNum);
		   smap.put("spId", spid);
		   service.updateBuGoods(smap);  //对spifo的更新
		   /*
			 * 
			 * 2.更新库存
			 * 
			 * */	    
		   Map  rmap=new HashMap();
		   if(buNum>rtNumber){   //如果 本次补货量大于 当期所选的 库存量
			   rmap.put("rtNumber",0 );
		   }else{
			   rmap.put("rtNumber",rtNumber-buNum );
		   }
		  
		   rmap.put("rtId", rtId);
		   service.updateBupertory(rmap);  //更新库存信息表
		   /*
			 * 
			 * 3.记录补货
			 * 
			 * */	
		   Map  bmap=new HashMap();
		   //insert into bugoods VALUES(null,#{ocId},#{bgDate},#{bgNum},#{spId},#{rtId})
		   String realname=	(String) httpSession.getAttribute("relaname");
		   bmap.put("ocId", realname);
		   SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		   bmap.put("bgDate", df.format(new Date()));
		   bmap.put("bgNum", buNum);       
		   bmap.put("spId", spid);       
		   bmap.put("rtId", rtId);  
		   //System.out.println(bmap+"bmap");
		   service.insertBuGoods(bmap);
		   
		/*  
		 *  记录货架表
		 *  
		 *  */
		 
		   /*	  public List<Map> qureyGoodsShelfRecordUtil(Integer rtid);  //补货时查询货架
			  public boolean insertGoodsShelfRecordUtil(Map map);  //补货时添加 商品货架记录表 
			  public boolean UpdateGoodsShelfRecordUtil(Map map);  //补货时更新商品货架记录表 
		  */	 
		   
		   
		   List<Map> gsrList=service.qureyGoodsShelfRecordUtil(rtId);//spid
		   int guNum=Integer.parseInt(String.valueOf(map.get("rtNumber")));  //一次补货数量
		   if(gsrList.size()>0){   // 如果从仓库添加的 商品的批次 在 当前货架依然有 
			                     //1.更新 商品货架记录表 GoodsShelfRecordUtil当期批次的数量
			                    //2.更新   商品表（spinfo）的 陈列数量
			   Map  updatemap=new HashMap();
			   //System.out.println(gsrList.get(0).get("guNum"));
			 int  NewGuNumzz=  Integer.parseInt(String.valueOf(gsrList.get(0).get("guNum"))) ;
			 if(buNum>rtNumber){  //如果 本次补货量大于 当期所选的 库存量
			 updatemap.put("guNum", NewGuNumzz+guNum);
			  }else{
			 updatemap.put("guNum", NewGuNumzz+buNum);	  
			  }
			 
			   updatemap.put("rtId", rtId);
			  // //System.out.println("NewGuNumzz"+NewGuNumzz);
			  // //System.out.println(updatemap);
			   
			   service.UpdateGoodsShelfRecordUtil(updatemap);  //更新当期批次的数量
			   
		   }else{  // 如果当前添加的货在     货架没有记录  直接记录新的  批次
			         // 3.重新添加   商品货架记录表 GoodsShelfRecordUtil  新的批次的数量
			  
			   Map  imap=new HashMap();
			   imap.put("spId", spid);
			   imap.put("rtId", rtId);
			   
			   if(buNum>rtNumber){   //如果 本次补货量大于 当期所选的 库存量
				   imap.put("guNum", rtNumber); //此时补货时的仓库的该其批次不够补货  
			   }else{
				   imap.put("guNum",buNum );
			   }
			   
			 
			   imap.put("bgid", "1");
			 
			   service.insertGoodsShelfRecordUtil(imap);
		   }
		return map;
	  }
	  
	  @RequestMapping("/getAllMapBuGoods")  //查询补货记录
	  @ResponseBody
	  public List<Map> getAllMapBuGoods(Integer spid){
		
		  
		return service.getAllMapBuGoods(spid);
		  
	  };  //查询 同一种商品不同的 进货单
	  
	  @RequestMapping("/getClearGoods")
	  @ResponseBody
	  public List<Map>  getClearGoods(Integer spid){
		  
		    //System.out.println(service.getClearGoods(spid));
		  
		return service.getClearGoods(spid);
		  
	  }
	  
   //补货人了
	     
	  @RequestMapping("/insertBuGoodsCheck")
	  @ResponseBody
	  public String  insertBuGoodsCheck(Integer spid,Integer bgNum,HttpSession httpSession){
		  
		  //System.out.println("insertBuGoodsCheck");
		  Map map=new HashMap();
		  map.put("spId", spid);
		  SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		  map.put("bgcDate", df.format(new Date()));
		  map.put("bgcNum", bgNum);
		  String realname=	(String) httpSession.getAttribute("relaname");
		  map.put("ocId", realname);
		  map.put("bgcStatus", "补货待审核");
		  //System.out.println(map);
		try {
			 service.insertbuGoodsCheck(map);
			 return "true";
		} catch (Exception e) {
			return "flase";
		} 
		
		  
	  }
	  
	  // 补货时查询是否已经申请了
	  @RequestMapping("/selectBuGoodsCheckIf")
	  public void  selectBuGoodsCheckIf(Integer spid,HttpServletResponse response) throws IOException{
		  List<Map> list=new ArrayList<Map>();  //避免空指针异常 先抛出  
		  //System.out.println("___"+service.selecetbuGoodsCheck(spid));
		  String   status;
		  try {
			  list=  service.selecetbuGoodsCheck(spid);
			 status=String.valueOf(list.get(0).get("bgcStatus")) ;
			  response.setCharacterEncoding("utf-8");
			  if(status.equals("补货待审核")){
				   response.getWriter().print("补货待审核");
			  }else{
				  response.getWriter().print("补货已审核");
			  }
			  
		} catch (Exception e) {
			response.getWriter().print("等待提交审核");
		}
		 
		  
	  }
	  //  查询补货待审核订单 
	  @RequestMapping("/getAllNocheckbuGoodsCheck")
	  @ResponseBody
	  public List<Map>  getAllNocheckbuGoodsCheck(){
		  
		   //System.out.println(service.getAllNocheckbuGoodsCheck("补货待审核"));
		  
		return service.getAllNocheckbuGoodsCheck("补货待审核");
		  
	  }
	  // 确认 申请的的补货
	  @RequestMapping("/yescheckbuGoodsCheck")
	  @ResponseBody
	  public String  yescheckbuGoodsCheck(String spId){
		  
		  try {
			service.yescheckbuGoodsCheck(spId);
			return "true";
		} catch (Exception e) {
			return "false";
			 
		}
	  }
	  //  提交订单
	  @RequestMapping("addAllbuGoodsCheck")
	  @ResponseBody
	  public String  addAllbuGoodsCheck(@RequestBody List<Map> addAllbuGoodsCheck ){
		//System.out.println(addAllbuGoodsCheck);
		return "true";
		  
	  }
	/* 
	 * 
	 * 提交补货申请 
	 *    默认优先上架商品的最后日期上架日期来减轻商品的滞销
	 * */
	  @RequestMapping("/BackOrder2")  
	  @ResponseBody
	  public String BackOrder2(@RequestBody List<Map> listMap,HttpSession httpSession){
		  //System.out.println(listMap+"listMap");
		  
		  
		  SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
	        Date today = new Date();
	        String appId = format.format(today);
	        //System.out.println(appId);//设置时间编号
		  
		  /*
			 * 
			 * 1.补货记录审核表buGoodsCheck
			 * 
			 * */	
	        String gdName=String.valueOf(listMap.get(0).get("gdName"));
		  SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		String datess=  df.format(new Date());
		  String realname2=	(String) httpSession.getAttribute("relaname");
		  Map map=new HashMap();  //#{ocId},#{bgcDate},#{bgcNum},#{bgcNoId},#{bgcStatus},#{gdName})
		  map.put("ocId", realname2);
		  map.put("bgcDate", datess);
		  map.put("bgcNum", "888888");
		  map.put("bgcNoId", appId);
		  map.put("bgcStatus", "补货待审核");
		  map.put("gdName", gdName);
		  //System.out.println(map);
		
			 service.insertbuGoodsCheck(map);
		
		  
		  
		  
		  
		  
		 for (int i = 0; i < listMap.size(); i++) {
			 
			Integer spId= Integer.parseInt(String.valueOf(listMap.get(i).get("spId")));//获取商品 Id
			Integer buNum= Integer.parseInt(String.valueOf(listMap.get(i).get("buNum")));//获取商品 Id
			List<Map>	repertoryList=  service.getAllMapGoodsDifferentUtil(spId); //获取同一商品的不同入库信息
			////System.out.println(repertoryList);
			Integer  firstNum=Integer.parseInt(String.valueOf(repertoryList.get(0).get("rtNumber")));
			
			Integer  rtId=Integer.parseInt(String.valueOf(repertoryList.get(0).get("rtId")));
			
			
	     	if(buNum<=firstNum){   // 如果当前商品的进货批次 可以一次性补货
	     	   /*
				 * 
				 * 2.补货记录表BuGoods
				 * 
				 * */	
			   Map  bmap=new HashMap();
			   bmap.put("ocId", realname2);
			   bmap.put("bgDate", df.format(new Date()));
			   bmap.put("bgNum", buNum);      // 直接记录即可 
			   bmap.put("spId", spId);       
			   bmap.put("rtId", rtId);  
			   bmap.put("bgcNoId",appId);
			   //System.out.println(bmap+"bmap");
			   service.insertBuGoods(bmap);
	     		
	     		
	     		
	     	}else if(buNum>firstNum){  //如果当前商品的进货批次不足以补货  首先扣除第一次的批次   //首先记录当前批次
	     		
	     		Map  bmap2=new HashMap();
				   bmap2.put("ocId", realname2);
				   bmap2.put("bgDate", df.format(new Date()));
				   bmap2.put("bgNum", firstNum);     //  该批次仓库的库存不够进货
				   bmap2.put("spId", spId);       
				   bmap2.put("rtId", rtId);  
				   bmap2.put("bgcNoId",appId);
				   service.insertBuGoods(bmap2);
			    // 再次扣除第二 批次的货物
	     		Integer  SecondNum=Integer.parseInt(String.valueOf(repertoryList.get(1).get("rtNumber")));  //下一批仓库的 数量
	     		Integer  rtId2=Integer.parseInt(String.valueOf(repertoryList.get(1).get("rtId")));  //下一批仓库 rtid
	     	
	     		Map  bmap3=new HashMap();
				   bmap3.put("ocId", realname2);
				   bmap3.put("bgDate", df.format(new Date()));
				   bmap3.put("bgNum",buNum-firstNum);     // 出去  第一次 还需要补的货物
				   bmap3.put("spId", spId);       
				   bmap3.put("rtId", rtId2);  
				   bmap3.put("bgcNoId",appId);
				   service.insertBuGoods(bmap3);
	     		      
			}else{   //默认第二次 完全够补货
				
				
			}
			
			
			//System.out.println(buNum);
			//System.out.println(repertoryList.get(0).get("rtId"));
		}
	
		
		  
	return "true";  //货架补货   2
		  
	  }
	  @RequestMapping("/getUtilNocheckbuGoodsCheck")
	  @ResponseBody
	  public List<Map> getUtilNocheckbuGoodsCheck(String bgcNoId){
		return service.getUtilNocheckbuGoodsCheck(bgcNoId);
		  
	  }
	  
	 /* 
	  * 确认审核   last
	  * 
	  * */
	  @RequestMapping("/sureBuGoodsSuccess")
	  @ResponseBody
	  public String sureBuGoodsSuccess(String bgcNoId){
		 SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
	        Date today = new Date();
	        String appId = format.format(today); //设置时间编号
		  List<Map> list=service.getUtilNocheckbuGoodsCheck(bgcNoId);  //获取需要出库的订单
		  
		 for (int i = 0; i <list.size(); i++) {
			 int  spId=Integer.parseInt(String.valueOf(list.get(i).get("spId")));
			 int  bgNum=Integer.parseInt(String.valueOf(list.get(i).get("bgNum")));
			 int  rtId=Integer.parseInt(String.valueOf(list.get(i).get("rtId")));
			  Map spinfo=  service.getSpifoNum(spId);//获取该@商品 信息  
			  int spAllNum= Integer.parseInt(String.valueOf(spinfo.get("spAllNum"))); //@商品剩余数量
			   int spDnNum= Integer.parseInt(String.valueOf(spinfo.get("spDnNum")));  //@陈列数量
			
			   /*
				 * 
				 * 1.更新商品
				 * 
				 * */	 
					Map  smap=new HashMap();
					   smap.put("spDnNum", spDnNum+bgNum);
					   smap.put("spAllNum", spAllNum-bgNum);
					   smap.put("spId", spId);
					   service.updateBuGoods(smap);  //对spifo的更新
					   
				   /*
						 * 
						 * 2.更新库存
						 * 
						 * */	    
					   Integer renum=service.getRepertoryNUmint(rtId);
				 //System.out.println(renum);
					   Map  rmap=new HashMap();
					   rmap.put("rtNumber",renum-bgNum );
					   rmap.put("rtId", rtId);
					   service.updateBupertory(rmap);  //更新库存信息表 
					   
					   
					   /*  
						 *  3.记录货架表
						 *  
						 *  */
						 
			 /*	  public List<Map> qureyGoodsShelfRecordUtil(Integer rtid);  //补货时查询货架
				 public boolean insertGoodsShelfRecordUtil(Map map);  //补货时添加 商品货架记录表 
				public boolean UpdateGoodsShelfRecordUtil(Map map);  //补货时更新商品货架记录表 
				 */	 
					  
					   List<Map> gsrList=service.qureyGoodsShelfRecordUtil(rtId);//rtid  此时的rtid具有唯一性
					  
					   if(gsrList.size()>0){  
					 String guToday=String.valueOf(gsrList.get(0).get("guToday"));//获取当天日期
						Integer guTotalNum2=Integer.parseInt(String.valueOf(gsrList.get(0).get("guTotalNum")));//获取当天盘点总数量
						                     // 如果从仓库添加的 商品的批次 在 当前货架依然有 
						                     //1.更新 商品货架记录表 GoodsShelfRecordUtil当期批次的数量
						                    //2.更新   商品表（spinfo）的 陈列数量
                       int  NewGuNum=  Integer.parseInt(String.valueOf(gsrList.get(0).get("guNum"))) ;
						   Map  updatemap=new HashMap();
						   //System.out.println(gsrList.get(0).get("guNum"));
						   updatemap.put("guNum",NewGuNum+bgNum);
						   //System.out.println("guToday"+guToday);
						   //System.out.println("appId"+appId);
                         if(guToday.equals(appId)){ //如果商品今天重复补货
                        	 updatemap.put("guToday", guToday);
                           	  updatemap.put("guTotalNum",guTotalNum2+bgNum); //当前 今天货架盘点数量进行叠加
						   }else{
							   updatemap.put("guToday", appId);
						   updatemap.put("guTotalNum",NewGuNum+bgNum); //当前货架直接记录即可
						  }
						   
						   updatemap.put("rtId", rtId);
						   
						 
						   
						   
						   service.UpdateGoodsShelfRecordUtil(updatemap);  //更新当期批次的数量
					   
					   }else{  // 如果当前添加的货在     货架没有记录  直接记录新的  批次
					         // 3.重新添加   商品货架记录表 GoodsShelfRecordUtil  新的批次的数量
							  
						   Map  imap=new HashMap();
						   imap.put("spId", spId);
						   imap.put("rtId", rtId);
						   imap.put("guNum",bgNum );
						   imap.put("bgid", "1");
						   imap.put("guTotalNum", bgNum);
						   imap.put("guToday", appId);
						   service.insertGoodsShelfRecordUtil(imap);
					   }   
					  service.yescheckbuGoodsCheck(bgcNoId);
	    	}
		  
		return "true";
		  
	  }
	  @RequestMapping("/setpointGoodsShelf")
	  @ResponseBody
	  public String setpointGoodsShelf(@RequestBody Map map,HttpSession session){
		  
		  
		Integer rtId=  Integer.parseInt(String.valueOf(map.get("rtId"))) ;
		Integer spId=  Integer.parseInt(String.valueOf(map.get("spId"))) ;  
		Integer whId=  Integer.parseInt(String.valueOf(map.get("whId"))) ;  
		Double spBuyPrice=  Double.parseDouble(String.valueOf(map.get("spBuyPrice"))) ;   //损毁单价
		Integer sspDamageNum=  Integer.parseInt(String.valueOf(map.get("sspDamageNum"))) ;  //损毁数量
		if(sspDamageNum==null){
			sspDamageNum=0;
		}
		Integer sspLackNum=  Integer.parseInt(String.valueOf(map.get("sspLackNum"))) ;  //丢失数量
		if(sspLackNum==null){
			sspLackNum=0;
		}
	    int  sspLackMonery=(sspDamageNum+sspLackNum)*(new Double(spBuyPrice)).intValue();;
		
		  //System.out.println(map);
		  
		/*
		 * spifo的更新
 */
		  Map spinfo=  service.getSpifoNum(spId);//获取该@商品 信息  
		  int spAllNum= Integer.parseInt(String.valueOf(spinfo.get("spAllNum"))); //@商品剩余数量
		   int spDnNum= Integer.parseInt(String.valueOf(spinfo.get("spDnNum")));  //@陈列数量
		  Map  smap=new HashMap();
		   smap.put("spDnNum", spDnNum-sspDamageNum-sspLackNum);
		   smap.put("spAllNum", spAllNum-sspDamageNum-sspLackNum);
		   smap.put("spId", spId);
		   service.updateBuGoods(smap);  //对spifo的更新
		  
		   /*
			 * 更新库存信息表 
	 */
		  
		  Integer renum=service.getRepertoryNUmint(rtId);
				   Map  rmap=new HashMap();
				   rmap.put("rtNumber",renum-sspDamageNum-sspLackNum );
				   rmap.put("rtId", rtId);
		service.updateBupertory(rmap);  //更新库存信息表 
				   
		   /*
					 * 更新当期货架批次的数量 
			 */
				  
				   List<Map> gsrList=service.qureyGoodsShelfRecordUtil(rtId);//rtid  此时的rtid具有唯一性
				   int  NewGuNum=  Integer.parseInt(String.valueOf(gsrList.get(0).get("guNum"))) ;
				   int  NewguTotalNum=  Integer.parseInt(String.valueOf(gsrList.get(0).get("guTotalNum"))) ;
				   Map  updatemap=new HashMap();
				   //System.out.println(gsrList.get(0).get("guNum"));
				   updatemap.put("guNum",NewGuNum-sspDamageNum-sspLackNum);	  
				//  updatemap.put("guTotalNum",NewguTotalNum-sspDamageNum-sspLackNum);
				  
				   updatemap.put("rtId", rtId);
				   
				   service.UpdateGoodsShelfRecordUtil(updatemap);  //更新当期批次的数量
		  
				   
				   /*
					 * 记录盘点记录表
			 */		//#{sspDate},#{whId},#{spId},#{sspNum},#{sspDamageNum},#{sspLackMonery},#{ocId})
					  SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
					String datess=  df.format(new Date());
				    Map spmap=new HashMap();
				    spmap.put("sspDate", datess);
				    spmap.put("whId", whId);
				    spmap.put("spId", spId);
				    spmap.put("sspNum", spAllNum);
				    spmap.put("sspDamageNum", sspDamageNum);
				    spmap.put("sspLackNum", sspLackNum);
				    spmap.put("sspLackMonery", sspLackMonery);
				    Integer realname=	(Integer) session.getAttribute("ocId");
				    spmap.put("ocId", realname);
				 service.insertintoStockSetPoint(spmap);
		return null;
		
		  
	  }
	      
	  @RequestMapping("/getslectRtnum")
	  @ResponseBody
	  public String getslectRtnum(Integer rtid){
		   Map  map0=new HashMap();
		  map0.put("spid", 11);
	      List<Map> rep=service.newselectGoodsShelfRecordUtil(map0);  
		  //System.out.println(rep);
		return service.slectRtnum(rtid);
		
		  
	  }
}
