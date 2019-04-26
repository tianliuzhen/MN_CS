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
<script type="text/javascript"
	src="backStage/assets/yhx_js/bootstrap-table.js"></script>
<script type="text/javascript"
	src="backStage/assets/yhx_js/bootstrap.min.js"></script>
<script type="text/javascript" src="backStage/assets/layui/layui.all.js"></script>
<script type="text/javascript"
	src="backStage/assets/yhx_js/bootstrap-table-zh-CN.min.js"></script>
<link rel="stylesheet" href="backStage/assets/yhx_css/table.css"
	type="text/css"></link>
<link rel="stylesheet"
	href="backStage/assets/yhx_css/bootstrap-table.css" type="text/css"></link>
<link rel="stylesheet" href="backStage/assets/yhx_css/bootstrap.min.css"
	type="text/css"></link>
<link rel="stylesheet" href="backStage/assets/layui/css/layui.css"
	type="text/css"></link>
<link rel="stylesheet" href="backStage/assets/yhx_css/rkcx.css"
	type="text/css"></link>
<link rel="stylesheet" href="backStage/assets/yhx_css/layui.css"
	type="text/css"></link>
<script type="text/javascript" src="backStage/assets/yhx_js/rkcx.js"></script>
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
<body style="background-color: #ececec;padding:20px">
<div style="background-color: #fff;padding: 20px;">
	<div class="alert alert-danger" id="alert1">您还没有选择开始检索日期哦！</div>
	<div class="alert alert-danger" id="alert2">您选择的开始检索日期不能大于结束检索日期哦！</div>
	<div class="alert alert-danger" id="alert3">您选择的开始检索日期不能大于今天的日期哦！</div>
	<div id="title">
		<ul class="breadcrumb">
			<h3 style="color:#999999;">&nbsp;&nbsp;入库查询</h3>
		</ul>
	</div>
	<div id="zz"></div>
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
					<input type="text" style="width:192px;height:35px" id="keyWord">
					<button style="height:35px;position:relative;top:-4px;"
						class="layui-btn" id="getUserByKey">查询</button>
					<table class="layui-hide" id="test"></table>
				</div>
				<div class="modal-footer" id="vue">
					<button type="button" class="btn btn-default" data-dismiss="modal"
						id="close">关闭</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
	<div id="serch">
		<input type="text" id="ipt" placeholder="根据入库单号或仓库名字或负责人进行搜索" onkeyup="serch()">
		<input type="text" name="date" id="date1" lay-verify="date"
			placeholder="请选择开始检索日期" class="layui-input">-- <input type="text"
			name="date" id="date2" lay-verify="date" placeholder="请选择结束检索日期"
			class="layui-input">
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
<script>
	var laydate = layui.laydate;
	var dateOne = "";
	var dateTwo = "";
	var mydate = new Date(); //当前日期
	var str = "" + mydate.getFullYear() + "-";
	str += (mydate.getMonth() + 1) + "-";
	str += mydate.getDate() + "-";
	var end = new Date(str.replace("-", "/").replace("-", "/"));
	//日期
	laydate.render({
		elem : '#date1',
		done : function(value) {//控件选择完毕后的回调---点击日期、清空、现在、确定均会触发。
			dateOne = value;
		     var start = new Date(dateOne.replace("-", "/").replace("-","/"));
		     var startTwo = new Date(dateTwo.replace("-", "/").replace("-", "/"));
			 if (start > end) {
						$("#alert3").slideDown(1000, function() {
							$(this).slideUp(2000)
						})
					}  else if (start > startTwo) {
						$("#alert2").slideDown(1000, function() {
							$(this).slideUp(2000)
						})
					}
		}
	});
	laydate
			.render({
				elem : '#date2',
				done : function(value) {//控件选择完毕后的回调---点击日期、清空、现在、确定均会触发。
					dateTwo = value; //结束日期
					//	       判断日期大小
					var start = new Date(dateOne.replace("-", "/").replace("-","/"));
					var startTwo = new Date(dateTwo.replace("-", "/").replace("-", "/"));
					if (dateOne == "") {
						$("#alert1").slideDown(1000, function() {
							$(this).slideUp(2000)
						})
					} else if (start > startTwo) {
						$("#alert2").slideDown(1000, function() {
							$(this).slideUp(2000)
						})
					}else{
					  fenye($("#ipt").val(),1,10,dateOne,dateTwo);
					}
				}
			});
</script>