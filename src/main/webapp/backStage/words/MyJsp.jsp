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

<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="backStage/assets/yhx_js/layui.all.js"></script>
<script type="text/javascript" src="backStage/assets/yhx_js/vue-resource.min.js"></script>
<script type="text/javascript" src="backStage/assets/yhx_js/vue.js"></script>
<link rel="stylesheet" href="backStage/assets/yhx_css/layui.css" type="text/css"></link>
<link rel="stylesheet" href="backStage/assets/yhx_css/ckcx.css" type="text/css"></link>
<link rel="stylesheet" href="backStage/assets/yhx_css/layui.css" type="text/css"></link>
<style>
.layui-table th{
font-size:20px;
text-align: center;
}
.layui-table td{
font-size:16px;
text-align: center;
}
#ipt{
height:40px;
width:450px;
font-size:16px;
}
</style>
</head>
<body>
<div id="serch">
<input type="text" id="ipt" placeholder="请输入内容"  v-on:keyup.enter="serch(this)">
</div>
	<table class="layui-hide" id="myTab"></table>
	<div id="fenye"></div>
	<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-xs" onclick="cli(this)">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs">删除</a>
</script>
</body>
<script>
	var table = layui.table; //定义全局变量  方便使用layui的表格
	var laypage = layui.laypage, layer = layui.layer; //定义全局变量  方便使用layui的分页条
	/*页面加载时查询数据  并且分页*/
	$(function() {
    
		fenye("",1,10);  //调用layui表格
		tool();          // 使用分页
	});
	var num=0;
	/*layui表格    传入三个参数   
	keyWord 模糊查询关键字
	pagenum 当前页
	limit   每页显示的条数
	*/
	function fenye(pagenum,limit) {
		table.render({
			id : 'myTab', //table的id
			elem : '#myTab',   //同上
			height : 500,  //表格的高度
			width:1000,
			url : 'seltd.action',
			where:{
			pageNum:pagenum,
			limit:limit,
			tui:tui,
			},
			cols : [ [ 
			/*表头  
			  checkbox：true  开启复选框
			  field : 你的列名
			  title : 你的标题  也就是 <th>
			  sort  : true   开启排序
			  edit: 'text'开启单元格编辑    */
			{type:'checkbox',fixed : true,width : 100}, 
			{field : 'spName',width : 150,title : '商品名称',sort : true,}, 
			{field : 'bsuNum',width : 140,title : '退货数量',sort : true,}, 
			{field : 'spName',width : 130,title : '商品名称',sort : true,}, 
			{field : 'bsuPrice',width : 150,title : '单价',sort : true,}, 
			{field : 'whName',width : 150,title : '所在仓库',sort : true,}, 
			{field : 'bsuAllMonery',width : 150,title : '退货总价',sort : true,}, 
			{field : 'sptName',width : 150,title : '类型名称',sort : true,edit: 'text'},
			{fixed: 'right', title:'操作', toolbar: '#barDemo', width:150}
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
	function tool(count) {
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
