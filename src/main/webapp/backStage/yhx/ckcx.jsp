<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
<link rel="stylesheet" href="backStage/assets/yhx_css/bootstrap-table.css" type="text/css"></link>
<link rel="stylesheet" href="backStage/assets/yhx_css/bootstrap.min.css" type="text/css"></link>
<link rel="stylesheet" href="backStage/assets/layui/css/layui.css" type="text/css"></link>
<link rel="stylesheet" href="backStage/assets/yhx_css/ckcx.css" type="text/css"></link>
<script type="text/javascript" src="backStage/assets/yhx_js/ckcx.js"></script>
<script type="text/javascript" src="backStage/assets/yhx_js/vue.js"></script>
<script type="text/javascript" src="backStage/assets/yhx_js/vue-resource.min.js"></script>
</head>
<body style="background-color: #ececec;padding:20px;">
<div style="background-color: #fff;padding: 20px;height: 770px;">
  <div class="alert alert-danger" id="alert1">此仓库下面还有商品，不可以删除哦！</div>
  <div id="title">
<ul class="breadcrumb">
<h3  style="color:#999999;">&nbsp;&nbsp;仓库查询</h3>
</ul>
</div>
  <div id="box">
 <!-- 模态框 1（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header" id="top">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					添加仓库
				</h4>
			</div>
			<div class="modal-body">
			<div class="alert alert-danger" id="alert2">您提交的信息格式有误!</div>
			<div class="alert alert-danger" id="alert4">您这个仓库名已经存在，为了便于区分，请重新取名!</div>
				<table id="addWh">
			<center>
			<form id="myForm" method="post">
				   <tr>
				      <td>仓库名称：</td>
				      <td><input type="text" name="map['whName']" id="whName" placeholder="输入汉字，数字，不可有特殊符号"></td>
				   </tr>
				   <tr>
				      <td>仓库地址：</td>
				      <td><input type="text" name="map['whAddress']" id="whAddress" placeholder="不可为空"></td>
				   </tr>
				   <tr>
				      <td>仓库电话：</td>
				      <td><input type="text" name="map['whphone']" id="whphone" placeholder="国内座机电话格式"></td>
				   </tr>
				   <tr>
				       <td>仓库负责人：</td>
				      <td><input type="text" readonly="readonly" style="width:192px;" id="ocRealName" placeholder="不可为空"><input type="text"  style="display:none" id="ocId" name="map['ocId']"><button class="layui-btn" data-toggle="modal" data-target="#myModalTwo" id="su"  onclick="selectUser()">选择负责人</button></td>
				   </tr>
				</table>
				</form>
				</center>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal" onclick="closeTwo()">关闭
				</button>
				<button type="button" class="layui-btn"  onclick="add()" id="save"> 
					确定保存
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
<!-- 模态框（Modal）二 -->
<div class="modal fade" id="myModalTwo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header" id="topTwo">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabelTwo">
					选择负责人
				</h4>
			</div>
			<div class="modal-body">
			<!-- 选择负责人 -->
			<input type="text" style="width:192px;height:35px" id="keyWord" placeholder="根据姓名或电话或性别搜索"><button style="height:35px;position:relative;top:-2px;"  class="layui-btn" id="getUserByKey">查询</button>
				<table class="layui-hide" id="test"></table>

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal" onclick="close()">关闭
				</button>
				<button type="button"  class="layui-btn" id="sure">
					确认选择
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
<!-- 模态框（Modal）三 -->
<div class="modal fade" id="myModalThree" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header" id="topThree">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabelThree">
					修改仓库信息
				</h4>
			</div>
			<div class="modal-body">
			<div class="alert alert-danger" id="alert3">您提交的信息格式有误!</div>
			<div class="alert alert-danger" id="alert5">您这个仓库名已经存在，为了便于区分，请重新取名!</div>
			<center>
			<form id="myFormTwo" method="post">
				<table id="addWh">
				 <tr>
				      <td>仓库编号：</td>
				      <td><input type="text" name="map['whId']" id="whId" readonly="readonly"></td>
				   </tr>
				      <tr>
				      <td>仓库负责人：</td>
				      <td><input type="text" readonly="readonly" style="width:192px;" id="ocName"><input type="text"  style="display:none" id="ocIdTwo" name="map['ocId']"><button class="layui-btn" data-toggle="modal" data-target="#myModalTwo" id="su"  onclick="selectUser()">选择负责人</button></td>
				   </tr>
				   <tr>
				      <td>仓库名称：</td>
				      <td><input type="text" name="map['whName']" id="ckmc"></td>
				   </tr>
				
				   <tr>
				      <td>仓库电话：</td>
				      <td><input type="text" name="map['whphone']" id="ckdh"></td>
				   </tr>
				   <tr>
				      <td>仓库地址：</td>
				      <td><input type="text" name="map['whAddress']" id="ckdz"></td>
				   </tr>
				</table>
				</form>
				</center>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal" onclick="closeTwo()">关闭
				</button>
				<button type="button" class="layui-btn"  onclick="update()" id="upda">
					确认更新
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
<!-- 表格数据 -->
<div id="serch">
<input type="text" id="ipt" placeholder="根据仓库名字或者地址检索"  onkeyup="serch()">
 <button class="layui-btn" id="addButton" data-toggle="modal" data-target="#myModal">+ 添加仓库</button>
</div>
	<table class="layui-hide" id="myTab"></table>
	<div id="fenye"></div>
	<script type="text/html" id="barDemo">
<button onclick="cli(this)"  class="layui-btn" data-toggle="modal" data-target="#myModalThree">修改</button>
<button class="layui-btn layui-btn-danger"  onclick="del(this)" >删除</button>
</script>
  </div>
  </div>
  </body>
</html>

