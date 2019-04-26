package com.aaa.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aaa.dao.StockDaoMapper;
import com.aaa.entity.backsale;
import com.aaa.entity.stock;
import com.aaa.entity.stockdetail;
import com.aaa.entity.supplier;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class StockServiceImpl implements StockService{
   
	@Autowired
	private StockDaoMapper dao;
	
	// SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
   SimpleDateFormat  sdf=new SimpleDateFormat("yyy-MM-dd");
   Date currentTime = new Date();
	 
   String times = sdf.format(currentTime);
   
   
   @Override
	public List<Map> getgoodsmeasure() {
		// TODO Auto-generated method stub
		return dao.getgoodsmeasure();
	}
	@Override
	public List<Map> getspinfotype(Integer sptId) {
		// TODO Auto-generated method stub
		return dao.getspinfotype(sptId);
	} 
	public List<Map> getSupplier(Integer sptId) {
		// TODO Auto-generated method stub
		
		return dao.getSupplier(  sptId);
	}
	@Override
	public List<Map> getwarehouse() {
		// TODO Auto-generated method stub
		return dao.getwarehouse();
	}
	@Override
	public List<Map> getspinfoall() {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public  Map  getspinfoalllay(String keyWord,Integer pageNum,Integer limit,Integer spAllNum) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pageNum,limit);
		List<Map> list=dao.getspinfoall(  keyWord,  spAllNum);
		PageInfo<Map> info=new PageInfo<Map>(list);
		Map map = new HashMap();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count",info.getTotal());
        map.put("data", info.getList());
		return map;
	}
	@Override
	public int addstock(stock s) {
		// TODO Auto-generated method stub
		return dao.addstock(s);
	}
	public int selstockdetaillimit() {
		// TODO Auto-generated method stub
		return dao.selstockdetaillimit();
	}
	@Override
	public int addstockdetail(stockdetail sd) {
		// TODO Auto-generated method stub
		return dao.addstockdetail(sd);
	}
 
	@Override
	public Map selstocklay(String keyWord, Integer pageNum, Integer limit,
			Integer Stauts, String begindate, String enddate) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pageNum,limit);
		List<Map> list=dao.selstocklay(keyWord, Stauts,   begindate,   enddate);
		PageInfo<Map> info=new PageInfo<Map>(list);
		Map map = new HashMap();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count",info.getTotal());
        map.put("data", info.getList());
		return map;
	}
	 
	@Override
	public Map selstockdetaillay(Integer stkId) {
		// TODO Auto-generated method stub
		List<Map> list=dao.selstockdetail(stkId );
		Map m=new HashMap();
		m.put("code", "0");
		m.put("msg","");
		m.put("count",list.size());
		m.put("data",list);
		return m;
	}
	@Override
	public int yes_stock(stock s) {
		// TODO Auto-generated method stub
	 
		s.setCheckDate(times);
		return dao.yes_stock(s);
	}
	@Override
	public int no_stock(stock s  ) {
		// TODO Auto-generated method stub
		s.setCheckDate(times);
		return dao.no_stock(s);
	}
	public int yes_stock2(stock s) {
		// TODO Auto-generated method stub
		s.setCheckDate2(times);
		return dao.yes_stock2(s);
	}
	@Override
	public int no_stock2(stock s  ) {
		// TODO Auto-generated method stub
		s.setCheckDate2(times);
		return dao.no_stock2(s);
	}
	@Override
	public int paymoney(int stkId, Double ppPay, Double ppMoney) {
		// TODO Auto-generated method stub
		Double ppDebt=ppMoney-ppPay;
	int nn=	dao.paymoney(ppPay, ppMoney,ppDebt); //添加采购付款列
		 
		int ppId=dao.getPur();        //获取付款列id
		String purDate=times;
	  int num=	dao.updatestock(stkId, ppId,purDate); //联系进货表
		return num;
	}
	 
	@Override
	public Map selbacklay(String keyWord, Integer pageNum, Integer limit,
			Integer Stauts,String begindate,String enddate) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pageNum,limit);
		List<Map> list=dao.selbacklay(keyWord, Stauts,  begindate,  enddate);
		PageInfo<Map> info=new PageInfo<Map>(list);
		Map map = new HashMap();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count",info.getTotal());
        map.put("data", info.getList());
		return map;
	}
	 
	@Override
	public Map selbackutillay(Integer bsId) {
		// TODO Auto-generated method stub
		List<Map> list=dao.selbackutil(bsId);
		Map m=new HashMap();
		m.put("code", "0");
		m.put("msg","");
		m.put("count",list.size());
		m.put("data",list);
		return m;
	}
	@Override
	public int yes_back(backsale b) {
		// TODO Auto-generated method stub
		b.setCheckDate(times);
		return dao.yes_back(b);
	}
	@Override
	public int no_back(backsale b) {
		// TODO Auto-generated method stub
		b.setCheckDate(times);
		return dao.no_back(b);
	}
	 
	 
	@Override
	public List<Map> getoffice(String name) {
		// TODO Auto-generated method stub
		return dao.getoffice(name);
	}
	@Override
	public List<Map> chartone() {
		// TODO Auto-generated method stub
		return dao.chartone();
	}
	@Override
	public List<Map> chartpayin(int year) {
		// TODO Auto-generated method stub
		return dao.chartpayin(  year);
	}
	@Override
	public List<Map> chartpayout(int year) {
		// TODO Auto-generated method stub
		return dao.chartpayout(  year);
	}
	@Override
	public List<Map> chartsale(int year) {
		// TODO Auto-generated method stub
		return dao.chartsale(year);
	}
	@Override
	public List<Map> chartsalesub(int year) {
		// TODO Auto-generated method stub
		return dao.chartsalesub(year);
	}
	@Override
	public List<Map> chartsaledate(int year, int month) {
		// TODO Auto-generated method stub
		return dao.chartsaledate(year, month);
	}
	@Override
	public List<Map> chartsalesubdate(int year, int month) {
		// TODO Auto-generated method stub
		return dao.chartsalesubdate(year, month);
	}

	@Override
	public int upd_spinfo(Double sale, Double buy, Integer type,Integer spId) {
		// TODO Auto-generated method stub
		return dao.upd_spinfo(sale, buy, type,  spId);
	}
	@Override
	public List<Map> chartsun(int year ) {
		// TODO Auto-generated method stub
		return dao.chartsun(year );
	}
	
	

	 
	
	
	
	
	 
	

}
