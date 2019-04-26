package com.aaa.serviceImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aaa.dao.zyqDaoMapper;
import com.aaa.entity.BasePojo;
import com.aaa.entity.Spinfo;
import com.aaa.entity.SpinfoType;
import com.aaa.service.zyqService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
@SuppressWarnings("all")
public class zyqServiceImpl implements zyqService {

	@Autowired
	private zyqDaoMapper dao;

	// 查询订单信息
	public List<Map> queryAllSpinfoOrders() {
		// TODO Auto-generated method stub
		return dao.queryAllSpinfoOrders();
	}

	// 根据编号查询单个订单信息
	public List<Map> querySpinfoOrderById(Integer soid) {
		// TODO Auto-generated method stub
		return dao.querySpinfoOrderById(soid);
	}

	// 修改订单信息
	public int updateSpinfoOrder(BasePojo map) {
		// TODO Auto-generated method stub
		return dao.updateSpinfoOrder(map);
	}

	// 删除订单信息
	public int delSpinfoOrder(Integer soid) {
		// TODO Auto-generated method stub
		return dao.delSpinfoOrder(soid);
	}

	// 根据时间查询订单数量
	public Map queryAllSpinfoOrderDetail(String beginDate, String endDate,
			String keyWord, Integer pageNum, Integer limit) {
		PageHelper.startPage(pageNum, limit);
		List<Map> list = dao.queryAllSpinfoOrderDetail(beginDate, endDate,
				keyWord);
		PageInfo<Map> info = new PageInfo<Map>(list);
		Map map = new HashMap();
		map.put("code", 0);
		map.put("msg", "");
		map.put("count", info.getTotal());
		map.put("data", info.getList());
		return map;
	}

	// 查询商品信息
	public List<Map> queryAllSpinfo() {
		// TODO Auto-generated method stub
		return dao.queryAllSpinfo();
	}

	// 根据编号查询单个商品信息
	public List<Map> querySpinfoById(Integer spId) {
		// TODO Auto-generated method stub
		return dao.querySpinfoById(spId);
	}

	// 修改商品信息
	public int updateSpinfo(BasePojo map) {
		// TODO Auto-generated method stub
		return dao.updateSpinfo(map);
	}

	// 删除商品信息
	public int delSpinfo(Integer spId) {
		// TODO Auto-generated method stub
		return dao.delSpinfo(spId);
	}

	// 商品图片上传 添加商品信息
	@Override
	public void addSpinfo(Spinfo s) {
		// TODO Auto-generated method stub
		dao.addSpinfo(s);
	}

	// 查询商品类型
	public List<Map> querySpinfoType() {
		// TODO Auto-generated method stub
		return dao.querySpinfoType();
	}

	// 查询商品规格
	public List<Map> queryGoodsStandard() {
		// TODO Auto-generated method stub
		return dao.queryGoodsStandard();
	}

	// 查询商品品牌
	public List<Map> queryGoodsLogo() {
		// TODO Auto-generated method stub
		return dao.queryGoodsLogo();
	}

	// 查询计量单位
	public List<Map> queryGoodsMeasure() {
		// TODO Auto-generated method stub
		return dao.queryGoodsMeasure();
	}

	// 查询仓库类型
	public List<Map> queryWarehouse() {
		// TODO Auto-generated method stub
		return dao.queryWarehouse();
	}

	// 查询百货部门号
	public List<Map> queryGoodsDept() {
		// TODO Auto-generated method stub
		return dao.queryGoodsDept();
	}

	// 查询陈列分类号
	public List<Map> queryDisplayparse_copy() {
		// TODO Auto-generated method stub
		return dao.queryDisplayparse_copy();
	}

	// 查询通道序列号
	public List<Map> queryAccessno() {
		// TODO Auto-generated method stub
		return dao.queryAccessno();
	}

	// 查询bay序号
	public List<Map> querybayno() {
		// TODO Auto-generated method stub
		return dao.querybayno();
	}

	// 查询陈列数量
	public List<Map> queryDisplaynum() {
		// TODO Auto-generated method stub
		return dao.queryDisplaynum();
	}

	// 查询商品状态
	public List<Map> querySpinfoStatus() {
		// TODO Auto-generated method stub
		return dao.querySpinfoStatus();
	}

	// 查询全部商品类型信息
	public List<Map> queryAllSpinfoType() {
		// TODO Auto-generated method stub
		return dao.queryAllSpinfoType();
	}

	// 根据查询单个商品类型信息
	public List<Map> queryAllSpinfoTypeById(Integer sptId) {
		// TODO Auto-generated method stub
		return dao.queryAllSpinfoTypeById(sptId);
	}

