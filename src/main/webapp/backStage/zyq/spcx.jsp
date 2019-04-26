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

<title>My JSP '商品查询.jsp' starting page</title>

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
	width:80%;
	margin-left: -640px;
	margin-top: 50px;
	border-radius: 10px;
	height: 560px;
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
	background-color: #30ab9d;
	width: 1500px;
	height: 50px;
	line-height: 25px;
}
/**update bgcolor*/
.breadcrumbss {
	background-color: #30ab9d;
	width: 1500px;
	height: 35px;
}

/**update width*/
#myModalxupdate {
	width: 70%;
	margin-left: -580px;
	border-radius: 10px;
	height: 420px;
	margin-top: 100px;
}

.btn {
	height: 30px;
}

#addsp{
margin-left:10px;
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
						<h4>商品&nbsp;查询&nbsp;</h4>
					</div>
					<div class="card-content">
						<div class="table-responsive">
							<table class="table table-striped table-bordered table-hover"
								id="dataTables-example">
								<thead>
									<tr class="success" id="trd" style="color:gray;">
										<th>编号</th>
										<th>名称</th>
										<th>图片</th>
										<th>条形码</th>
										<th>规格</th>
										<th>品牌</th>
										<th>单位</th>
										<th>类别</th>
										<th>仓库</th>
										<th>售价</th>
										<th>状态</th>
										<th>保质期</th>
										<th>库存量</th>
										<th>操作&nbsp;&nbsp;(<button class='btn btn-primary btn-lg' data-toggle='modal'	data-target='#myModal' id='addsp' style='background:#2ec376;color:#fff;border:1px solid #2ec376;'>添加</button>&nbsp;&nbsp;)</th>
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

		<!-- 添加商品信息 -->
		<div class="modal  fade" id="myModal">
			<!--   <div id="responsive_oldgoods" class="modal hide fade"  -->

			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>


	          <div id="title">
 					<ul class="breadcrumb">
						<h4 style="color:white;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;添加商品信息</h4>
					</ul>
				</div>
			</div>
			<div class="modal-body" style="padding-left: 100px;">
				<div class="row">
					<div class="col s2">
						<form action="SpinfoOrder/addSpinfo" enctype="multipart/form-data"
							method="post" onsubmit="return check()">
							<div class="form-group">
								<div class="col-sm-10">
									商品名称：<input class="form-control" type="text" name="spName"
										id="spName" style="width:200px;height:30px;"
										placeholder="请输入商品名称"> <span id="validator_spName"></span>
								</div>
							</div>


							<div class="form-group">
								<div class="col-sm-10"
									style="margin-top:-40px;margin-left:450px;">
									商品条形码：<input class="form-control" type="text" name="spBarCode"
										id="spBarCode" style="width:200px;height:30px;"
										placeholder="请输入商品条形码"> <span id="validator_spBarCode"></span>
								</div>
							</div>





							<div class="form-group">
								<div class="col-sm-10">
									商品进价：<input class="form-control" type="text" name="spBuyPrice"
										id="spBuyPrice" style="width:200px;height:30px;"> <span
										id="validator_spBuyPrice"></span>
								</div>
							</div>




							<div class="form-group">
								<div class="col-sm-10"
									style="margin-top:-40px;margin-left:465px;">
									商品售价：<input class="form-control" type="text" name="spSalePrice"
										id="spSalePrice" style="width:200px;height:30px;"> <span
										id="validator_spSalePrice"></span>
								</div>
							</div>




							<div class="form-group">
								<div class="col-sm-10">
									商品规格：<select id="spgg" name="gsId"
										style="width:200px;height:30px;" /></select>
								</div>
							</div>



							<div class="form-group">
								<div class="col-sm-10"
									style="margin-top:-40px;margin-left:465px;">
									商品品牌：<select id="sppp" name="glId"
										style="width:200px;height:30px;" /></select><br />
								</div>
							</div>





							<div class="form-group">
								<div class="col-sm-10">
									计量单位：<select id="jldw" name="gmId"
										style="width:200px;height:30px;" /></select>

								</div>
							</div>






							<div class="form-group">
								<div class="col-sm-10"
									style="margin-top:-40px;margin-left:465px;">

									类别名称：<select id="lbmc" name="sptId"
										style="width:200px;height:30px;" /></select>


								</div>
							</div>








							<div class="form-group">
								<div class="col-sm-10">
									所在仓库：<select id="szck" name="whId"
										style="width:200px;height:30px;" /></select>



								</div>
							</div>





							<div class="form-group">
								<div class="col-sm-10"
									style="margin-top:-40px;margin-left:465px;">

									促销价格：<input type="text" name="spDisPrice"
										style="width:200px;height:30px;" id="spDisPrice" /> <span
										id="validator_spDisPrice"></span>
								</div>
							</div>






							<div class="form-group">
								<div class="col-sm-10">

									百货部门：<select id="bhbmh" name="gdId"
										style=width:200px;height:30px; "/></select>

								</div>
							</div>



							<div class="form-group">
								<div class="col-sm-10"
									style="margin-top:-40px;margin-left:435px;">


									促销开始日期：<input type="date" name="spDisBegdate"
										style="width:200px;height:30px;" /><br /> <span
										id="validator_spDisBegdate"></span>
								</div>
							</div>




							<div class="form-group">
								<div class="col-sm-10">

									陈列分类：<select id="clflh" name="dpId"
										style="width:200px;height:30px;" /></select>

								</div>
							</div>









							<div class="form-group">
								<div class="col-sm-10"
									style="margin-top:-40px;margin-left:435px;">

									促销截至日期：<input type="date" name="spDisEndDdate"
										style="width:200px;height:30px;" /> <span
										id="validator_spDisEndDdate"></span>
								</div>
							</div>







							<div class="form-group">
								<div class="col-sm-10">

									通道序列：<select id="tdxlh" name="anId"
										style="width:200px;height:30px;" /></select><br />

								</div>
							</div>





							<div class="form-group">
								<div class="col-sm-10"
									style="margin-top:-40px;margin-left:470px;">
									Bay序号：<select id="bxh" name="bnId"
										style="width:200px;height:30px;" /></select><br />

								</div>
							</div>




							<div class="form-group">
								<div class="col-sm-10" style="margin-left:16px;">
								保质期：<input class="form-control" type="text" name="rtPeriod"
										id="rtPeriod" style="width:200px;height:30px;"> <span
										id="validator_rtPeriod"></span>
								</div>
							</div>	
							

							<div class="form-group">
								<div class="col-sm-10">
									商品图片：<input type="file" name="file"
										style="width:200px;height:30px;" />

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
					style="width:70px;height:30px;font-family:'微软雅黑';background:#1ca798;color:#fff;border:1px solid #1ca798;"
					id="submitadd">添加</button>
			</div>
			</form>
			<!-- /.modal -->
		</div>



		<!-- 修改商品信息 -->
		<div class="modal  fade" id="myModalxupdate">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					&times;</button>

				<div id="titless">
					<ul class="breadcrumbss">
						<h4 style="color:white;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;修改商品信息</h4>
					</ul>
				</div>
			</div>
			<div class="modal-body"  style="padding-left: 100px;">

				<div class="row">
					<div class="   col s2">

						<center>
							<form id="myfom3">


								<div class="form-group">
									<div class="col-sm-10">
										商品编号：<input class="form-control" type="text"
											name="map['spId']" id="spbh" readonly="readonly"
											style="width:200px;height:30px;">
									</div>
								</div>


								<div class="form-group">
									<div class="col-sm-10"
										style="margin-top:-40px;margin-left:465px;">
										商品条形码：<input class="form-control" type="text"
											name="map['spBarCode']" id="sptxm"
											style="width:200px;height:30px;">
									</div>
								</div>







								<div class="form-group">
									<div class="col-sm-10">
										商品名称：<input class="form-control" type="text"
											name="map['spName']" id="spmc"
											style="width:200px;height:30px;">
									</div>
								</div>












								<div class="form-group">
									<div class="col-sm-10"
										style="margin-top:-40px;margin-left:480px;">
										促销价格：<input type="text" id="cxjg" name="map['spDisPrice']"
											style="width:200px;height:30px;" />
									</div>
								</div>





								<div class="form-group">
									<div class="col-sm-10" style="margin-left:0px;">
										商品进价：<input type="text" id="spjj" name="map['spBuyPrice']"
											style="width:200px;height:30px;" />
									</div>
								</div>



								<div class="form-group">
									<div class="col-sm-10"
										style="margin-top:-40px;margin-left:480px;">
										商品售价：<input type="text" id="spsj" name="map['spSalePrice']"
											style="width:200px;height:30px;" />
									</div>
								</div>



								<div class="form-group">
									<div class="col-sm-10">
										商品规格：<select id="gg" name="map['gsId']"
											style="width:200px;height:30px;" /></select>
									</div>
								</div>





								<div class="form-group">
									<div class="col-sm-10"
										style="margin-top:-40px;margin-left:480px;">
										商品品牌：<select id="pp" name="map['glId']"
											style="width:200px;height:30px;" /></select>
									</div>
								</div>




								<div class="form-group">
									<div class="col-sm-10">
										计量单位：<select id="jl" name="map['gmId']"
											style="width:200px;height:30px;" /></select>
									</div>
								</div>



								<div class="form-group">
									<div class="col-sm-10"
										style="margin-top:-40px;margin-left:480px;">
										类别名称：<select id="lb" name="map['sptId']"
											style="width:200px;height:30px;" /></select>
									</div>
								</div>




								<div class="form-group">
									<div class="col-sm-10">
										所在仓库：<select id="ck" name="map['whId']"
											style="width:200px;height:30px;" /></select>
									</div>
								</div>


							</form>
					</div>
				</div>

			</div>
			<div class="modal-footer">
				<button type="button" id="guan_btn" class="btn btn-default"
					data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary btn-lg"
					onclick="updateso2()"
					style='background:#1ca798;color:#1ca798;border:1px solid #1ca798;'>
					<font color='white'>更新</font>
				</button>
			</div>

		</div>
	</div>


	<!-- jQuery Js -->
	<script src="backStage/assets/js/jquery-1.10.2.js"></script>
	<script type="text/javascript">
		/**查询所有商品信息*/
		$(function() {
			zyq();
		});
		function zyq() {
			$
					.ajax({
						url : "SpinfoOrder/queryAllSpinfo",
						type : "post",
						data : {},
						dataType : "json",
						async : false,
						success : function(data) {
							$("#mytab").html("");
							var tr = "";
							for ( var i = 0; i < data.length; i++) {

								tr += "<tr>";
								tr += "<td>" + data[i].spId + "</td>";
								tr += "<td>" + data[i].spName + "</td>";
								tr += "<td><img src='"+data[i].spImage+"' width=40,height=40></td>";
								tr += "<td>" + data[i].spBarCode + "</td>";
								tr += "<td>" + data[i].gsName + "</td>";
								tr += "<td>" + data[i].glName + "</td>";
								tr += "<td>" + data[i].gmName + "</td>";
								tr += "<td>" + data[i].sptName + "</td>";

								tr += "<td>" + data[i].whName + "</td>";
								tr += "<td>" + data[i].spSalePrice + "</td>";
								if (data[i].spStatu == 0) {
									tr += "<td>未上架</td>";
								} else {
									tr += "<td>已上架</td>";
								}
							    tr += "<td>" + data[i].rtPeriod + "</td>";
								tr += "<td>" + data[i].spAllNum + "</td>";

								tr += "<td><button id='"
										+ data[i].spId
										+ "' onclick='querySp(this.id)' data-toggle='modal' data-target='#myModalxupdate'  class='btn btn-primary btn-lg' style='background:#1ca798;color:#1ca798;border:1px solid #1ca798;margin-left:10px;'><font color='white'>修改</font></button>&nbsp;&nbsp;<button id='"
										+ data[i].spId
										+ "' onclick='delSp(this.id)'  class='btn btn-primary btn-lg' style='background:#fc764c;color:#fc764c;border:1px solid #fc764c;'><font color='white'>删除</font></button></td>";
	
								tr += "</tr>";
							}

							$("#dataTables-example").append(tr);

						}
					});
		};

		/**查询单个商品信息 */
		function querySp(spId) {
			$.ajax({
				url : "SpinfoOrder/querySpinfoById",
				type : "post",
				data : {
					"spId" : spId
				},
				dataType : "json",
				async : false,
				success : function(data) {

					$("#spbh").val(data[0].spId);
					$("#spmc").val(data[0].spName);
					$("#sptp").val(data[0].spImage);
					$("#sptxm").val(data[0].spBarCode);
					$("#gg").val(data[0].gsId);
					$("#spjj").val(data[0].spBuyPrice);
					$("#spsj").val(data[0].spSalePrice);
					$("#cxjg").val(data[0].spDisPrice);
					$("#spkczsl").val(data[0].spAllNum);
					$("#lb").val(data[0].sptId);
					$("#ck").val(data[0].whId);
					$("#jl").val(data[0].gmId);
					$("#pp").val(data[0].glId);
				}
			});
		}

		/**修改商品信息 */
		function updateso2() {
			$.ajax({
				url : "SpinfoOrder/updateSpinfo",
				type : "post",
				data : $("#myfom3").serialize(),
				success : function(data) {
					window.location.reload();
				}

			});
		}

		/**删除商品信息*/
		function delSp(spId) {
			if (confirm("您确定要删除此商品信息吗？")) {
				$.ajax({
					url : "SpinfoOrder/delSpinfo",
					type : "post",
					dataType : "json",
					data : {
						"spId" : spId
					},
					success : function(data) {
						zyq();

					}
				});

			} else {
				return false;
			}

		}

		/**查询商品类型（add 用） */
		$(function() {
			$.ajax({
				url : "SpinfoOrder/querySpinfoType",
				type : "post",
				data : {},
				dataType : "json",
				success : function(data) {
					for ( var i = 0; i < data.length; i++) {
						$("#lbmc").append(
								"<option value='"+data[i].sptId+"' >"
										+ data[i].sptName + "</option>");
					}
				}
			});
		});

		/**查询商品类型（update 用） */
		$(function() {
			$.ajax({
				url : "SpinfoOrder/querySpinfoType",
				type : "post",
				data : {},
				dataType : "json",
				success : function(data) {
					for ( var i = 0; i < data.length; i++) {
						$("#lb").append(
								"<option value='"+data[i].sptId+"' >"
										+ data[i].sptName + "</option>");
					}
				}
			});
		});

		/**查询商品规格类型(add用) */
		$(function() {
			$.ajax({
				url : "SpinfoOrder/queryGoodsStandard",
				type : "post",
				data : {},
				dataType : "json",
				success : function(data) {
					for ( var i = 0; i < data.length; i++) {
						$("#spgg").append(
								"<option value='"+data[i].gsId+"' >"
										+ data[i].gsName + "</option>");
					}
				}
			});
		});

		/**查询商品规格类型 (update用)*/

		$(function() {
			$.ajax({
				url : "SpinfoOrder/queryGoodsStandard",
				type : "post",
				data : {},
				dataType : "json",
				success : function(data) {
					for ( var i = 0; i < data.length; i++) {
						$("#gg").append(
								"<option value='"+data[i].gsId+"' >"
										+ data[i].gsName + "</option>");
					}
				}
			});
		});

		/**查询商品品牌类型(add用)*/

		$(function() {
			$.ajax({
				url : "SpinfoOrder/queryGoodsLogo",
				type : "post",
				data : {},
				dataType : "json",
				success : function(data) {
					for ( var i = 0; i < data.length; i++) {
						$("#sppp").append(
								"<option value='"+data[i].glId+"' >"
										+ data[i].glName + "</option>");
					}
				}
			});
		});

		/**查询商品品牌类型(update用)*/
		$(function() {
			$.ajax({
				url : "SpinfoOrder/queryGoodsLogo",
				type : "post",
				data : {},
				dataType : "json",
				success : function(data) {
					for ( var i = 0; i < data.length; i++) {
						$("#pp").append(
								"<option value='"+data[i].glId+"' >"
										+ data[i].glName + "</option>");
					}
				}
			});
		});

		/**查询计量单位类型(add用) */

		$(function() {
			$.ajax({
				url : "SpinfoOrder/queryGoodsMeasure",
				type : "post",
				data : {},
				dataType : "json",
				success : function(data) {
					for ( var i = 0; i < data.length; i++) {
						$("#jldw").append(
								"<option value='"+data[i].gmId+"' >"
										+ data[i].gmName + "</option>");
					}
				}
			});
		});

		/**查询计量单位类型(update用) */
		$(function() {
			$.ajax({
				url : "SpinfoOrder/queryGoodsMeasure",
				type : "post",
				data : {},
				dataType : "json",
				success : function(data) {
					for ( var i = 0; i < data.length; i++) {
						$("#jl").append(
								"<option value='"+data[i].gmId+"' >"
										+ data[i].gmName + "</option>");
					}
				}
			});
		});

		/**查询仓库类型(add用) */
		$(function() {
			$.ajax({
				url : "SpinfoOrder/queryWarehouse",
				type : "post",
				data : {},
				dataType : "json",
				success : function(data) {
					for ( var i = 0; i < data.length; i++) {
						$("#szck").append(
								"<option value='"+data[i].whId+"' >"
										+ data[i].whName + "</option>");
					}
				}
			});
		});

		/**查询仓库类型(update用) */
		$(function() {
			$.ajax({
				url : "SpinfoOrder/queryWarehouse",
				type : "post",
				data : {},
				dataType : "json",
				success : function(data) {
					for ( var i = 0; i < data.length; i++) {
						$("#ck").append(
								"<option value='"+data[i].whId+"' >"
										+ data[i].whName + "</option>");
					}
				}
			});
		});

		/**查询百货部门号(add用) */
		$(function() {
			$.ajax({
				url : "SpinfoOrder/queryGoodsDept",
				type : "post",
				data : {},
				dataType : "json",
				success : function(data) {
					for ( var i = 0; i < data.length; i++) {
						$("#bhbmh").append(
								"<option value='"+data[i].gdId+"' >"
										+ data[i].gdName + "</option>");
					}
				}
			});
		});

		/**查询陈列分类号(add用) */
		$(function() {
			$.ajax({
				url : "SpinfoOrder/queryDisplayparse_copy",
				type : "post",
				data : {},
				dataType : "json",
				success : function(data) {
					for ( var i = 0; i < data.length; i++) {
						$("#clflh").append(
								"<option value='"+data[i].dpId+"' >"
										+ data[i].dpName + "</option>");
					}
				}
			});
		});

		/**查询通道序列号(add用) */
		$(function() {
			$.ajax({
				url : "SpinfoOrder/queryAccessno",
				type : "post",
				data : {},
				dataType : "json",
				success : function(data) {
					for ( var i = 0; i < data.length; i++) {
						$("#tdxlh").append(
								"<option value='"+data[i].anId+"' >"
										+ data[i].anName + "</option>");
					}
				}
			});
		});

		/**查询bay序号(add用) */
		$(function() {
			$.ajax({
				url : "SpinfoOrder/querybayno",
				type : "post",
				data : {},
				dataType : "json",
				success : function(data) {
					for ( var i = 0; i < data.length; i++) {
						$("#bxh").append(
								"<option value='"+data[i].bnId+"' >"
										+ data[i].bnName + "</option>");
					}
				}
			});
		});

		/**查询陈列数量(add用) */
		$(function() {
			$.ajax({
				url : "SpinfoOrder/queryDisplaynum",
				type : "post",
				data : {},
				dataType : "json",
				success : function(data) {
					for ( var i = 0; i < data.length; i++) {
						$("#clsl").append(
								"<option value='"+data[i].dnId+"' >"
										+ data[i].dnNum + "</option>");
					}
				}
			});
		});
		/**查询商品状态*/
		$(function() {
			$.ajax({
				url : "SpinfoOrder/querySpinfoStatus",
				type : "post",
				data : {},
				dataType : "json",
				success : function(data) {
					for ( var i = 0; i < data.length; i++) {
						$("#spzt").append(
								"<option value='"+data[i].spId+"' >"
										+ data[i].spStatu + "</option>");
					}
				}
			});
		});
		
		/**验证商品名称*/
		$("#spName").focus(
				function() {
					$("#spName").css("border-color", "red");
					$("#validator_spName").html(
							"<font color='red'>商品名称不能包含数字！</font>");
				});
		$("#spName").blur(
				function() {
					var name = $("#spName").val();
					var reg = /[a-zA-Z\u4E00-\u9FA5]+$/;
					if (a = reg.test(name)) {
						$("#validator_spName").html(
								"<font color='green'>输入正确</font>");
						$("#spName").css("border-color", "");
					} else {
						$("#validator_spName").html(
								"<font color='red'>输入有误   请重新填写！</font>");
					}
				});

		/**验证商品条形码 */
		$("#spBarCode").focus(
				function() {
					$("#spBarCode").css("border-color", "red");
					$("#validator_spBarCode").html(
							"<font color='red'>商品条形码至少9位数字！</font>");
				});
		$("#spBarCode").blur(
				function() {
					var name = $("#spBarCode").val();
					var reg =/^\d{9,}$/;
					if (a = reg.test(name)) {
						$("#validator_spBarCode").html(
								"<font color='green'>输入正确</font>");
						$("#spBarCode").css("border-color", "");
					} else {
						$("#validator_spBarCode").html(
								"<font color='red'>输入有误   请重新填写！</font>");
					}
				});

		/**验证进价 */
		$("#spBuyPrice").focus(
				function() {
					$("#spBuyPrice").css("border-color", "red");
					$("#validator_spBuyPrice").html(
							"<font color='red'>商品进价不能为负数！</font>");
				});
		$("#spBuyPrice").blur(
				function() {
					var name = $("#spBuyPrice").val();
					var reg = /^[+]{0,1}(\d+)$|^[+]{0,1}(\d+\.\d+)$/;
					if (a = reg.test(name)) {
						$("#validator_spBuyPrice").html(
								"<font color='green'>输入正确</font>");
						$("#spBuyPrice").css("border-color", "");
					} else {
						$("#validator_spBuyPrice").html(
								"<font color='red'>输入有误   请重新填写！</font>");
					}
				});

		/**验证促销价格 */
		$("#spDisPrice").focus(
				function() {
					$("#spDisPrice").css("border-color", "red");
					$("#validator_spDisPrice").html(
							"<font color='red'>促销价格不能为负数！</font>");
				});
		$("#spDisPrice").blur(
				function() {
					var name = $("#spDisPrice").val();
					var reg = /^[+]{0,1}(\d+)$|^[+]{0,1}(\d+\.\d+)$/;
					if (a = reg.test(name)) {
						$("#validator_spDisPrice").html(
								"<font color='green'>输入正确</font>");
						$("#spDisPrice").css("border-color", "");
					} else {
						$("#validator_spDisPrice").html(
								"<font color='red'>输入有误   请重新填写！</font>");
					}
				});

		/**验证售价 */
		$("#spSalePrice").focus(
				function() {
					$("#spSalePrice").css("border-color", "red");
					$("#validator_spSalePrice").html(
							"<font color='red'>商品售价不能为负数！</font>");
				});
		$("#spSalePrice").blur(
				function() {
					var name = $("#spSalePrice").val();
					var reg = /^[+]{0,1}(\d+)$|^[+]{0,1}(\d+\.\d+)$/;
					if (a = reg.test(name)) {
						$("#validator_spSalePrice").html(
								"<font color='green'>输入正确</font>");
						$("#spSalePrice").css("border-color", "");
					} else {
						$("#validator_spSalePrice").html(
								"<font color='red'>输入有误   请重新填写！</font>");
					}
				});

		/**验证开始日期 */
		$("#spDisBegdate").focus(
				function() {
					$("#spDisBegdate").css("border-color", "red");
					$("#validator_spDisBegdate").html(
							"<font color='red'>日期格式有误！</font>");
				});
		$("#spDisBegdate").blur(
				function() {
					var name = $("#spDisBegdate").val();
					var reg = /^\d{4}-\d{1,2}-\d{1,2}/;
					if (a = reg.test(name)) {
						$("#validator_spDisBegdate").html(
								"<font color='green'>输入正确</font>");
						$("#spDisBegdate").css("border-color", "");
					} else {
						$("#validator_spDisBegdate").html(
								"<font color='red'>输入有误   请重新填写！</font>");
					}
				});
         /**验证截至日期 */
		$("#spDisEndDdate").focus(
				function() {
					$("#spDisEndDdate").css("border-color", "red");
					$("#validator_spDisEndDdate").html(
							"<font color='red'>日期格式有误！</font>");
				});
		$("#spDisEndDdate").blur(
				function() {
					var name = $("#spDisEndDdate").val();
					var reg = /^\d{4}-\d{1,2}-\d{1,2}/;
					if (a = reg.test(name)) {
						$("#validator_spDisEndDdate").html(
								"<font color='green'>输入正确</font>");
						$("#spDisEndDdate").css("border-color", "");
					} else {
						$("#validator_spDisEndDdate").html(
								"<font color='red'>输入有误   请重新填写！</font>");
					}
				});

		/**验证不为空 */
		function check() {
			var spName = $("#spName").val();
			var spBarCode = $("#spBarCode").val();
			var spBuyPrice = $("#spBuyPrice").val();
			var spSalePrice = $("#spSalePrice").val();
			if (spName == null || spName == "" && spBarCode == null
					|| spBarCode == "" && spBuyPrice == null
					|| spBuyPrice == "" && spSalePrice == null
					|| spSalePrice == "") {
				alert("商品信息不能为空！");
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
