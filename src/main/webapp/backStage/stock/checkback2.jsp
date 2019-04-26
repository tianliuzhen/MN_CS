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
#date1,#date2 {
 height:40px;
 width:120px;
 border-radius:5px;
 margin-top: 4px;
}
#term{
  position:absolute;
  left:540px;
  top:85px;
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
					<h4 class="modal-title" id="myModalLabel">商品退货单详情</h4>
				</div>
				<div id="content">
				<table class="layui-hide" id="test"></table>
				</div>
				<div class="modal-footer" id="vue">
				 <input id="check_reason" placeholder=" 备注 ： "  style="height:30px;width:500px;" >&nbsp;&nbsp;&nbsp;
					<button type="button" class="btn btn-primary"   id="yes_back">通过
					</button>
					<button type="button" class="btn btn-danger"   id="no_back">驳回 
					</button>
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
		<h3  >&nbsp;&nbsp;退款审核</h3>
		</ul>
	 </div></br>
	<div id="serch">
		<input type="text" id="ipt" placeholder="日期查询" onkeyup="serch()">
	  
  </div>
	
	<div id="term">
           
         <select id="sel_state" style="height:40px;width:150px;position:relative;top:7px;">
            <option value="">所有退货单</option>
            <option value="0" selected="selected">未审核</option>
            <option value="1">已通过</option>
            <option value="2">驳回</option>
            <option value="4">已退货或处理</option>
         </select>
         <input id="date1" placeholder="开始日期" >-- <input id="date2" placeholder="截止日期" >
         <button class="layui-btn layui-btn-normal" id="sel_btn" style="position:relative;top:4px;">查看</button>
 
	</div> 
	<!-- layui表格渲染 -->
	<table class="layui-hide" id="myTab"></table>
	<div id="fenye"></div>
	</div>
	<script type="text/html" id="barDemo">
     <button onclick="cli(this)"  class="layui-btn" data-toggle="modal" data-target="#myModal">查看明细</button>
    </script>
    
</body>
</html>
<script>
 var table = layui.table; //定义全局变量  方便使用layui的表格
var laypage = layui.laypage, layer = layui.layer; //定义全局变量  方便使用layui的分页条
var laydate = layui.laydate;
var begindate;
var enddate;
laydate.render({
		elem : '#date1',
		done : function(value) {
		begindate=value;
		}
		})
laydate.render({
		elem : '#date2',
		done : function(value) {
		enddate=value;
		}
		})
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
		url :'stock/selbacklay',
		where:{
			pageNum:pagenum,
			limit:limit,
			keyWord:keyWord,
			Stauts:$("#sel_state").val(),
			begindate:begindate,
			enddate:enddate
		},
		cols : [ [ 
		     {field: 'bsId', width:180,title: '编号'}
		    ,{field : 'ocRealName', width:230,title :'操作人' }
	        ,{field: 'coun', width:180,title: '订单数', sort: true}
	        ,{field: 'mon', width:180,title: '总金额', sort: true}
	        ,{field: 'btauts', width:180,title: '状态值',templet: function(d){
	    	 if(d.btauts==0){
	    		 return "未审核";
	    	 }else if(d.btauts==1){
	    		 return "通过";
	    	 }else if(d.btauts==2){
	    		 return "驳回";
	    	 }else if(d.btauts==3){
	    		 return "已退货或处理";
	    	 } 
	    	   }, sort: true}
		    ,{field: 'bsDate', width:200,title: '提交日期'}
		   ,{field: 'checkDate', width:200,title: '审核日期',templet: function(d){
	    	 if(d.checkDate=="" || d.checkDate==null){
	    		 return "<span  style='color:lightgray'>暂未审核</span>";
	    	 } else {
	    		 return d.checkDate;
	    	 }},sort: true} 
	         ,{fixed: 'right', title:'操作', toolbar: '#barDemo',width:200} 
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
//查看退货商品详情
function cli(obj){
	var bsId=$(obj).parent().parent().prev().prev().prev().prev().prev().prev().prev().children().html();
	var sel_state=$(obj).parent().parent().prev().prev().prev().children().html();
	if(sel_state!="未审核"){//不是未审核状态是，隐藏通过驳回按钮
	       $("#yes_back").hide();
	       $("#no_back").hide();
	       $("#check_reason").hide();
	  }
	  if(sel_state=="未审核"){//不是未审核状态是，隐藏通过驳回按钮
	      $("#yes_back").show();
	       $("#no_back").show();
	       $("#check_reason").show();
	  }  
	check_id=bsId;
	var tableins=table.render({
				 id: 'test'
			    ,elem: '#test'
			    ,url: 'stock/selbackutillay',
			    where:{
			    	bsId:bsId
			    }
			    ,cols: [[ //表头
			       {field: 'bsuUtilId', title: '编号', width:120, sort: true, fixed: 'left'}
			      ,{field: 'spName', width:130,title: '商品名称',}
			      ,{field: 'sptName', width:130,title: '商品类型', sort: true}
			      ,{field: 'gmName', width:130,title: '计量单位', sort: true}
			      ,{field: 'gsName',width:140, title: '商品规格', sort: true,} 
			      ,{field: 'bsuPrice',width:140, title: '退货商品单价', sort: true,} 
			      ,{field: 'bsuNum', width:100,title: '商品数量', sort: true,}
			      ,{field: 'bsuAllMonery', width:120,title: '商品总价', sort: true,}
			      ,{field: 'whName', width:120,title: '所在仓库', sort: true,} 
			      ,{field: 'bsgName', width:120,title: '退货商家', sort: true}
			      ,{field: 'BsReason',width:200, title: '退货原因', sort: true,} 
			    ]]
			  });  
	  
  $("#yes_back").click(function(){
	       if($("#check_reason").val()==null || $("#check_reason").val()=="" ){
	           if(confirm("未填写备注，是否通过 ？")){
	                 yess();
	           }
	       }else{
	          if(confirm("是否通过审核 ？")){
	                 yess();
	           }
	       }   
          })
      function yess(){
          tableins.reload({
		url: 'stock/yes_back',
		where:{
			 bsId:check_id,
			 NoReason:$("#check_reason").val(),
		},done:function(){
		$("#close").click();  
		 window.location.reload();
		}
	}); 
      }
       
        $("#no_back").click(function(){
	       if($("#check_reason").val()==null || $("#check_reason").val()=="" ){
	           if(confirm("未填写备注，是否直接驳回？")){
	                 noo();
	           }
	       }else{
	          if(confirm("是否确认驳回？")){
	                 noo();
	           }
	       }   
          })
      function noo(){
          tableins.reload({
		url: 'stock/no_back',
		where:{
			 bsId:check_id,
			 NoReason:$("#check_reason").val(),
		},done:function(){
		$("#close").click();  
		 window.location.reload();
		}
	}); 
      }
}
 
//绑定input enter事件  在input输入完成   按下回车  调用
function serch(){                //网页内按下回车触发
    if(event.keyCode==13)
    {
    	fenye($("#ipt").val(),1,15);
    }
}


  $("#sel_btn").click(function(){
	num=0;     
  
    if(begindate!=null && enddate!=null){
      var begin = new Date(begindate.replace("-", "/"));
      var end = new Date(enddate.replace("-", "/"));
      if(begin>end){
        alert("开始日期不能大于截止日期");
      }else{ 
       
        fenye("",1,15 );
       }
    }else if(begindate==null && enddate==null){
     
      fenye("",1,15 );
    }else{
     alert("日期选择要完整");
    }
    
 })

</script>