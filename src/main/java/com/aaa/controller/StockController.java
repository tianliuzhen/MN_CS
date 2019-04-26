package com.aaa.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aaa.entity.backsale;
import com.aaa.entity.BackSaleUtil;
import com.aaa.entity.stock; 
import com.aaa.entity.stockdetail;
import com.aaa.entity.supplier;
import com.aaa.service.StockService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;


@Controller
@RequestMapping("/stock")
public class StockController {
@Autowired
private StockService ser;
 


@RequestMapping("/getgoodsmeasure")
public @ResponseBody List<Map> getgoodsmeasure(   ){
	return ser.getgoodsmeasure(   );
	
	
}


@RequestMapping("/getSupplier")
public @ResponseBody List<Map> getSupplier(Integer sptId){
	return ser.getSupplier(  sptId);
	
	
}

@RequestMapping("/getspinfotype")
public @ResponseBody List<Map> getspinfotype(Integer sptId){
	return ser.getspinfotype(  sptId);
	
	
}

@RequestMapping("/getwarehouse")
public @ResponseBody List<Map> getwarehouse(){
	return ser.getwarehouse();
	
	
}
@RequestMapping("/getspinfoall")
public @ResponseBody List<Map> getspinfoall(){
	return ser.getspinfoall();
}
@RequestMapping("/getspinfoalllay")
public @ResponseBody  Map  getspinfoalllay(String keyWord,Integer pageNum,Integer limit,Integer spAllNum){
	return ser.getspinfoalllay(  keyWord,  pageNum,  limit,  spAllNum);
}
//商品添加进货单
@RequestMapping("/addstock") 
public @ResponseBody int addstock(stock s){
	System.out.println("addstocks");
		System.out.println(s.getStkDate());
	 
		int num=ser.addstock(s);
	return num ;
}
 
@RequestMapping("/addstockdetail") 
public @ResponseBody int  addstockdetail(stockdetail sd){
	int StkId=ser.selstockdetaillimit(); //查询本次进货单编号
	System.out.println("addstockdetail");
	//   //    stkId     sdDebt  sumMoney
	sd.setStkId(StkId);        
	sd.setSdDebt(0.0);
	sd.setSpNumber(sd.getSpNumberdan()*sd.getGmIdMark());
	sd.setSumMoney(sd.getSpPrice()*sd.getSpNumber());
	int num=ser.addstockdetail(sd);
	
	return num;
}

 
@RequestMapping("/selstocklay")
public @ResponseBody Map selstocklay(String keyWord,Integer pageNum,Integer limit,Integer Stauts, String begindate, String enddate){
	System.out.println("selstocklay");
	return ser.selstocklay(keyWord, pageNum, limit, Stauts,   begindate,   enddate);
}
 
@RequestMapping("/selstockdetaillay")
public @ResponseBody Map selstockdetaillay(Integer stkId){
	System.out.println("selstockdetaillay");
	return ser.selstockdetaillay(stkId);
}
//订单通过
@RequestMapping("/yes_stock") 
public @ResponseBody int  yes_stock(stock s ){
	System.out.println("yes_stock");
	return ser.yes_stock( s );
}
@RequestMapping("/yes_stock2") 
public @ResponseBody int  yes_stock2(stock s ){
	System.out.println("yes_stock2");
	return ser.yes_stock2( s );
}
//订单驳回
@RequestMapping("/no_stock") 
public @ResponseBody int  no_stock(stock s){
	System.out.println("no_stock");
	return ser.no_stock( s);
}
@RequestMapping("/no_stock2") 
public @ResponseBody int  no_stock2(stock s){
	System.out.println("no_stock2");
	return ser.no_stock2( s);
}
//添加付款
@RequestMapping("/paymoney") 
public @ResponseBody int  paymoney(int stkId,Double ppPay,Double ppMoney ){
	 
	return ser. paymoney(  stkId,  ppPay,  ppMoney );
}

  
@RequestMapping("/selbacklay")
public @ResponseBody Map selbacklay(String keyWord,Integer pageNum,Integer limit,Integer Stauts,String begindate,String enddate){
	System.out.println("selbacklay");
	System.out.println(begindate);
	return ser.selbacklay(keyWord, pageNum, limit, Stauts,  begindate,  enddate);
}
@RequestMapping("/getoffice") 
public @ResponseBody List<Map>  getoffice(String name){
	System.out.println("getoffice222");
	 Date currentTime = new Date();
	 
	return ser.getoffice(name);
}
//查询退货明细
 
@RequestMapping("/selbackutillay") 
public @ResponseBody Map  selbackutillay(Integer bsId){
	System.out.println("selbackutillay");
	return ser.selbackutillay(bsId);
}
//退货单通过
@RequestMapping("/yes_back") 
public @ResponseBody int  yes_back(backsale b ){
	System.out.println("yes_back");
	return ser.yes_back( b );
}
//退货单驳回
@RequestMapping("/no_back") 
public @ResponseBody int  no_back(backsale b){
	System.out.println("no_back");
	return ser.no_back( b);
}
 
@RequestMapping("/chartone") 
public @ResponseBody List  chartone( ){
	System.out.println("chartone");
//	System.out.println(ser.chartone());
	 List<Map> list= ser.chartone();
//	  System.out.println(list);
	  List list2=new ArrayList();
	  for (int i = 0; i < list.size(); i++) {
 		Map<String,Object> map2 =list.get(i);
 		list2.add(map2.get("ssRealMonery"));
	    } 
	  System.out.println(list2);
	return list2;
}
//采购  金额统计
@RequestMapping("/chartpayin") 
public @ResponseBody List  chartpayin(int year ){
	System.out.println("chartpayin");
//	System.out.println(ser.chartone());
	List<Map> list= ser.chartpayin(  year);
//	  System.out.println(list);
	List list2=new ArrayList();
	for (int i = 0; i < list.size(); i++) {
		Map<String,Object> map2 =list.get(i);
		list2.add(map2.get("ppPay"));
	} 
	System.out.println(list2);
	return list2;
}
//退货  金额统计
@RequestMapping("/chartpayout") 
public @ResponseBody List  chartpayout(int year){
	System.out.println("chartpayout");
//	System.out.println(ser.chartone());
	List<Map> list= ser.chartpayout(  year);
//	  System.out.println(list);
	List list2=new ArrayList();
	for (int i = 0; i < list.size(); i++) {
		Map<String,Object> map2 =list.get(i);
		list2.add(map2.get("owuAllMonery"));
	} 
	System.out.println(list2);
	return list2;
}
//销售  金额统计
@RequestMapping("/chartsale") 
public @ResponseBody List  chartsale(int year){
	System.out.println("chartsale");
	List<Map> list= ser.chartsale(  year);
	List list2=new ArrayList();
	for (int i = 0; i < list.size(); i++) {
		Map<String,Object> map2 =list.get(i);
		list2.add(map2.get("ssTotal"));
	} 
	System.out.println(list2);
	return list2;
}
//销售 盈利金额统计
@RequestMapping("/chartsalesub") 
public @ResponseBody List  chartsalesub(int year){
	System.out.println("chartsalesub");
	List<Map> list= ser.chartsalesub(  year);
	List list2=new ArrayList();
	for (int i = 0; i < list.size(); i++) {
		Map<String,Object> map2 =list.get(i);
		list2.add(map2.get("profit"));
	} 
	System.out.println(list2);
	return list2;
}
//销售  金额统计
@RequestMapping("/chartsaledate") 
public @ResponseBody List  chartsaledate(int year,int month){
	System.out.println("chartsaledate");
	List<Map> list= ser.chartsaledate(year, month);
	List list2=new ArrayList();
	for (int i = 0; i < list.size(); i++) {
		Map<String,Object> map2 =list.get(i);
		list2.add(map2.get("ssTotal"));
	} 
	System.out.println(list2);
	return list2;
}
//销售  金额统计
@RequestMapping("/chartsalesubdate") 
public @ResponseBody List  chartsalesubdate(int year,int month){
	System.out.println("chartsalesubdate");
	List<Map> list= ser.chartsalesubdate(year, month);
	List list2=new ArrayList();
	for (int i = 0; i < list.size(); i++) {
		Map<String,Object> map2 =list.get(i);
		list2.add(map2.get("profit"));
	} 
	System.out.println(list2);
	return list2;
}
//商品报损  金额统计
@RequestMapping("/chartsun") 
public @ResponseBody List  chartsun(int year ){
	System.out.println("chartsun");
	List<Map> list= ser.chartsun(year   );
	List list2=new ArrayList();
	for (int i = 0; i < list.size(); i++) {
		Map<String,Object> map2 =list.get(i);
		list2.add(map2.get("sumsun"));
	} 
	System.out.println(list2);
	return list2;
}
//商品报损  金额统计 报溢
@RequestMapping("/chartyi") 
public @ResponseBody List  chartyi(int year ){
	System.out.println("chartyi");
	List<Map> list= ser.chartsun(year   );
	List list2=new ArrayList();
	for (int i = 0; i < list.size(); i++) {
		Map<String,Object> map2 =list.get(i);
		list2.add(map2.get("sumyi"));
	} 
	System.out.println(list2);
	return list2;
}
//商品报损+报溢
@RequestMapping("/sunyi") 
public @ResponseBody List  sunyi(int year ){
	System.out.println("sunyi");
	List<Map> list= ser.chartsun(year   );
	List list2=new ArrayList();
	for (int i = 0; i < list.size(); i++) {
		Map<String,Object> map2 =list.get(i);
		list2.add(map2.get("sunyi"));
	} 
	System.out.println(list2);
	return list2;
}
//商品属性更改
@RequestMapping("/upd_spinfo") 
public @ResponseBody int  upd_spinfo(Double sale,Double buy,Integer type,Integer spId){
	System.out.println("upd_spinfo");
	 return ser.upd_spinfo(  sale,  buy,  type,  spId);
	 
}

 
}
