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

<body>
    <div id="wrapper">
        <nav class="navbar navbar-default top-navbar" role="navigation">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle waves-effect waves-dark" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand waves-effect waves-dark" href="index.jsp"><i class="large material-icons">insert_chart</i> <strong>TRACK</strong></a>
				
		<div id="sideNav" href=""><i class="material-icons dp48">toc</i></div>
            </div>

            <ul class="nav navbar-top-links navbar-right"> 
				<li><a class="dropdown-button waves-effect waves-dark" href="#!" data-activates="dropdown4"><i class="fa fa-envelope fa-fw"></i> <i class="material-icons right">arrow_drop_down</i></a></li>				
				<li><a class="dropdown-button waves-effect waves-dark" href="#!" data-activates="dropdown3"><i class="fa fa-tasks fa-fw"></i> <i class="material-icons right">arrow_drop_down</i></a></li>
				<li><a class="dropdown-button waves-effect waves-dark" href="#!" data-activates="dropdown2"><i class="fa fa-bell fa-fw"></i> <i class="material-icons right">arrow_drop_down</i></a></li>
				  <li><a class="dropdown-button waves-effect waves-dark" href="#!" data-activates="dropdown1"><i class="fa fa-user fa-fw"></i> <b>John Doe</b> <i class="material-icons right">arrow_drop_down</i></a></li>
            </ul>
        </nav>
		<!-- Dropdown Structure -->
<ul id="dropdown1" class="dropdown-content">
<li><a href="#"><i class="fa fa-user fa-fw"></i> My Profile</a>
</li>
<li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
</li> 
<li><a href="#"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
</li>
</ul>
<ul id="dropdown2" class="dropdown-content w250">
  <li>
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
                        </li>
</ul>
<ul id="dropdown3" class="dropdown-content dropdown-tasks w250">
<li>
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
	<li>
</ul>   
<ul id="dropdown4" class="dropdown-content dropdown-tasks w250">
  <li>
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
                        </li>
