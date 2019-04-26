<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'shouyin.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!-- Bootstrap Styles-->
    <link href="backStage/assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FontAwesome Styles-->
    <!-- Morris Chart Styles-->
    <!-- Custom Styles-->
    <!-- Google Fonts-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <link rel="stylesheet" href="backStage/assets/js/Lightweight-Chart/cssCharts.css"> 

  <script type="text/javascript" src="backStage/assets/js/jquery-1.8.3.min.js"></script>
  <link rel="stylesheet" href="backStage/assets/lks/css/layui.css" type="text/css"></link>
  <script type="text/javascript" src="backStage/assets/lks/js/layui.js"charset="utf-8"></script></head>
  <style>
   #top11{
    padding:18px 30px 0 30px;
    width:100%;
    height:10%;
    background-color:#dcdcdc;
   }
   #top11 span{
    color:#fff;
   }
   #content11{
    margin-top:10px;
    overflow :yes;
    overflow :auto;
    overflow-y :yes;
    overflow-y :auto;
    width:100%;
    height:35%;
    
   }
   #end11{
    padding:8px 30px 0 30px;
   	margin-top:10px;
    width:100%;
    height:15%;
    background-color: #5ea6eb;
   }
   #aa{
    width:50%;
   }
   span{
    font-size:26px;
   }
   tr th{
    text-align:center;
   }
   #heji{
    border:1px;
    border-style:#CDCDCD;
    width:50%;
    height:60%;
     
   }
   #huiyuan{
    margin-top:10px;
    padding-top:4px;
    border:1px;
    border-style:#CDCDCD;
    width:50%;
    height:29%;
   }
   #endright{
    border:1px;
    border-style:#CDCDCD;
    float:right;
    width:49%;
    height:95%;
   }
   .xiu{
     border:0px;
     border-radius:10px;
     width:100%;
     height:49%;
     color:#fff;
   }
  #mytbody{
   text-align:center;
  }
  </style>
  <body style="overflow-y:auto">
  <div style="overflow:auto">
  <div class="alert alert-warning" style="display: none;" id="alert1">
   
   <strong>警告！</strong>该会员不存在。</div>
  
  <div class="alert alert-warning" style="display: none;" id="alert2">
   
   <strong>警告！</strong>金钱不够或不当操作</div>
  
  <form id="mybodys" action="alipaySum" method="post">
    <div id="top11">
     <span>商品条形码</span>&nbsp;&nbsp;&nbsp;&nbsp;
     <input  placeholder="请输入商品条码" type="text" name="map['SpBarCode']" id="aa" style=" height:35px;"/>
     <input type="button" class="btn btn-primary btn-sm" onclick="get()" value="查询"/>
    </div>
     <div id="content11">
  		<table class="table table-striped table-bordered table-hover">
  		 <tr>
  		 <th>商品名称</th>
  		 <th>商品条码</th>
  		 <th>商品价格</th>
  		 <th>商品数量</th>
  		 <th>商品类型</th>
  		 <th style='display:none'>商品编号</th>
  		 <th style='display:none'>所属仓库</th>
  		 <th>商品操作</th>
  		 </tr>
  		 <tbody id="mytbody">
  		
  		 </tbody>
  		</table>
    </div>
    <div id="end11" style="background-color: #dcdcdc">
    <div id="endright">
    <div style="float:right;width:20%;height:100%;">
    <input name="payables" id="alipay" style="display:none"/>
    <input name="subject" value="超市收银" style="display:none"/>
    <input name="body" value="MN_CS支付" style="display:none"/>
         <button class="xiu" style="font-size:26px;background-color: red;" onclick="jiesuanali()">支付宝结算</button>
    	 <input class="xiu" style="font-size:26px;background-color: #5ea6eb;" type="button" value="现金结算" onclick="jiesuan()"/>
    	</div>
    	<div style="width:80%;height:100%;">
    	<h3>实收金额：￥<input id="shis" name="map['ssRealMonery']" onkeyup="shishous()" value="0.00" style="border-style:none;color:red" onfocus="if(value=='0.00'){this.style.color='red';value=''}" onblur="if(value==''){this.style.color='red';value='0.00'}"/></h3>
    	<h3>应收金额：￥<input id="yings" name="map['ssTotalPrice']" readonly="readonly" value="0.00" style="border-style:none;color:red"/></h3>
    	<h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    	找零：￥<input id="zhaol" name="map['ssChange']" readonly="readonly" value="0.00" style="border-style:none;color:red"/></h3>
    	</div>
    	</div>
    	<div id="heji">
    	<span>合计：￥<input id="hejiqian"  readonly="readonly" value="0.00" style="border-style:none"/></span><br/>
    	<span>优惠：￥<input id="youhui" name="map['ssDisMonery']" readonly="readonly" value="0.00" style="border-style:none"/></span>
    	</div>
    	
    	<div id="huiyuan">
    	<font>会员号：
    	<input onblur="vipblur()"  name="map['mpBalMOnery']" id="mpBalMOnery" onfocus="if(value=='0'){this.style.color='red';value=''}"/>
    	会员类型：<input id="viptype" readonly="readonly" style="border-style:none;color:red;width:70px;"/>
    	会员状态：<input id="vipstatus" readonly="readonly" style="border-style:none;color:red;width:50px;"/>
    	<input id="mpId" name="map['mpId']" value="0" style="display:none"/>
    	</font>
    	</div>
    	
    </div>
    </form>
    </div>
  </body>
