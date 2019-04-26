<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
    <title>My JSP 'index.jsp' starting page</title>
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
</head>

<body style="background-color: #ececec;">
    
	
		  
            <div id="page-inner">
  

			<center>
			<!-- <img src="backStage/tlz/image/logo2.jpg" height="100px;" width="400px;"/></font><br/> -->
			</center>
                <div class="row">
                    <div class="col-xs-12 col-sm-6 col-md-3">
					
						<div class="card horizontal cardIcon waves-effect waves-dark">
						<div class="card-image red">
						<i class="fa fa-eye fa-5x"></i>
						</div>
						<div class="card-stacked">
						<div class="card-content">
						<h3 id="t1">0</h3> 
						</div>
						<div class="card-action">
						<strong>退货待审核</strong>
						</div>
						</div>
						</div>
	 
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-3">
					
						<div class="card horizontal cardIcon waves-effect waves-dark">
						<div class="card-image orange">
						<i class="fa fa-shopping-cart fa-5x"></i>
						</div>
						<div class="card-stacked">
						<div class="card-content">
						<h3 id="t2">0</h3> 
						</div>
						<div class="card-action">
						<strong>采购待审核</strong>
						</div>
						</div>
						</div> 
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-3">
					
							<div class="card horizontal cardIcon waves-effect waves-dark">
						<div class="card-image blue">
						<i class="fa fa-comments fa-5x"></i>
						</div>
						<div class="card-stacked">
						<div class="card-content">
						<h3 id="t3">0</h3> 
						</div>
						<div class="card-action">
						<strong>补货待审核</strong>
						</div>
						</div>
						</div> 
						 
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-3">
					
					<div class="card horizontal cardIcon waves-effect waves-dark">
						<div class="card-image">
						<i class="fa fa-users fa-5x"></i>
						</div>
						<div class="card-stacked">
						<div class="card-content">
						<h3 id="t4">0</h3> 
						</div>
						<div class="card-action">
						<strong>上下架待审核</strong>
						</div>
						</div>
						</div> 
						 
                    </div>
                </div>
			
                <!-- /. ROW  --> 
		<div class="row">
			<div class="col-xs-12 col-sm-6 col-md-3"> 
					<div class="card-panel text-center">
						<h4>当天总收益</h4>
						<div class="easypiechart" id="easypiechart-blue" data-percent="0" ><span class="percent" id="t5">0</span>
						</div> 
					</div>
			</div>
			<div class="col-xs-12 col-sm-6 col-md-3"> 
					<div class="card-panel text-center">
						<h4>当天总订单</h4>
						<div class="easypiechart" id="easypiechart-red" data-percent="0" ><span class="percent" id="t6">0</span>
						</div>
					</div>
			</div>
			<div class="col-xs-12 col-sm-6 col-md-3"> 
					<div class="card-panel text-center">
						<h4>当天采采购订单 </h4>
						<div class="easypiechart" id="easypiechart-teal" data-percent="0" ><span class="percent" id="t7">0</span>
						</div> 
					</div>
			</div>
			<div class="col-xs-12 col-sm-6 col-md-3"> 
					<div class="card-panel text-center">
						<h4>当天入库订单</h4>
						<div class="easypiechart" id="easypiechart-orange" data-percent="0" ><span class="percent" id="t8">0</span>
						</div>
					</div>
			</div> 
		</div><!--/.row-->
			
		
				

			 
	
				<div class="row">
				<div class="col-md-12">
				
					</div>		
				</div> 	
                <!-- /. ROW  -->

	   
				
				
				
                <div class="row">
                    <div class="col-md-4 col-sm-12 col-xs-12">
						<div class="card"><div class="card-action">
					  <b>主要部门</b>
					</div>
					<div class="card-image">
					  <div class="collection" id="asd" style="height:400px; overflow:auto">
					
						</div>
					</div> 
					
					</div>	  

                    </div>
                    <div class="col-md-8 col-sm-12 col-xs-12">
	<div class="card">
	<div class="card-action">
					  <b>员工列表</b>
					</div>
					<div class="card-image">
					  <ol class="collection" id="yyg" style="height:400px; overflow:auto">
    
  </ol>
					 </div>  
					</div>	 
					
                       

                    </div>
                </div>
                <!-- /. ROW  -->
	
		
            </div>
            <!-- /. PAGE INNER  -->
        </div>
        <!-- /. PAGE WRAPPER  -->
    </div>
   <!-- /. WRAPPER  -->
    <!-- JS Scripts-->
    <!-- jQuery Js -->
    <script src="backStage/assets/js/jquery-1.10.2.js"></script>
	
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
	
    <!-- Custom Js -->
 

</body>

