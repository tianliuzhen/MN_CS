package com.aaa.service;

import java.util.List;
import java.util.Map;

import com.aaa.entity.BasePojo;
import com.aaa.entity.Spinfo;
import com.aaa.entity.SpinfoType;

@SuppressWarnings("all")
public interface zyqService {
	// 查询订单信息
	public List<Map> queryAllSpinfoOrders();

	// 根据编号查询单个订单信息
	public List<Map> querySpinfoOrderById(Integer soid);

	// 修改订单信息
	public int updateSpinfoOrder(BasePojo map);

	// 删除订单信息
	public int delSpinfoOrder(Integer soid);

	// 根据时间查询订单数量
	public Map queryAllSpinfoOrderDetail(String beginDate, String endDate,
			String keyWord, Integer pageNum, Integer limit);

	// 查询商品信息
	public List<Map> queryAllSpinfo();

	// 查询单个商品信息
	public List<Map> querySpinfoById(Integer spId);

	// 修改商品信息
	public int updateSpinfo(BasePojo map);

	// 删除商品信息
	public int delSpinfo(Integer spId);

	// 商品图片上传 添加商品信息
	public void addSpinfo(Spinfo s);

	// 查询商品类型
	public List<Map> querySpinfoType();

	// 查询商品规格
	public List<Map> queryGoodsStandard();

	// 查询商品品牌
	public List<Map> queryGoodsLogo();

	// 查询计量单位
	public List<Map> queryGoodsMeasure();

	// 查询仓库类型
	public List<Map> queryWarehouse();

	// 查询百货部门号
	public List<Map> queryGoodsDept();

	// 查询陈列分类号
	public List<Map> queryDisplayparse_copy();

	// 查询通道序列号
	public List<Map> queryAccessno();

	// 查询Bay序号
	public List<Map> querybayno();

	// 查询陈列数量
	public List<Map> queryDisplaynum();

	// 查询商品状态
	public List<Map> querySpinfoStatus();

	// 查询全部商品类型信息
	public List<Map> queryAllSpinfoType();

	// 根据查询单个商品类型信息
	public List<Map> queryAllSpinfoTypeById(Integer sptId);

	// 添加商品类型

	public int addSpinfoType(BasePojo map);

	// 删除商品类型
	public int delSpinfoType(Integer sptId);

	// 修改商品类型
	public int updateSpinfoType(BasePojo map);

	// 财务统计
	public Map queryAllFinance(String beginDate, String endDate,
			String keyWord, Integer pageNum, Integer limit);

	// 查询职位信息
	public List<Map> selectOfficeClerk();

	// 通过编号查询职员对应角色信息
	public List<Map> queryOfficeClerkById(Integer ocId);

	// 添加职位角色中间表信息
	public int addOfficeClerk(Map map);

	// 删除职位信息
	public int delOfficeClerk(Integer ocId);

	// 查看职员信息
	public List<Map> queryOneOfficeClerk(Integer ocId);

	// 修改职位信息
	public int updateOfficeClerk(BasePojo map);

	// 查看职员性别
	public List<Map> queryOfficeClerkBySex();

	// 下拉框查询角色信息
	public List<Map> queryRoleById();

	// 添加职员信息
	public int addManyOfficeClerk(Map map);

	// 获取职员信息总数
	public List<Map> queryocName();

	// 查看员工状态
	public List<Map> queryOfficeFlag();

	// 单个查询职员信息
	public List<Map> queryOfficeClerk(Integer ocId);

	// 修改员工状态
	public int updateOfficeFlag(BasePojo map);
	//删除角色中间表
	  public String delOrMiddle(String roleId,String ocId);

	// 查询部门
	public List<Map> selectDept();

	// 添加部门
	public int addDept(BasePojo map);

	// 删除部门
	public int delDept(Integer dpId);

	// 查询供货商信息
	public List<Map> selectSupplier();

	// 添加供货商信息
	public int addSupplier(BasePojo map);

	// 查询单个供货商信息
	public List<Map> queryOneSupplier(Integer supId);

	// 修改供货商信息
	public int updateSupplier(BasePojo map);

	// 查询供货商状态
	public List<Map> querysupState();

}
