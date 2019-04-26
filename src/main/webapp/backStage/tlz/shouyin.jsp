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

  <script type="text/javascript" src="backStage/assets/js/jquery-1.8.3.min.js"></script></head>
  <style>
   #top11{
    padding:18px 30px 0 30px;
    width:100%;
    height:10%;
    background-color:#F9F9F9;
   }
   #content11{
    margin-top:10px;
    overflow :yes;
    overflow :auto;
    overflow-y :yes;
    overflow-y :auto;
    width:100%;
    height:60%;
    
   }
   #end11{
    padding:8px 30px 0 30px;
   	margin-top:10px;
    width:100%;
    height:25%;
    background-color:#F9F9F9;
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
    border-style:solid;
    width:50%;
    height:60%;
     
   }
   #huiyuan{
    margin-top:10px;
    padding-top:4px;
    border:1px;
    border-style:solid;
    width:50%;
    height:29%;
   }
   #endright{
    border:1px;
    border-style:solid;
    float:right;
    width:49%;
    height:95%;
   }
   #xiu{
     width:100%;
     height:100%;
     font-size:32px;
     background-color: #E8F2FE;
   }
  #mytbody{
   text-align:center;
  }
  </style>
  <body>
    <div id="top11">
     <span>商品条形码</span>&nbsp;&nbsp;&nbsp;&nbsp;
     <input type="text" name="SpBarCode" id="aa" value="1234567801"/>
     <input type="button" onclick="get()" value="查询"/>
    </div>
     <div id="content11">
  		<table class="table table-striped table-bordered table-hover">
  		 <tr>
  		 <th>商品名称</th>
  		 <th>商品条码</th>
  		 <th>商品价格</th>
  		 <th>商品数量</th>
  		 <th>商品类型</th>
  		 <th>商品操作</th>
  		 </tr>
  		 <tbody id="mytbody">
  		
  		 </tbody>
  		</table>
    </div>
    <div id="end11">
    <div id="endright">
    <div style="float:right;width:20%;height:100%;">
    	 <input id="xiu" type="button" value="结算">
    	</div>
    	<div style="width:80%;height:100%;">
    	<h3>实收金额：￥<input id="shis" onkeyup="shis()" value="0.00" style="border-style:none;color:red" onfocus="if(value=='0.00'){this.style.color='red';value=''}" onblur="if(value==''){this.style.color='red';value='0.00'}"/></h3>
    	<h3>应收金额：￥<input id="yings" readonly="readonly" value="0.00" style="border-style:none;color:red"/></h3>
    	<h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    	找零：￥<input id="zhaol" readonly="readonly" value="0.00" style="border-style:none;color:red"/></h3>
    	</div>
    	</div>
    	<div id="heji">
    	<span>合计：￥<input id="hejiqian" readonly="readonly" value="0.00" style="border-style:none"/></span><br/>
    	<span>优惠：￥<input id="youhui" readonly="readonly" value="0.00" style="border-style:none"/></span>
    	</div>
    	
    	<div id="huiyuan">
    	<font>会员号：
    	<input onkeyup="keyup()" name="mpId" id="mpId"/>
    	会员类型：<input id="viptype" readonly="readonly" style="border-style:none;color:red;width:70px;"/>
    	会员状态：<input id="vipstatus" readonly="readonly" style="border-style:none;color:red;width:50px;"/>
    	</font>
    	</div>
    	
    </div>
  </body>
</html>
<script src="backStage/assets/js/jquery-1.10.2.js"></script>
<script>
 var num=1;
 var numtwo=0;
 function get(){
 var SpBarCode=$("#aa").val();
  			$.ajax({
   			 url:"getlksspinfolks",
             type:"post",
             data:{"SpBarCode":SpBarCode},
             dataType:"json", 
             async:false,   
    success:function(data){  
      var tr="";
    tr+="<tr>";
    tr+="<td class='spName'>"+data[0].spName+"</td>";
    tr+="<td class='weio'>"+data[0].spbc+"</td>";
    tr+="<td class='danjia'>"+data[0].spSalePrice+"</td>";
    tr+="<td><input class='shu' value='1'  style='border-style:none'/></td>";
    tr+="<td class='sptName'>"+data[0].sptName+"</td>";
    tr+="<td><button onclick='RemoveTr(this)'>"+'删除'+"</button></td>";
    tr+="</tr>";
  if(num==1){
   $("#mytbody").append(tr);
   alert(document.getElementById("mytbody").rows.length)
  }
 
  
  
  var tab = document.getElementById("mytbody"); 
  
  var row = tab.rows.length;
 
  for(var i = 0; i < row; i++)
  {
      var cols = tab.rows[i].childNodes;
      if(SpBarCode==cols[1].innerText){
    
       $(".weio").each(function(){
     if($(this).html()==SpBarCode){
       $(this).next().next().find("input").val( parseInt($(this).next().next().find("input").val())+1);
       
     }
  });
 
      numTwo=1;
      break;
      }
  } 
  
   if(numTwo==1&num==1){
  
  }else if(numTwo==0&num!=1){
   $("#mytbody").append(tr);
  } 
    numTwo=0;
     }
 
  });
  num+=1;
               
    
    
    
  /* var zong=0;
   var chang=document.getElementById("mytbody").childNodes.length-1;
   for(var a=0;a<chang;a++){
   zong+=parseInt($(".danjia").text());
   alert($(".danjia").text());
   }
   $("#hejiqian").val(zong);
  alert(zong); */
  var z=0;
  var chang=document.getElementById("mytbody").childNodes.length-1;
  var ss= $("#mytbody").find("tr");
  for(var a=0;a<chang;a++){
   var dan = ss.eq(a).find("td").eq(2).text();
   var shu = ss.eq(a).find("td").eq(3).find("input").val();
   
   var zong=parseFloat(dan*shu);
   
   z=+zong;
   
   
  }
  $("#hejiqian").val(z);
  
  
 
 }
 function RemoveTr(o) {
   $(o).parent().parent().remove();
   var z=0;
  var chang=document.getElementById("mytbody").childNodes.length-1;
  var ss= $("#mytbody").find("tr");
  for(var a=0;a<chang;a++){
   var dan = ss.eq(a).find("td").eq(2).text();
   var shu = ss.eq(a).find("td").eq(3).find("input").val();
   
   var zong=dan*shu;
   z+=zong;
   
   
   
  }
  $("#hejiqian").val(z);
}
//查询会员类型
function keyup(){
var mpId=$("#mpId").val();
 $.ajax({
   			 url:"getviplks",
             type:"post",
             data:{"mpId":mpId},
             dataType:"json",
             async:false,   
    		 success:function(data){
    		$("#viptype").val(data[0].mpType);
    		$("#vipstatus").val(data[0].mpStatus);
    		
    }});
    var you=0;
    var vipty=$("#viptype").val();
    var vipstatus=$("#vipstatus").val();
    if(vipstatus=="正常"){
    if(vipty=="普通会员"){
    you=$("#hejiqian").val()-($("#hejiqian").val()*0.95);
    $("#youhui").val(you);
    }
    if(vipty=="高级会员"){
    you=$("#hejiqian").val()-($("#hejiqian").val()*0.90);
    $("#youhui").val(you);
    }}else {
     $("#youhui").val(0.00);
    }
    $("#yings").val($("#hejiqian").val()-you);
    
}

		//禁用鼠标右键
       function stop(){
		return false;
		}
		document.oncontextmenu=stop;
</script>

