package com.aaa.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.aaa.entity.BackSaleUtil;
import com.aaa.entity.StockSetPoint;
import com.aaa.entity.backsale;
import com.aaa.entity.repertory;

public interface depotDaoMapper {
  public List<Map> getdepot(@Param("dept") String dept);
  public List<Map> getdepotpan(@Param("pan") String pan);
  public List<Map> getdepotone(@Param("list")List<Map> rtid,@Param("getone")String getone);
  public  void   updatedepot(Map map);
  public void upsifo(Map map);
  
  public  void   upsy(@Param("rtNumber") String rtNumber,@Param("rtid") Integer rtid);
  public void uppdz(repertory r);
  public List<Map> selSt(@Param("keyWord") String keyWord);
  public List<Map> selhj(@Param("hj") String hj);
  public void addst(List<Map> list);
  public void addstss(StockSetPoint s);
  public void updatede(@Param("rt")String rt);
  public List<Map> waresel(@Param("re")String re,@Param("whId")Integer whId);
  public List<Map> selfo(@Param("spId")Integer spId,@Param("rtbegDate")String rtbegDate,@Param("rtEndDate")String rtEndDate);
  public List<Map> seloff(@Param("RealName")String RealName);
  public List<Map> seltui(@Param("jia") String jia);
  public List<Map> selbs();
  public void addback(BackSaleUtil b);
  public void addsale(backsale a);
  public List<Map> seltd(@Param("tui") String tui,@Param("bsId")Integer bsId,@Param("rtbegDate")String rtbegDate,@Param("rtEndDate")String rtEndDate);
  public void uptd(backsale a);
  public void upmoney(BackSaleUtil b);
  public List<Map> selbo(@Param("bo") String bo);
  public List<Map> selto(@Param("to") String to);
  public List<Map> selbsq(@Param("bsq")String bsq);
  public void upback(BackSaleUtil b);
  public void delback(@Param("bsuUtilId")Integer bsuUtilId);
  public List<Map> selgq(@Param("gq") String gq);
  public void addbackdd(List<Map> list);
  public List<Map> selsale(@Param("bs") String bs,@Param("bsId")Integer bsId);
  public void   uptuih(List<Map> list);
  public  void   uptuizt(List<Map> list);
  public void addck(List<Map> list);
  public List<Map> delgq(List<Map> list);
  public List<Map> selck(@Param("ck") String ck);
  public List<Map> selgh(@Param("su") String su);
  public List<Map> selboj(@Param("bsj")String bsj);
  public List<Map> selpan(Integer spid);
  public List<Map> ztd();
  public List<Map> zbu();
  public List<Map> zcd();
  public List<Map> zsy();
  public List<Map> dzy();
  public List<Map> dzd();
  public List<Map> dcg();
  public List<Map> drk();
  public List<Map> gdn();
  public List<Map> office();
  public List<Map> gettone(@Param("rtid")Integer rtid, @Param("rtbegDate")String rtbegDate,@Param("rtEndDate")String rtEndDate);
}
