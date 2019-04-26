package com.aaa.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.aaa.entity.BasePojo;
import com.aaa.entity.Spinfo;
import com.aaa.entity.SpinfoType;
import com.aaa.entity.supplier;
import com.aaa.face.FaceAdd;
import com.aaa.service.zyqService;
import com.alibaba.fastjson.JSON;

@Controller
//请求映射路径
@RequestMapping("/SpinfoOrder")
@SuppressWarnings("all")
public class zyqController {
	@Autowired
	private zyqService zs;

	// 查询订单信息
	@RequestMapping("/queryAllSpinfoOrders")
//用于异步获取数据  在使用 @RequestMapping后，返回值通常解析为跳转路径，但是加上 @ResponseBody 后返回结果不会被解析为跳转路径，而是直接写入 HTTP response body 中
	@ResponseBody
	public List<Map> queryAllSpinfoOrders() {
		return zs.queryAllSpinfoOrders();

	}

	// 根据编号查询单个订单信息
	@RequestMapping("/querySpinfoOrderById")
	public @ResponseBody
	List<Map> querySpinfoOrderById(Integer soid) {

		return zs.querySpinfoOrderById(soid);

	}

	// 修改订单信息
	@RequestMapping("/updateSpinfoOrder")
	public @ResponseBody
	String updateSpinfoOrder(BasePojo map) {
		int num = zs.updateSpinfoOrder(map);
		if (num > 0) {
			return "success";
		}
		return "error";
	}

	// 删除订单信息
	@RequestMapping("/delSpinfoOrder")
	public @ResponseBody
	String delSpinfoOrder(Integer soid) {
		zs.delSpinfoOrder(soid);
		return "true";
	}

	// 根据时间查询订单数量
	@RequestMapping("/queryAllSpinfoOrderDetail")
	public @ResponseBody
	Map queryAllSpinfoOrderDetail(String beginDate, String endDate,
			String keyWord, Integer pageNum, Integer limit) {
		return zs.queryAllSpinfoOrderDetail(beginDate, endDate, keyWord,
				pageNum, limit);
	}

	// 查询商品信息
	@RequestMapping("/queryAllSpinfo")
	@ResponseBody
	public List<Map> queryAllSpinfo() {
		return zs.queryAllSpinfo();

	}

	// 根据编号查询单个商品信息
	@RequestMapping("/querySpinfoById")
	public @ResponseBody
	List<Map> querySpinfoById(Integer spId) {

		return zs.querySpinfoById(spId);

	}

	// 修改商品信息
	@RequestMapping("/updateSpinfo")
	public @ResponseBody
	String updateSpinfo(BasePojo map) {
		int num = zs.updateSpinfo(map);
		if (num > 0) {
			return "success";
		}
		return "error";
	}

	// 删除商品信息
	@RequestMapping("/delSpinfo")
	public @ResponseBody
	String delSpinfo(Integer spId) {
		zs.delSpinfo(spId);

		return "true";
	}

	// 商品图片上传 添加商品信息
	@RequestMapping("/addSpinfo")
	public String addSpinfo(@RequestParam("file") MultipartFile file,
			HttpServletRequest request, Spinfo s) throws IllegalStateException,
			IOException {

		String oldname = file.getOriginalFilename();
		// 重新命名，防止重复
		String newName = UUID.randomUUID()
				+ oldname.substring(oldname.lastIndexOf("."));
		// upload文件路径,获取upload文件夹的路径
		String realPath = request.getSession().getServletContext()
				.getRealPath("/backStage/zyq/upload");
		System.out.println(realPath + "/" + newName);
		// 上传
		File files = new File(realPath + "/" + newName);
		file.transferTo(files);
		s.setSpImage("backStage/zyq/upload/" + newName);

		zs.addSpinfo(s);
		return "backStage/zyq/spcx";

	}

	// 查询商品类型
	@RequestMapping("/querySpinfoType")
	public @ResponseBody
	List<Map> querySpinfoType() {
		List<Map> list = zs.querySpinfoType();
		System.out.println(list);
		return list;

	}

	// 查询商品规格
	@RequestMapping("/queryGoodsStandard")
	public @ResponseBody
	List<Map> queryGoodsStandard() {
		List<Map> list = zs.queryGoodsStandard();
		System.out.println(list);
		return list;

	}

	// 查询商品品牌
	@RequestMapping("/queryGoodsLogo")
	public @ResponseBody
	List<Map> queryGoodsLogo() {
		List<Map> list = zs.queryGoodsLogo();
		System.out.println(list);
		return list;

	}

