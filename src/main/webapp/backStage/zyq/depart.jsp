<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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

<title>My JSP '部门查询.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet"
	href="backStage/assets/materialize/css/materialize.min.css"
	media="screen,projection" />
<!-- Bootstrap Styles-->
<link href="backStage/assets/css/bootstrap.css" rel="stylesheet" />
<!-- FontAwesome Styles-->
<link href="backStage/assets/css/font-awesome.css" rel="stylesheet" />
<!-- Morris Chart Styles-->
<link href="backStage/assets/js/morris/morris-0.4.3.min.css"
	rel="stylesheet" />
<!-- Custom Styles-->
<link href="backStage/assets/css/custom-styles.css" rel="stylesheet" />
<!-- Google Fonts-->
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
<link rel="stylesheet"
	href="backStage/assets/js/Lightweight-Chart/cssCharts.css">
<link rel="stylesheet" href="backStage/assets/yhx_css/bootstrap.min.css"
	type="text/css"></link>
<!-- <link rel="stylesheet" href="validator/bootstrap.css" type="text/css"></link>
<script type="text/javascript" src="validator/bootstrapValidator.js"></script>
<script type="text/javascript" src="validator/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="validator/bootstrap.min.js"></script>
<script type="text/javascript" src="validator/bootstrapValidator.js"></script> -->

<script type="text/javascript"
	src="backStage/zyq/js/jquery-1.8.3.min.js"></script>

<style type="text/css">
.dataTables_length label {
	font-size: 19px;
	font-weight: normal;
}

.dataTables_filter label {
	font-size: 19px;
	font-weight: normal;
	margin-bottom: -55px;
}

.table table-striped table-bordered table-hover dataTable no-footer {
	margin-top: 10px;
}

.dataTables_info {
	font-size: 18px;
	font-weight: normal;
	color: gray;
	margin-top: 22px;
}

.pagination li a {
	font-size: 15px;
	font-weight: normal;
	color: gray;
}

.dataTables_length label {
	font-size: 17px;
	font-weight: normal;
}

.dataTables_filter label {
	font-size: 18px;
	font-weight: normal;
}

.table table-striped table-bordered table-hover dataTable no-footer {
	margin-top: 10px;
}

#trd th {
	text-align: center;
}

#mytab tr td {
	text-align: center;
}

form {
	white-space: nowrap;
}

/*add width*/
#myModal {
	width:40%;
	height:280px;
	margin-top:120px;
}

/**add message*/
#title {
	margin-top: -15px;
	margin-left: -40px;
}
/**update message*/
#titless {
	margin-top: -15px;
	margin-left: -40px;
}
/**add bgcolor*/
.breadcrumb {
	background-color: #337ab7;
	width: 1500px;
	height: 50px;
	line-height: 25px;
}


.btn {
	height: 30px;
}

#addsp{
margin-left:10px;
}