</html>
<script src="backStage/assets/js/jquery-1.10.2.js"></script>
<script>
 var num=1;
 var numtwo=0;
 //根据条码查询商品
 function get(){
  			$.ajax({
   			 url:"getlksspinfolks",
             type:"post",
             data:{"SpBarCode":$("#aa").val()},
             dataType:"json", 
             async:false,   
    success:function(data){ 
      var tr="";
    tr+="<tr>";
    tr+="<td name='map['spName']' class='spName'>"+data[0].spName+"</td>";
    tr+="<td name='map['SpBarCode']' class='weio'>"+data[0].spbc+"</td>";
    tr+="<td name='map['spSalePrice']' class='danjia'>"+data[0].spSalePrice+"</td>";
    tr+="<td><input name='map['ssSaleNum']' onkeyup='genggai()' class='shu' value='1'  style='border-style:none'/></td>";
    tr+="<td name='map=['sptName']'  class='sptName'>"+data[0].sptName+"</td>";
    tr+="<td id='spId' style='display:none'>"+data[0].spId+"</td>";
    tr+="<td id='whId' style='display:none'>"+data[0].whId+"</td>";
    tr+="<td><button style='background-color: #dc143c' class='btn btn-warning btn-sm' onclick='RemoveTr(this)'>"+'删除'+"</button></td>";
    tr+="</tr>";
  	if(num==1){
    $("#mytbody").append(tr);
    }  
  var tab = document.getElementById("mytbody"); 
  var row = tab.rows.length;
  for(var i = 0; i < row; i++)
  		{
      var cols = tab.rows[i].childNodes;
      if($("#aa").val()==cols[1].innerText){
      $(".weio").each(function(){
     if($(this).html()==$("#aa").val()){
       $(this).next().next().find("input").val( parseInt($(this).next().next().find("input").val())+1);
     }
  });
      numTwo=1;
      }
  } 
   if(numTwo==1&num==1){
   var ss1= $("#mytbody").find("tr");
  ss1.eq(0).find("td").eq(3).find("input").val(ss1.eq(0).find("td").eq(3).find("input").val()-1);
  }else if(numTwo==0&num!=1){
  
   $("#mytbody").append(tr);
  } 
    numTwo=0;  
 }
  });
  num+=1;
  var z=0;
  var chang=document.getElementById("mytbody").childNodes.length-1;
  var ss= $("#mytbody").find("tr");
  for(var a=0;a<chang;a++){
   var dan = ss.eq(a).find("td").eq(2).text();
   var shu = ss.eq(a).find("td").eq(3).find("input").val();
    var zong=parseFloat((dan*shu).toFixed(2));
   z+=zong;
   
  }
  $("#hejiqian").val(parseFloat(z).toFixed(2));
  $("#aa").val("");
  $("#yings").val($("#hejiqian").val());
 }
 //清除不要的商品
 function RemoveTr(o) {
   $(o).parent().parent().remove();
   var z=0;
  var chang=document.getElementById("mytbody").childNodes.length-1;
  var ss= $("#mytbody").find("tr");
  for(var a=0;a<chang;a++){
   var dan = ss.eq(a).find("td").eq(2).text();
   var shu = ss.eq(a).find("td").eq(3).find("input").val();
   
   var zong=parseFloat((dan*shu).toFixed(2));
   z+=zong;
   
  }
  $("#hejiqian").val(parseFloat(z).toFixed(2));
  $("#yings").val($("#hejiqian").val());
}
//改变购买商品数量
function genggai(){

 	 var z=0;
  var chang=document.getElementById("mytbody").childNodes.length-1;
  var ss= $("#mytbody").find("tr");
  for(var a=0;a<chang;a++){
   var dan = ss.eq(a).find("td").eq(2).text();
   var shu = ss.eq(a).find("td").eq(3).find("input").val();
   
   var zong=parseFloat((dan*shu).toFixed(2));
   z+=zong;
   
  }
  $("#hejiqian").val(parseFloat(z).toFixed(2));
  $("#yings").val($("#hejiqian").val());
}
//查询会员类型
function vipblur(){
var mpBalMOnery=$("#mpBalMOnery").val();
$("#viptype").val("");
$("#vipstatus").val("");
 $.ajax({
   			 url:"getvipphonelks",
             type:"post",
             data:{"mpBalMOnery":mpBalMOnery},
             dataType:"json",
             async:false,   
    		 success:function(data){
    		 if(data.length>0){
    		 $("#alert1").css("display","none");
    		$("#mpId").val(data[0].mpId);
    		$("#viptype").val(data[0].mpType);
    		$("#vipstatus").val(data[0].mpStatus);
    		}else{
    		$("#alert1").css("display","block");
    		}
    		
    }});
    var you=0;
    var vipty=$("#viptype").val();
    var vipstatus=$("#vipstatus").val();
    if(vipstatus=="正常"){
    	if(vipty=="普通会员"){
    	
    you=$("#hejiqian").val()-parseFloat(($("#hejiqian").val()*0.95).toFixed(2));
    $("#youhui").val(parseFloat(you).toFixed(2));
    	 }
   		else if(vipty=="高级会员"){
   		var hj=parseFloat((($("#hejiqian").val()*0.90).toFixed(2)));
   		
    	you=$("#hejiqian").val()-hj;
    
    $("#youhui").val(parseFloat(you).toFixed(2));
    	}
    }else{
     $("#youhui").val(0.00);
     $("#yings").val($("#hejiqian").val());
    }
    $("#yings").val(parseFloat($("#hejiqian").val()-you).toFixed(2));
    $("#abcde").val($("#yings").val())
    }
