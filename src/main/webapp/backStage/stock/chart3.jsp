<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'chart.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  <script type="text/javascript" src="backStage/stock/Highcharts-6.2.0/code/jquery-3.3.1.min.js"></script>
  <script type="text/javascript" src="backStage/stock/Highcharts-6.2.0/code/highcharts.js"></script>
  <style>
  
  #table_stock_before{ 
        border-collapse:collapse;
        border:1px solid #cad9ea; 
        color:#666;
         margin:auto auto;
          text-align:center;
          width:1480px;
          background:white;
        } 
  #table_stock_before tr th,#table_stock_before tr td{  
          border:1px solid #cad9ea;
          padding:0 1em 0;
          
          height:40px;
          text-align:center;
          height:40px;       
          width:auto;      }                        
 #year_sel{
     position:absolute;
     top:55px;
     left:1000px;
     height:30px;
     width:120px;
     z-index:300;
 }
 #month_sel{
     position:absolute;
     top:55px;
     left:1150px;
     height:30px;
     width:120px;
     z-index:300;
 }
  .contact{
     position:absolute;
    top:40px;
    right:30px;
  }
  .content{
    display:none;
    width:250px;
    height:70px;
    border-radius:10px;
    padding:20px;
    position:absolute;
    top:60px;
    right:60px;
    background-color:#2F4056;
    z-index:300;
} 
  </style>
   </head><!--height:1200px;  -->
 <body style="height:1300px;"> 
  <a href="#" style="color: blue" class="contact"><img src="backStage/stock/img/wenhao.png"></a>    
    <div class="content" style="color: white;">
       销售盈利：销售-成本<br /><br />
        净盈利：销售盈利-损失成本
    </div>
 
    <select onchange="change()" id="year_sel">
       <option selected="selected" value="2018">2018年</option>
       <option value="2017">2017年</option>
       <option value="2016">2016年</option>
       <option value="2015">2015年</option>
       <option value="2014">2014年</option>
       <option value="2013">2013年</option>
     
    </select>
    <select onchange="changemon()" id="month_sel">
       <option selected="selected" value="">--全年--</option>
       <option value="1">一月</option>
       <option value="2">二月</option>
       <option value="3">三月</option>
       <option value="4">四月</option>
       <option value="5">五月</option>
       <option value="6">六月</option>
       <option value="7">七月</option>
       <option value="8">八月</option>
       <option value="9">九月</option>
       <option value="10">十月</option>
       <option value="11">十一月</option>
       <option value="12">十二月</option>
    </select>
 <div id="container" style="width: 1050px; height: 600px; margin: 50 auto"></div>
 <div id=" " >
 <h3 style="position:relative;left: 850px;"> <span id="text_mon"></span></h3> 
      <table  id="table_stock_before">
                                   
                                </table>
 </div>