</html>
<script>
$(function() {
       $.ajax({
           url:"dzy.action",
           type:"post",
            dataType:"json",
           
            success:function(data){
         
          $("#t5").html(data[0].m+"元")
            }
            })
/* 
	   $.ajax({
           url:"ztd.action",
           type:"post",
            dataType:"json",
           
            success:function(data){
          $("#t1").html(data[0].t+"单")
            }
            })
        

               $.ajax({
           url:"zbu.action",
           type:"post",
            dataType:"json",
           
            success:function(data){
         
          $("#t2").html(data[0].b+"单")
            }
            })
               $.ajax({
           url:"zcd.action",
           type:"post",
            dataType:"json",
           
            success:function(data){
     
          $("#t3").html(data[0].s+"单")
            }
            })
               $.ajax({
           url:"zsy.action",
           type:"post",
            dataType:"json",
           
            success:function(data){
        
          $("#t4").html(data[0].u+"单")
            }
            })
        
               $.ajax({
           url:"dzd.action",
           type:"post",
            dataType:"json",
           
            success:function(data){
    
          $("#t6").html(data[0].d+"单")
            }
            })
               $.ajax({
           url:"dcg.action",
           type:"post",
            dataType:"json",
           
            success:function(data){
         
          $("#t7").html(data[0].c+"单")
            }
            })
                     $.ajax({
           url:"drk.action",
           type:"post",
            dataType:"json",
           
            success:function(data){
          
          $("#t8").html(data[0].i+"单")
            }
            }) */
                        $.ajax({
           url:"gdn.action",
           type:"post",
            dataType:"json",
          
            success:function(data){
             var a="";
           for(var i=0;i<data.length;i++){
               var a= "<a href='javascript:void(0)' class='collection-item'>"+data[i].gdName+"<span class='new badge blue'>来源于超市管理处</span></a>"
                $("#asd").append(a);
           }
         
            }
            })
    
                                    $.ajax({
           url:"office.action",
           type:"post",
            dataType:"json",
          
            success:function(data){
             var b="";
           for(var i=0;i<data.length;i++){
               var b= "<li class='collection-item avatar'><i class='material-icons circle green'>insert_chart</i><span class='title'>"+data[i].ocRealName+"</span><p>"+data[i].ocPhone+"<br>"+data[i].ocAddress+"</p><a href='javascript:void(0)' class='secondary-content'><i class='material-icons'>grade</i></a></li>"
              
                $("#yyg").append(b);
           }
         
            }
            })
            
})
  
</script>
<script type="text/javascript">
        //先检验能不能运行起来，能不能连上，自动推送数据，先不做数据显示
        //客户端就会与服务器进行连接
        var webSocket = new WebSocket("ws://localhost:8080/MN_CS/websocketAlert/"+"a");

        //这里只是调试用
        //连接失败时回调
        webSocket.onerror = function (event) {
            makeDataOnWeb("error");
        };

        //这里只是调试用
        //连接成功时回调，真的会执行括号中的代码！
        webSocket.onopen = function (event) {
         //   makeDataOnWeb("conn success");
        };
 webSocket.onmessage = function (event) {
            makeDataOnWeb(event.data);

        };

        //这里只是调试用
        webSocket.onclose = function (event) {
            makeDataOnWeb("conn close");
        };
            window.onbeforeunload = function () {
         websocket.close();
    }
        function makeDataOnWeb(data) {
        //   alert(data);
          $("#t1").html(data+"单")
         

        };
    
    
    
    

    </script>
    <script type="text/javascript">
        //先检验能不能运行起来，能不能连上，自动推送数据，先不做数据显示
        //客户端就会与服务器进行连接
        var webSocket2 = new WebSocket("ws://localhost:8080/MN_CS/websocketAlert/"+"a2");

        //这里只是调试用
        //连接失败时回调
        webSocket2.onerror = function (event) {
            makeDataOnWeb2("error");
        };

        //这里只是调试用
        //连接成功时回调，真的会执行括号中的代码！
        webSocket2.onopen = function (event) {
      //      makeDataOnWeb2("conn success");
        };
 webSocket2.onmessage = function (event) {
            makeDataOnWeb2(event.data);

        };

        //这里只是调试用
        webSocket2.onclose = function (event) {
        webSocket2.close();
            makeDataOnWeb2("conn close");
        };
   window.onbeforeunload = function () {
       websocket2.close();
    }
    
        function makeDataOnWeb2(data) {
            $("#t2").html(data+"单")
          

        };
     
            

    </script>
    <script type="text/javascript">
        //先检验能不能运行起来，能不能连上，自动推送数据，先不做数据显示
        //客户端就会与服务器进行连接
        var webSocket3 = new WebSocket("ws://localhost:8080/MN_CS/websocketAlert/"+"a3");

        //这里只是调试用
        //连接失败时回调
        webSocket3.onerror = function (event) {
            makeDataOnWeb3("error");
        };

        //这里只是调试用
        //连接成功时回调，真的会执行括号中的代码！
        webSocket3.onopen = function (event) {
      //      makeDataOnWeb2("conn success");
        };
 webSocket3.onmessage = function (event) {
            makeDataOnWeb3(event.data);

        };

        //这里只是调试用
        webSocket3.onclose = function (event) {
        webSocket3.close();
            makeDataOnWeb3("conn close");
        };
 window.onbeforeunload = function () {
          websocket3.close();
    }
        function makeDataOnWeb3(data) {
            $("#t3").html(data+"单")
          

        };
  
   
       
    </script>
    <script type="text/javascript">
        //先检验能不能运行起来，能不能连上，自动推送数据，先不做数据显示
        //客户端就会与服务器进行连接
        var webSocket4= new WebSocket("ws://localhost:8080/MN_CS/websocketAlert/"+"a4");

        //这里只是调试用
        //连接失败时回调
        webSocket4.onerror = function (event) {
            makeDataOnWeb4("error");
        };

        //这里只是调试用
        //连接成功时回调，真的会执行括号中的代码！
        webSocket4.onopen = function (event) {
      //      makeDataOnWeb2("conn success");
        };
 webSocket4.onmessage = function (event) {
            makeDataOnWeb4(event.data);

        };

        //这里只是调试用
        webSocket4.onclose = function (event) {
        webSocket4.close();
            makeDataOnWeb4("conn close");
        };
