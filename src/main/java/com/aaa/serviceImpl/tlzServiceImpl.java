package com.aaa.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aaa.dao.WhDao;
import com.aaa.dao.tlzDaoMapper;
import com.aaa.entity.Menus;
import com.aaa.entity.Officeclerk;
import com.aaa.service.menuService;
import com.aaa.service.tlzService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
@Service
public class tlzServiceImpl implements tlzService {
@Autowired
private tlzDaoMapper daoMapper;
@Autowired
private  WhDao whDao;//
	@Override
	public List<Map> getAllMapGoodsDept(String gdname) {
		// TODO Auto-generated method stub
		return daoMapper.getAllMapGoodsDept(gdname);
	}
	@Override
	public List<Map> getAllGoodsShelf(String gdName) {
		// TODO Auto-generated method stub
		return daoMapper.getAllGoodSShelf(gdName);
	}
	@Override
	public PageInfo<Map> getAllGoodsShelf(Integer pageNum,String gdName) {
		PageHelper.startPage(pageNum,5);
		List<Map> list=daoMapper.getAllGoodSShelf(gdName);
		for (Map map : list) {
			//System.out.println(map.get("gdName"));
		}
		PageInfo<Map> info=new PageInfo<Map>(list);
		return info;
	}
	@Override
	public PageInfo<Map> getAllSaleUtilByOneOnGoodSDept(Integer spid,Integer pageNum) {
		
		PageHelper.startPage(pageNum,5);
		List<Map> list=daoMapper.getAllSaleUtilByOneOnGoodSDept(spid);
		for (Map map : list) {
			//System.out.println(map.get("gdName"));
		}
		PageInfo<Map> info=new PageInfo<Map>(list);
		
		return info;
		
	}
	@Override
	public List<Map> getNoShelfGoods(String spStatu) {
		// TODO Auto-generated method stub
		return daoMapper.getNoShelfGoods(spStatu);
	}
	@Override
	public List<Map> getGoodsDeptOne() {
		// TODO Auto-generated method stub
		return daoMapper.getGoodsDeptOne();
	}
	@Override
	public List<Map> getDisplayParseOne() {
		// TODO Auto-generated method stub
		return daoMapper.getDisplayParseOne();
	}
	@Override
	public List<Map> getAccessNoOne() {
		// TODO Auto-generated method stub
		return daoMapper.getAccessNoOne();
	}
	@Override
	public List<Map> getBayNoOne() {
		// TODO Auto-generated method stub
		return daoMapper.getBayNoOne();
	}
	@Override
	public boolean updateApplyGoodsShelf(Map map) {
		// TODO Auto-generated method stub
		try {
			
			daoMapper.updateApplyGoodsShelf(map);
			return true;
		} catch (Exception e) {
			return false;
		}
		
	}
	@Override
	public boolean updateApplyGoodsShelfCheck(Integer i,Integer num) {
		// TODO Auto-generated method stub
try {
			
			daoMapper.updateApplyGoodsShelfCheck(i,num);
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	@Override
	public boolean updateApplyGoodsShelf2(Map map) {
     try {
			
			daoMapper.updateApplyGoodsShelf2(map);
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	@Override
	public Map getSpifoNum(Integer i) {
		// TODO Auto-generated method stub
		return daoMapper.getSpifoNum(i);
	}
	@Override
	public boolean updateApplyGoodsShelfCheck2(Map map) {
		System.out.println("RTYUI__"+map);
		return daoMapper.updateApplyGoodsShelfCheckLast2(map);
	}
	@Override
	public List<Map> getOrderNeedToShelf() {
		// TODO Auto-generated method stub
		return daoMapper.getOrderNeedToShelf();
	}
	@Override
	public List<Map> getAllMapGoodsDifferentUtil(Integer spid) {
		// TODO Auto-generated method stub
		return daoMapper.getAllMapGoodsDifferentUtil(spid);
	}
	@Override
	public boolean updateBuGoods(Map map) {
		// TODO Auto-generated method stub
		try {
			 daoMapper.updateBuGoods(map);
			 return true;
		} catch (Exception e) {
			return false;
		}
		
	}
	@Override
	public boolean updateBupertory(Map map) {
		try {
			 daoMapper.updateBupertory(map);
			 return true;
		} catch (Exception e) {
			return false;
		}
	}
	@Override
	public boolean insertBuGoods(Map map) {
		try {
			 daoMapper.insertBuGoods(map);
			 return true;
		} catch (Exception e) {
			return false;
		}
	}
	@Override
	public List<Map> getAllMapBuGoods(int spid) {
		return daoMapper.getAllMapBuGoods(spid);
		
	}
	@Override
	public List<Map> getClearGoods(Integer spid) {
		// TODO Auto-generated method stub
		return daoMapper.getClearGoods(spid);
	}
	@Override
	public List<Map> qureyGoodsShelfRecordUtil(Integer rtid) {
		// TODO Auto-generated method stub
		return daoMapper.qureyGoodsShelfRecordUtil(rtid);
	}
	@Override
	public boolean insertGoodsShelfRecordUtil(Map map) {
		// TODO Auto-generated method stub
		return daoMapper.insertGoodsShelfRecordUtil(map);
	}
	@Override
	public boolean UpdateGoodsShelfRecordUtil(Map map) {
		// TODO Auto-generated method stub
		return daoMapper.UpdateGoodsShelfRecordUtil(map);
	}
	@Override
	public boolean insertbuGoodsCheck(Map map) {
		// TODO Auto-generated method stub
		return daoMapper.insertbuGoodsCheck(map);
	}
	@Override
	public List<Map> selecetbuGoodsCheck(Integer spid) {
		// TODO Auto-generated method stub
		return daoMapper.selecetbuGoodsCheck(spid);
	}
	@Override
	public List<Map> getAllNocheckbuGoodsCheck(String status) {
		// TODO Auto-generated method stub
		return daoMapper.getAllNocheckbuGoodsCheck(status);
	}
	@Override
	public boolean yescheckbuGoodsCheck(String spid) {
		// TODO Auto-generated method stub
		try {
			daoMapper.yescheckbuGoodsCheck(spid);
			return true;
		} catch (Exception e) {
			return  false;
		}
		
	}
	@Override
	public List<Map> getUtilNocheckbuGoodsCheck(String bgcNoId) {
		// TODO Auto-generated method stub
		return daoMapper.getUtilNocheckbuGoodsCheck(bgcNoId);
	}
	@Override
	public Integer getRepertoryNUmint(Integer rtid) {
		// TODO Auto-generated method stub
		return daoMapper.getRepertoryNUmint(rtid);
	}
	@Override
	public List<Map> qureyGoodsShelfRecordUtil2(Integer rtId, Integer spId) {
		// TODO Auto-generated method stub
		return daoMapper.qureyGoodsShelfRecordUtil2(rtId, spId);
	}
	public boolean insertintoStockSetPoint(Map map) {
		try {
			daoMapper.insertintoStockSetPoint(map);
			return  true;
		} catch (Exception e) {
			return  false;
		}
		
	}
	@Override
	public String slectRtnum(Integer rtid) {
		// TODO Auto-generated method stub
		return daoMapper.slectRtnum(rtid);
	}
	@Override
	public boolean insertUpanddownCheck(Map map) {
		// TODO Auto-generated method stub
		return daoMapper.insertUpanddownCheck(map);
	}
	@Override
	public List<Map> getListMapUpanddownCheck() {
		// TODO Auto-generated method stub
		return daoMapper.getListMapUpanddownCheck();
	}
	@Override
	public List<Map> getNoShelfGoods2(String spucId, String spStatu) {
		// TODO Auto-generated method stub
		return daoMapper.getNoShelfGoods2(spucId, spStatu);
	}
	@Override
	public List<Map> UpdateUpanddownCheck(String spucId) {
		// TODO Auto-generated method stub
		return daoMapper.UpdateUpanddownCheck(spucId);
	}
	@Override
	public List<Map> getListMapUpanddownCheck2(String status) {
		// TODO Auto-generated method stub
		return daoMapper.getListMapUpanddownCheck2(status);
	}
	@Override
	public List<Map> UpdateUpanddownCheck2(String spucId) {
		// TODO Auto-generated method stub
		return daoMapper.UpdateUpanddownCheck2(spucId);
	}
	@Override
	public List<Map> getNoShelfGoods3(String spStatu) {
		// TODO Auto-generated method stub
		return daoMapper.getNoShelfGoods3(spStatu);
	}
	@Override
	public List<Map> qureyGoodsShelfRecordUtil3Byspid(Integer spid) {
		// TODO Auto-generated method stub
		return daoMapper.qureyGoodsShelfRecordUtil3Byspid(spid);
	}
	@Override
	public int createInHouseWarant(Map map) {
		// TODO Auto-generated method stub
		return whDao.createInHouseWarant(map);
	}
	@Override
	public int createInHouseWarantInfo(Map map) {
		// TODO Auto-generated method stub
		return whDao.createInHouseWarantInfo(map);
	}
	@Override
	public boolean deleteGoodsShelfRecordUtil(Map map) {
		// TODO Auto-generated method stub
		return daoMapper.deleteGoodsShelfRecordUtil(map);
	}
	@Override
	public List<Map> qureyGoodsShelfRecordUtil3(Integer spid) {
		// TODO Auto-generated method stub
		System.out.println("___spid+"+spid);
		return daoMapper.qureyGoodsShelfRecordUtil3(spid);
	}
	@Override
	public boolean updateBupertory2(Map map) {
		// TODO Auto-generated method stub
		return daoMapper.updateBupertory2(map);
	}
	@Override
	public List<Map> newselectGoodsShelfRecordUtil(Map map) {
		// TODO Auto-generated method stub
		return daoMapper.newselectGoodsShelfRecordUtil(map);
	}
	@Override
	public List<Map> UpdateUpanddownCheck2xx(String spucId) {
		// TODO Auto-generated method stub
		return daoMapper.UpdateUpanddownCheck2xx(spucId);
	}
	
	

}