</ul>  
	   <!--/. NAV TOP  -->
        <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">

                    <li>
                        <a class="active-menu waves-effect waves-dark" href="index.jsp"><i class="fa fa-dashboard"></i>仪表板</a>
                    </li>
                    <li>
                        <a href="ui-elements.jsp" class="waves-effect waves-dark"><i class="fa fa-desktop"></i>进度条</a>
                    </li>
					<li>
                        <a href="chart.jsp" class="waves-effect waves-dark"><i class="fa fa-bar-chart-o"></i> 图表</a>
                    </li>
                    <li>
                        <a href="tab-panel.jsp" class="waves-effect waves-dark"><i class="fa fa-qrcode"></i> 标签和面板</a>
                    </li>
                    
                    <li>
                        <a href="table.jsp" class="waves-effect waves-dark"><i class="fa fa-table"></i>响应表</a>
                    </li>
                    <li>
                        <a href="form.jsp" class="waves-effect waves-dark"><i class="fa fa-edit"></i>形式 </a>
                    </li>


                    <li>
                        <a href="#" class="waves-effect waves-dark"><i class="fa fa-sitemap"></i> 多级下拉<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="#">二级链接</a>
                            </li>
                            <li>
                                <a href="#">二级链接</a>
                            </li>
                            <li>
                                <a href="#">二级链接<span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level">
                                    <li>
                                        <a href="#">三级链接</a>
                                    </li>
                                    <li>
                                        <a href="#">三级链接</a>
                                    </li>
                                    <li>
                                        <a href="#">三级链接</a>
                                    </li>

                                </ul>

                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="empty.jsp" class="waves-effect waves-dark"><i class="fa fa-fw fa-file"></i> 空白</a>
                    </li>
                </ul>

            </div>

        </nav>
        <!-- /. NAV SIDE  -->
      
		<div id="page-wrapper">
		  <div class="header"> 
                        <h1 class="page-header">
                            仪表板
                        </h1>
						<ol class="breadcrumb">
					  <li><a href="#">Home</a></li>
					  <li><a href="#">Dashboard</a></li>
					  <li class="active">Data</li>
					</ol> 
									
		</div>
            <div id="page-inner">

			
                <div class="row">
                    <div class="col-xs-12 col-sm-6 col-md-3">
					
						<div class="card horizontal cardIcon waves-effect waves-dark">
						<div class="card-image red">
						<i class="fa fa-eye fa-5x"></i>
						</div>
						<div class="card-stacked">
						<div class="card-content">
						<h3>16,150</h3> 
						</div>
						<div class="card-action">
						<strong> Daily Visits</strong>
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
						<h3>25,550</h3> 
						</div>
						<div class="card-action">
						<strong> Sales</strong>
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
						<h3>11,225</h3> 
						</div>
						<div class="card-action">
						<strong> Comments</strong>
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
						<h3>72,525</h3> 
						</div>
						<div class="card-action">
						<strong> No. of Visits</strong>
						</div>
						</div>
						</div> 
						 
                    </div>
                </div>
			
                <!-- /. ROW  --> 
		<div class="row">
			<div class="col-xs-12 col-sm-6 col-md-3"> 
					<div class="card-panel text-center">
						<h4>Profit</h4>
						<div class="easypiechart" id="easypiechart-blue" data-percent="82" ><span class="percent">82%</span>
						</div> 
					</div>
			</div>
			<div class="col-xs-12 col-sm-6 col-md-3"> 
					<div class="card-panel text-center">
						<h4>No. of Visits</h4>
						<div class="easypiechart" id="easypiechart-red" data-percent="46" ><span class="percent">46%</span>
						</div>
					</div>
			</div>
			<div class="col-xs-12 col-sm-6 col-md-3"> 
					<div class="card-panel text-center">
						<h4>Customers</h4>
						<div class="easypiechart" id="easypiechart-teal" data-percent="84" ><span class="percent">84%</span>
						</div> 
					</div>
			</div>
			<div class="col-xs-12 col-sm-6 col-md-3"> 
					<div class="card-panel text-center">
						<h4>Sales</h4>
						<div class="easypiechart" id="easypiechart-orange" data-percent="55" ><span class="percent">55%</span>
						</div>
					</div>
			</div> 
		</div><!--/.row-->
			
		
				
				<div class="row">
				<div class="col-md-5"> 
						<div class="card">
						<div class="card-image">
						 <div id="morris-line-chart"></div>
						</div> 
						<div class="card-action">
						  <b>折线图</b>
						</div>
						</div>
		  
					</div>		
					
						<div class="col-md-7"> 
					<div class="card">
					<div class="card-image">
					  <div id="morris-bar-chart"></div>
					</div> 
					<div class="card-action">
					  <b>条形统计图</b>
					</div>
					</div>					
					</div>
					
				</div> 
			 
				
				
                <div class="row">
                    <div class="col-md-9 col-sm-12 col-xs-12">
						<div class="card">
					<div class="card-image">
					  <div id="morris-area-chart"></div>
					</div> 
					<div class="card-action">
					  <b>A面积图</b>
					</div>
					</div>	 
                    </div>
                    <div class="col-md-3 col-sm-12 col-xs-12">
						<div class="card">
					<div class="card-image">
					  <div id="morris-donut-chart"></div>
					</div> 
					<div class="card-action">
					  <b>圆形图</b>
					</div>
					</div>	 
                    </div>

                </div>
				<div class="row">
				<div class="col-md-12">
				
					</div>		
				</div> 	
                <!-- /. ROW  -->

	   
				
				
				
                <div class="row">
                    <div class="col-md-4 col-sm-12 col-xs-12">
						<div class="card"><div class="card-action">
					  <b>任务面板</b>
					</div>
					<div class="card-image">
					  <div class="collection">
						  <a href="#!" class="collection-item">Red<span class="new badge red" data-badge-caption="red">4</span></a>
						  <a href="#!" class="collection-item">Blue<span class="new badge blue" data-badge-caption="blue">4</span></a>
						  <a href="#!" class="collection-item"><span class="badge">1</span>Alan</a>
							<a href="#!" class="collection-item"><span class="new badge">4</span>Alan</a>
							<a href="#!" class="collection-item">Alan<span class="new badge blue" data-badge-caption="blue">4</span></a>
							<a href="#!" class="collection-item"><span class="badge">14</span>Alan</a>
							   <a href="#!" class="collection-item">Custom Badge Captions<span class="new badge" data-badge-caption="custom caption">4</span></a>
							<a href="#!" class="collection-item">Custom Badge Captions<span class="badge" data-badge-caption="custom caption">4</span></a>
						</div>
					</div> 
					
					</div>	  

                    </div>
                    <div class="col-md-8 col-sm-12 col-xs-12">
	<div class="card">
	<div class="card-action">
					  <b>用户列表</b>
					</div>
					<div class="card-image">
					  <ul class="collection">
    <li class="collection-item avatar">
      <i class="material-icons circle green">insert_chart</i>
      <span class="title">Title</span>
      <p>First Line <br>
         Second Line
      </p>
      <a href="#!" class="secondary-content"><i class="material-icons">grade</i></a>
    </li>
    <li class="collection-item avatar">
      <i class="material-icons circle">folder</i>
      <span class="title">Title</span>
      <p>First Line <br>
         Second Line
      </p>
      <a href="#!" class="secondary-content"><i class="material-icons">grade</i></a>
    </li>
    <li class="collection-item avatar">
      <i class="material-icons circle green">insert_chart</i>
      <span class="title">Title</span>
      <p>First Line <br>
         Second Line
      </p>
      <a href="#!" class="secondary-content"><i class="material-icons">grade</i></a>
    </li>
    <li class="collection-item avatar">
      <i class="material-icons circle red">play_arrow</i>
      <span class="title">Title</span>
      <p>First Line <br>
         Second Line
      </p>
      <a href="#!" class="secondary-content"><i class="material-icons">grade</i></a>
    </li>
  </ul>
					 </div>  
					</div>	 
					
                       

                    </div>
                </div>
                <!-- /. ROW  -->
			   <div class="fixed-action-btn horizontal click-to-toggle">
    <a class="btn-floating btn-large red">
      <i class="material-icons">menu</i>
    </a>
    <ul>
      <li><a class="btn-floating red"><i class="material-icons">insert_chart</i></a></li>
      <li><a class="btn-floating yellow darken-1"><i class="material-icons">format_quote</i></a></li>
      <li><a class="btn-floating green"><i class="material-icons">publish</i></a></li>
      <li><a class="btn-floating blue"><i class="material-icons">attach_file</i></a></li>
    </ul>
  </div>
		
				<footer><p>Copyright &copy; 2016.Company name All rights reserved.<a target="_blank" href="http://www.17sucai.com/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a></p>
				
        
				</footer>
            </div>
            <!-- /. PAGE INNER  -->
        </div>
        <!-- /. PAGE WRAPPER  -->
    </div>
   <!-- /. WRAPPER  -->
    <!-- JS Scripts-->
    <!-- jQuery Js -->
    <script>
    
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
	alert(1);    
	}  
    </script>
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
    <script src="backStage/assets/js/custom-scripts.js"></script> 

</body>

</html>