window.onbeforeunload = function () {
          websocket4.close();
    }

        function makeDataOnWeb4(data) {
            $("#t4").html(data+"单")
          

        };   
    </script>
    
    <script type="text/javascript">
        //先检验能不能运行起来，能不能连上，自动推送数据，先不做数据显示
        //客户端就会与服务器进行连接
        var webSocket5 = new WebSocket("ws://localhost:8080/MN_CS/websocketAlert/"+"a5");

        //这里只是调试用
        //连接失败时回调
        webSocket5.onerror = function (event) {
            makeDataOnWeb5("error");
        };

        //这里只是调试用
        //连接成功时回调，真的会执行括号中的代码！
        webSocket5.onopen = function (event) {
      //      makeDataOnWeb2("conn success");
        };
 webSocket5.onmessage = function (event) {
            makeDataOnWeb5(event.data);

        };

        //这里只是调试用
        webSocket5.onclose = function (event) {
        webSocket5.close();
            makeDataOnWeb5("conn close");
        };
        window.onbeforeunload = function () {
          websocket5.close();
    }

        function makeDataOnWeb5(data) {
            $("#t5").html(data+"元")
          

        };   

    </script>
    
    <script type="text/javascript">
        //先检验能不能运行起来，能不能连上，自动推送数据，先不做数据显示
        //客户端就会与服务器进行连接
        var webSocket6 = new WebSocket("ws://localhost:8080/MN_CS/websocketAlert/"+"a6");

        //这里只是调试用
        //连接失败时回调
        webSocket6.onerror = function (event) {
            makeDataOnWeb2("error");
        };

        //这里只是调试用
        //连接成功时回调，真的会执行括号中的代码！
        webSocket6.onopen = function (event) {
      //      makeDataOnWeb2("conn success");
        };
 webSocket6.onmessage = function (event) {
            makeDataOnWeb6(event.data);

        };

        //这里只是调试用
        webSocket6.onclose = function (event) {
        webSocket6.close();
            makeDataOnWeb6("conn close");
        };
  window.onbeforeunload = function () {
          websocket6.close();
    }

        function makeDataOnWeb6(data) {
            $("#t6").html(data+"单")
          

        }; 
    </script>
    
    <script type="text/javascript">
        //先检验能不能运行起来，能不能连上，自动推送数据，先不做数据显示
        //客户端就会与服务器进行连接
        var webSocket7 = new WebSocket("ws://localhost:8080/MN_CS/websocketAlert/"+"a7");

        //这里只是调试用
        //连接失败时回调
        webSocket7.onerror = function (event) {
            makeDataOnWeb7("error");
        };

        //这里只是调试用
        //连接成功时回调，真的会执行括号中的代码！
        webSocket7.onopen = function (event) {
      //      makeDataOnWeb2("conn success");
        };
 webSocket7.onmessage = function (event) {
            makeDataOnWeb7(event.data);

        };

        //这里只是调试用
        webSocket7.onclose = function (event) {
        webSocket7.close();
            makeDataOnWeb7("conn close");
        };
 window.onbeforeunload = function () {
          websocket7.close();
    }

        function makeDataOnWeb7(data) {
            $("#t7").html(data+"单")
          

        };  
    </script>
    
    <script type="text/javascript">
        //先检验能不能运行起来，能不能连上，自动推送数据，先不做数据显示
        //客户端就会与服务器进行连接
        var webSocket8 = new WebSocket("ws://localhost:8080/MN_CS/websocketAlert/"+"a8");

        //这里只是调试用
        //连接失败时回调
        webSocket8.onerror = function (event) {
            makeDataOnWeb8("error");
        };

        //这里只是调试用
        //连接成功时回调，真的会执行括号中的代码！
        webSocket8.onopen = function (event) {
      //      makeDataOnWeb2("conn success");
        };
 webSocket8.onmessage = function (event) {
            makeDataOnWeb8(event.data);

        };

        //这里只是调试用
        webSocket8.onclose = function (event) {
        webSocket8.close();
            makeDataOnWeb8("conn close");
        };
     window.onbeforeunload = function () {
          websocket8.close();
    }
        function makeDataOnWeb8(data) {
            $("#t8").html(data+"单")
          

        };  
    

    </script>
    
    
