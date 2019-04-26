package com.aaa.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.aaa.entity.BasePojo;



public interface lksDaoMapper {
	//查询全部会员信息
	public List<Map> getvip();
	//根据商品条形码查出商品信息
	public List<Map> getspinfolks(String SpBarCode);
	//根据会员编号查询会员信息
	public List<Map> getviplks(Integer mpId);
	//添加会员
	public int addlks(BasePojo map);
	//修改会员
	public int upviplks(BasePojo map);
	//根据会员手机号查询会员信息
	public List<Map> getvipphonelks(String mpBalMOnery);
	//添加商品订单表
	public int addSpinfoOrderlks(BasePojo map);
	//查询商品订单表ID
	public int querySpinfoOrderlks();
	//添加商品销售表
	public int addSpinfoSpendlks(Map map);
	//修改商品信息表
	public int upspInfolks(Map map);
	//修改库存信息表
	public int uprepertorylks(Map map);
	//修改商品货架记录表
	public int upgoodsshelfrecordutillks(Map map);
	//修改会员表
	public int upmembershiplks(BasePojo map);
	//查询当天出单记录
	public List<Map> querySpinfoSpendlks();
	//查询退货单
	public List<Map> querytuihuolks(Integer soid);
	//查询详细商品信息
	public List<Map> querytuihuomigxilks(@Param("ssBarCode")String ssBarCode,@Param("soid")Integer soid);
	//添加退货记录
	public int addbackOrderGoodslks(BasePojo map);
	//根据条件查询退货单
	public List<Map> querybackorderlks(@Param("soid")Integer soids,@Param("sptId")String sptIds);
	//收银对账
	public List<Map> queryduizhanglks();
	//提交对账单
	public int addduizhanglks(Map map);
	//查看对账单
	public List<Map> queryduizhangshlks();
	//审核对账
	public int upduizhanglks(BasePojo map);
	//支付宝结算添加订单
	public int addAlipaylks(BasePojo map);
	
}