	// 添加商品类型
	public int addSpinfoType(BasePojo map) {
		// TODO Auto-generated method stub
		return dao.addSpinfoType(map);
	}

	// 删除商品类型
	public int delSpinfoType(Integer sptId) {
		// TODO Auto-generated method stub
		return dao.delSpinfoType(sptId);
	}

	// 修改商品类型
	public int updateSpinfoType(BasePojo map) {
		// TODO Auto-generated method stub
		return dao.updateSpinfoType(map);
	}

	// 财务统计
	public Map queryAllFinance(String beginDate, String endDate,
			String keyWord, Integer pageNum, Integer limit) {
		PageHelper.startPage(pageNum, limit);
		List<Map> list = dao.queryAllFinance(beginDate, endDate, keyWord);
		PageInfo<Map> info = new PageInfo<Map>(list);
		Map map = new HashMap();
		map.put("code", 0);
		map.put("msg", "");
		map.put("count", info.getTotal());
		map.put("data", info.getList());
		return map;
	}

	// 查询职位信息
	public List<Map> selectOfficeClerk() {
		// TODO Auto-generated method stub
		return dao.selectOfficeClerk();
	}

	// 通过编号查询职员对应角色信息
	public List<Map> queryOfficeClerkById(Integer ocId) {
		// TODO Auto-generated method stub
		return dao.queryOfficeClerkById(ocId);
	}

	// 添加职位角色中间表信息
	public int addOfficeClerk(Map map) {
		// TODO Auto-generated method stub
		return dao.addOfficeClerk(map);
	}

	// 删除职位信息
	public int delOfficeClerk(Integer ocId) {
		// TODO Auto-generated method stub
		return dao.delOfficeClerk(ocId);
	}

	// 查看职员信息
	public List<Map> queryOneOfficeClerk(Integer ocId) {
		// TODO Auto-generated method stub
		return dao.queryOneOfficeClerk(ocId);
	}

	// 修改职位信息
	public int updateOfficeClerk(BasePojo map) {
		// TODO Auto-generated method stub
		return dao.updateOfficeClerk(map);
	}

	// 查看职员性别
	public List<Map> queryOfficeClerkBySex() {
		// TODO Auto-generated method stub
		return dao.queryOfficeClerkBySex();
	}

	// 下拉框查询角色信息
	public List<Map> queryRoleById() {
		// TODO Auto-generated method stub
		return dao.queryRoleById();
	}

	// 添加职员信息
	public int addManyOfficeClerk(Map map) {
		// TODO Auto-generated method stub
		return dao.addManyOfficeClerk(map);
	}

	// 查询部门
	public List<Map> selectDept() {
		// TODO Auto-generated method stub
		return dao.selectDept();
	}

	// 添加部门
	public int addDept(BasePojo map) {
		// TODO Auto-generated method stub
		return dao.addDept(map);
	}

	// 删除部门
	public int delDept(Integer dpId) {
		// TODO Auto-generated method stub
		return dao.delDept(dpId);
	}

	// 查询供货商信息
	public List<Map> selectSupplier() {
		// TODO Auto-generated method stub
		return dao.selectSupplier();
	}

	// 添加供货商信息
	public int addSupplier(BasePojo map) {
		// TODO Auto-generated method stub
		return dao.addSupplier(map);
	}

	// 查询单个供货商信息
	public List<Map> queryOneSupplier(Integer supId) {
		// TODO Auto-generated method stub
		return dao.queryOneSupplier(supId);
	}

	// 修改供货商信息
	public int updateSupplier(BasePojo map) {
		// TODO Auto-generated method stub
		return dao.updateSupplier(map);
	}

	// 查询供货商状态
	public List<Map> querysupState() {
		// TODO Auto-generated method stub
		return dao.querysupState();
	}

	// 获取职员信息总数
	public List<Map> queryocName() {
		// TODO Auto-generated method stub
		return dao.queryocName();
	}

	// 修改职员状态
	public int updateOfficeFlag(BasePojo map) {
		// TODO Auto-generated method stub
		return dao.updateOfficeFlag(map);
	}

	// 查询职员状态
	public List<Map> queryOfficeFlag() {
		// TODO Auto-generated method stub
		return dao.queryOfficeFlag();
	}

	// 单个查询职员信息
	public List<Map> queryOfficeClerk(Integer ocId) {
		// TODO Auto-generated method stub
		return dao.queryOfficeClerk(ocId);
	}

	//删除角色中间表
	public String delOrMiddle(String roleId, String ocId) {
		// TODO Auto-generated method stub
		return dao.delOrMiddle(roleId, ocId);
	}

}