	// 查询计量单位
	@RequestMapping("/queryGoodsMeasure")
	public @ResponseBody
	List<Map> queryGoodsMeasure() {
		List<Map> list = zs.queryGoodsMeasure();
		System.out.println(list);
		return list;

	}

	// 查询仓库类型
	@RequestMapping("/queryWarehouse")
	public @ResponseBody
	List<Map> queryWarehouse() {
		List<Map> list = zs.queryWarehouse();
		System.out.println(list);
		return list;

	}

	// 查询百货部门号
	@RequestMapping("/queryGoodsDept")
	public @ResponseBody
	List<Map> queryGoodsDept() {
		List<Map> list = zs.queryGoodsDept();
		System.out.println(list);
		return list;

	}

	// 查询陈列分类号
	@RequestMapping("/queryDisplayparse_copy")
	public @ResponseBody
	List<Map> queryDisplayparse_copy() {
		List<Map> list = zs.queryDisplayparse_copy();
		System.out.println(list);
		return list;

	}

	// 查询通道序列号
	@RequestMapping("/queryAccessno")
	public @ResponseBody
	List<Map> queryAccessno() {
		List<Map> list = zs.queryAccessno();
		System.out.println(list);
		return list;

	}

	// 查询bay序号
	@RequestMapping("/querybayno")
	public @ResponseBody
	List<Map> querybayno() {
		List<Map> list = zs.querybayno();
		System.out.println(list);
		return list;

	}

	// 查询陈列数量
	@RequestMapping("/queryDisplaynum")
	public @ResponseBody
	List<Map> queryDisplaynum() {
		List<Map> list = zs.queryDisplaynum();
		System.out.println(list);
		return list;

	}

	@RequestMapping("/querySpinfoStatus")
	public @ResponseBody
	List<Map> querySpinfoStatus() {
		List<Map> list = zs.querySpinfoStatus();
		System.out.println(list);
		return list;

	}

	// 查询所有商品类型信息
	@RequestMapping("/queryAllSpinfoType")
	public @ResponseBody
	List<Map> queryAllSpinfoType() {
		return zs.queryAllSpinfoType();

	}

	// 根据查询单个商品类型信息
	@RequestMapping("/queryAllSpinfoTypeById")
	public @ResponseBody
	List<Map> queryAllSpinfoTypeById(Integer sptId) {
		return zs.queryAllSpinfoTypeById(sptId);

	}

	// 添加商品类型
	@RequestMapping("/addSpinfoType")
	public String addSpinfoType(BasePojo map) {
		int num = zs.addSpinfoType(map);
		if (num > 0) {
			return "backStage/zyq/splx";
		}
		return "error";
	}

	// 删除商品类型
	@RequestMapping("/delSpinfoType")
	public @ResponseBody
	String delSpinfoType(Integer sptId) {
		zs.delSpinfoType(sptId);

		return "true";
	}

	// 修改商品类型
	@RequestMapping("/updateSpinfoType")
	public @ResponseBody
	String updateSpinfoType(BasePojo map) {
		int num = zs.updateSpinfoType(map);
		if (num > 0) {
			return "success";
		}
		return "error";
	}

	// 财务统计
	@RequestMapping("/queryAllFinance")
	public @ResponseBody
	Map queryAllFinance(String beginDate, String endDate, String keyWord,
			Integer pageNum, Integer limit) {
		return zs.queryAllFinance(beginDate, endDate, keyWord, pageNum, limit);
	}

	// 查询职位信息
	@RequestMapping("/selectOfficeClerk")
	@ResponseBody
	public List<Map> selectOfficeClerk() {
		return zs.selectOfficeClerk();

	}

	// 通过编号查询职员对应角色信息
	@RequestMapping("/queryOfficeClerkById")
	public @ResponseBody
	List<Map> queryOfficeClerkById(Integer ocId) {

		return zs.queryOfficeClerkById(ocId);

	}

	// 添加职位角色中间表信息
	@RequestMapping("/addOfficeClerk")
	public @ResponseBody
	String addOfficeClerk(@RequestBody Map map) {
		System.out.println("dfghjkl;");
		System.out.println(map + "___");
		int num = zs.addOfficeClerk(map);
		if (num > 0) {
			return "success";
		}
		return "error";
	}

	// 删除职位信息
	@RequestMapping("/delOfficeClerk")
	public @ResponseBody
	String delOfficeClerk(Integer ocId) {
		zs.delOfficeClerk(ocId);
		return "true";

	}

	// 查询职位信息
	@RequestMapping("/queryOneOfficeClerk")
	public @ResponseBody
	List<Map> queryOneOfficeClerk(Integer ocId) {

		return zs.queryOneOfficeClerk(ocId);

	}

