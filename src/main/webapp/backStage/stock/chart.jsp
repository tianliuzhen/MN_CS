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
   <script type="text/javascript" src="backStage/stock/Highcharts-6.2.0/code/highcharts-3d.js"></script>
   
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
 select{
     position:absolute;
     top:55px;
     left:1100px;
     height:30px;
     width:120px;
     z-index:300;
 }
  </style>
   </head>
 <body>
    <select onchange="change()" id="year_sel">
       <option>--请选择--</option>
       <option selected="selected">2018年</option>
       <option>2017年</option>
       <option>2016年</option>
       <option>2015年</option>
       <option>2014年</option>
       <option>2013年</option>
     
    </select>
 <div id="container" style="width: 1050px; height: 600px; margin: 50 auto"></div>
 
 <div id=" "  >
 <h3 style="position:relative;left: 1350px;"> 总金额：<span id="text_mon"></span>元</h3>
      <table  id="table_stock_before">
                                    <thead>
                                        <tr>
									   <th style="width: 50px;">月份</th>
									   <th>一月</th>
									   <th>二月</th>
									   <th>三月</th>
									   <th>四月</th>
									   <th>五月</th>
									   <th>六月</th>
									   <th>七月</th>
									   <th>八月</th>
									   <th>九月</th>
									   <th>十月</th>
									   <th>十一月</th>
									   <th>十二月</th>
								        </tr>
								        
                                    </thead>
                                     <tbody id="tbody_stock_before">
                                    
                                    </tbody>
                                </table>
 </div>
<script language="JavaScript">
 function change(){
     init();
   }
  $(function (){
    init();
  })
 function init() {  
 
 var inmon;

       $.ajax({	  
       	type: "post",
      url: "stock/chartpayin",	
      data:{year:parseInt($("#year_sel").val())},
	 	async:false,
	success: function (data) {	
			inmon = data;	
					},	
		 error: function () {	
			 alert("请求超时，请重试！");	
		     	}	
		});
  //金额数组的累加
    $("#text_mon").html(eval(inmon.join("+")));
 //数据填入表格
  $("#tbody_stock_before").html("");     
    var  inmon_td;
     for ( var i in inmon) {
		 
		  inmon_td+= "<td>"+inmon[i]+"</td>";
	}  
		 $("#tbody_stock_before").append("<tr>"+
		                             "<td>进货金额</td>"+inmon_td+"</tr>")
    
   var chart = {
      type: 'column'
   };
   var title = {
      text: $("#year_sel").val()+'每月采购金额统计'   
   };
   var subtitle = {
      text: '财务支出'  
   };
   var xAxis = {
      categories: ['一月', '二月', '三月', '四月', '五月', '六月',
         '七月', '八月', '九月', '十月', '十一月', '十二月'],
      crosshair: true
   };
   var yAxis = {
      min: 0,
      title: {
         text: '单位(元)'         
      }      
   };
   var tooltip = {
      headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
      pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
         '<td style="padding:0"><b>{point.y:.1f} mm</b></td></tr>',
      footerFormat: '</table>',
      shared: true,
      useHTML: true
   };
   var plotOptions = {
      column: {
         pointPadding: 0.2,
         borderWidth: 0
      }
   };  
   var credits = {
      enabled: false
   };
   
   var series= [{
        name: '采购金额',
            data: inmon
        },   
        ];     
      
   var json = {};   
   json.chart = chart; 
   json.title = title;   
   json.subtitle = subtitle; 
   json.tooltip = tooltip;
   json.xAxis = xAxis;
   json.yAxis = yAxis;  
   json.series = series;
   json.plotOptions = plotOptions;  
   json.credits = credits;
   $('#container').highcharts(json);
  
};
</script>
</body>
</html>