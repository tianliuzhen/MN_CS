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
 
#table_stock_before{ 
   border:1px solid #cad9ea; 
      color:#666;}
#table_stock_before th { 
       background-repeat::repeat-x; 
          height:40px;}
 #table_stock_before th,#table_stock_before td{  
            border:1px solid #cad9ea;
                padding:0 1em 0;
                width:280px;
                 height:40px;
                 text-align:center;
                }
 #table_stock_before   tr { 
                   background-color:#f5fafe;}
 
 #addWh{
	width:400px;
}
#addWh td{
	
	height:20px;
	margin-bottom:0px;
}
#addWh td input{
	height:40px;
	width:300px;

}                  
 
 
  
.layui-table img {
    max-width: 48px;min-height: 48px;
}

 select{
  
  height:40px;
 }
</style>
</head>
<body style="background-color: #ececec;padding:20px;padding-top: 0px;">
  </br>
<!-- 模态框（Modal） -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="width:500px;left:800px;">
	<div class="modal-dialog"  >
		<div class="modal-content"  >
			<div class="modal-header" id="top">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					更改列表
				</h4>
			</div>
			<div class="modal-body">
			<center>
			<form id="myForm" method="post">
				<table id="addWh">
				   <tr style="display:none">
				      <td>商品编号</td>
				      <td><input type="text"   id="add_spId" readonly></td>
				   </tr>
				   <tr>
				      <td>商品名称</td>
				      <td><input type="text"   id="add_spName" readonly>
				      </td>
				   </tr>
				  
				   <tr  >
				      <td>商品类型</td>
				      <td>
						      <select id="spt_sel"  >
						      
						   </select>  
                        </td>
				   </tr>
				   <tr>
				      <td>进价</td>
				      <td><input type="text"   id="add_spBuyPrice"   ></td>
				   </tr>
				   <tr>
				      <td>售价</td>
				      <td><input type="text"   id="add_spSalePrice"   ></td>
				   </tr>
				   
				   
				    <tr>
				      <td>供货商</td>
				      <td>
                          
						   <select id="sup_sel"  >
						      
						   </select>  
                      </td>
				   </tr>
				</table>
				</form>
				</center>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary"  onclick="upd_spinfo()"> 
					确认修改
				</button>
				<button type="button" class="btn btn-default" id="closetan" data-dismiss="modal">关闭
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>


	</div>
		<div style="background-color: #fff;padding: 20px;">
	<div id="title">
		<ul  >
		<h3  >&nbsp;&nbsp;商品属性操作</h3>
		</ul>
	 </div></br>
	<div id="serch">
		<input type="text" id="ipt" placeholder="商品名称查询" onkeyup="serch()">
          
  </div>
	 
	 
	<!-- layui表格渲染 -->
	<table class="layui-hide" id="myTab"></table>
	<div id="fenye"></div>
	   
	</div>
	<script type="text/html" id="barDemo">
     <button onclick="cli(this)"  class="layui-btn" data-toggle="modal" data-target="#myModal">更改</button>
    </script>
    
</body>
</html>
<script>
 var table = layui.table; //定义全局变量  方便使用layui的表格
