<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	request.setAttribute("path", path);
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>My JSP '订单统计.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript" src="backStage/zyq/js/jquery.js"></script>
<script type="text/javascript" src="backStage/zyq/js/bootstrap-table.js"></script>
<script type="text/javascript" src="backStage/zyq/js/bootstrap.min.js"></script>
<script type="text/javascript" src="backStage/zyq/js/layui.all.js"></script>
<script type="text/javascript"
	src="backStage/zyq/js/bootstrap-table-zh-CN.min.js"></script>
<link rel="stylesheet" href="backStage/zyq/css/table.css"
	type="text/css"></link>
<link rel="stylesheet" href="backStage/zyq/css/bootstrap-table.css"
	type="text/css"></link>
<link rel="stylesheet" href="backStage/zyq/css/bootstrap.min.css"
	type="text/css"></link>
<link rel="stylesheet" href="backStage/zyq/css/layui.css"
	type="text/css"></link>
<link rel="stylesheet" href="backStage/zyq/css/tj.css" type="text/css"></link>
<link rel="stylesheet" href="backStage/zyq/css/layui.css"
	type="text/css"></link>
<script type="text/javascript" src="backStage/zyq/js/tj.js"></script>
<script type="text/javascript" src="backStage/zyq/js/vue.js"></script>
<script type="text/javascript"
	src="backStage/zyq/js/vue-resource.min.js"></script>
<style>
.layui-table th {
	font-size: 17px;
	text-align: center;
}

.layui-table td {
	font-size: 16px;
	text-align: center;
}

.layui-btn {
	text-align: center;
	margin-top: -5px;
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
<body>
<div id="box1">
		<ul id="nav" class="nav nav-tabs"
			style="background:#eeeeee;border-bottom:0px;margin:7 0 0 11;">
			<li class="active"><a href="${path}/backStage/zyq/ddtj.jsp">订单统计</a>
			</li>
		</ul>
	</div>
	<div id="zz"></div><br/>
	
	<div id="serch">
		<input type="text" id="ipt" placeholder="请输入内容" onkeyup="serch()">
	</div>
	<div id="dateBox">
		<input type="date" id="date1" onchange="beginDate(this)"> 
		 <input	type="date" id="date2" onchange="endDate(this)">
	</div><br/>
	<!-- layui表格渲染 -->
	<table class="layui-hide" id="myTab"></table>
	<div id="fenye"></div>
</body>
</html>