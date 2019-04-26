package com.aaa.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.aaa.entity.BasePojo;
import com.sun.org.glassfish.gmbal.ParameterNames;

public interface WhDao {
//  查询所有仓库
	public List<Map> getAllWareHouse(BasePojo basepojo);
//	选择负责人 查询所有员工
	public List<Map> getAllUsers();
//	选择负责人 模糊查询员工
	public List<Map> getAllUserByWord(@Param("keyWord")String keyWord);
//	验证仓库名唯一
	public int checkWhName(@Param("whName")String whName,@Param("whId")Integer whId);
//	添加仓库
	public int addWh(BasePojo map);
//	根据Id查询仓库信息
	public Map getHousrByWhId(@Param("WhId")Integer WhId);
//	更新仓库
	public int updateWh(BasePojo map);
//	删除之前统计仓库里面有无商品
	public List<Map> getSpinfoByWhId(@Param("whId")Integer whId);
//	删除仓库
	public int delWh(Integer whId);
//	查询采购单信息
	public List<Map> getAllStockInfo(BasePojo basePojo);
//	查询采购单详情
	public List<Map> getStockdetail(@Param("stkId")Integer stkId,@Param("keyWord")String keyWord);
//	查询入库单
	public List<Map> getInHouse(@Param("stkId")Object stkId,@Param("whId")Object whId);
//	查询入库明细单
	public List<Map> getInhouseInfo(@Param("InId")Object InId,@Param("spId")Object spId,@Param("rtbegDate")String rtbegDate);
//	查询库存单
	public List<Map> getRepertoryo(@Param("spId")Object spId,@Param("rtbegDate")Object rtbegDate);
//	执行入库单数量修改
	public int updateInHouseInfo(@Param("inUtilId")Object inUtilId,@Param("srsl")Object srsl);
//	执行库存数量修改
	public int updaterepertory(@Param("rtId")Object rtId,@Param("srsl")Object srsl);
//	修改采购单数量
	public int updateStockdetail(@Param("sdId")Object sdId,@Param("srsl")Object srsl);
//	修改采购单明细状态
	public int updateStockdetailStatus(@Param("sdId")Object sdId);
//	修改商品总库存
	public int updateSpinfoTwo(@Param("spId")Object spId,@Param("srsl")Object srsl);
//	生成入库单返回主键
	public int createInHouseWarant(Map map);
//	生成入库详细记录
	public int createInHouseWarantInfo(Map map);
//	生成库存信息记录
	public int createPertoryo(Map map);
//	把商品总库存更新
	public int updateSpinfo(Map map);
//	把采购单状态改为已审核
	public int updateStockStatus(Map map);
//	查询入库单信息
	public List<Map> getAllInHouse(BasePojo basePojo);
//  查询入库单详细
	public List<Map> getAllInHouseInfo(@Param("InId")Integer InId,@Param("keyWord")String keyWord);
//	查询所有商品
	public List<Map> getAllSpInfo(BasePojo basePojo);
//  查询商品详细
	public List<Map> getAllRepertory(@Param("spId")Integer spId,@Param("keyWord")String keyWord);
//  查询仓库
	public List<Map> getWh();
//	查询入出库单信息
	public List<Map> getAllBuGoods(BasePojo basePojo);
}
