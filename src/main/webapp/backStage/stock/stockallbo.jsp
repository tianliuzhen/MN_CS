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
		<h3  >&nbsp;&nbsp;拨款记录</h3>
		</ul>
	 </div></br>
	<div id="serch">
		<input type="text" id="ipt" placeholder="供货商查询" onkeyup="serch()">
	</div>
	<div id="term">
         <select id="sel_state" style="height:40px;width:150px;position:relative;top:7px;">
            
            <option value="" >所有订单</option>
            <option value="0" >未审核</option>
            <option value="1">一审通过</option>
            <option value="2">一审驳回</option>
            <option value="5">二审通过</option>
            <option value="6">二审驳回</option>
            <option value="3" selected="selected">已拨款</option>
            <option value="4">已入库</option>
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
function fenye(keyWord,pagenum,limit ) {
	var tableins=table.render({
		id : 'myTab', //table的id
		elem : '#myTab',   //同上
		height : 630,  //表格的高度
		url :'stock/selstocklay',
		where:{
			pageNum:pagenum,
			limit:limit,
			keyWord:keyWord,
			Stauts:$("#sel_state").val(),
			begindate:begindate,
			enddate:enddate
		},
		cols : [ [ 
		     {field: 'stkId', width:85,title: '编号', sort: true}
		    ,{field : 'ocRealName',width:90,title :'操作人' , sort: true}
		   
	        ,{field: 'counts', width:90,title: '订单数', sort: true}
	        ,{field: 'sumMoneyall', width:105,title: '总金额', sort: true}
	        ,{field: 'Stauts', width:120,title: '审核状态',templet: function(d){
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
	    	  
		    ,{field: 'stkDate', width:150,title: '提交日期', sort: true}
		    ,{field: 'checkDate', width:150,title: '一审日期',templet: function(d){
	    	 if(d.checkDate=="" || d.checkDate==null){
	    		 return "<span  style='color:lightgray'>暂未审核</span>";
	    	 } else {
	    		 return d.checkDate;
	    	 }},sort: true}
		    ,{field: 'checkDateReason', width:150,title: '一审备注',templet: function(d){
	    	 if(d.checkDateReason=="" || d.checkDateReason ==null){
	    		 return "<span  style='color:lightgray'>无备注</span>";
	    	 }else {
	    		 return d.checkDateReason;
	    	 }}, sort: true}
		    ,{field: 'checkDate2', width:150,title: '二审日期',templet: function(d){
	    	 if(d.checkDate2=="" || d.checkDate2 ==null){
	    		 return "<span  style='color:lightgray'>暂未审核</span>";
	    	 }else {
	    		 return d.checkDate2;
	    	 }}, sort: true}
		    ,{field: 'checkDate2Reason', width:150,title: '一审备注',templet: function(d){
	    	 if(d.checkDate2Reason=="" || d.checkDate2Reason ==null){
	    		 return "<span  style='color:lightgray'>无备注</span>";
	    	 }else {
	    		 return d.checkDate2Reason;
	    	 }}, sort: true}
		    ,{field: 'purDate', width:150,title: '拨款日期',templet: function(d){
	    	 if(d.purDate=="" || d.purDate ==null){
	    		 return "<span  style='color:lightgray'>暂未拨款</span>";
	    	 }else {
	    		 return d.purDate;
	    	 }}, sort: true}
	         ,{fixed: 'right', title:'操作', toolbar: '#barDemo',width:140} 
               ] ],
              
              
         //回调函数 在表格渲染完成后 执行 用num判断  让它只在页面加载时执行一次   点击上一页下一页不执行
		done : function(res) {
		        /* 
		        $("[data-field='checkDate']").children().each(function(){
				if($(this).text()==''){	
					 $(this).text("暂未审核")
					 $(this).css({"color":"lightgray"})	
				} 	
			 	  	});
		        $("[data-field='checkDate2']").children().each(function(){
				if($(this).text()==''){	
					 $(this).text("暂未审核")
					  $(this).css({"color":"lightgray"})	
				} 	
			 	  	});
		        $("[data-field='checkDateReason']").children().each(function(){
				if($(this).text()==''){	
					 $(this).text("无备注")	
					  $(this).css({"color":"lightgray"})
				} 	
			 	  	});
		        $("[data-field='checkDate2Reason']").children().each(function(){
				if($(this).text()==''){	
					 $(this).text("无备注")	
					  $(this).css({"color":"lightgray"})	
				} 	
			 	  	});
			 	
			 	$("[data-field='purDate']").children().each(function(){
				if($(this).text()==''){	
					 $(this).text("暂未拨款")	
					  $(this).css({"color":"lightgray"})
				} 	
			 	  	});
			 	  	  	
		        $("[data-field='Stauts']").children().each(function(){
				if($(this).text()=='0'){	
					 $(this).text("未审核")	
				}else if($(this).text()=='1'){		
					$(this).text("一审通过")	
					}else if($(this).text()=='2'){	
						 $(this).text("一审驳回")		
						}else if($(this).text()=='3'){
								  $(this).text("已拨款")
								  			}else if($(this).text()=='4'){
								  			   $(this).text("已入库");
								  			}else if($(this).text()=='5'){
								  			   $(this).text("二审通过");
								  			}else if($(this).text()=='6'){
								  			   $(this).text("二审驳回");
								  			} 	
								  					});*/
		  if(num==0){
		  tool($("#ipt").val(),res.count);  //调用tool()函数   启用分页条  并传总数据数  res.count 
		  num+=1;
		  }
		}
	});
  /*  */
     
  /*  */
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
			       ,{field: 'supName', width:170,title: '供货商名称', sort: true}
			      ,{field: 'whName', width:148,title: '录入仓库'} 
			    ]]
			  });  
	    
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