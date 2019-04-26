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
<link rel="stylesheet" href="backStage/assets/yhx_css/kccx.css"
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
</style>
</head>
<body style="background-color: #ececec;padding:20px;padding-top: 0px;">
  </br>
<!-- 模态框（Modal） -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" id="top">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">采购订单详情</h4>
				</div>
				<div id="content">
				<table class="layui-hide" id="test"></table>
				</div>
				<div class="modal-footer" id="vue">
					<button type="button" class="btn btn-default" data-dismiss="modal" id="close">关闭 
					</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
	
	<div style="background-color: #fff;padding: 20px;">
	<div id="title">
		<ul  >
		<h3  >&nbsp;&nbsp;采购拨款</h3>
		</ul>
	 </div></br>
	<div id="serch">
		<input type="text" id="ipt" placeholder="供货商查询" onkeyup="serch()">
	</div>
	<div id="dateBox">
	<button style="height:40px;position:relative;top:12px;"  class="layui-btn layui-btn-normal" id="checkmon_btn" onclick="mon()">选择拨款</button>
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
 var table = layui.table; //定义全局变量  方便使用layui的表格
var laypage = layui.laypage, layer = layui.layer; //定义全局变量  方便使用layui的分页条
var laydate = layui.laydate;
/*页面加载时查询数据  并且分页*/
$(function() {
	fenye("",1,15);  //调用layui表格
	tool();
	 
});
var num=0;
function fenye(keyWord,pagenum,limit) {
	var tableins=table.render({
		id : 'myTab', //table的id
		elem : '#myTab',   //同上   
		height : 635,  //表格的高度  
		url :'stock/selstocklay', 
		where:{
			pageNum:pagenum,
			limit:limit,
			keyWord:keyWord,
			Stauts:5   
		},    
		cols : [ [ 
		     {type:'checkbox',fixed : true,width : 90,checkbox:true, },
		     {field: 'stkId', width:85,title: '编号', sort: true}
		    ,{field : 'ocRealName',width:90,title :'操作人' , sort: true}
		   
	        ,{field: 'counts', width:90,title: '订单数', sort: true}
	        ,{field: 'sumMoneyall', width:105,title: '总金额', sort: true}
	        ,{field: 'Stauts', width:110,title: '审核状态',templet: function(d){
	    	 if(d.Stauts==0){
	    		 return "未审核";
	    	 }else if(d.Stauts==1){
	    		 return "一审通过";
	    	 }else if(d.Stauts==2){
	    		 return "一审驳回";
	    	 }else if(d.Stauts==3){
	    		 return "已拨款";
	    	 }else if(d.Stauts==4){
	    		 return "已入库";
	    	 }else if(d.Stauts==5){
	    		 return "二审通过";
	    	 }else if(d.Stauts==6){
	    		 return "二审驳回";
	    	 }
	    	   }, sort: true}
	    	  
		    ,{field: 'stkDate', width:140,title: '提交日期', sort: true}
		    ,{field: 'checkDate', width:140,title: '一审日期',templet: function(d){
	    	 if(d.checkDate=="" || d.checkDate==null){
	    		 return "<span  style='color:lightgray'>暂未审核</span>";
	    	 } else {
	    		 return d.checkDate;
	    	 }},sort: true}
		    ,{field: 'checkDateReason', width:140,title: '一审备注',templet: function(d){
	    	 if(d.checkDateReason=="" || d.checkDateReason ==null){
	    		 return "<span  style='color:lightgray'>无备注</span>";
	    	 }else {
	    		 return d.checkDateReason;
	    	 }}, sort: true}
		    ,{field: 'checkDate2', width:140,title: '二审日期',templet: function(d){
	    	 if(d.checkDate2=="" || d.checkDate2 ==null){
	    		 return "<span  style='color:lightgray'>暂未审核</span>";
	    	 }else {
	    		 return d.checkDate2;
	    	 }}, sort: true}
		    ,{field: 'checkDate2Reason', width:140,title: '一审备注',templet: function(d){
	    	 if(d.checkDate2Reason=="" || d.checkDate2Reason ==null){
	    		 return "<span  style='color:lightgray'>无备注</span>";
	    	 }else {
	    		 return d.checkDate2Reason;
	    	 }}, sort: true}
		    ,{field: 'purDate', width:140,title: '拨款日期',templet: function(d){
	    	 if(d.purDate=="" || d.purDate ==null){
	    		 return "<span  style='color:lightgray'>暂未拨款</span>";
	    	 }else {
	    		 return d.purDate;
	    	 }}, sort: true}
	         ,{fixed: 'right', title:'操作', toolbar: '#barDemo',width:140} 
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
function tool(keyWord,count) {
	laypage.render({
		elem : 'fenye',//分页条的作用域   页面中di'v的id
		count : count,  //总数据数
		limit:15,      //每页显示的条数
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

var check_id=0;
//查看商品详情
function cli(obj){
	var stkId=$(obj).parent().parent().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().children().html();
	 
	check_id=stkId;
	var tableins=table.render({
				 id: 'test'
			    ,elem: '#test'
			    ,url: 'stock/selstockdetaillay',
			    where:{
			    	stkId:stkId
			    }
			    ,cols: [[ //表头
			       {field: 'sdId', title: '进货编号', width:150, sort: true, fixed: 'left'}
			      ,{field: 'spName', width:130,title: '商品名称',}
			      ,{field: 'sptName', width:130,title: '商品类型', sort: true}
			      ,{field: 'gmName', width:130,title: '计量单位', sort: true}
			      ,{field: 'gsName',width:140, title: '商品规格', sort: true,} 
			      ,{field: 'spPrice',width:140, title: '进货单价', sort: true,} 
			      ,{field: 'allnum', width:130,title: '进货数量'}
			      ,{field: 'sumMoney', width:148,title: '商品总价'}
			      ,{field: 'supName', width:250,title: '供货商名称'}
			      ,{field: 'whName', width:148,title: '录入仓库'} 
			    ]]
			  });  
	  
     
}
 
//绑定input enter事件  在input输入完成   按下回车  调用
function serch(){                //网页内按下回车触发
    if(event.keyCode==13)
    {
    	fenye($("#ipt").val(),1,10);
    }
}
function mon(){
      var checkStatus = table.checkStatus('myTab')
      ,data = checkStatus.data;
      if(data.length<1){
         alert("未选择");
      }else{   
         if(confirm("是否拨款")){ 
       for (var i in data){  
                  $.ajax({
		           url:"stock/paymoney",
		           type:"post",
		           data:{"stkId":data[i].stkId,"ppPay":data[i].sumMoneyall,"ppMoney":data[i].sumMoneyall},
		            dataType:"json",
		            
		            success:function(data){
		              window.location.reload();
		            }  
		            })
       } 
}}
}


</script>