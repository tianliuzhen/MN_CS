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

<title>My JSP '供货商查询.jsp' starting page</title>

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
	width:50%;
	height:350px;
	margin-top:120px;
	margin-left:-400px;
}
#myModalsa{
width:700px;
height:360px;
margin-top:40px;
margin-left:-350px;
}

#titleupdate {
	margin-top: 15px;
	margin-left: -40px;
	background-color: #337ab7;
	width: 700px;
	height: 50px;
	margin-top: -28px;
}


/**add message*/
#title {
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

#ghscx{
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

						<h3><span id="ghscx">供货商查询</span></h3>
						<br /> <br /> <br />
					</div>
					<div class="card-content">
						<div class="table-responsive">
							<table class="table table-striped table-bordered table-hover"
								id="dataTables-example">
								<thead>
									<tr class="success" id="trd" style="color:gray;">
										<th>供货商编码</th>
										<th>供货商名称</th>
										<th>供货商地址</th>
										<th>供货商电话</th>
										<th>供货状态</th>
										<th>类型名称</th>
										<th>操作&nbsp;&nbsp;(&nbsp;&nbsp;<button class='btn btn-primary btn-lg' data-toggle='modal'	data-target='#myModal' id='addsupplier' style=' width:60px;height:25px;padding-top:2px;background:#337ab7;color:#fff;border:1px solid #337ab7;'>添加</button>&nbsp;&nbsp;)</th>
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

		<!-- 添加供货商信息 -->
		<div class="modal  fade" id="myModal">
			<!--   <div id="responsive_oldgoods" class="modal hide fade"  -->

			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>


	          <div id="title">
 					<ul class="breadcrumb">
						<h4 style="color:white;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;添加供货商信息</h4>
					</ul>
				</div>
			</div>
			<div class="modal-body" style="padding-left: 100px;">
				<div class="row">
					<div class="col s2">
						<form action="SpinfoOrder/addSupplier" method="post" onsubmit="return check()">
						<div class="form-group">
								<div class="col-sm-10">
									供货商名称：<input type="text" id="supName" name="map['supName']"
										style="width:250px;height:30px;" placeholder="请输入供货商名称" /><span id="v_supName"></span>
								</div>
							</div>
                           <div class="form-group">
								<div class="col-sm-10">
									供货商地址：<input type="text" id="supAddress"
										name="map['supAddress']" style="width:250px;height:30px;"
										placeholder="请输入供货商地址" /><span id="v_supAddress"></span>
								</div>
							</div>

						
							<div class="form-group">
								<div class="col-sm-10">
									供货商电话：<input type="text" id="supPhone" name="map['supPhone']"
										style="width:250px;height:30px;" placeholder="请输入供货商电话" /><span id="v_supPhone"></span>
								</div>
							</div>


                            <div class="form-group">
								<div class="col-sm-10">

									商品类型名：<select id="lb" name="map['sptId']"
										style="width:250px;height:30px;" />
									<option>请选择</option>
									</select>


								</div>
							</div>

						
					</div>
				</div>
			</div>
			<div class="modal-footer">
					<button type="button" id="guan_btn" class="btn btn-default"
					data-dismiss="modal">关闭</button>&nbsp;
				<button type="submit" class="btn btn-primary" value="提交"
					class="btn btn-primary btn-lg "
					style="width:65px;height:30px;font-family:'微软雅黑';background:#337ab7;color:#fff;border:1px solid #337ab7;">添加</button>
			
			</div>
			</form>
			<!-- /.modal -->
		</div>

