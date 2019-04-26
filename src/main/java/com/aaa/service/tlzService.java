package com.aaa.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.github.pagehelper.PageInfo;

public interface tlzService {
	 public List<Map> getAllMapGoodsDept(@Param("gdnameOne") String gdname);
	 
	  public List<Map> getOrderNeedToShelf(); //查询每个部门  需要补货的数量1
	 
	 public List<Map> getAllGoodsShelf(String gdName);
	 
	 public PageInfo<Map> getAllGoodsShelf(Integer pageNum,String gdName);//分页百货  部门查找
	 
	  public PageInfo<Map>  getAllSaleUtilByOneOnGoodSDept(Integer spid,Integer pageNum); 
	  public List<Map>  getNoShelfGoods(String spStatu);//查询未上架商品
	  
	  
	  public List<Map>  getGoodsDeptOne();                       //百货部门
	  
	   public List<Map>  getDisplayParseOne();           //陈列分类号
	  
	   public List<Map>  getAccessNoOne();                    //通道序号
	  
	   public List<Map>  getBayNoOne();                     //BAY序号:
	   
	   public boolean updateApplyGoodsShelf(Map map);  //提交上架商品上架审核
	   
	   public boolean updateApplyGoodsShelfCheck(Integer i,Integer num);  //确认审核
	   
	   public boolean updateApplyGoodsShelf2(Map map);  //提交上架商品下架审核
	   
	   public Map getSpifoNum(Integer i);  //查询商品剩余数量
	   
	   public boolean updateApplyGoodsShelfCheck2(Map map);  //  确认审核
	   
	   public List<Map> getAllMapGoodsDifferentUtil(Integer spid);  //查询 同一种商品不同的 进货单
	   
	   public boolean  updateBuGoods(Map map);//补货后修改商品记录信息
	   
	   public boolean  updateBupertory(Map map);//修改  该商品仓库 进货记录
	   
	   public boolean insertBuGoods(Map map); //添加补货记录
	   
	   public List<Map> getAllMapBuGoods(int spid);  //查询补货记录
	  
	   public List<Map> getClearGoods(Integer spid);// 理货时  查询 不同日期的商品
	   
	   public List<Map> qureyGoodsShelfRecordUtil(Integer rtid);  //补货时查询货架
	   
	   public boolean insertGoodsShelfRecordUtil(Map map);  //补货时添加 商品货架记录表 
	   
	   public boolean UpdateGoodsShelfRecordUtil(Map map);  //补货时添加 商品货架记录表 
	   
	   public boolean  insertbuGoodsCheck(Map map); //添加补货记录审核表
	   
	   public  List<Map> selecetbuGoodsCheck(Integer spid);  //查询补货记录表
	   
	   public List<Map>  getAllNocheckbuGoodsCheck(String status);  //查询待审核
	   
	   public List<Map>  getUtilNocheckbuGoodsCheck(String bgcNoId);  //查询待审核详细
	   
	   public boolean  yescheckbuGoodsCheck(String spid);// 确认补货审核
	   
	   public Integer  getRepertoryNUmint(Integer rtid);  //根据仓库rtid 查询所剩库存
	   
	   public List<Map> qureyGoodsShelfRecordUtil2(Integer rtId,Integer spId);  //补货时查询货架
	   
	   public boolean  insertintoStockSetPoint(Map map);  //添加货架盘点记录

	   
	   public String   slectRtnum(Integer rtid);  //查询出当天该商品的消费数量	
	   
	   public boolean  insertUpanddownCheck(Map map);// 插入上下架审核表
	   
	   public List<Map>  getListMapUpanddownCheck();// 查询上下架审核表
	   
	   public List<Map>  getNoShelfGoods2(String spucId,String spStatu);//查询未上架商品
	   
	   public List<Map>  UpdateUpanddownCheck(String spucId);// 查询上架审核表
	   
	   public List<Map>  getListMapUpanddownCheck2(String status);// 查询下架审核表
	   
	   public List<Map>  UpdateUpanddownCheck2(String spucId);// 查询下架审核表
	   
	   public List<Map>  getNoShelfGoods3(String spStatu);//查询未上架商品
	   
	   public List<Map> qureyGoodsShelfRecordUtil3Byspid(Integer spid); //下架查询rtid  执行入库
	   
//		生成入库单返回主键
	   public int createInHouseWarant(Map map);
//		生成入库详细记录
	   public int createInHouseWarantInfo(Map map);
		
	   public boolean   deleteGoodsShelfRecordUtil(Map map); //下架时删除该商品货架记录
		 
	   public List<Map> qureyGoodsShelfRecordUtil3(Integer spid);  //下架时查询  不同批次的库存
	   
	   public boolean  updateBupertory2(Map map);// 3. 修改  该商品仓库 进货记录
	   
	   public List<Map>  newselectGoodsShelfRecordUtil(Map map);
	   
	   public List<Map>  UpdateUpanddownCheck2xx(String spucId);// 查询下架审核表
}