#bmcx{
font-size:20px;
}
</style>
</head>
<body style="background-color:ececec;">

	<div id="page-inner">

		<div class="row">
			<div class="col-md-12">
				<!--  -->
				<!-- Advanced Tables -->
				<div class="card">
					<div class="card-action">
						<br />

						<h3><span id="bmcx">部门查询</span></h3>
						<br /> <br /> <br />
					</div>
					<div class="card-content">
						<div class="table-responsive">
							<table class="table table-striped table-bordered table-hover"
								id="dataTables-example">
								<thead>
									<tr class="success" id="trd" style="color:gray;">
										<th>部门编码</th>
										<th>部门名称</th>
										<th>操作&nbsp;&nbsp;(&nbsp;&nbsp;<button class='btn btn-primary btn-lg' data-toggle='modal'	data-target='#myModal' id='addDept' style='background:#337ab7;color:#fff;border:1px solid #337ab7;'>添加</button>&nbsp;&nbsp;)</th>
									</tr>
								</thead>
								<tbody id="mytab">

								</tbody>
							</table>
						</div>

					</div>
				</div>
				<!--End Advanced Tables -->
			</div>
		</div>
		<!-- /. ROW  -->

		<!-- 添加部门信息 -->
		<div class="modal  fade" id="myModal">
			<!--   <div id="responsive_oldgoods" class="modal hide fade"  -->

			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>


	          <div id="title">
 					<ul class="breadcrumb">
						<h4 style="color:white;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;添加部门信息</h4>
					</ul>
				</div>
			</div>
			<div class="modal-body" style="padding-left: 100px;">
				<div class="row">
					<div class="col s2">
						<form action="SpinfoOrder/addDept" method="post" onsubmit="return check()">
							<div class="form-group">
								<div class="col-sm-10">
									部门编码：<input type="text" id="dpId" name="map['dpId']"
										style="width:200px;height:30px;" placeholder="请输入部门编码" /><span id="v_dpId"></span>
								</div>
							</div>


							<div class="form-group">
								<div class="col-sm-10">
									部门名称：<input type="text" id="dpName"
										name="map['dpName']" style="width:200px;height:30px;"
										placeholder="请输入部门名称" /><span id="v_dpName"></span>
								</div>
							</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" id="guan_btn" class="btn btn-default"
					data-dismiss="modal">关闭</button>
				<button type="submit" class="btn btn-primary" value="提交"
					class="btn btn-primary btn-lg "
					style="width:70px;height:30px;font-family:'微软雅黑';background:#337ab7;color:#fff;border:1px solid #337ab7;">添加</button>
			</div>
			</form>
			<!-- /.modal -->
		</div>



	</div>


	<!-- jQuery Js -->
	<script src="backStage/assets/js/jquery-1.10.2.js"></script>
	<script type="text/javascript">
		$(function() {
			zyq();
		});
		/**查询部门信息*/
		function zyq() {
			$.ajax({
						url : "SpinfoOrder/selectDept",
						type : "post",
						data : {},
						dataType : "json",
						async : false,
						success : function(data) {
							$("#mytab").html("");
							var tr = "";
							for ( var i = 0; i < data.length; i++) {

								tr += "<tr>";
								tr += "<td>" + data[i].dpId + "</td>";
								tr += "<td>" + data[i].dpName + "</td>";							
								tr += "<td><button id='"
										+ data[i].dpId
										+ "' onclick='delDept(this.id)' class='btn btn-primary btn-lg' style='background:#337ab7;color:#fff;border:1px solid #337ab7;'>删除部门</button></td>";
								tr += "</tr>";
							}

							$("#dataTables-example").append(tr);

						}
					});
		};
/** 删除部门信息 */

		function  delDept(dpId) {
			if (confirm("您确定要删除此部门信息吗？")) {
				$.ajax({
					url : "SpinfoOrder/delDept",
					type : "post",
					dataType : "json",
					data : {
						"dpId" : dpId
					},
					success : function(data) {
						zyq();

					}
				});

			} else {
				return false;
			}

		}
		/**验证部门编码*/
		$("#dpId").focus(
  function(){
   $("#v_dpId").html("<font size='2'>部门编号只能为数字！</font>");
}
);
$("#dpId").blur(
  function(){
    var name2=$("#dpId").val();
	var reg = /^[0-9]*$/;
	if(b=reg.test(name2)){

	    $("#v_dpId").html("✔").css("color","green");
		  return true;
	}else{
   
  $("#v_dpId").html("×").css("color","red");
		  return false;
	}
}
);
		
				
		/**验证部门名称*/
  $("#dpName").focus(
    function(){
    $("#v_dpName").html("<font size='1'>部门名称只能为汉字！</font>");
	}
    );
    $("#dpName").blur(
    function(){
     var name=$("#dpName").val();
     var reg = /^[\u4e00-\u9fa5]{0,}$/;
     if(a=reg.test(name)){
       $("#v_dpName").html("✔").css("color","green");
       return true;

	 }else{
       $("#v_dpName").html("×").css("color","red");
		  return false;
	 }
     }
	 );

		/**验证不为空 */
		function check() {
			var dpId = $("#dpId").val();
			var dpName = $("#dpName").val();
			if (dpId==null ||dpId=="" && dpName == null || dpName == "") {
				alert("部门信息不能为空！");
				return false;
			}
			return true;
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
		$(document).ready(function() {
			$('#dataTables-example').dataTable();
		});
	</script>
	<!-- Custom Js -->
	<script src="backStage/assets/js/custom-scripts.js"></script>


</body>

</html>
