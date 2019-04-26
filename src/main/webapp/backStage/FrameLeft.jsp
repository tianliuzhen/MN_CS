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
  <style type="text/css">
/*   body{
  background-color: #303030;
  }
  .303030{
  background-color: #303030;
  } */
  .nav a{
  color: white;
  }
 a:HOVER {
	color: #2C445A;
	font-weight: 550;
}
start active ul{
  display: none;
}
li:HOVER {
	background-color:;
}
  </style>
</head>

<body>
<div id="wrapper" ></div>
<!-- style="width:264.7px; height:600px; overflow:auto; border:0px solid #000000;" -->
    <div id="wrapper" >
                <ul class="nav" id="main-menu">
 <!--   
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

-->
                  <!--   <li>
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
                    <li>
                        <a href="empty.jsp" class="waves-effect waves-dark"><i class="fa fa-fw fa-file"></i> 空白</a>
                    </li>
                </ul> 

            </div>

      
		
                
			
	
		
				-->
				</ul> 
            </div>
        </div>
   <!-- /. WRAPPER  -->
    <!-- JS Scripts-->
    <!-- jQuery Js -->
    <!-- <div id="asdaa"></div>  -->
    <script src="backStage/assets/js/jquery-1.10.2.js"></script>
	<script>
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
  //alert(data[0].menus.length);
        // <li>
       // <a href="#" class="waves-effect waves-dark"><i class="fa fa-sitemap"></i> 多级下拉<span class="fa arrow"></span></a>
       // <ul class="nav nav-second-level">
  
   ul+="<li  > <a target='mainFrame' href='javascript:void(0)'  class='waves-effect waves-dark'  ><i class='fa fa-bar-chart-o'></i>"+data[k].menuname+"<span class='fa arrow'></span></a><ul  class='nav nav-second-level'  >";
    for(var i=0;i<data[k].menus.length;i++){
  // alert(data[k].menus[i].menuname);
 //alert(data[k].menus[i].url.url);
     ul+="<li   > <a href='"+data[k].menus[i].url.url+"' target='mainFrame' class='waves-effect waves-dark' ><i class='fa fa-qrcode'></i>"+data[k].menus[i].menuname+"</a><span class='fa arrow'></span></li>";
   
    }
       ul+="</ul></li>";
  }
  

  
  $(".nav").append(ul);
  
});
 
  
  
      /*    $(function(){
         var uu="<li>";
             uu+="<a href='#' class='waves-effect waves-dark'><i class='fa fa-sitemap'></i> 多级下拉<span class='fa arrow'></span></a>";
             uu+="<ul class='nav nav-second-level'>";
             uu+="<li><a href='#'>e二级链接</a></li>";
             uu+="</ul>";
             uu+="</li>";
             alert(uu);
             $(".nav").append(uu);
         }) */
           
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
	
    <!-- Custom Js -->
    <script src="backStage/assets/js/custom-scripts.js"></script> 

</body>

</html>
<script>
</script>