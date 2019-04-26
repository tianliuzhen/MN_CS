package com.aaa.dao;
 
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.aaa.entity.backsale;
import com.aaa.entity.stock;
import com.aaa.entity.stockdetail;
import com.aaa.entity.supplier;

public interface StockDaoMapper {
	public List<Map> getgoodsmeasure(  ); //查询商品单位

	
	public List<Map> getspinfotype( Integer sptId); //查询商品类型
	
	public List<Map> getSupplier(@Param("sptId")Integer sptId);//查询供货商
	public List<Map> getwarehouse();//查询仓库
	public List<Map> getspinfoall(@Param("keyWord")String keyWord,@Param("spAllNum")Integer spAllNum);//查询已有商品
	public List<Map>  getoffice(@Param("ocRealName")String name);//查询登录员工
	public int addstock(stock s);//添加采购单
	public int selstockdetaillimit();//获取采购单添加列
	public int addstockdetail(stockdetail sd);//添加采购明细
    
	 
	public List<Map> selstocklay(@Param("keyWord")String keyWord,@Param("Stauts")Integer Stauts,@Param("begindate")String begindate,@Param("enddate")String enddate); //查询采购单
	public List<Map> selstockdetail(Integer stkId); //查询订采购单明细
	public int yes_stock( stock s );//采购审核通过
	public int no_stock(stock s  );//采购审核驳回
	public int yes_stock2( stock s );//采购审核通过
	public int no_stock2(stock s  );//采购审核驳回
	
	public int  paymoney(@Param("ppPay")Double ppPay,@Param("ppMoney")Double ppMoney,@Param("ppDebt")Double ppDebt );//进货拨款
	public int  getPur( );//进货拨款 添加进货联系
	public int  updatestock(@Param("stkId")int stkId,@Param("ppId")int ppId,@Param("purDate")String purDate);//进货拨款 添加进货联系
    
	
	 
	public List<Map> selbacklay(@Param("keyWord")String keyWord,@Param("btauts")Integer Stauts,@Param("begindate")String begindate,@Param("enddate")String enddate);//查询退货单
	public List<Map> selbackutil(@Param("bsId")int bsId); //查询退货单明细
	public int yes_back( backsale b );//退货审核通过
	public int no_back( backsale b  );//退货审核驳回
	 
	public List<Map> chartone();  
	public List<Map> chartpayin(@Param("year")int year); //采购 金额统计
	public List<Map> chartpayout(@Param("year")int year); // 退货金额统计
	public List<Map> chartsale(@Param("year")int year); // 销售金额统计 每月 
	public List<Map> chartsalesub(@Param("year")int year); // 销售盈利统计 每月 
	public List<Map> chartsaledate(@Param("year")int year,@Param("month")int month); // 销售金额统计  每天
	public List<Map> chartsalesubdate(@Param("year")int year,@Param("month")int month); // 销售金额统计  每天 盈利
	public List<Map> chartsun(@Param("year")int year ); // 商品报损金额统计 每月
	
	public int upd_spinfo(@Param("spSalePrice")Double sale,@Param("spBuyPrice")Double buy,@Param("sptId")Integer type ,@Param("spId")Integer spId);//商品属性修改
}
