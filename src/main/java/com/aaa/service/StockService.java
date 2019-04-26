package com.aaa.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.aaa.entity.backsale;
import com.aaa.entity.stock;
import com.aaa.entity.stockdetail;
import com.aaa.entity.supplier;

 
public interface StockService {
	
	public List<Map> getgoodsmeasure(  ); //查询商品单位
	public List<Map> getspinfotype( Integer sptId); //查询商品类型
	
	public List<Map> getSupplier( Integer sptId); //查询供货商
	public List<Map> getwarehouse(); // 查询仓库
	public List<Map> getspinfoall();  //查询已有商品
	public   Map  getspinfoalllay(String keyWord,Integer pageNum,Integer limit,Integer spAllNum);   
	public List<Map>  getoffice(String name); //查询登录员工
	public int addstock(stock s);         //添加采购单
	public int selstockdetaillimit();      //获取采购单新添加列
	public int addstockdetail(stockdetail sd); //添加采购明细
    
	public Map selstocklay(String keyWord,Integer pageNum,Integer limit,Integer Stauts, String begindate, String enddate); //查询采购单
	public Map selstockdetaillay(Integer stkId); //查询采购明细
	
	public int yes_stock( stock s );//采购审核通过
	public int no_stock(stock s  );//采购审核驳回
	public int yes_stock2( stock s );//采购审核通过
	public int no_stock2(stock s  );//采购审核驳回
	
	public int  paymoney(int stkId,Double ppPay,Double ppMoney );//采购拨款
	 
	
	public Map selbacklay(String keyWord,Integer pageNum,Integer limit,Integer Stauts,String begindate,String enddate);//退货单查询
	public Map selbackutillay(Integer bsId);//查询退货单明细 
	public int yes_back( backsale b );//退货审核通过
	public int no_back( backsale b  );//退货审核驳回
	 
	public List<Map> chartone(); 
	public List<Map> chartpayin(int year); //采购 金额统计
	public List<Map> chartpayout(int year); // 退货金额统计
	public List<Map> chartsale(@Param("year")int year); // 销售金额统计
	public List<Map> chartsalesub(@Param("year")int year); // 销售盈利统计 每月 

	public List<Map> chartsaledate(@Param("year")int year,@Param("month")int month); // 销售金额统计  每天
	public List<Map> chartsalesubdate(@Param("year")int year,@Param("month")int month); // 销售金额统计  每天 盈利
	public List<Map> chartsun( int year );
	
	public int upd_spinfo(Double sale,Double buy,Integer type ,Integer spId);//商品属性修改
}
