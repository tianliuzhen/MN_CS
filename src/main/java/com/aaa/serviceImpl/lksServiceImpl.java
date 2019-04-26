package com.aaa.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aaa.dao.lksDaoMapper;
import com.aaa.entity.BasePojo;
import com.aaa.service.lksService;

@Service
public class lksServiceImpl implements lksService {
@Autowired
private lksDaoMapper dao;

@Override
public List<Map> getvip() {
	// TODO Auto-generated method stub
	return dao.getvip();
}

@Override
public List<Map> getspinfolks(String SpBarCode) {
	// TODO Auto-generated method stub
	return dao.getspinfolks(SpBarCode);
}

@Override
public List<Map> getviplks(Integer mpId) {
	// TODO Auto-generated method stub
	return dao.getviplks(mpId);
}

@Override
public int addlks(BasePojo map) {
	// TODO Auto-generated method stub
	return dao.addlks(map);
}

@Override
public int upviplks(BasePojo map) {
	// TODO Auto-generated method stub
	return dao.upviplks(map);
}

@Override
public int addSpinfoOrderlks(BasePojo map) {
	// TODO Auto-generated method stub
	return dao.addSpinfoOrderlks(map);
}

@Override
public int querySpinfoOrderlks() {
	// TODO Auto-generated method stub
	return dao.querySpinfoOrderlks();
}

@Override
public int addSpinfoSpendlks(Map map) {
	// TODO Auto-generated method stub
	return dao.addSpinfoSpendlks( map);
}

@Override
public int upspInfolks(Map map) {
	// TODO Auto-generated method stub
	return dao.upspInfolks(map);
}

@Override
public int uprepertorylks(Map map) {
	// TODO Auto-generated method stub
	return dao.uprepertorylks(map);
}

@Override
public int upmembershiplks(BasePojo map) {
	// TODO Auto-generated method stub
	return dao.upmembershiplks(map);
}

@Override
public List<Map> querySpinfoSpendlks() {
	// TODO Auto-generated method stub
	return dao.querySpinfoSpendlks();
}

@Override
public List<Map> querytuihuolks(Integer soid) {
	// TODO Auto-generated method stub
	return dao.querytuihuolks(soid);
}

@Override
public int upgoodsshelfrecordutillks(Map map) {
	// TODO Auto-generated method stub
	return dao.upgoodsshelfrecordutillks(map);
}

@Override
public int addbackOrderGoodslks(BasePojo map) {
	// TODO Auto-generated method stub
	return dao.addbackOrderGoodslks(map);
}

@Override
public List<Map> querytuihuomigxilks(String ssBarCode,Integer soid) {
	// TODO Auto-generated method stub
	return dao.querytuihuomigxilks(ssBarCode,soid);
}

@Override
public List<Map> querybackorderlks(Integer soid, String sptId) {
	// TODO Auto-generated method stub
	return dao.querybackorderlks(soid, sptId);
}

@Override
public List<Map> getvipphonelks(String mpBalMOnery) {
	// TODO Auto-generated method stub
	return dao.getvipphonelks(mpBalMOnery);
}

@Override
public List<Map> queryduizhanglks() {
	// TODO Auto-generated method stub
	return dao.queryduizhanglks();
}

@Override
public int addduizhanglks(Map map) {
	// TODO Auto-generated method stub
	return dao.addduizhanglks(map);
}

@Override
public List<Map> queryduizhangshlks() {
	// TODO Auto-generated method stub
	return dao.queryduizhangshlks();
}

@Override
public int upduizhanglks(BasePojo map) {
	// TODO Auto-generated method stub
	return dao.upduizhanglks(map);
}

@Override
public int addAlipaylks(BasePojo map) {
	// TODO Auto-generated method stub
	return dao.addAlipaylks(map);
}


	
	

}