var laypage = layui.laypage, layer = layui.layer; //定义全局变量  方便使用layui的分页条
var laydate = layui.laydate;
/*页面加载时查询数据  并且分页*/
$(function() {
	fenye("",1,10);  //调用layui表格
	tool();
	$('.layui-table').children().children().children('th').eq(3).css("display","none");
	 
});
var num=0;
function fenye(keyWord,pagenum,limit) {
	var tableins=table.render({
		id : 'myTab', //table的id
		elem : '#myTab',   //同上
		height : 430,  //表格的高度
		url :'stock/getspinfoalllay',
		where:{
			pageNum:pagenum,
			limit:limit,
			keyWord:keyWord,
			 
		},
		cols : [ [ 
		     {field: 'spId', title: '编号' ,width:90}
		    ,{field : 'spName',width:160, title :'商品名称' }
	        ,{field: 'spImage', width:160, title: '商品图片', sort: true,templet:
	                                   '<div><img src="{{ d.spImage}}"></div>'}
	        ,{field: 'sptId', width:160, title: '类型编号', sort: true,style:"display:none"}
	        ,{field: 'sptName',width:175,  title: '商品类型', sort: true }
		    ,{field: 'gmName', width:160, title: '单位'}
		   ,{field: 'gsName', width:160, title: '规格'}
		   ,{field: 'spBuyPrice', width:160, title: '进价'}
		   ,{field: 'spAllNum', width:160,title: '库存数量'}
		   ,{field: 'spSalePrice',width:160,  title: '售价'}
	         ,{fixed: 'right', title:'操作', toolbar: '#barDemo',width:180,} 
               ] ],
               
         //回调函数 在表格渲染完成后 执行 用num判断  让它只在页面加载时执行一次   点击上一页下一页不执行
		done : function(res) {
		      $('.layui-table').children().children().children('th').eq(3).css("display","none"); 
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
 var sel_ocId=0;   
var check_id=0;
//选择采购选项
function cli(obj){
         
	   $("#addWh input").val("");
	   $("#addWh select").val("");
     
        $("#add_spId").val($(obj).parent().parent().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().children().html());
        $("#add_spName").val($(obj).parent().parent().prev().prev().prev().prev().prev().prev().prev().prev().prev().children().html());
        $("#add_sptId").val($(obj).parent().parent().prev().prev().prev().prev().prev().prev().prev().children().html());
        var sptId_line=$(obj).parent().parent().prev().prev().prev().prev().prev().prev().prev().children().html();
        $("#add_sptName").val($(obj).parent().parent().prev().prev().prev().prev().prev().prev().children().html());
        var sptName_line=$(obj).parent().parent().prev().prev().prev().prev().prev().prev().children().html();
        $("#add_spBuyPrice").val($(obj).parent().parent().prev().prev().prev().children().html());
        $("#add_spSalePrice").val($(obj).parent().parent().prev().children().html());
      /*   $("#add_spBuyPrice").val("qina");
        $("#add_BuyNumber").val("shuliang");
        $("#ware_btn").val("cang");
        $("#sup_btn").val("gong");
         */
	    $("#ware_btn2").val(2);
        $("#sup_btn2").val(2);
         var sptId_ti=$(obj).parent().parent().prev().prev().prev().prev().prev().prev().prev().children().html()
        
       //查询所有供货商 
         $.ajax({
          url:"stock/getSupplier",
          type:"post",
          data:{ },
          dataType:"json",
            async:false,
          success:function(data){
               $("#sup_sel").html("");
            var option="";
                option+="<option selected='selected'>--请选择--</option>";
                 for(var i=0;i<data.length;i++){

                option+="<option value='"+data[i].supId+"'>"+data[i].supName+"</option>";
             }  
                $("#sup_sel").append(option);
          }     
        })
       //查询所有商品类型
         $.ajax({
          url:"stock/getspinfotype",
          type:"post",
          data:{ },
          dataType:"json",
            async:false,
          success:function(data){
               $("#spt_sel").html("");
            var option="";
//                option+="<option selected='selected'>--请选择--</option>";
                option+="<option value='"+sptId_line+"' >"+sptName_line+"</option>";
                 for(var i=0;i<data.length;i++){
                       if(data[i].sptId==sptId_line){
                          continue;
                       }
                option+="<option value='"+data[i].sptId+"'>"+data[i].sptName+"</option>";
             }  
                $("#spt_sel").append(option);
          }     
        })
     
} 
 
//绑定input enter事件  在input输入完成   按下回车  调用
function serch(){                //网页内按下回车触发
    if(event.keyCode==13)
    {  
      num=0;
    	fenye($("#ipt").val(),1,10);
    	$('.layui-table').children().children().children('th').eq(3).css("display","none");
    }
}
 function upd_spinfo(){
            $.ajax({
          url:"stock/upd_spinfo",
          type:"post",
          data:{spId:$("#add_spId").val(),sale:$("#add_spSalePrice").val(),buy:$("#add_spBuyPrice").val(),type:$("#spt_sel").val()},
          dataType:"json",
            async:false,
          success:function(data){
          alert("更改成功！");
              window.location.reload();
          }     
        })
     
         
 } 
   
</script>