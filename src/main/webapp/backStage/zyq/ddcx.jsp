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

<title>My JSP 订单查询.jsp' starting page</title>

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
<script type="text/javascript"
	src="backStage/zyq/js/jquery-1.8.3.min.js"></script>
<style type="text/css">
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

.breadcrumb {
	background-color: #30ab9d;
	width: 1200px;
	height: 50px;
	line-height: 25px;
}

#myModalx {
	border-radius: 10px;
	width: 60%;
	margin-left: -480px;
	height: 480px;
	margin-top:100px;
}

#title {
	margin-top: -15px;
	margin-left: -15px;
}
.breadcrumbs{
width:100%;
height:60px;
}

</style>
</head>
<body style="background-color: #ececec;">

	<div id="page-inner">

		<div class="row">
			<div class="col-md-12">
				<!--  -->
				<!-- Advanced Tables -->
				<div class="card">
					<div class="card-action">
					<h4>订单查询</h4>
					</div>
					<div class="card-content">
						<div class="table-responsive">
							<table class="table table-striped table-bordered table-hover"
								id="dataTables-example">
								<thead>
									<tr class="success" id="trd">
										<th>交易流水号</th>
										<th>计数号</th>
										<th>收银员号</th>
										<th>销售编号</th>
										<th>会员卡号</th>
										<th>会员姓名</th>
										<th>优惠金额</th>
										<th>总计</th>
										<th>实际应付</th>
										<th>找零</th>
										<th>支付方式</th>
										<th>操作</th>
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



		<!-- 修改 -->
		<div class="modal  fade" id="myModalx">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					&times;</button>

				<div id="title">
					<ul class="breadcrumb">
						<h4 style="color:white;">&nbsp;&nbsp;&nbsp;&nbsp;修改订单信息</h4>
					</ul>
				</div>
			</div>
			<div class="modal-body">

				<div class="row">
					<div class="   col s2">
						<form id="myfom2">



							<div class="form-group">
								<div class="col-sm-10">
									交易流水号： <input type="text" id="jylsh" name="map['soid']"
										readonly="readonly" style="width:200px;height:30px;" />
								</div>
							</div>



							<div class="form-group">
								<div class="col-sm-10"
									style="margin-top:-40px;margin-left:485px;">
									计数号 ： <input type="text" id="jsh" name="map['ssNumber']"
										style="width:200px;height:30px;" />
								</div>
							</div>




							<div class="form-group">
								<div class="col-sm-10" style="margin-left:20px;">
									收银员号：<input type="text" id="syyh" name="map['ocId']"
										style="width:200px;height:30px;" />
								</div>
							</div>



							<div class="form-group">
								<div class="col-sm-10"
									style="margin-top:-40px;margin-left:480px;">
									销售编号：<input type="text" id="xsbh" name="map['ssID']"
										style="width:200px;height:30px;" />
								</div>
							</div>





							<div class="form-group">
								<div class="col-sm-10" style="margin-left:20px;">
									会员卡号：<input type="text" id="hykh" name="map['mpId']"
										style="width:200px;height:30px;" />
								</div>
							</div>




							<div class="form-group">
								<div class="col-sm-10"
									style="margin-top:-40px;margin-left:480px;">
									优惠金额：<input type="text" id="yhje" name="map['ssDisMonery']"
										style="width:200px;height:30px;" />
								</div>
							</div>









							<div class="form-group">
								<div class="col-sm-10" style="margin-left:50px;">
									总计：<input type="text" id="zj" name="map['ssTotalPrice']"
										style="width:200px;height:30px;" />
								</div>
							</div>




							<div class="form-group">
								<div class="col-sm-10"
									style="margin-top:-40px;margin-left:480px;">
									实际应付：<input type="text" id="sjyf" name="map['ssRealMonery']"
										style="width:200px;height:30px;" />
								</div>
							</div>




							<div class="form-group">
								<div class="col-sm-10" style="margin-left:50px;">
									找零：<input type="text" id="zl" name="map['ssChange']"
										style="width:200px;height:30px;" />
								</div>
							</div>




							<div class="form-group">
								<div class="col-sm-10"
									style="margin-top:-40px;margin-left:480px;">
									支付方式：<input type="text" id="zffs" name="map['ssPayType']"
										style="width:200px;height:30px;" />
								</div>
							</div>



						</form>
					</div>
				</div>

			</div>
			<div class="modal-footer">
				<button type="button" id="guan_btn" class="btn btn-default"
					data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="updateso2()"
					style='background:#1ca798;color:#1ca798;border:1px solid #1ca798;'>
					<font color='white'>更新</font>
				</button>
			</div>
		</div>
	</div>
	<!-- jQuery Js -->
	<script src="backStage/assets/js/jquery-1.10.2.js"></script>
	<script>
		$(function() {
			zyq();
		});
		/**查询订单信息*/
		function zyq() {
			$.ajax({
						url : "SpinfoOrder/queryAllSpinfoOrders",
						type : "post",
						data : {},
						dataType : "json",
						async : false,
						success : function(data) {
							$("#mytab").html("");
							var tr = "";
							for ( var i = 0; i < data.length; i++) {
								tr += "<tr>";
								tr += "<td>" + data[i].soid + "</td>";
								tr += "<td>" + data[i].ssNumber + "</td>";
								tr += "<td>" + data[i].ocId + "</td>";
								tr += "<td>" + data[i].ssID + "</td>";
								tr += "<td>" + data[i].mpId + "</td>";
								tr += "<td>" + data[i].mpName + "</td>";
								tr += "<td>" + data[i].ssDisMonery + "</td>";
								tr += "<td>" + data[i].ssTotalPrice + "</td>";
								tr += "<td>" + data[i].ssRealMonery + "</td>";
								tr += "<td>" + data[i].ssChange + "</td>";
								tr += "<td>" + data[i].ssPayType + "</td>";
								tr += "<td><button id='"
										+ data[i].soid
										+ "' onclick='querySpOrder(this.id)' data-toggle='modal' data-target='#myModalx'   class='btn btn-primary btn-lg' style='background:#1ca798;color:#1ca798;border:1px solid #1ca798;height:30px;'><font color='white'>修改</font></button>&nbsp;&nbsp;&nbsp;<button id='"
										+ data[i].soid
										+ "' onclick='delSpOrder(this.id)' class='btn btn-primary btn-lg' style='background:#fc764c;color:#fc764c;border:1px solid #fc764c;height:30px;'><font color='white'>删除</font></button></td>";
								tr += "</tr>";
							}

							$("#dataTables-example").append(tr);

						}
					});
		};

		/**根据编号查询订单信息*/
		function querySpOrder(soid) {
			$.ajax({
				url : "SpinfoOrder/querySpinfoOrderById",
				type : "post",
				data : {
					"soid" : soid
				},
				dataType : "json",
				async : false,
				success : function(data) {
					$("#jylsh").val(data[0].soid);
					$("#jsh").val(data[0].ssNumber);
					$("#syyh").val(data[0].ocId);
					$("#xsbh").val(data[0].ssID);
					$("#hykh").val(data[0].mpId);
					$("#hyxm").val(data[0].mpName);
					$("#yhje").val(data[0].ssDisMonery);
					$("#zj").val(data[0].ssTotalPrice);
					$("#sjyf").val(data[0].ssRealMonery);
					$("#zl").val(data[0].ssChange);
					$("#zffs").val(data[0].ssPayType);

				}
			});
		}

		/**修改订单信息*/
		function updateso2() {
			$.ajax({
				url : "SpinfoOrder/updateSpinfoOrder",
				type : "post",
				data : $("#myfom2").serialize(),
				success : function(data) {
					window.location.reload();
				}

			});
		}

		/**删除订单信息*/
		function delSpOrder(soid) {
			if (confirm("您确定要删除此订单信息吗？")) {
				$.ajax({
					url : "SpinfoOrder/delSpinfoOrder",
					type : "post",
					dataType : "json",
					data : {
						"soid" : soid
					},
					success : function(data) {
						zyq();
					}
				});

			} else {
				return false;
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
		$(document).ready(function() {
			$('#dataTables-example').dataTable();
		});
	</script>
	<!-- Custom Js -->
	<script src="backStage/assets/js/custom-scripts.js"></script>


</body>

</html>
