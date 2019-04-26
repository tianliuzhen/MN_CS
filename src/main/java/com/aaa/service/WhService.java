package com.aaa.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.aaa.entity.BasePojo;

public interface WhService {
//  查询所有仓库
	public Map getAllWareHouse(BasePojo basepojo);
//	选择负责人 查询所有员工
	public List<Map> getAllUsers();
//	选择负责人 模糊查询员工
	public List<Map> getAllUserByWord(String keyWord);
//	验证仓库名唯一
	public int checkWhName(String whName,Integer whId);
//	添加仓库
	public int addWh(BasePojo map);
//	根据Id查询仓库信息
	public Map getHousrByWhId(Integer WhId);
//	更新仓库
	public int updateWh(BasePojo map);
//	删除之前统计仓库里面有无商品
	public List<Map> getSpinfoByWhId(Integer whId);
//	删除仓库
	public int delWh(Integer whId);
//  查询采购单
	public Map getAllStockInfo(BasePojo basePojo);
//	查询采购单详情
	public List<Map> getStockdetail(Integer stkId,String keyWord);
//	执行入库操作
	public void inHouse(List<Map> list,Integer status);
//  查询入库单
	public Map getAllInHouse(BasePojo basePojo);
//  查询入库单详细
	public Map getAllInHouseInfo(Integer InId,String keyWord);
//	查询所有商品
	public Map getAllSpInfo(BasePojo basePojo);
//  查询商品详细
	public Map getAllRepertory(Integer spId,String keyWord);
//  查询仓库
	public List<Map> getWh();
//  查询出库单
	public Map getAllBuGoods(BasePojo basePojo);
}
