<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'goodsShelf.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
		<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link rel="stylesheet" href="backStage/assets/materialize/css/materialize.min.css" media="screen,projection" />
    <!-- Bootstrap Styles-->
    <link href="backStage/assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FontAwesome Styles-->
    <link href="backStage/assets/css/font-awesome.css" rel="stylesheet" />
    <!-- Morris Chart Styles-->
    <link href="backStage/assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
    <!-- Custom Styles-->
    <link href="backStage/assets/css/custom-styles.css" rel="stylesheet" />
    <!-- Google Fonts-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <link rel="stylesheet" href="backStage/assets/js/Lightweight-Chart/cssCharts.css"> 
    <style type="text/css">
    .dataTables_length label{
    font-size: 19px;
    font-weight: normal;
    }
    .dataTables_filter label{
    font-size: 19px;
      font-weight: normal;
        margin-bottom: -55px;
    } 
    .table table-striped table-bordered table-hover dataTable no-footer{
    margin-top: 10px;
    }
    .dataTables_info{
    font-size: 18px;
      font-weight: normal;
      color: gray;
      margin-top:22px; 
    }
    .pagination li a{
     font-size: 15px;
      font-weight: normal;
      color: gray;
    }
     .dataTables_length label{
    font-size: 17px;
    font-weight: normal;
    }
    .dataTables_filter label{
    font-size: 18px;
      font-weight: normal;
    } 
    .table table-striped table-bordered table-hover dataTable no-footer{
    margin-top: 10px;
    }
    #trd th{
     text-align:center;
    }
    #mytab tr td{
    text-align:center;
    }
    form{
     white-space:nowrap;
    }
    #seo{
     position: relative;
  	 left: 75px;
  	 top: -30px;
    }
    </style>
<script type="text/javascript" src="backStage/assets/lks/js/sha1.js"></script></head>
<body style="background-color: #ececec;">
  <div class="alert alert-warning" style="display: none;" id="alert">
   <a href="#" class="close" data-dismiss="alert">
      &times;   </a>
   <strong>警告！</strong>请先对账再提交。</div>
        
            <div id="page-inner"> 
        
           
                 
                
                <!--  -->
                    <!-- Advanced Tables -->
                    <div class="card">
                     <div class="card-action">
           <button class='btn btn-primary btn-lg' onclick="add()">提交对账单</button>
         </div>
                        <div class="card-content">
                            <div class="table-responsive" style="overflow:-Scroll;overflow-x:hidden">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr class="success" id="trd">
                                        	<th>日期</th>
                                            <th>收银方式</th>
                                            <th>收银金额（元）</th>
                                            <th>实际金额（元）</th>
                                            <th>状态（元）</th>
                                        </tr>
                                    </thead>
                                    <tbody id="mytab">
                                        
                                    </tbody>
                                </table>
                            </div>
                            
                        
                    <!--End Advanced Tables -->
                </div>
            </div>
                <!-- /. ROW  -->
          
            
               
  </div>                                  
                  
         
           
 

    <!-- jQuery Js -->
    <script src="backStage/assets/js/jquery-1.10.2.js"></script>
	 <script>
	 $(function(){
	  aaa();
	 })
	 //查询会员
	 
   function aaa(){
   			$.ajax({
   			 url:"queryduizhanglks",
             type:"post",
             data:{},
             dataType:"json",
             async:false,
             success:function(data){
   			var  tr="";
      	     for(var i=0;i<data.length;i++){
             tr+="<tr>";
             tr+="<td>"+data[i].sspDate+"</td>";
             tr+="<td>"+data[i].ssPayType+"</td>";
             tr+="<td class='tot'>"+data[i].ssTotal+"</td>";
             tr+="<td><input onblur='jisu()' value='"+data[i].ssTotal+"'/></td>";
             tr+="<td class='zt'></td>";
             tr+="</tr>";
             }
             
      $("#mytab").append(tr);
   //   alert(tr);
   }});};
   
   function jisu(){
   $(".tot").each(function(){
   var a=$(this).text();
   var b=$(this).next().find("input").val();
    $(this).next().next().text(parseFloat((a-b).toFixed(2)));
   })
   }
  function add(){
   if($(".zt").text()!=null&$(".zt").text()!=""){
    $("#alert").css("display","none");
     var jsonArr=new Array();
		    $("#mytab tr").each(function(i){                   // 遍历 tr
			   var dtype=$(this).children('td').eq(1).html();
			   var dyings=$(this).children('td').eq(2).html();
			   var dshis=$(this).children('td').eq(3).find("input").val();
			   var dzt=$(this).children('td').eq(4).html();	   
			   josnStr={"dtype":dtype,"dyings":dyings,"dshis":dshis,"dzt":dzt};
	           jsonArr.push(josnStr); 
			       });
  $.ajax({
     url:"addduizhanglks",
     contentType:"application/json",
     type:"post",
     data:JSON.stringify(jsonArr),
     success:function(data){
     window.location.reload();
     }
    });
   }else{
    $("#alert").css("display","block");
   }
  }
   </script>
	<!-- Bootstrap Js -->
    <script src="backStage/assets/js/bootstrap.min.js"></script>
	
	<script src="backStage/assets/materialize/js/materialize.min.js"></script>
	
    <!-- Metis Menu Js -->
    <script src="backStage/assets/js/jquery.metisMenu.js"></script>
    <!-- Morris Chart Js -->
    <script src="backStage/assets/js/morris/raphael-2.1.0.min.js"></script>
    <script src="backStage/assets/js/morris/morris.js"></script>
	
	
	<script src="backStage/assets/js/easypiechart.js"></script>
	<script src="backStage/assets/js/easypiechart-data.js"></script>
	
	 <script src="backStage/assets/js/Lightweight-Chart/jquery.chart.js"></script>
	 <!-- DATA TABLE SCRIPTS -->
    <script src="backStage/assets/js/dataTables/jquery.dataTables.js"></script>
    <script src="backStage/assets/js/dataTables/dataTables.bootstrap.js"></script>
        <script>
            $(document).ready(function () {
                $('#dataTables-example').dataTable();
            });
            
    </script>
    <!-- Custom Js -->
    <script src="backStage/assets/js/custom-scripts.js"></script> 
 
  
</body>

</html>
