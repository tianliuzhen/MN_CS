package com.aaa.controller;

import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aaa.entity.BasePojo;
import com.aaa.service.WhService;
import com.sun.org.apache.xalan.internal.xsltc.compiler.sym;

@Controller
@RequestMapping("/wh")
@SuppressWarnings("all")
public class WhController {
	@Autowired
	private WhService whService;
//  查询所有仓库
	@RequestMapping("/getAllWareHouse")
    public @ResponseBody Map getAllWareHouse(BasePojo basepojo) {
		return whService.getAllWareHouse(basepojo);
	}
//	选择负责人 查询所有员工
	@RequestMapping("/getAllUser")
	public @ResponseBody Map getAllUsers(){
		List<Map> list=whService.getAllUsers();
//		封装分页需要的参数
		Map m=new HashMap();
		m.put("code", "0");
		m.put("msg","");
		m.put("count",list.size());
		m.put("data",list);
		return m;
	}
//	对用户的模糊查询
	@RequestMapping("/getUserByKey")
	public @ResponseBody Map getUserByKey(String keyWord){
		List<Map> list=whService.getAllUserByWord(keyWord);
//		封装分页需要的参数
		Map m=new HashMap();
		m.put("code", "0");
		m.put("msg","");
		m.put("count",list.size());
		m.put("data",list);
		return m;
	}
//	验证仓库名字唯一
	@RequestMapping("/checkWareName")
	public @ResponseBody String checkWareName(String whName,Integer whId){
		int count=whService.checkWhName(whName, whId);
//		判断此仓库名是否已经添加
		if(count==0){
		return "true";
		}else{
		return "false";
		}
	}
//	添加仓库
	@RequestMapping("/addWh")
	public @ResponseBody String addWh(BasePojo map) {
//		判断是否添加仓库成功
		int num=whService.addWh(map);
		if(num>0){
		return "success";
		}
		return "error";
	}
//	根据仓库ID仓库
	@RequestMapping("/getHouseByWhId")
	public @ResponseBody Map getHouseByWhId(Integer WhId){
		return whService.getHousrByWhId(WhId);
	}
//	更新仓库
	@RequestMapping("/updateWh")
	public @ResponseBody String updateWh(BasePojo map){
//		判断是否更新仓库成功
		int num=whService.updateWh(map);
		if(num>0){
			return "success";
			}
			return "error";
	}
//	删除之前统计仓库里面有无商品
	@RequestMapping("/getSpInfoByWhId")
	public @ResponseBody String getSpinfoByWhId(Integer whId){
		List<Map> list=whService.getSpinfoByWhId(whId);
//		如果此仓库下有商品并且商品数量大于0就返回fasle 不能删除    如果没有商品或者商品数量等于0就返回true 可以删除
		if(list.size()>0){
		return "fasle";
		}else{
	    return "true";
		}
	}
//	删除仓库
	@RequestMapping("/delWh")
	public @ResponseBody String delWh(Integer whId){
		int num=whService.delWh(whId);
		if(num>0){
			return "success";
			}
			return "error";
	}
//	查询所有采购单
	@RequestMapping("/getAllStockInfo")
	public @ResponseBody Map getStockInfo(BasePojo basePojo) {
		return whService.getAllStockInfo(basePojo);
	}
//	查询采购单详情
	@RequestMapping("/getStockdetail")
	public @ResponseBody Map getStockdetail(Integer stkId,String keyWord){
		List<Map> list=whService.getStockdetail(stkId,keyWord);
       for(int i=0;i<list.size();i++){
			list.get(i).put("id", i);
		}
		Map m=new HashMap();
		m.put("code", "0");
		m.put("msg","");
		m.put("count",list.size());
		m.put("data",list);
		return m;
	}
//	商品入库
	@RequestMapping("/inHouse")
	public @ResponseBody Map inHouse(BasePojo list){
		  whService.inHouse(list.getList(),list.getStatus());
		  List<Map> listTwo=whService.getStockdetail(list.getStkId(),list.getKeyWord());
	       for(int i=0;i<listTwo.size();i++){
	    	   listTwo.get(i).put("id", i);
			}
			Map m=new HashMap();
			m.put("code", "0");
			m.put("msg","");
			m.put("count",listTwo.size());
			m.put("data",listTwo);
			return m;
	  
	}
//	查询所有入库单
	@RequestMapping("/getAllInHouse")
	public @ResponseBody Map getAllInHouse(BasePojo basePojo) {
		return whService.getAllInHouse(basePojo);
	}
//	查询入库单详情
	@RequestMapping("/getAllInHouseInfo")
	public @ResponseBody Map getAllInHouseInfo(Integer InId,String keyWord){
		Map map=whService.getAllInHouseInfo(InId,keyWord);
		return map;
	}
//	查询所有商品
	@RequestMapping("/getAllSpInfo")
	public @ResponseBody Map getAllSpInfo(BasePojo basePojo){
		return whService.getAllSpInfo(basePojo);
	}
//	查询根据商品id 查询库存信息表
	@RequestMapping("/getAllRepertory")
	public @ResponseBody Map getAllRepertory(Integer spId,String keyWord){
		return whService.getAllRepertory(spId, keyWord);
	}
//	查询仓库
	@RequestMapping("/getWh")
	public @ResponseBody List<Map> getWh(){
		return whService.getWh();
	}
//	查询所有出库记录
	@RequestMapping("/getAllBuGoods")
	public @ResponseBody Map getAllBuGoods(BasePojo basePojo) {
		return whService.getAllBuGoods(basePojo);
	}
}