<div class="modal  fade" id="myModalsa">
			<!--   <div id="responsive_oldgoods" class="modal hide fade"  -->

			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">
				<div id="titleupdate">
						<ul class="breadcrumbupdate">
							<h4 style="color:white;padding-top:18px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;修改供货商信息</h4>
						</ul>
					</div>
				
				
				</h4>
			</div>
			<div class="modal-body">

				<div class="row">
					<div class="col s2">
						<form id="myfom2">
							<div class="form-group">
								<div class="col-sm-10">
									供货商编码： <input type="text" id="ghsbh" name="map['supId']"
										style="width:250px;height:30px;" readonly="readonly" />
								</div>
							</div>





							<div class="form-group">
								<div class="col-sm-10">
									供货商名称： <input type="text" id="ghsmc" name="map['supName']"
										style="width:250px;height:30px;" readonly="readonly" />
								</div>
							</div>



							<div class="form-group">
								<div class="col-sm-10">
									供货商地址： <input type="text" id="ghsdz" name="map['supAddress']"
										style="width:250px;height:30px;" />
								</div>
							</div>





							<div class="form-group">
								<div class="col-sm-10" style="margin-left:3px;">
									供货商电话：<input type="text" id="ghsdh" name="map['supPhone']"
										style="width:250px;height:30px;" />
								</div>
							</div>


							<div class="form-group">
								<div class="col-sm-10" style="margin-left:3px;">

									商品类型名：<select id="lbmc" name="map['sptId']"
										style="width:250px;height:30px;" readonly="readonly"></select>

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
					onclick="updateSupplier()" style='background:#337ab7;color:#fff;border:1px solid #337ab7;'>更新</button>
			</div>

			<!-- /.modal -->
		</div>
	</div>


	<!-- jQuery Js -->
	<script src="backStage/assets/js/jquery-1.10.2.js"></script>
	<script type="text/javascript">
		$(function() {
			zyq();
		});
		/**查询供货商信息*/
		function zyq() {
			$.ajax({
					    url : "SpinfoOrder/selectSupplier",
						type : "post",
						data : {},
						dataType : "json",
						async : false,
						success : function(data) {
							var tr = "";
							for ( var i = 0; i < data.length; i++) {

								tr += "<tr>";
								tr += "<td>" + data[i].supId + "</td>";
								tr += "<td>" + data[i].supName + "</td>";
								tr += "<td>" + data[i].supAddress + "</td>";
								tr += "<td>" + data[i].supPhone + "</td>";
								if (data[i].supState == 0) {
									tr += "<td>可供货</td>";
								} else {
									tr += "<td>禁止供货</td>";
								}
								tr += "<td>" + data[i].sptName + "</td>";
								tr += "<td><button id='"
										+ data[i].supId
										+ "' onclick='queryOneSupplier(this.id)' class='btn btn-primary btn-lg' style='background:#337ab7;width:60px;height:25px;line-height:5px;'data-toggle='modal' data-target='#myModalsa'>"
										+ "更新" + "</button></td>";
								tr += "</tr>";
							}

							$("#dataTables-example").append(tr);
						}
					});
		};



/**查询单个供货商 */
		function queryOneSupplier(supId) {
			$.ajax({
				url : "SpinfoOrder/queryOneSupplier",
				type : "post",
				data : {
					"supId" : supId
				},
				dataType : "json",
				async : false,
				success : function(data) {
					$("#ghsbh").val(data[0].supId);
					$("#ghsmc").val(data[0].supName);
					$("#ghsdh").val(data[0].supAddress);
					$("#ghsdz").val(data[0].supPhone);
					$("#ghszt").val(data[0].supState);
					$("#lbmc").val(data[0].sptId);
				}

			});
		}
		/**修改供货商 */
		function updateSupplier() {
			$.ajax({
				url : "SpinfoOrder/updateSupplier",
				type : "post",
				data : $("#myfom2").serialize(),
				success : function(data) {
					window.location.reload();
				}

			});
		}
		/**所属类别(add)*/
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

		/**所属类别(update)*/
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
	
	
		/**验证供货商名称*/
  $("#supName").focus(
    function(){
    $("#v_supName").html("<font size='1'>供货商名称只能为汉字！</font>");
	}
    );
    $("#supName").blur(
    function(){
     var name=$("#supName").val();
     var reg = /^[\u4e00-\u9fa5]{0,}$/;
     if(a=reg.test(name)){
       $("#v_supName").html("✔").css("color","green");
       return true;

	 }else{
       $("#v_supName").html("×").css("color","red");
		  return false;
	 }
     }
	 );
		
		
		
		
		
		/**验证供货商地址*/

  $("#supAddress").focus(
   function(){
    $("#v_supAddress").html("<font size='2'>汉字或包含数字</font>");
  }
  );
$("#supAddress").blur(
  function(){
    var name2=$("#supAddress").val();
	var reg = /^(?=.*?[\u4E00-\u9FA5])[\d\u4E00-\u9FA5]+/;
    if(b=reg.test(name2)){
	  $("#v_supAddress").html("✔").css("color","green");
       return true;
	}else{
    $("#v_supAddress").html("×").css("color","red");
		  return false;
	}
    }
    );
		
		
		
		/**验证供货商电话*/
  $("#supPhone").focus(
   function(){
    $("#v_supPhone").html("<font size='2'>至少为十一位数</font>");
  }
  );
$("#supPhone").blur(
  function(){
    var name3=$("#supPhone").val();
	var reg = /^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/;
    if(c=reg.test(name3)){
	  $("#v_supPhone").html("✔").css("color","green");
       return true;
	}else{
    $("#v_supPhone").html("×").css("color","red");
		  return false;
	}
    }
    );
		
		/**验证不为空 */
		function check() {
			var supName = $("#supName").val();
			var supAddress =$("#supAddress").val();
			var supPhone=$("#supPhone").val();
			if (supName==null ||supName=="" && supAddress == null || supAddress == "" && supPhone == null || supPhone == "") {
				alert("供货商信息不能为空！");
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