<script language="JavaScript">
  $(document).ready(function(){
$(".contact").mouseover(function(){
$(".content").show( );
$(".contact").mouseout(function(){
$(".content").hide( );
});
});
}) 
//选项查询
function changemon(){
   if($("#month_sel").val()==""){
      cc();
   }else{ 
   ccmon();
   }
}
function change(){
  
   $("#month_sel option:first").prop("selected",'selected');
   
   cc(); 
}
//页面加载
$(document).ready(function () {
  cc();
})  
function cc() { 
var inmon;
 var profit;    
       $.ajax({	  
       	type: "post",
      url: "stock/chartsale",	
      data:{year:parseInt($("#year_sel").val())},
	 	async:false,
	success: function (data) {	
			inmon = data;	
			 
					},	
		 error: function () {	
			 alert("请求超时，请重试！");	
		     	}	
		});
      
       //每月盈利 减去成本
       $.ajax({	  
       	type: "post",
      url: "stock/chartsalesub",	
      data:{year:$("#year_sel").val(),month:$("#month_sel").val()},
	 	async:false,
	success: function (data) {	
			profit = data;	
			 
					},	
		 error: function () {	
			 alert("请求超时，请重试！");	
		     	}	
		});
 
 var sunyi;
       //每月报溢+报损                                                                                        //每月盈利 减去成本 报损 加报溢
       $.ajax({	  
       	type: "post",
      url: "stock/sunyi",	
      data:{year:$("#year_sel").val(),month:$("#month_sel").val()},
	 	async:false,
	success: function (data) {	
			sunyi = data;	
			 
					},	
		 error: function () {	
			 alert("请求超时，请重试！");	
		     	}	
		});
		//每月纯收益
	var arr=[];
	for ( var i = 0; i < profit.length; i++) {
		var cha =profit[i]+sunyi[i];
		arr.push(cha);
	}	
		 
  //金额数组的累加
    var inmon_all=eval(inmon.join("+"))
    var profit_all=eval(profit.join("+"))
     var arr_all=eval(arr.join("+"));
    $("#text_mon").html("营业额："+inmon_all+"元 /盈利额："+profit_all+"元/净盈利："+arr_all+"元" );
    //数组填入表格
     $("#table_stock_before").html("");     
    var  inmon_td;
     for ( var i in inmon) {
		 
		  inmon_td+= "<td>"+inmon[i]+"</td>";
	}  
    var  profit_td;
     for ( var i in profit) {
		 
		  profit_td+= "<td>"+profit[i]+"</td>";
	}  
    var  arr_td;
     for ( var i in arr) {
		 
		  arr_td+= "<td>"+arr[i]+"</td>";
	}  
		 $("#table_stock_before").append( "<thead>"+
                                        "<tr>"+
									   "<th style='width: 50px;'>月份</th>"+
									   "<th>一月</th>"+
									   "<th>二月</th>"+
									   "<th>三月</th>"+
									   "<th>四月</th>"+
									   "<th>五月</th>"+
									   "<th>六月</th>"+
									   "<th>七月</th>"+
									   "<th>八月</th>"+
									   "<th>九月</th>"+
									   "<th>十月</th>"+
									   "<th>十一月</th>"+
									   "<th>十二月</th>"+
								        "</tr>"+
								        
                                    "</thead>"+
                                     "<tbody id='tbody_stock_before'>"+
                                    
                                    "</tbody>")
		 $("#tbody_stock_before").append("<tr  id='tableone'>"+
		                             "<td>销售金额</td>"+inmon_td+"</tr>")
    
		 $("#tableone").after("<tr  id='yinge'>"+
		                             "<td>销售盈利</td>"+profit_td+"</tr>")
		 $("#yinge").after("<tr  >"+
		                             "<td>净盈利</td>"+arr_td+"</tr>")
    
 
   var title = {
      text: parseInt($("#year_sel").val())+'年营业盈利报表'   
   };
   var subtitle = {
      text: '每月销售统计'
   };
   var xAxis = {
      categories: ['一月', '二月', '三月', '四月', '五月', '六月',
         '七月', '八月', '九月', '十月', '十一月', '十二月']
   };
   var yAxis = {
      title: {
         text: '金额 (\元)'
      }
   };
   var plotOptions = {
      line: {
         dataLabels: {
            enabled: true
         },   
         enableMouseTracking: false
      }
   };
   var series= [{
         name: '营业额',
         data:  inmon
      } ,
      {
         name: '销售盈利',
         data:  profit
      } ,
      {
         name: '净盈利',
         data:  arr
      } 
   ];
   
   var json = {};

   json.title = title;
   json.subtitle = subtitle;
   json.xAxis = xAxis;
   json.yAxis = yAxis;  
   json.series = series;
   json.plotOptions = plotOptions;
   $('#container').highcharts(json);
  
};
function ccmon() { 
var inmon;
 var profit;
     //收银金额
       $.ajax({	  
       	type: "post",
      url: "stock/chartsaledate",	
      data:{year:$("#year_sel").val(),month:$("#month_sel").val()},
	 	async:false,
	success: function (data) {	
			inmon = data;	
			 
					},	
		 error: function () {	
			 alert("请求超时，请重试！");	
		     	}	
		});
     //收银金额
       $.ajax({	  
       	type: "post",
      url: "stock/chartsalesubdate",	
      data:{year:$("#year_sel").val(),month:$("#month_sel").val()},
	 	async:false,
	success: function (data) {	
			profit = data;	
			 
					},	
		 error: function () {	
			 alert("请求超时，请重试！");	
		     	}	
		});
     
  //金额数组的累加
    var inmon_all=eval(inmon.join("+"));
    var profit_all=eval(profit.join("+"));
   
     $("#text_mon").html("<h3>营业额："+inmon_all+"元 /盈利额："+profit_all+"元</h3>");
    //数组填入表格
     $("#table_stock_before").html(""); 
     
     //月份判断
	var mon31da=[1,3,5,7,8,10,12];
	var bbb=[4,6,9,11];
	   if( $("#month_sel").val()==4 ||  $("#month_sel").val()==6 ||  $("#month_sel").val()==9 ||  $("#month_sel").val()==11){
	  inmon.pop();
	  profit.pop();
 } else if( $("#month_sel").val()==2 && $("#year_sel").val()%4==0){
	  inmon.pop();
	  inmon.pop();
	  profit.pop();
	  profit.pop();
 }
	else   if( $("#month_sel").val()==2){
	  inmon.pop();
	  inmon.pop();
	  inmon.pop();
	  profit.pop();
	  profit.pop();
	  profit.pop();
 }
	 
	  
         
    var  inmon_td;
     for ( var i in inmon) {
		  inmon_td+= "<td>"+inmon[i]+"</td>";
		 if(i==15){
		   break;
		 }
	}    
    var  inmon2_td;
	for ( var i = 16; i < profit.length; i++) {
		   inmon2_td += "<td>"+inmon[i]+"</td>";
		 
	}
    var  profit_td;
     for ( var i in profit) {
		  profit_td+= "<td>"+profit[i]+"</td>";
		 if(i==15){
		   break;
		 }
	}    
	
    var  profit2_td;
	for ( var i = 16; i < profit.length; i++) {
		   profit2_td += "<td>"+profit[i]+"</td>";
		 
	}
    
	     $("#table_stock_before").append( "<thead>"+
                                        "<tr id='table_one'>"+
									   "<th style='width: 50px;'>日期</th>"+
									   "<th>1号</th>"+
									   "<th>2号</th>"+
									   "<th>3号</th>"+
									   "<th>4号</th>"+
									   "<th>5号</th>"+
									   "<th>6号</th>"+
									   "<th>7号</th>"+
									   "<th>8号</th>"+
									   "<th>9号</th>"+
									   "<th>10号</th>"+
									   "<th>11号</th>"+
									   "<th>12号</th>"+
									   "<th>13号</th>"+
									   "<th>14号</th>"+
									   "<th>15号</th>"+
									   "<th>16号</th>"+
									   "</tr> <tr  id='table_two'>"+
									   "<th style='width: 50px;'>日期</th>"+
									   "<th>17号</th>"+
									   "<th>18号</th>"+
									   "<th>19号</th>"+
									   "<th>20号</th>"+
									   "<th>21号</th>"+
									   "<th>22号</th>"+
									   "<th>23号</th>"+
									   "<th>24号</th>"+
									   "<th>25号</th>"+
									   "<th>26号</th>"+
									   "<th>27号</th>"+
									   "<th>28号</th>"+
									   
									   "<th id='da29'>29号</th>"+
									  
									   "<th id='da30'>30号</th>"+
									   "<th id='da31'>31号</th>"+
								        "</tr>"+
                                    "</thead>"+
                                     "<tbody id='tbody_stock_before'>"+
                                    
                                    "</tbody>")
    if( $("#month_sel").val()==4 ||  $("#month_sel").val()==6 ||  $("#month_sel").val()==9 ||  $("#month_sel").val()==11){
	    $("#da31").css({"display":"none"});
 }else if( $("#month_sel").val()==2 && $("#year_sel").val()%4==0){
	  $("#da31").css({"display":"none"});
	    $("#da30").css({"display":"none"});
 }
else if( $("#month_sel").val()==2){
	    $("#da31").css({"display":"none"});
	    $("#da30").css({"display":"none"});
	    $("#da29").css({"display":"none"});
 } 
    
		   $("#table_one").after("<tr id='tt'>"+
		                             "<td>销售金额</td>"+inmon_td+"</tr>")  
		   $("#table_two").after("<tr id='tt2'>"+
		                             "<td>销售金额</td>"+inmon2_td+"</tr>")  
		   $("#tt").after("<tr >"+
		                             "<td>盈利金额</td>"+profit_td+"</tr>")  
		   $("#tt2").after("<tr >"+
		                             "<td>盈利金额</td>"+profit2_td+"</tr>")  
           
      
      
      
   var title = {
      text: parseInt($("#year_sel").val())+'年'+$("#month_sel").val()+'月营业盈利报表'   
   };
   var subtitle = {
      text: '当月每日销售统计'
   };
   var xAxis = {
      categories:   ['1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19',
               '20','21','22','23','24','25','26','27','28','29','30','31']
   };
   var yAxis = {
      title: {
         text: '金额 (\元)'
      }
   };
   var plotOptions = {
      line: {
         dataLabels: {
            enabled: true
         },   
         enableMouseTracking: false
      }
   };
   var series= [{
         name: '营业额',
         data:  inmon
      } ,
        {
         name: '盈利额',
         data:  profit
      } 
   ];
   
   var json = {};

   json.title = title;
   json.subtitle = subtitle;
   json.xAxis = xAxis;
   json.yAxis = yAxis;  
   json.series = series;
   json.plotOptions = plotOptions;
   $('#container').highcharts(json);
      
   
};
</script>
</body>
</html>