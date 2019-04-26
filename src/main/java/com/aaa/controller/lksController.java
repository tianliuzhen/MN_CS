package com.aaa.controller;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aaa.alipay.config;
import com.aaa.entity.BasePojo;
import com.aaa.serviceImpl.lksServiceImpl;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradePagePayRequest;


@Controller
public class lksController {
	@Autowired 
	private lksServiceImpl service;
	 //查询会员信息
	  @RequestMapping("/getvip") 
	  @ResponseBody
	  public List<Map> getvip(){
		 
		return service.getvip();
	  
	  }
	  //根据条形码查询商品
	  @RequestMapping("/getlksspinfolks")
	  @ResponseBody
	  public List<Map> getspinfolks(String SpBarCode){
		return service.getspinfolks(SpBarCode);
		
	  }
	//根据会员编码查询会员信息
	  @RequestMapping("/getviplks")
	  @ResponseBody
	  public List<Map> getviplks(Integer mpId){
		 
		return service.getviplks(mpId);
		  
	  }
	  //添加会员
	  @RequestMapping("/addlks")
	  @ResponseBody
	  public String addlks(BasePojo map){
		  int num=service.addlks(map);
		  if(num>0){
			  return "success";
				}else{
			 return "error";
		}
		  
	  }
	  //修改会员
	  @RequestMapping("/upviplks")
	  @ResponseBody
	  public String upviplks(BasePojo map){
		  int num=service.upviplks(map);
		  if(num>0){
			  return "success";
				}else{
			 return "error";
		}
		  
	  }
	  
	  //结算
	  
	//根据会员手机号查询会员信息
	  @RequestMapping("/getvipphonelks")
	  @ResponseBody
	  public List<Map> getvipphonelks(String mpBalMOnery){
		 
		return service.getvipphonelks(mpBalMOnery);
		  
	  }
	
