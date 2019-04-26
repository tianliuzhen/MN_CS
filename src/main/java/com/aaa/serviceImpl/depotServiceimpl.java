package com.aaa.serviceImpl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aaa.dao.depotDaoMapper;
import com.aaa.entity.BackSaleUtil;
import com.aaa.entity.StockSetPoint;
import com.aaa.entity.backsale;
import com.aaa.entity.repertory;
import com.aaa.service.depotService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
@Service
public class depotServiceimpl implements depotService {
@Autowired
private depotDaoMapper dao;

	

	
	@Override
	public void updatede(String rt) {
		// TODO Auto-generated method stub
		dao.updatede(rt);
		
	}


	@Override
	public List<Map> seloff(String RealName) {
		// TODO Auto-generated method stub
		return dao.seloff(RealName);
		
	}

	@Override
	public List<Map> selbs() {
		// TODO Auto-generated method stub
		
		return dao.selbs();
	}
	@Override
	public List<Map> selSt(String keyWord) {
		// TODO Auto-generated method stub
		return dao.selSt(keyWord);
	}

	@Override
	public List<Map> getdepotpan(String pan) {
		// TODO Auto-generated method stub
		return dao.getdepotpan(pan);
	}

	@Override
	public void addback(BackSaleUtil b) {
		// TODO Auto-generated method stub
		 dao.addback(b);
	}

	@Override
	public void addsale(backsale a) {
		// TODO Auto-generated method stub
		dao.addsale(a);
	}

	@Override
	public void uptd(backsale a) {
		// TODO Auto-generated method stub
		dao.uptd(a);
	}


	@Override
	public void upmoney(BackSaleUtil b) {
		// TODO Auto-generated method stub
		dao.upmoney(b);
	}

	@Override
	public List<Map> selbo(String bo) {
		// TODO Auto-generated method stub
		return dao.selbo(bo);
	}

	@Override
	public List<Map> selto(String to) {
		// TODO Auto-generated method stub
		return dao.selto(to);
	}

	@Override
	public List<Map> seltui(String jia) {
		// TODO Auto-generated method stub
		return dao.seltui(jia);
	}



	@Override
	public void upback(BackSaleUtil b) {
		// TODO Auto-generated method stub
		dao.upback(b);
	}

	@Override
	public void delback(Integer bsuUtilId) {
		// TODO Auto-generated method stub
		dao.delback(bsuUtilId);
	}

	@Override
	public List<Map> selgq(String gq) {
		// TODO Auto-generated method stub
		return dao.selgq(gq);
	}

	@Override
	public void addbackdd(List<Map> list) {
		// TODO Auto-generated method stub
		dao.addbackdd(list);
	}

	@Override
	public List<Map> selbsq(String bsq) {
		// TODO Auto-generated method stub
		return dao.selbsq(bsq);
	}

	@Override
	public List<Map> selsale(String bs, Integer bsId) {
		// TODO Auto-generated method stub
		return dao.selsale(bs, bsId);
	}

	@Override
	public void uptuih(List<Map> list) {
	 dao.uptuih(list);
	}

	@Override
	public void uptuizt(List<Map> list) {
	 dao.uptuizt(list);
	}



	@Override
	public void addck(List<Map> list) {
		// TODO Auto-generated method stub
		dao.addck(list);
	}

	@Override
	public void delgq(List<Map> list) {
		// TODO Auto-generated method stub
		dao.delgq(list);
	}

	@Override
	public List<Map> selck(String ck) {
		// TODO Auto-generated method stub
		return dao.selck(ck);
	}

	

	@Override
	public List<Map> selboj(String bsj) {
		// TODO Auto-generated method stub
		return dao.selboj(bsj);
	}

	

	@Override
	public List<Map> selpan(Integer spid) {
		// TODO Auto-generated method stub

		return dao.selpan(spid);
	}

	@Override
	public void uppdz(repertory r) {
		// TODO Auto-generated method stub
		dao.uppdz(r);
	}

	@Override
	public List<Map> selhj(String hj) {
		// TODO Auto-generated method stub
		return dao.selhj(hj);
	}

	@Override
	public List<Map> getdepot(String dept) {
		// TODO Auto-generated method stub
		return dao.getdepot(dept);
	}
	@Override
	public List<Map> waresel(String re, Integer whId) {
		// TODO Auto-generated method stub

		return dao.waresel(re, whId);
	}
	@Override
	public List<Map> selgh(String su) {
		// TODO Auto-generated method stub
		return dao.selgh(su);
	}


	@Override
	public List<Map> selfo(Integer spId, String rtbegDate, String rtEndDate) {
		// TODO Auto-generated method stub
	
		return dao.selfo(spId, rtbegDate, rtEndDate);
	}

	

	@Override
	public List<Map> seltd(String tui, Integer bsId, String rtbegDate,
			String rtEndDate) {
		// TODO Auto-generated method stub
		return dao.seltd(tui, bsId, rtbegDate, rtEndDate);
	}

	@Override
	public List<Map> ztd() {
		// TODO Auto-generated method stub
		return dao.ztd();
	}

	@Override
	public List<Map> zbu() {
		// TODO Auto-generated method stub
		return dao.zbu();
	}

	@Override
	public List<Map> zcd() {
		// TODO Auto-generated method stub
		return dao.zcd();
	}

	@Override
	public List<Map> zsy() {
		// TODO Auto-generated method stub
		return dao.zsy();
	}

	@Override
	public List<Map> dzy() {
		// TODO Auto-generated method stub
		return dao.dzy();
	}

	@Override
	public List<Map> dzd() {
		// TODO Auto-generated method stub
		return dao.dzd();
	}

	@Override
	public List<Map> dcg() {
		// TODO Auto-generated method stub
		return dao.dcg();
	}

	@Override
	public List<Map> drk() {
		// TODO Auto-generated method stub
		return dao.drk();
	}

	@Override
	public List<Map> gdn() {
		// TODO Auto-generated method stub
		return dao.gdn();
	}

	@Override
	public List<Map> office() {
		// TODO Auto-generated method stub
		return dao.office();
	}

	@Override
	public List<Map> getdepotone(List<Map> rtid, String getone) {
		// TODO Auto-generated method stub
		return dao.getdepotone(rtid, getone);
	}


	@Override
	public void addst(List<Map> list) {
		// TODO Auto-generated method stub
		dao.addst(list);
	}


	@Override
	public void updatedepot(Map map) {
		// TODO Auto-generated method stub
		dao.updatedepot(map);
	}


	@Override
	public List<Map> gettone(Integer rtid, String rtbegDate, String rtEndDate) {
		// TODO Auto-generated method stub
		return dao.gettone(rtid, rtbegDate, rtEndDate);
	}


	@Override
	public void addstss(StockSetPoint s) {
		// TODO Auto-generated method stub
		dao.addstss(s);
	}


	@Override
	public void upsy(String rtNumber, Integer rtid) {
		// TODO Auto-generated method stub
		System.out.println(rtNumber);
		System.out.println(rtid);
		dao.upsy(rtNumber, rtid);
	}


	@Override
	public void upsifo(Map map) {
		// TODO Auto-generated method stub
		dao.upsifo(map);
	}













}
