<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>My JSP 'ckcx.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript" src="backStage/assets/yhx_js/jquery.js"></script>
<script type="text/javascript" src="backStage/assets/yhx_js/bootstrap-table.js"></script>
<script type="text/javascript" src="backStage/assets/yhx_js/bootstrap.min.js"></script>
<script type="text/javascript" src="backStage/assets/layui/layui.all.js"></script>
<script type="text/javascript" src="backStage/assets/yhx_js/bootstrap-table-zh-CN.min.js"></script>
<link rel="stylesheet" href="backStage/assets/yhx_css/table.css" type="text/css"></link>
<link rel="stylesheet"
	href="backStage/assets/yhx_css/bootstrap-table.css" type="text/css"></link>
<link rel="stylesheet" href="backStage/assets/yhx_css/bootstrap.min.css"
	type="text/css"></link>
<link rel="stylesheet" href="backStage/assets/layui/css/layui.css"
	type="text/css"></link>
<link rel="stylesheet" href="backStage/assets/yhx_css/kccx.css"
	type="text/css"></link>
<script type="text/javascript" src="backStage/assets/yhx_js/kccx.js"></script>
<script type="text/javascript" src="backStage/assets/yhx_js/vue.js"></script>
<script type="text/javascript"
	src="backStage/assets/yhx_js/vue-resource.min.js"></script>
<style>
.layui-table th {
	font-size: 17px;
	text-align: center;
}
.layui-table td {
	font-size: 16px;
	text-align: center;
}
.layui-btn{
  text-align:center;
  margin-top:-5px;
}
#ipt {
	height: 40px;
	width: 450px;
	font-size: 16px;
}

.layui-laypage-limits select {
	width: 90px;
}
</style>
</head>
<body style="background-color: #ececec;padding:20px">
<div style="background-color: #fff;padding: 20px;">
<div id="title">
<ul class="breadcrumb">
<h3  style="color:#999999;">&nbsp;&nbsp;库存查询</h3>
</ul>
</div>
<!-- 模态框（Modal） -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" id="top">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">产品验收</h4>
				</div>
				<div id="content">
			    <input type="text" style="width:192px;height:35px" id="keyWord"><button style="height:35px;position:relative;top:-4px;"  class="layui-btn" id="getUserByKey">查询</button>
<!-- 				<button style="height:35px;position:relative;top:-4px;"  class="layui-btn layui-btn-warm" id="danger">过期预警</button> -->
				<table class="layui-hide" id="test"></table>
				</div>
				<div class="modal-footer" id="vue">
					<button type="button" class="btn btn-default" data-dismiss="modal" id="close">关闭
					</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
	<div id="serch">
		<input type="text" id="ipt" placeholder="根据商品条形码或者商品名称进行检索" onkeyup="serch()">
	</div>
	<div id="dateBox">
	<button style="height:40px;position:relative;top:36px;"  class="layui-btn layui-btn-danger" id="danger">库存预警</button>
	 <!--  <input type="date" id="date1" onchange="dateOne(this)"> -- <input type="date" id="date2"onchange="dateTwo(this)"> -->
	</div> 
	<!-- layui表格渲染 -->
	<table class="layui-hide" id="myTab"></table>
	<div id="fenye"></div>
	<script type="text/html" id="barDemo">
     <button onclick="cli(this)"  class="layui-btn" data-toggle="modal" data-target="#myModal">查看明细</button>
    </script>
    </div>
</body>
</html>