	// 修改职位信息
	@RequestMapping("/updateOfficeClerk")
	public @ResponseBody
	String updateOfficeClerk(BasePojo map) {
		int num = zs.updateOfficeClerk(map);
		if (num > 0) {
			return "success";
		}
		return "error";
	}

	// 查看职员性别
	@RequestMapping("/queryOfficeClerkBySex")
	public @ResponseBody
	List<Map> queryOfficeClerkBySex() {
		List<Map> list = zs.queryOfficeClerkBySex();
		System.out.println(list);
		return list;

	}

	// 下拉框查询角色信息
	@RequestMapping("/queryRoleById")
	public @ResponseBody
	List<Map> queryRoleById() {
		List<Map> list = zs.queryRoleById();
		System.out.println(list);
		return list;

	}

	// 添加职员信息
	@RequestMapping("/addManyOfficeClerk")
	public @ResponseBody
	String addManyOfficeClerk(@RequestBody Map map) {
		System.out.println(map);
		String regiterBase = String.valueOf(map.get("face"));
		String user_id = String.valueOf(map.get("ocName"));
		// 注册百度人脸库
		FaceAdd.add(regiterBase, user_id);

		int num = zs.addManyOfficeClerk(map);
		if (num > 0) {
			System.out.println(num);
			return "success";
		}
		return "error";
	}

	// 获取职员信息总数
	@RequestMapping("/queryocName")
	public @ResponseBody
	String queryocName() {
		return String.valueOf(zs.queryocName().get(0).get("ocn"));

	}

	// 查询职员状态
	@RequestMapping("/queryOfficeFlag")
	public @ResponseBody
	List<Map> queryOfficeFlag() {
		List<Map> list = zs.queryOfficeFlag();
		System.out.println(list);
		return list;

	}

	// 单个查询职员信息
	@RequestMapping("/queryOfficeClerk")
	public @ResponseBody
	List<Map> queryOfficeClerk(Integer ocId) {

		return zs.queryOfficeClerk(ocId);

	}

	// 修改职员状态
	@RequestMapping("/updateOfficeFlag")
	public @ResponseBody
	String updateOfficeFlag(BasePojo map) {
		int num = zs.updateOfficeFlag(map);
		if (num > 0) {
			return "success";
		}
		return "error";
	}

	// 查询部门
	@RequestMapping("/selectDept")
	@ResponseBody
	public List<Map> selectDept() {
		return zs.selectDept();

	}

	// 添加部门
	@RequestMapping("/addDept")
	public String addDept(BasePojo map) {
		int num = zs.addDept(map);
		if (num > 0) {
			return "backStage/zyq/depart";
		}
		return "error";
	}

	// 删除部门
	@RequestMapping("/delDept")
	public @ResponseBody
	String delDept(Integer dpId) {
		zs.delDept(dpId);
		return "true";
	}

	// 查询供货商信息
	@RequestMapping("/selectSupplier")
	@ResponseBody
	public List<Map> selectSupplier() {
		return zs.selectSupplier();

	}

	// 添加供货商信息
	@RequestMapping("/addSupplier")
	public String addSupplier(BasePojo map) {
		int num = zs.addSupplier(map);
		if (num > 0) {
			return "backStage/zyq/supplier";
		}
		return "error";
	}

	// 查询单个供货商信息
	@RequestMapping("/queryOneSupplier")
	public @ResponseBody
	List<Map> queryOneSupplier(Integer supId) {

		return zs.queryOneSupplier(supId);

	}

	// 修改供货商信息
	@RequestMapping("/updateSupplier")
	public @ResponseBody
	String updateSupplier(BasePojo map) {
		int num = zs.updateSupplier(map);
		if (num > 0) {
			return "success";
		}
		return "error";
	}

	// 查询供货商状态
	@RequestMapping("/querysupState")
	public @ResponseBody
	List<Map> querysupState() {
		List<Map> list = zs.querysupState();
		System.out.println(list);
		return list;

	}
	//删除角色中间表
	@RequestMapping("/delOrMiddle")
	  public @ResponseBody String delOrMiddle(String roleId,String ocId){
			  List list=JSON.parseArray(roleId);
		    	System.out.println("ddd");
		    	System.out.println(roleId);
		    	for (Object object : list) {
		    		Map map=new HashMap();
		    		map.put("roleId", Integer.parseInt(String.valueOf(object)));
		    		map.put("ocId", ocId);
		    		
					System.out.println(map);
				}
				return "true";
		  
	  }
}
