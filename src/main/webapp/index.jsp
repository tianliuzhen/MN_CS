<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>超市后台管理系统</title>
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
    *{
    padding: 0px;
    margin: 0px;
    }
    a {
	color: #fff;
   }
    </style>
</head>
<body style="overflow: hidden;">
    <div id="wrapper">
        <nav class="navbar navbar-default top-navbar" role="navigation">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand waves-effect waves-dark" href="index.jsp"><i class="large material-icons">insert_chart</i> <strong>TRACK</strong></a>
		<div id="sideNav" href=""><i class="material-icons dp48">toc</i></div>
            </div>
             <ul class="nav navbar-top-links navbar-right"> 
				<li><a class="dropdown-button waves-effect waves-dark" href="javascript:void(0)" data-activates="dropdown4"><i class="fa fa-envelope fa-fw"></i> <i class="material-icons right">arrow_drop_down</i></a></li>				
				<li><a class="dropdown-button waves-effect waves-dark" href="javascript:void(0)" data-activates="dropdown3"><i class="fa fa-tasks fa-fw"></i> <i class="material-icons right">arrow_drop_down</i></a></li>
				<li><a class="dropdown-button waves-effect waves-dark" href="javascript:void(0)" data-activates="dropdown2"><i class="fa fa-bell fa-fw"></i> <i class="material-icons right">arrow_drop_down</i></a></li>
				
				  <li><a class="dropdown-button waves-effect waves-dark" href="javascript:void(0)"  onclick="aa()" data-activates="dropdown1"><i class="fa fa-user fa-fw"></i> <b>${relaname }</b> <i class="material-icons right">arrow_drop_down</i></a></li>
            </ul>
        </nav>
		<!-- Dropdown Structure -->
<ul id="dropdown1" class="dropdown-content">
<!-- <li><a href="#"><i class="fa fa-user fa-fw"></i> My Profile</a>
</li> -->
<li><a href="backStage/login.jsp"><i class="fa fa-gear fa-fw"></i> 切换</a>
</li> 
 <li><a  href="backStage/cancle.jsp"><i class="fa fa-sign-out fa-fw"></i> 注销</a>
</li>
</ul>
<ul id="dropdown2" class="dropdown-content w250">
 <!--  <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-comment fa-fw"></i> New Comment
                                    <span class="pull-right text-muted small">4 min</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-twitter fa-fw"></i> 3 New Followers
                                    <span class="pull-right text-muted small">12 min</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-envelope fa-fw"></i> Message Sent
                                    <span class="pull-right text-muted small">4 min</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-tasks fa-fw"></i> New Task
                                    <span class="pull-right text-muted small">4 min</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-upload fa-fw"></i> Server Rebooted
                                    <span class="pull-right text-muted small">4 min</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a class="text-center" href="#">
                                <strong>See All Alerts</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li> -->
</ul>
<ul id="dropdown3" class="dropdown-content dropdown-tasks w250">
<!-- <li>
		<a href="#">
			<div>
				<p>
					<strong>Task 1</strong>
					<span class="pull-right text-muted">60% Complete</span>
				</p>
				<div class="progress progress-striped active">
					<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
						<span class="sr-only">60% Complete (success)</span>
					</div>
				</div>
			</div>
		</a>
	</li>
	<li class="divider"></li>
	<li>
		<a href="#">
			<div>
				<p>
					<strong>Task 2</strong>
					<span class="pull-right text-muted">28% Complete</span>
				</p>
				<div class="progress progress-striped active">
					<div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="28" aria-valuemin="0" aria-valuemax="100" style="width: 28%">
						<span class="sr-only">28% Complete</span>
					</div>
				</div>
			</div>
		</a>
	</li>
	<li class="divider"></li>
	<li>
		<a href="#">
			<div>
				<p>
					<strong>Task 3</strong>
					<span class="pull-right text-muted">60% Complete</span>
				</p>
				<div class="progress progress-striped active">
					<div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
						<span class="sr-only">60% Complete (warning)</span>
					</div>
				</div>
			</div>
		</a>
	</li>
	<li class="divider"></li>
	<li>
		<a href="#">
			<div>
				<p>
					<strong>Task 4</strong>
					<span class="pull-right text-muted">85% Complete</span>
				</p>
				<div class="progress progress-striped active">
					<div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="85" aria-valuemin="0" aria-valuemax="100" style="width: 85%">
						<span class="sr-only">85% Complete (danger)</span>
					</div>
				</div>
			</div>
		</a>
	</li>
	<li class="divider"></li>
	<li> -->