	  @RequestMapping("/addSpinfoOrderlks")
	  @ResponseBody
	  public String jiesuan(BasePojo map,HttpSession httpSess){
		 //添加商品订单表
		  Integer ocId= (Integer) httpSess.getAttribute("ocId");
		  map.getMap().put("ocId",ocId);
		  int num=service.addSpinfoOrderlks(map);
		  if(num>0){
			  return "success";
		  }else{
			  return "error";
		  }
	  
	  }
	  @RequestMapping("/addSpinfoSpendlks")
	  @ResponseBody
	  public String addSpinfoSpendlks(@RequestBody List<Map> map){
		 //查询商品订单表的主键添加商品销售表
		 try {
			 for (int i = 0; i < map.size(); i++) {
				 Integer aaa=service.querySpinfoOrderlks();
				Map map3=new HashMap();
				map3.put("soid", aaa);
				map3.put("ssBarCode", String.valueOf(map.get(i).get("ssBarCode")));
				map3.put("ssSaleNum", Integer.parseInt(String.valueOf(map.get(i).get("ssSaleNum"))));
				map3.put("ssSalePrice",Double.parseDouble(String.valueOf(map.get(i).get("ssSalePrice"))));
				map3.put("spId", Integer.parseInt(String.valueOf(map.get(i).get("spId"))));
				map3.put("whId", Integer.parseInt(String.valueOf(map.get(i).get("whId"))));
				map3.put("ssTotal",(Integer.parseInt(String.valueOf(map.get(i).get("ssSaleNum")))*Double.parseDouble(String.valueOf(map.get(i).get("ssSalePrice")))));
				int num2=service.addSpinfoSpendlks(map3);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "success";
	  }
	 


@RequestMapping("/uprepertorylks")
@ResponseBody
public String uprepertorylks(@RequestBody List<Map> map){
	 //修改库存信息表
	 try {
		 for (int i = 0; i < map.size(); i++) {
			Map map2=new HashMap();
			map2.put("SpBarCode", String.valueOf(map.get(i).get("ssBarCode")));
			map2.put("trNumber", Integer.parseInt(String.valueOf(map.get(i).get("ssSaleNum"))));
			int num2=service.uprepertorylks(map2);
		}
	} catch (Exception e) {
		// TODO: handle exception
	}
	return "success";
}


@RequestMapping("/upspInfolks")
@ResponseBody
public String upspInfolks(@RequestBody List<Map> map){
	 //修改商品信息表
	 try {
		 for (int i = 0; i < map.size(); i++) {
			Map map1=new HashMap();
			map1.put("spId", Integer.parseInt(String.valueOf(map.get(i).get("spId"))));
			map1.put("spAllNum", Integer.parseInt(String.valueOf(map.get(i).get("ssSaleNum"))));
			map1.put("spDnNum", Integer.parseInt(String.valueOf(map.get(i).get("ssSaleNum"))));
			int num1=service.upspInfolks(map1);
		}
	} catch (Exception e) {
		// TODO: handle exception
	}
	return "true";
}
@RequestMapping("/upgoodsshelfrecordutillks")
@ResponseBody
public String upgoodsshelfrecordutillks(@RequestBody List<Map> map){
	 //修改商品货架记录表
	 try {
		 for (int i = 0; i < map.size(); i++) {
			Map map4=new HashMap();
			map4.put("spId", Integer.parseInt(String.valueOf(map.get(i).get("spId"))));
			map4.put("spAllNum", Integer.parseInt(String.valueOf(map.get(i).get("ssSaleNum"))));
			int num1=service.upgoodsshelfrecordutillks(map4);
		}
	} catch (Exception e) {
		// TODO: handle exception
	}
	return "true";
}
//添加累计金额
@RequestMapping("/upmembershiplks")
@ResponseBody
public String upmembershiplks(BasePojo map){
	 int num=service.upmembershiplks(map);
	return "true";
	  
	  
	  
}
//查询当天订单
@RequestMapping("/querySpinfoSpendlks") 
@ResponseBody
public List<Map> querySpinfoSpendlks(){
	 
	return service.querySpinfoSpendlks();

}
//根据销售订单号查询该订单
@RequestMapping("/querytuihuolks")
@ResponseBody
public List<Map> querytuihuolks(Integer soid){
	return service.querytuihuolks(soid);
	
}
//根据销售订单号查询该订单
@RequestMapping("/querytuihuomigxilks")
@ResponseBody
public List<Map> querytuihuomigxilks(String ssBarCode,Integer soid){
	return service.querytuihuomigxilks(ssBarCode,soid);
}
//添加退货记录
@RequestMapping("/addbackOrderGoodslks")
@ResponseBody
public String addbackOrderGoodslks(BasePojo map){
	int num=service.addbackOrderGoodslks(map);
	if(num>0){
		  return "success";
	  }else{
		  return "error";
	  }
}
//根据条件查询退货单
@RequestMapping("/querybackorderlks")
@ResponseBody
public List<Map> querybackorderlks(String sptId,Integer soid){
	return service.querybackorderlks(soid,sptId);
	
}
////收银对账
@RequestMapping("/queryduizhanglks") 
@ResponseBody
public List<Map> queryduizhanglks(){
	return service.queryduizhanglks();

}
//提交对账记录
@RequestMapping("/addduizhanglks")
@ResponseBody
public String addduizhanglks(@RequestBody List<Map> map){
		 for (int i = 0; i < map.size(); i++) {
			Map map3=new HashMap();
			map3.put("dtype", String.valueOf(map.get(i).get("dtype")));
			map3.put("dyings", String.valueOf(map.get(i).get("dyings")));
			map3.put("dshis",String.valueOf(map.get(i).get("dshis")));
			map3.put("dzt", String.valueOf(map.get(i).get("dzt")));
			int num2=service.addduizhanglks(map3);
		}
	return "success";
}

//查询对账单
@RequestMapping("/queryduizhangshlks") 
@ResponseBody
public List<Map> queryduizhangshlks(){
	return service.queryduizhangshlks();

}
//审核对账单
@RequestMapping("/upduizhanglks")
@ResponseBody
public String upduizhanglks(BasePojo map){
	  int num=service.upduizhanglks(map);
	  if(num>0){
		  return "success";
			}else{
		 return "error";
	}
	  
}

@RequestMapping("alipaySum")
public Object alipayIumpSum(Model model, String payables, String subject, String body, HttpServletResponse response)
        throws Exception {
    // 获得初始化的AlipayClient
    AlipayClient alipayClient = new DefaultAlipayClient(config.gatewayUrl, config.app_id,
    		config.merchant_private_key, "json", config.charset,
    		config.alipay_public_key, config.sign_type);
    // 设置请求参数
    AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
    alipayRequest.setReturnUrl("http://localhost:8080/MN_CS/index.jsp");
    alipayRequest.setNotifyUrl("http://localhost:8080/MN_CS/index.jsp");
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ssSSS");
    // 商户订单号，商户网站订单系统中唯一订单号，必填
    String out_trade_no = sdf.format(new Date());
    // 付款金额，必填
    String total_amount = payables.replace(",", "");
    alipayRequest.setBizContent("{\"out_trade_no\":\"" + out_trade_no + "\"," + "\"total_amount\":\"" + total_amount
            + "\"," + "\"subject\":\"" + subject + "\"," + "\"body\":\"" + body + "\","
            + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
    // 请求
    String result = alipayClient.pageExecute(alipayRequest).getBody();
    // System.out.println(result);
    config.logResult(result);// 记录支付日志
    response.setContentType("text/html; charset=gbk");
    PrintWriter out = response.getWriter();
    out.print(result);
	return null;
    
}

@RequestMapping("notify_url")
public void Notify(HttpServletResponse response, HttpServletRequest request) throws Exception {
	// 商户订单号
    String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"), "GBK");
    // 付款金额
    String total_amount = new String(request.getParameter("total_amount").getBytes("ISO-8859-1"), "GBK");
    // 支付宝交易号
    String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"), "GBK");
    // 交易说明
    String cus = new String(request.getParameter("body").getBytes("ISO-8859-1"), "GBK");
    // 交易状态
    String trade_status = new String(request.getParameter("trade_status").getBytes("ISO-8859-1"), "GBK");
   
}
@RequestMapping("/addAlipaylks")
@ResponseBody
public String alipay(BasePojo map,HttpSession httpSess){
	 //添加商品订单表
	  Integer ocId= (Integer) httpSess.getAttribute("ocId");
	  map.getMap().put("ocId",ocId);
	  int num=service.addAlipaylks(map);
	  if(num>0){
		  return "success";
	  }else{
		  return "error";
	  }

}

}
