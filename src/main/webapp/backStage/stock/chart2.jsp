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
        position:absolute;
        border-collapse:collapse;
        border:1px solid #cad9ea; 
        color:#666;
         left:240px;
          text-align:center;
          width:1180px;
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
 <div id="container" style="width: 1250px; height: 600px; margin: 50 auto"></div>
 <div id=" " style="width: 1050px; height: 600px; margin: 0 auto">
      <table  id="table_stock_before">
                                    <thead>
                                        <tr>
									   <th style="width: 50px;"> 月份</th>
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
//选项查询
function change(){
   cc();
}
//页面加载
$(document).ready(function () {
  cc();
})  
function cc() {  
var inmon;
var outmon;

       $.ajax({	  
       	type: "post",
      url: "stock/chartsun",	
      data:{year:parseInt($("#year_sel").val())},
	 	async:false,
	success: function (data) {	
			inmon = data;	
			 
					},	
		 error: function () {	
			 alert("请求超时，请重试！");	
		     	}	
		});
       $.ajax({	  
       	type: "post",
      url: "stock/chartpayout",	
       data:{year:parseInt($("#year_sel").val())},
	 	async:false,
	success: function (data) {	
			outmon = data;	
		 
					},	
		 error: function () {	
			 alert("请求超时，请重试！");	
		     	}	
		});
  //金额数组的累加
    var inmon_all=eval(inmon.join("+"))
    var outmon_all=eval(outmon.join("+"))
    //数组填入表格
     $("#tbody_stock_before").html("");     
    var  inmon_td;
     for ( var i in inmon) {
		 
		  inmon_td+= "<td>"+inmon[i]+"</td>";
	}  
		 $("#tbody_stock_before").append("<tr>"+
		                             "<td>损坏金额</td>"+inmon_td+"</tr>")
     var outmon_td;
      for ( var i in inmon) {
		 
		  outmon_td+= "<td>"+outmon[i]+"</td>";
	}  
		 $("#tbody_stock_before").append("<tr>"+
		                             "<td>退货金额</td>"+outmon_td+"</tr>")
   var title = {
      text: '商品退货损坏金额统计'   
   };
   var xAxis = {
      categories: ['一月', '二月', '三月', '四月', '五月', '六月',
         '七月', '八月', '九月', '十月', '十一月', '十二月']
   };
   var labels = {
      items: [{
         html: '退货损坏总额对比',
            style: {
               left: '50px',
               top: '18px',
               color: (Highcharts.theme && Highcharts.theme.textColor) || 'black'
            }
      }]
   };
   var series= [{
        type: 'column',
            name: '损坏',
            data:inmon
        }, {
            type: 'column',
            name: ' ',
            
        }, {
            type: 'column',
            name: '退货',
            data: outmon
        },   {
            type: 'pie',
            name: '总金额',
            data: [{
                name: '损坏',
                y: inmon_all,
                color: Highcharts.getOptions().colors[0] // Jane 的颜色
            }, {
                name: '退货',
                y: outmon_all,
                color: Highcharts.getOptions().colors[2] // John 的颜色
            }],
            center: [100, 80],
            size: 100,
            showInLegend: false,
            dataLabels: {
                enabled: false
            }
      }
   ];     
      
   var json = {};   
   json.title = title;   
   json.xAxis = xAxis;
   json.labels = labels;  
   json.series = series;
   $('#container').highcharts(json);  
};
</script>
</body>
</html>