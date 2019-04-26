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

<title>My JSP 'index.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript" src="backStage/assets/yhx_js/jquery.js"></script>
<script type="text/javascript" src="backStage/assets/yhx_js/bootstrap-table.js"></script>
<script type="text/javascript" src="backStage/assets/yhx_js/bootstrap.min.js"></script>
<script type="text/javascript" src="backStage/assets/yhx_js/layui.all.js"></script>
<script type="text/javascript" src="backStage/assets/yhx_js/bootstrap-table-zh-CN.min.js"></script>
<link rel="stylesheet" href="backStage/assets/yhx_css/table.css" type="text/css"></link>
<link rel="stylesheet"
	href="backStage/assets/yhx_css/bootstrap-table.css" type="text/css"></link>
<link rel="stylesheet" href="backStage/assets/yhx_css/bootstrap.min.css"
	type="text/css"></link>
<link rel="stylesheet" href="backStage/assets/yhx_css/layui.css"
	type="text/css"></link>
 
<link rel="stylesheet" href="backStage/assets/yhx_css/layui.css"
	type="text/css"></link>
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
  .dataTables_length label{
    font-size: 19px;
    font-weight: normal;
    }
    .dataTables_filter label{
    font-size: 19px;
      font-weight: normal;
        margin-bottom: -55px;
    } 
    .table table-striped table-bordered table-hover dataTable no-footer{
    margin-top: 10px;
    }
    .dataTables_info{
    font-size: 18px;
      font-weight: normal;
      color: gray;
      margin-top:22px; 
    }
    .pagination li a{
     font-size: 15px;
      font-weight: normal;
      color: gray;
    }
</style>

<body style="background-color: #ececec;padding:20px;">

                  
									
		
		<div style="background-color: #fff;padding: 20px;">
		      <h3 >
                            货架盘点记录 <small>查看货架盘点记录.</small>
                        </h3>
                       
					</hr>
<div id="serch"  >
<input type="text" id="ipt" placeholder="请输入内容" style="margin-top: 8px;" v-on:keyup.enter="serch(this)">

</div>

	<table class="layui-hide" id="myTab"></table>
	<div id="fenye"></div>
	</div>
	<script type="text/html" id="barDemo">

</script>
</body>
<script>
	var table = layui.table; //定义全局变量  方便使用layui的表格
	var laypage = layui.laypage, layer = layui.layer; //定义全局变量  方便使用layui的分页条
	/*页面加载时查询数据  并且分页*/
	$(function() {
		fenye("",1,15);  //调用layui表格
		tool();          // 使用分页
	});
	var num=0;
	/*layui表格    传入三个参数   
	keyWord 模糊查询关键字
	pagenum 当前页
	limit   每页显示的条数
	*/
	function fenye(hj,pagenum,limit) {
	
		table.render({
			id : 'myTab', //table的id
			elem : '#myTab',   //同上
			height : 650,  //表格的高度
			url : 'selhj.action',
			totalRow: true,
		
			where:{
			pageNum:pagenum,
			limit:limit,
			hj:hj,
			},
			cols : [ [ 
			/*表头  
			  checkbox：true  开启复选框
			  field : 你的列名
			  title : 你的标题  也就是 <th>
			  sort  : true   开启排序
			  edit: 'text'开启单元格编辑*/
            
			{field : 'spId',title : '编号',sort : true,}, 
			{field : 'sspDate',title : '盘点日期',sort : true,}, 
			{field : 'whName',title : '仓库号',sort : true,}, 
			{field : 'spName',title : '损失商品',sort : true,}, 
			{field : 'sspNum',title : '产品数量',sort : true,}, 
			{field : 'sspDamageNum',title : '产品损溢数量',sort : true,total:true,}, 
			{field : 'sspLackMonery',title : '损失金额',sort : true,}, 
			{field : 'ocRealName',title : '盘点人员',sort : true,edit: 'text'},
	
                   ] ],
             //回调函数 在表格渲染完成后 执行 用num判断  让它只在页面加载时执行一次   点击上一页下一页不执行
			done : function(res) {
			  if(num==0){
			  tool($("#ipt").val(),res.count);  //调用tool()函数   启用分页条  并传总数据数  res.count 
			  num+=1;
			  }
			}
			
		});
		
	}
	/*渲染分页工具条
	  同样传入两个参数   关键字   总数据
	*/
	function tool(hj,count) {
		laypage.render({
			elem : 'fenye',//分页条的作用域   页面中di'v的id
			count : count,  //总数据数
			limit:10,      //每页显示的条数
			layout : [ 'prev', 'page', 'next','limit','skip' ],
			jump : function(obj, first) {
			/*判断如果不是第一页执行里面的方法*/
				if (!first) {
				/*重新调用分页方法*/
		
					fenye($("#ipt").val(),obj.curr,obj.limit);
				}
			}
		});
	}
	//绑定input enter事件  在input输入完成   按下回车  调用
	new Vue({
	     el :"#serch",
	     methods:{
	        serch:function(){
	             fenye($("#ipt").val(),1,10);
	        }
	     }
	});

</script>
</html>