</ul>   
<ul id="dropdown4" class="dropdown-content dropdown-tasks w250">
 <!--  <li>
                            <a href="#">
                                <div>
                                    <strong>John Doe</strong>
                                    <span class="pull-right text-muted">
                                        <em>Today</em>
                                    </span>
                                </div>
                                <div>Lorem Ipsum has been the industry's standard dummy text ever since the 1500s...</div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <strong>John Smith</strong>
                                    <span class="pull-right text-muted">
                                        <em>Yesterday</em>
                                    </span>
                                </div>
                                <div>Lorem Ipsum has been the industry's standard dummy text ever since an kwilnw...</div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <strong>John Smith</strong>
                                    <span class="pull-right text-muted">
                                        <em>Yesterday</em>
                                    </span>
                                </div>
                                <div>Lorem Ipsum has been the industry's standard dummy text ever since the...</div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a class="text-center" href="#">
                                <strong>Read All Messages</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li> -->
</ul>  
	   <!--/. NAV TOP  -->
      <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">

                   
               </ul>

            </div>

        </nav>
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper">
			   <iframe id="ifram" style="width: 100%;height: 100%;">
			 
		        </iframe>
             <!-- /. PAGE INNER  -->
            </div>
         <!-- /. PAGE WRAPPER  -->
        </div>
     <!-- /. WRAPPER  -->
    <!-- JS Scripts-->
    <!-- jQuery Js -->
    <script src="backStage/assets/js/jquery-1.10.2.js"></script>
	<script type="text/javascript">
	
	
	
	</script>
	
	<script>
	 $(function(){
     var  ocname='${ocnamefaceId}';
     if(ocname=='000005'){
      $("#ifram").attr("src","backStage/ifarmeIndex.jsp");
      }else if(ocname=='000004'){
      $("#ifram").attr("src","backStage/yhx/ckcx.jsp");
      }else if(ocname=='000003'){
      $("#ifram").attr("src","backStage/zyq/ddcx.jsp");
      }else if(ocname=='000002'){
      $("#ifram").attr("src","backStage/stock/checkstock2.jsp");
      }else if(ocname=='000001'){
      $("#ifram").attr("src","backStage/lks/shouyin.jsp");
      }
	})
     $(function(){
     
     
     var data=null;
     $.ajax({
             url:"getMenuTree",
             type:"post",
             dataType:"json",
             async:false,
             success:function(datas){
            // alert(JSON.stringify(data));
          //  alert(data.length);
             data=datas;
              
            
         
             }
             })
              var ul="";
  for(var k=0;k<data.length;k++){
if(k==0){

   ul+="<li  > <a  href='javascript:void(0)' style='font-size:17px;' class='active-menu waves-effect waves-dark'    ><i class='fa fa-bar-chart-o'></i>"+data[k].menuname+"<span class='fa arrow'></span></a>";
  }else{
    ul+="<li  > <a  href='javascript:void(0)'  style='font-size:17px;'  ><i class='"+data[k].treeStyle+"'></i>"+data[k].menuname+"<span class='fa arrow'></span></a>";
 
  }
  ul+=" <ul  class='nav nav-second-level'  >";
    for(var i=0;i<data[k].menus.length;i++){
    ul+="<li  onclick=test('"+data[k].menus[i].url.url+"') > <a href='javascript:void(0);' style='color:#fff;font-size:17px;'  >"+data[k].menus[i].menuname+"</a></li>";
   
    }
       ul+="</ul></li>";
  }
  

  $("#main-menu").append(ul);
  
});
 
   function  test(url){
 //alert(url);
      $("#ifram").attr("src",url);
 }
        
var timeTask=setInterval(function(){     
	var date=new Date();     
	var h=date.getHours();   
	var m=date.getMinutes();  
	var s=date.getSeconds();  
  
	if(h==12&&m==0&&s==0){          
		
		callFunction();  }
	},1000);   
function callFunction(){  
	
   $.ajax({
             url:"uppdz.action",
             type:"post",
             dataType:"json",
             async:false,
             })    
alert("兄弟！是时候去仓库盘点了！");    
	}           
</script>
	
	<!-- Bootstrap Js -->
    <script src="backStage/assets/js/bootstrap.min.js"></script>
	
	<script src="backStage/assets/materialize/js/materialize.min.js"></script>
	
    <!-- Metis Menu Js -->
		<script src="backStage/assets/js/jquery.metisMenu.js"></script> 
    <!-- Custom Js -->
    <script src="backStage/assets/js/custom-scripts.js"></script> 
	
 

</body>

</html>
