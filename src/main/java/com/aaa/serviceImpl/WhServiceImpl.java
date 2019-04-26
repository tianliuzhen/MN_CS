package com.aaa.serviceImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.aaa.dao.WhDao;
import com.aaa.entity.BasePojo;
import com.aaa.service.WhService;
import com.fasterxml.jackson.databind.node.POJONode;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
@Service
@SuppressWarnings("all")
public class WhServiceImpl implements WhService{
@Autowired
private WhDao whDao;
//  查询所有仓库
	public Map getAllWareHouse(BasePojo basepojo) {
//		使用后mybatis提供的分页插件
		PageHelper.startPage(basepojo.getPageNum(),basepojo.getLimit());
		List<Map> list=whDao.getAllWareHouse(basepojo);
		PageInfo<Map> info=new PageInfo<Map>(list);
		Map map = new HashMap();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count",info.getTotal());
        map.put("data", info.getList());
		return map;
	}
//	选择负责人 查询所有员工
	public List<Map> getAllUsers() {
		return whDao.getAllUsers();
	}
//	选择负责人 模糊查询员工
	public List<Map> getAllUserByWord(String keyWord) {
		return whDao.getAllUserByWord(keyWord);
	}
//	验证仓库名唯一
	public int checkWhName(String whName,Integer whId){
		return whDao.checkWhName(whName, whId);
	}
//	添加仓库
	public int addWh(BasePojo map) {
		return whDao.addWh(map);
	}
//	根据Id查询仓库信息
	public Map getHousrByWhId(Integer WhId){
		return whDao.getHousrByWhId(WhId);
	}
//	更新仓库
	public int updateWh(BasePojo map) {
		return whDao.updateWh(map);
	}
//	删除之前统计仓库里面有无商品
	public List<Map> getSpinfoByWhId(Integer whId){
		return whDao.getSpinfoByWhId(whId);
	}
//	删除仓库
	public int delWh(Integer whId) {
		return whDao.delWh(whId);
	}
//  查询采购单
	public Map getAllStockInfo(BasePojo basePojo) {
		PageHelper.startPage(basePojo.getPageNum(),basePojo.getLimit());
		List<Map> list=whDao.getAllStockInfo(basePojo);
		PageInfo<Map> info=new PageInfo<Map>(list);
		Map map = new HashMap();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count",info.getTotal());
        map.put("data", info.getList());
		return map;
	}
//	查询采购单详情
	public List<Map> getStockdetail(Integer stkId,String keyWord) {
		return whDao.getStockdetail(stkId,keyWord);
	}
//	执行入库操作
	@Transactional(rollbackFor=Exception.class)
	public void inHouse(List<Map> list,Integer status) {
		 Random rand = new Random();
//		首先判断是否已经生成此采购单的入库单，不同的仓库要生成不同的采购单
//					如果存在  则只生成入库明细    首先判断入库明细里面是否有同批次的商品
					for(int k=0;k<list.size();k++){
						//查询是否已经生成此采购单的入库单
						List<Map> listTwo=whDao.getInHouse(list.get(k).get("stkId"),list.get(k).get("whId"));
						//如果存在
						if(listTwo.size()>0){
//						查询入库详细  判断入库的是否是同一个生产日期的同一批次商品  如果是  只叠加数量 否则生成一个新的批次的库存商品
						List<Map> listThree=whDao.getInhouseInfo(listTwo.get(0).get("InId"),list.get(k).get("spId"),String.valueOf(list.get(k).get("rtbegDate")));
//						查询库存详细 同样判断入库的是否是同一个生产日期的同一批次商品  如果是  只叠加数量 否则生成一个新的批次的库存商品
						List<Map> listFour=whDao.getRepertoryo(list.get(k).get("spId"),list.get(k).get("rtbegDate"));
                        //如果存在
					    if(listThree.size()>0){
					    	if(list.get(k).get("rtbegDate").equals("无")){
					    		  whDao.updateStockdetailStatus(list.get(k).get("sdId"));
							}else{
								//执行数量叠加修改操作  同时让采购单明细数量减少  库存数量相应增加
						    	  for(int j=0;j<listThree.size();j++){
						    		   //更新入库单修改数量
								    	whDao.updateInHouseInfo(listThree.get(j).get("inUtilId"),list.get(k).get("srsl"));
								       //更新库存信息修改数量
								    	if(listFour.size()>0){
								    		whDao.updaterepertory(listFour.get(j).get("rtId"), list.get(k).get("srsl"));
								    	}
								    	//修改采购单数量
								    	whDao.updateStockdetail(list.get(k).get("sdId"), list.get(k).get("srsl"));
								    	//修改商品总库存
								    	whDao.updateSpinfoTwo( list.get(k).get("spId"),  list.get(k).get("srsl"));
								    }
							}
					    }else{
//					    	如果不存在同一批次的商品，在入库明细单里面添加一列
					    	list.get(k).put("InId",listTwo.get(0).get("InId"));
                            //生成入库详细记录
					    	whDao.createInHouseWarantInfo(list.get(k));
					    	//修改采购单数量 
					    	whDao.updateStockdetail(list.get(k).get("sdId"), list.get(k).get("srsl"));
					    	//修改采购单数量 
					    	whDao.updateSpinfoTwo(list.get(k).get("spId"), list.get(k).get("srsl"));
					    	list.get(k).put("SpBarCode",rand.nextInt(999999999));
					    	//生成库存信息记录  只有在商品数量大于0的时候
					    	if(list.get(k).get("srsl").equals("0")){
					    		//把状态改为结束
					    	  whDao.updateStockdetailStatus(list.get(k).get("sdId"));
					    	}else if(list.get(k).get("srsl").equals(""+list.get(k).get("spNumber")+"")){
					    		  //把状态改为结束
						    	  whDao.updateStockdetailStatus(list.get(k).get("sdId"));
						    	  whDao.createPertoryo(list.get(k));
					    	}else {
					    		whDao.createPertoryo(list.get(k));
							}
					    }
					}else{
                         //如果没有生成入库单						
//						1.先生成入库单  返回主键  如果验收数量	没填  默认为0
						    int num=whDao.createInHouseWarant(list.get(k));
//							把返回的主键当成参数传回去
							list.get(k).put("InId", list.get(k).get("InId"));
//							2.再生成入库详细记录 "主键"：list.get(i).get("InId")
							if(num>0){
								//生成入库详细记录
								whDao.createInHouseWarantInfo(list.get(k));
//								3 生成库存信息记录
								list.get(k).put("SpBarCode",rand.nextInt(999999999));
								if(list.get(k).get("srsl").equals("0")){
						    		//把状态改为结束
						    	  whDao.updateStockdetailStatus(list.get(k).get("sdId"));
						    	}else if(list.get(k).get("srsl").equals(""+list.get(k).get("spNumber")+"")){
						    		  //把状态改为结束
							    	  whDao.updateStockdetailStatus(list.get(k).get("sdId"));
							    	  whDao.createPertoryo(list.get(k));
						    	}else {
						    		whDao.createPertoryo(list.get(k));
								}
//								4 在商品信息表里面 根据商品id增加商品的库存
								whDao.updateSpinfo(list.get(k));
								whDao.updateStockdetail(list.get(k).get("sdId"), list.get(k).get("srsl"));
							}
						}
					}
//			5.如果是验收结束，把采购单状态改为审核完毕  到此 此采购单验收完成
			if(status==1){
				whDao.updateStockStatus(list.get(0));
			}
	}
//  查询入库单
	public Map getAllInHouse(BasePojo basePojo) {
		PageHelper.startPage(basePojo.getPageNum(),basePojo.getLimit());
		List<Map> list=whDao.getAllInHouse(basePojo);
		PageInfo<Map> info=new PageInfo<Map>(list);
		Map map = new HashMap();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count",info.getTotal());
        map.put("data", info.getList());
		return map;
	}
//	查询入库单详情
	public Map getAllInHouseInfo(Integer InId, String keyWord) {
		List<Map> list=whDao.getAllInHouseInfo(InId, keyWord);
		Map m=new HashMap();
		m.put("code", "0");
		m.put("msg","");
		m.put("count",list.size());
		m.put("data",list);
		return m;
	}
//	查询所有商品
	public Map getAllSpInfo(BasePojo basePojo) {
		PageHelper.startPage(basePojo.getPageNum(),basePojo.getLimit());
		List<Map> list=whDao.getAllSpInfo(basePojo);
		PageInfo<Map> info=new PageInfo<Map>(list);
		Map map = new HashMap();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count",info.getTotal());
        map.put("data", info.getList());
		return map;
	}
//  查询商品详细
	public Map getAllRepertory(Integer spId, String keyWord) {
		List<Map> list=whDao.getAllRepertory(spId, keyWord);
		Map m=new HashMap();
		m.put("code", "0");
		m.put("msg","");
		m.put("count",list.size());
		m.put("data",list);
		return m;
	}
//  查询仓库
	public List<Map> getWh() {
		return whDao.getWh();
	}
//  查询出库单
	public Map getAllBuGoods(BasePojo basePojo) {
		PageHelper.startPage(basePojo.getPageNum(),basePojo.getLimit());
		List<Map> list=whDao.getAllBuGoods(basePojo);
		PageInfo<Map> info=new PageInfo<Map>(list);
		Map map = new HashMap();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count",info.getTotal());
        map.put("data", info.getList());
		return map;
	}

}
