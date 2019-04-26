<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page deferredSyntaxAllowedAsLiteral="true"%>
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

<title>My JSP '职位管理.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

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

.modal-content {
	font-size: 18px;
}

#addsp {
	margin-left: 400px;
}

#myModal {
	margin-left: -80px;
	margin-top: 150px;
}

#myModalLabel {
	height: 30px;
}

input[type="checkbox"] {
	-webkit-appearance: none;
	vertical-align: middle;
	margin-top: 0;
	background: #fff;
	border: #999 solid 1px;
	border-radius: 3px;
	min-height: 17px;
	min-width: 17px;
}

input[type="checkbox"]:checked {
	background: #3190e8;
}

input[type=checkbox]:checked::after {
	content: '';
	top: 3px;
	left: 3px;
	position: absolute;
	background: transparent;
	border: #fff solid 2px;
	border-top: none;
	border-right: none;
	height: 6px;
	width: 10px;
	-moz-transform: rotate(-45deg);
	-ms-transform: rotate(-45deg);
	-webkit-transform: rotate(-45deg);
	transform: rotate(-45deg);
}
</style>
</head>
<body style="background-color: #ececec;">




	<div id="page-inner">

		<div class="row">
			<div class="col-md-12" style="background-color: #fff;">
				<!--  -->
				<!-- Advanced Tables -->
				<div class="card">
					<div class="card-action">
						<br />

						<h3>职位查询</h3>
						<br /> <br /> <br />
					</div>
					<div class="card-content">
						<div>
							<table class="table table-striped table-bordered table-hover"
								id="dataTables-example">
								<thead>
									<tr class="success" id="trd" style="color: gray">
										<!-- <th>员工编号</th> -->
										<th>账号名字</th>
										<th>账号密码</th>
										<th>员工姓名</th>
										<th>员工性别</th>
										<th>员工年龄</th>
										<th>入职日期</th>
										<th>员工电话</th>
										<th>员工住址</th>
										<th>员工状态</th>
										<th>操作</th>
										<th>操作&nbsp;&nbsp;(&nbsp;&nbsp;
											<button class='btn btn-primary btn-lg' data-toggle='modal'
												data-target='#myModal1' id='addSpinfoType'
												style='width:70px;height:25px; padding-top:0px;background:#337ab7;color:#fff;border:1px solid #337ab7;border-radius:5px;'>添加</button>&nbsp;&nbsp;)</th>
									</tr>
								</thead>
								<tbody id="mytab">

								</tbody>
								<tr>

								</tr>
							</table>
						</div>

					</div>
				</div>
				<!--End Advanced Tables -->
			</div>
		</div>
		<!-- /. ROW  -->

	</div>






	<div class="modal fade" id="myModal1" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true"
		style="width: 900px;left: 400px;">
		<div class="modal-dialog" style="width: 900px;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">
						<font color="green" size="5">添加员工信息</font>
					</h4>
				</div>
				<div class="modal-body" style="padding-left: 100px;width: 900px;">



					<div class="row">
						<div class="col s2">
							<form id="myfom" action="SpinfoOrder/addManyOfficeClerk"
								method="post">
								<input id="face" name="map['face']" type="hidden">

								<div class="form-group">
									<br />
									<div class="col-sm-10">
										账号名字：<input type="text" id="ocNamexxx" name="map['ocName']"
											style="width:200px;height:30px;" placeholder="请输入账号名字"
											readonly="readonly" />

									</div>
								</div>
								<br />




								<div class="form-group">
									<div class="col-sm-10">
										账号密码：<input type="password" id="ocPassword"
											name="map['ocPassword']" style="width:200px;height:30px;"
											placeholder="请输入密码" /><span id="v_ocPassword"></span>
									</div>
								</div>
								<br />





								<div class="form-group">
									<div class="col-sm-10">
										确认密码：<input type="password" id="reocPassword"
											name="map['ocPassword']" style="width:200px;height:30px;"
											placeholder="请再次输入密码" /><span id="v_reocPassword"></span>
									</div>
								</div>
								<br />


								<div class="form-group">
									<div class="col-sm-10">
										真实名字：<input type="text" id="ocRealName"
											name="map['ocRealName']" style="width:200px;height:30px;"
											placeholder="请输入真实名称" /><span id="v_ocRealName"></span>
									</div>
								</div>
								<br />







								<div class="form-group">
									<div class="col-sm-10">
										员工性别：<select id="ygxb" name="map['ocSex']"
											style="width:132px;height: 30px;">
											<option>男</option>
											<option>女</option>
										</select>
									</div>
								</div>
								<br />









								<div class="form-group">
									<div class="col-sm-10">
										员工年龄：<input type="text" id="ocAgexxx" name="map['ocAge']"
											style="width:200px;height:30px;" placeholder="请输入员工年龄" /><span
											id="v_ocAgexxx"></span>
									</div>
								</div>
								<br />





								<div class="form-group">
									<div class="col-sm-10">
										入职时间：<input type="date" id="ocEntryTime"
											name="map['ocEntryTime']" style="width:200px;height:30px;"
											placeholder="请输入入职日期" />
									</div>
								</div>
								<br />









								<div class="form-group">
									<div class="col-sm-10">
										员工电话：<input type="text" id="ocPhone" name="map['ocPhone']"
											style="width:200px;height:30px;" placeholder="请输入员工电话" /><span
											id="v_ocPhone"></span>
									</div>
								</div>
								<br />









								<div class="form-group">
									<div class="col-sm-10">
										员工住址：<input type="text" id="ocAddress" name="map['ocAddress']"
											style="width:200px;height:30px;" placeholder="请输入员工住址" /><span
											id="v_ocAddress"></span>
									</div>
								</div>
								<br />




								<div class="form-group">
									<div class="col-sm-10">
										角色名称：<select id="roleId" name="map['roleId']">
											<option value="1">收银员</option>
											<option value="2">审核员</option>
											<option value="3">财务经理</option>
											<option value="4">仓库管理员</option>
											<option value="5">系统管理员</option>
											<option value="6">采购员</option>
											<option value="10">财务经理</option>
										</select>
									</div>
								</div>
								<br />


								<div class="form-group">
									<div class="col-sm-10">
										部门名称：<select id="dpId" name="map['dpId']">
											<option value="1">采购部</option>
											<option value="2">销售部</option>
											<option value="3">市场部</option>
											<option value="4">策划部</option>
											<option value="5">财务部</option>
											<option value="6">资源部</option>
											<option value="7">调研部</option>
										</select>
									</div>
								</div>









								<div style="position: absolute;top: 40px;left: 500px;">
									<input type="file" id="file" onchange="show()"><br />
									<div id="img"
										style="width:300px;height:300px;border:1px solid #d5d5d5">这里显示图片</div>

									<div class="form-group"></div>
							</form>
						</div>
					</div>


				</div>




			</div>
			<div class="modal-footer">
				<button type="submit" class="btn btn-primary"
					onclick="addManyOfficeClerk()">添加</button>
				<button type="button" id="guan_btn" class="btn btn-default"
					data-dismiss="modal">关闭</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal -->
	</div>















	<div class="modal fade" id="myModalsa" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<span class="modal-title" id="myModalLabel"> 查看&nbsp;<font
						id="ofm2" color="green" size="5"></font>&nbsp;&nbsp;对应角色<br /> </span>
				</div>
				<div class="modal-body">


					<div class="row" style="margin-left: 30px;">
						<div class="   col s2">
							<form id="myfom2">
								<input type="hidden" id="ofm" readonly="readonly"
									style="width:150px;" />
								<div id="ofjdiv"></div>
							</form>

						</div>



					</div>




				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>

					<button class='btn btn-primary' data-toggle='modal'
						data-target='#myModal'>添加角色</button>

					<button class='btn btn-primary' onclick="delzzz()">删除</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>









	<!-- 添加模态 -->
	<div class="modal  fade" id="myModal"
		style="width: 600px;margin-left: 450px;top:100px;">
		<!--   <div id="responsive_oldgoods" class="modal hide fade"  -->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">全部角色信息</h4>
			</div>
			<div class="modal-body">


				<div class="row">
					<div class="   col s2">
						<form id="myfom">

							<input type="hidden" id="roleIdmmm2" name="map['ocId']">



							<div class="form-group">
								<div class="col-sm-10">
									角色名称：<select id="roleIdmmm" name="map['roleId']">
										<option value="1">收银员</option>
										<option value="2">审核员</option>
										<option value="3">财务经理</option>
										<option value="4">仓库管理员</option>
										<option value="5">系统管理员</option>
										<option value="6">采购员</option>
										<option value="10">财务经理</option>
									</select>
								</div>
							</div>


						</form>
					</div>
				</div>

			</div>
			<div class="modal-footer">
				<button type="button" id="guan_btn" class="btn btn-default"
					data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary"
					onclick="addOfficeClerk()">添加</button>
			</div>
		</div>
		<!-- /.modal-content -->
		<!-- /.modal -->
	</div>








	<div class="modal  fade" id="myModalx3"
		style="width: 850px;margin-left: 400px;top:100px;">
		<!--   <div id="responsive_oldgoods" class="modal hide fade"  -->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					&times;</button>

				<font color="green" size="5">修改员工信息</font>
			</div>
			<div class="modal-body">
				<center>
					<div class="row">
						<div class="   col s2">
							<form id="myfom3">

								员工编号:&nbsp;<input type="text" id="ygbh" name="map['ocId']"
									readonly="readonly" style="width:162px;height: 30px;" />
								账号名字:&nbsp;<input type="text" id="zhmz" name="map['ocName']"
									style="width:132px;height: 30px;" /> 账号密码:&nbsp;<input
									type="text" id="zhmm" name="map['ocPassword']"
									style="width:1`32px;height: 30px;" /><br /> <br />
								员工姓名:&nbsp;<input type="text" id="ygxm" name="map['ocRealName']"
									style="width:162px;height: 30px;;" /> 员工性别:&nbsp;<select
									id="ygxb" name="map['ocSex']" style="width:132px;height: 30px;">
									<option>男</option>
									<option>女</option>
								</select> 员工年龄:&nbsp;<input type="text" id="ygnl" name="map['ocAge']"
									style="width:132px;margin-left:2px;height: 30px;" /><br /> <br />
								入职日期:&nbsp;<input type="date" id="rzrq"
									name="map['ocEntryTime']" style="width:162px;height: 30px;" />
								员工电话:&nbsp;<input type="text" id="ygdh" name="map['ocPhone']"
									style="width:132px;height: 30px;" /> 员工住址:&nbsp;<input
									type="text" id="ygzz" name="map['ocAddress']"
									style="width:132px;height: 30px;" />

							</form>
						</div>
					</div>

				</center>
			</div>
			<div class="modal-footer">
				<button type="button" id="guan_btn" class="btn btn-default"
					data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary"
					onclick="updateOffks()">更新</button>
			</div>
		</div>
		<!-- /.modal-content -->
		<!-- /.modal -->
	</div>











	<div class="modal  fade" id="myModalx4"
		style="width: 500px;margin-left: 500px;top:250px;">
		<!--   <div id="responsive_oldgoods" class="modal hide fade"  -->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					&times;</button>

				<font color="green" size="5">修改员工状态</font>
			</div>
			<div class="modal-body">
				<center>
					<div class="row">
						<div class="   col s2">
							<form id="myfom4">
							
							
							<div class="form-group">
									<div class="col-sm-10">
									<input type="hidden" id="ygbha" name="map['ocId']"
											style="width:200px;height:30px;" />
									</div>
								</div>
							
							
								<div class="form-group">
									<div class="col-sm-10">
										员工状态：<select id="ygzt" name="map['ocFlag']"
											style="width:200px;height:30px;" />
											<option value="0">冻结</option>
											<option value="1">正常</option>
											
									
											</select>
									</div>
								</div>

							</form>
						</div>
					</div>

				</center>
			</div>
			<div class="modal-footer">
				<button type="button" id="guan_btn" class="btn btn-default"
					data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="updateOf()">更新</button>
			</div>
		</div>
		<!-- /.modal-content -->
		<!-- /.modal -->
	</div>










	<!-- jQuery Js -->
	<script src="backStage/assets/js/jquery-1.10.2.js"></script>
	<script>
		function delzzz() {

			alert($("#roleIdmmm2").val());
		}

		function show() {
			var input = document.getElementById("file");
			var file = input.files[0];
			if (!/image\/\w+/.test(file.type)) {
				alert("文件必须为图片！");
				return false;
			}
			var reader = new FileReader();
			reader.readAsDataURL(file);
			reader.onload = function() {
				document.getElementById("img").innerHTML = '<img id="canvas" src="'+this.result+'" style="width:300px;height:300px;"/>'
			}

		}

		$(function() {
			aaa();
		});
		/**查询职员信息*/
		function aaa() {
			$
					.ajax({
						url : "SpinfoOrder/selectOfficeClerk",
						type : "post",
						data : {},
						dataType : "json",
						async : false,
						success : function(data) {
							var tr = "";
							$("#mytab").html("");
							for ( var i = 0; i < data.length; i++) {

								tr += "<tr>";
								/* 	tr += "<td>" + data[i].ocId + "</td>"; */
								tr += "<td>" + data[i].ocName + "</td>";
								tr += "<td>" + "******" + "</td>";
								tr += "<td>" + data[i].ocRealName + "</td>";
								tr += "<td>" + data[i].ocSex + "</td>";
								tr += "<td>" + data[i].ocAge + "</td>";
								tr += "<td>" + data[i].ocEntryTime + "</td>";
								tr += "<td>" + data[i].ocPhone + "</td>";
								tr += "<td>" + data[i].ocAddress + "</td>";
								if (data[i].ocFlag == 0) {
									tr += "<td>冻结</td>";
								} else {
									tr += "<td>正常</td>";
								}
								if (data[i].ocFlag == 0) {
													tr += "<td><button id='"+data[i].ocId+"' onclick='queryOfficeClerk(this.id)' data-toggle='modal' data-target='#myModalx4'  class='btn btn-primary btn-lg' style='height: 27px; padding-top: 0px;'><font color='white'>启用</font></button></td>";
	
								} else {
								tr += "<td><button id='"+data[i].ocId+"' onclick='queryOfficeClerk(this.id)' data-toggle='modal' data-target='#myModalx4'  class='btn btn-primary btn-lg' style='height: 27px; padding-top: 0px;background-color:f44336;border:0px;'><font color='white'>禁用</font></button></td>";
	
								}
	
								tr += "<td><button id='"
										+ data[i].ocId
										+ "' onclick='chakan(this.id)' class='btn btn-primary btn-lg' data-toggle='modal' data-target='#myModalsa'  style='height: 27px; padding-top: 0px;'>"
										+ "查看角色"
										+ "</button>&nbsp;&nbsp;<button id='"
										+ data[i].ocId
										+ "' onclick='delOfficeClerk(this.id)'  data-toggle='modal' class='btn btn-primary btn-lg' style='height: 27px; padding-top: 0px;'><font color='white'>删除</font></button>&nbsp;&nbsp;<button id='"
										+ data[i].ocId
										+ "' onclick='queryOneOfficeClerk(this.id)' data-toggle='modal' data-target='#myModalx3'  class='btn btn-primary btn-lg' style='height: 27px; padding-top: 0px;'><font color='white'>更新</font></button>&nbsp;"
										
								tr += "</tr>";
									//
						
						
						
							}

							$("#dataTables-example").append(tr);
							//   alert(tr);
						}
					});
		};

		/**通过编号查询职员对应角色信息*/
		function chakan(ocId) {
			$("#ofjdiv").html(" ");
			$("#roleIdmmm2").val(ocId);
			$.ajax({
				url : "SpinfoOrder/queryOfficeClerkById",
				type : "post",
				data : {
					"ocId" : ocId
				},
				dataType : "json",
				async : false,
				success : function(data) {
					// alert(data.length);
					$("#ofm").val(data[0].ocRealName);
					$("#ofm2").html($("#ofm").val());
					var xxx = ""
					for ( var i = 0; i < data.length; i++) {
						xxx += "<tr>"
						xxx += "<td>" + data[i].roleName + "&nbsp;"
								+ "<input type='checkbox'/></td>"
						xxx += "</tr>"

					}
					$("#ofjdiv").append(xxx);
				}
			});
		}

		/**添加职位角色中间表信息*/
		function addOfficeClerk() {

			$.ajax({
				url : "SpinfoOrder/addOfficeClerk",
				contentType : "application/json;charset=utf-8",
				type : "post",
				data : JSON.stringify({
					"roleId" : $("#roleIdmmm option:selected").val(),
					"ocId" : $("#roleIdmmm2").val()
				}),
				success : function(data) {
					window.location.reload();
				}

			});
		}

		/**删除职位信息*/
		function delOfficeClerk(ocId) {
			if (confirm("您要删除此职员信息吗？")) {
				$.ajax({
					url : "SpinfoOrder/delOfficeClerk",
					type : "post",
					dataType : "json",
					data : {
						"ocId" : ocId
					},
					success : function(data) {
						aaa();

					}
				});

			} else {
				return false;
			}

		}

		/**查看职员信息*/
		function queryOneOfficeClerk(ocId) {
			$.ajax({
				url : "SpinfoOrder/queryOneOfficeClerk",
				type : "post",
				data : {
					"ocId" : ocId
				},
				dataType : "json",
				async : false,
				success : function(data) {
					$("#ygbh").val(data[0].ocId);
					$("#zhmz").val(data[0].ocName);
					$("#zhmm").val(data[0].ocPassword);
					$("#ygxm").val(data[0].ocRealName);
					$("#ygxb").val(data[0].ocSex);
					$("#ygnl").val(data[0].ocAge);
					$("#rzrq").val(data[0].ocEntryTime);
					$("#ygdh").val(data[0].ocPhone);
					$("#ygzz").val(data[0].ocAddress);
					$("#ocFlag").val(data[0].ocFlag);
				}
			});
		}

		/**查看职员性别*/
		$(function() {
			$.ajax({
				url : "SpinfoOrder/queryOfficeClerkBySex",
				type : "post",
				data : {},
				dataType : "json",
				success : function(data) {
					for ( var i = 0; i < data.length; i++) {
						$("#ygxb").append(
								"<option value='"+data[i].ocId+"' >"
										+ data[i].ocSex + "</option>");
					}
				}
			});
		});

		/*下拉框查询角色信息*/
		$(function() {
			$.ajax({
				url : "SpinfoOrder/queryRoleById",
				type : "post",
				data : {},
				dataType : "json",
				success : function(data) {
					for ( var i = 0; i < data.length; i++) {
						$("#jsxx").append(
								"<option value='"+data[i].roleId+"' >"
										+ data[i].roleName + "</option>");
					}
				}
			});
		});

		/*修改职位信息*/
		function updateOffks() {
			$.ajax({
				url : "SpinfoOrder/updateOfficeClerk",
				type : "post",
				data : $("#myfom3").serialize(),
				success : function(data) {
					window.location.reload();
				}

			});
		}

		//添加职员信息*/
		function addManyOfficeClerk() {
			try {
				var face = $("#canvas")[0].src.toString().split(",")[1];
				$("#face").val(face);
			} catch (e) {
				alert(22);
			}
			//	ocName  ocPassword  ocRealName  ygxb33  ocAge  ocEntryTime  ocPhone  ocAddress	roleId		dpId
			//#{map.ocName},#{map.ocPassword},#{map.ocRealName},#{map.ocSex},#{map.ocAge},
			//#{map.ocEntryTime},#{map.ocPhone},#{map.ocAddress},#{map.roleId},#{map.dpId})
			var map = {
				"face" : face,
				"ocName" : $('#ocNamexxx').val(),
				"ocPassword" : $('#ocPassword').val(),
				"ocSex" : $('#ygxb option:selected').val(),
				"ocAge" : $("#ocAgexxx").val(),
				"ocRealName" : $("#ocRealName").val(),
				"ocEntryTime" : $("#ocEntryTime").val(),
				"ocPhone" : $("#ocPhone").val(),
				"ocEntryTime" : $("#ocEntryTime").val(),
				"ocAddress" : $("#ocAddress").val(),
				"roleId" : $('#roleId option:selected').val(),
				"dpId" : $('#dpId option:selected').val(),
			};
			/*   alert(JSON.stringify(map)); */
			$.ajax({
				url : "SpinfoOrder/addManyOfficeClerk",
				contentType : "application/json;charset=utf-8",
				type : "post",
				data : JSON.stringify(map),
				success : function(data) {
					window.location.reload();
				}

			});
		}

		$("#addSpinfoType").click(function() {
			getOcName();

		});

		function getOcName() {
			$.ajax({
				url : "SpinfoOrder/queryocName",
				type : "post",
				dataType : "json",
				success : function(data) {

					var newocname = "00000" + parseInt(parseInt(data) + 1);
					$("#ocNamexxx").val(newocname);
				}
			});
		}

		/**验证账号密码*/
		$("#ocPassword").focus(function() {
			$("#v_ocPassword").html("<font size='2'>密码不低于6位</font>");
		});
		$("#ocPassword").blur(function() {
			var name2 = $("#ocPassword").val();
			var reg = /^[a-zA-Z]\w{5,10}$/;
			if (b = reg.test(name2)) {

				$("#v_ocPassword").html("✔").css("color", "green");
				return true;
			} else {

				$("#v_ocPassword").html("×").css("color", "red");
				return false;
			}
		});

		/**验证确认密码*/
		$("#reocPassword").focus(function() {
			$("#v_reocPassword").html("<font size='2'>密码不低于6位</font>");
		});
		$("#reocPassword").blur(function() {
			var name2 = $("#ocPassword").val();
			var name3 = $("#reocPassword").val();
			var reg = /^[a-zA-Z]\w{5,10}$/;
			if (name3 != name2) {
				$("#v_reocPassword").html("×").css("color", "red");
			} else {
				$("#v_reocPassword").html("✔").css("color", "green");
			}
		});

		/**验证真实姓名*/
		$("#ocRealName").focus(function() {
			$("#v_ocRealName").html("<font size='1'>姓名2-5位之间</font>");
		});
		$("#ocRealName").blur(function() {
			var name = $("#ocRealName").val();
			var reg = /^[\u4e00-\u9fa5]{2,6}$/;
			if (a = reg.test(name)) {
				$("#v_ocRealName").html("✔").css("color", "green");
				return true;

			} else {
				$("#v_ocRealName").html("×").css("color", "red");
				return false;
			}
		});

		/**验证年龄*/
		$("#ocAgexxx").focus(function() {
			$("#v_ocAgexxx").html("<font size='1'>年龄只能为正数</font>");
		});
		$("#ocAgexxx").blur(function() {
			var name4 = $("#ocAgexxx").val();
			var reg = /^[0-9]*$/;
			if (c = reg.test(name4)) {
				$("#v_ocAgexxx").html("✔").css("color", "green");
				return true;

			} else {
				$("#v_ocAgexxx").html("×").css("color", "red");
				return false;
			}
		});

		/**验证员工电话*/
		$("#ocPhone").focus(function() {
			$("#v_ocPhone").html("<font size='2'>至少为十一位数</font>");
		});
		$("#ocPhone")
				.blur(
						function() {
							var name5 = $("#ocPhone").val();
							var reg = /^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/;
							if (d = reg.test(name5)) {
								$("#v_ocPhone").html("✔").css("color", "green");
								return true;
							} else {
								$("#v_ocPhone").html("×").css("color", "red");
								return false;
							}
						});

		/**验证员工住址*/

		$("#ocAddress").focus(function() {
			$("#v_ocAddress").html("<font size='2'>汉字或包含数字</font>");
		});
		$("#ocAddress").blur(function() {
			var name6 = $("#ocAddress").val();
			var reg = /^(?=.*?[\u4E00-\u9FA5])[\d\u4E00-\u9FA5]+/;
			if (f = reg.test(name6)) {
				$("#v_ocAddress").html("✔").css("color", "green");
				return true;
			} else {
				$("#v_ocAddress").html("×").css("color", "red");
				return false;
			}
		});
/**查询职员状态*/
			$(function() {
			$.ajax({
				url : "SpinfoOrder/queryOfficeFlag",
				type : "post",
				data : {},
				dataType : "json",
				success : function(data) {
					for ( var i = 0; i < data.length; i++) {
						$("#zyzt").append(
								"<option value='"+data[i].ocId+"' >"
										+ data[i].ocFlag + "</option>");
					}
				}
			});
		});
		
		/**查看单个职员信息*/
		function queryOfficeClerk(ocId) {
			$.ajax({
				url : "SpinfoOrder/queryOfficeClerk",
				type : "post",
				data : {
					"ocId" : ocId
				},
				dataType : "json",
				async : false,
				success : function(data) {
				    $("#ygbha").val(data[0].ocId);
					$("#ygzt").val(data[0].ocFlag);
				}
			});
		}
		
			/**修改职位状态*/
		function updateOf() {
			$.ajax({
				url : "SpinfoOrder/updateOfficeFlag",
				type : "post",
				data :$("#myfom4").serialize(),
				success : function(data) {
					window.location.reload();
				}

			});
		}
	</script>
	<!-- Bootstrap Js -->
	<script src="backStage/assets/js/bootstrap.min.js"></script>

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