//得到金额
function shishous(){
 var sa=$("#shis").val();

 var ys=$("#yings").val();
 $("#zhaol").val(parseFloat(sa-ys).toFixed(2));
}

		//禁用鼠标右键
       function stop(){
		return false;
		}
		document.oncontextmenu=stop;
		
		//结算
		function jiesuan(){
		var ss=parseInt($("#shis").val());
		var ys=parseInt($("#yings").val());
		
		if(ss<ys){
		 $("#alert2").css("display","block");
		}
		 else if(ys==0.00){
		  $("#alert2").css("display","block");
		 }
		else{
		$("#alert2").css("display","none");
		//添加商品订单信息
		 $.ajax({
     url:"addSpinfoOrderlks",
     //contentType:"application/json",
     type:"post",
     data:$("#mybodys").serialize(),
     success:function(data){
    
    setTimeout("alertV()",1000); 
    
     }
    });
    
    var jsonArr=new Array();
		    $("#mytbody tr").each(function(i){                   // 遍历 tr
			   var  ssBarCode=$(this).children('td').eq(1).html();
			   var ssSalePrice=$(this).children('td').eq(2).html();
			   var ssSaleNum=$(this).children('td').eq(3).find("input").val();
			   var spId=$(this).children('td').eq(5).html();
			   var whId=$(this).children('td').eq(6).html();		   
			   josnStr={"ssBarCode":ssBarCode,"ssSalePrice":ssSalePrice,"ssSaleNum":ssSaleNum,"spId":spId,"whId":whId};
	           jsonArr.push(josnStr);   
			       });
			
	//循环添加		       
 //添加商品销售信息
   $.ajax({
  	url:"addSpinfoSpendlks",
     contentType:"application/json",
     type:"post",
     data:JSON.stringify(jsonArr),
     success:function(data){
    
     
     }
  });
 /*  //修改库存信息表
  
  $.ajax({
  url:"uprepertorylks",
     contentType:"application/json",
     type:"post",
     data:JSON.stringify(jsonArr),
     success:function(data){
     
     
     }
  }); */
  //修改商品信息表
   $.ajax({
  url:"upspInfolks",
     contentType:"application/json",
     type:"post",
     data:JSON.stringify(jsonArr),
     success:function(data){
     
     }
  }); 
   //修改商品货架记录表
  $.ajax({
  url:"upgoodsshelfrecordutillks",
     contentType:"application/json",
     type:"post",
     data:JSON.stringify(jsonArr),
     success:function(data){
    
     }
  });
  //添加会员累计金额
  if($("#mpBalMOnery").val()!=null&&$("#mpBalMOnery").val()!=""&&$("#mpBalMOnery").val()!=0){
   $.ajax({
     url:"upmembershiplks",
     type:"post",
     data:$("#mybodys").serialize(),
     success:function(data){
    	
     }
    });
  }
  window.location.reload();
  }
  
  
		}
		//支付宝结算
		
		function jiesuanali(){
		$("#alipay").val($("#yings").val());
		//添加商品订单信息
		 $.ajax({
     url:"addAlipaylks",
     type:"post",
     data:$("#mybodys").serialize(),
     success:function(data){
    setTimeout("alertV()",1000); 
     }
    });
    
    var jsonArr=new Array();
		    $("#mytbody tr").each(function(i){                   // 遍历 tr
			   var  ssBarCode=$(this).children('td').eq(1).html();
			   var ssSalePrice=$(this).children('td').eq(2).html();
			   var ssSaleNum=$(this).children('td').eq(3).find("input").val();
			   var spId=$(this).children('td').eq(5).html();
			   var whId=$(this).children('td').eq(6).html();		   
			   josnStr={"ssBarCode":ssBarCode,"ssSalePrice":ssSalePrice,"ssSaleNum":ssSaleNum,"spId":spId,"whId":whId};
	           jsonArr.push(josnStr);   
			       });
			
	//循环添加		       
 //添加商品销售信息
   $.ajax({
  	url:"addSpinfoSpendlks",
     contentType:"application/json",
     type:"post",
     data:JSON.stringify(jsonArr),
     success:function(data){
    
     
     }
  });
  //修改库存信息表
 /*  $.ajax({
  url:"uprepertorylks",
     contentType:"application/json",
     type:"post",
     data:JSON.stringify(jsonArr),
     success:function(data){
     }
  }); */
  //修改商品信息表
   $.ajax({
  url:"upspInfolks",
     contentType:"application/json",
     type:"post",
     data:JSON.stringify(jsonArr),
     success:function(data){
     }
  }); 
   //修改商品货架记录表
  $.ajax({
  url:"upgoodsshelfrecordutillks",
     contentType:"application/json",
     type:"post",
     data:JSON.stringify(jsonArr),
     success:function(data){
     }
  });
  //添加会员累计金额
  if($("#mpBalMOnery").val()!=null&&$("#mpBalMOnery").val()!=""&&$("#mpBalMOnery").val()!=0){
   $.ajax({
     url:"upmembershiplks",
     type:"post",
     data:$("#mybodys").serialize(),
     success:function(data){
     }
    });
  }
  
  
  
		}
</script>

