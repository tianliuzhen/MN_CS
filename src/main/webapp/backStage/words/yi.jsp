<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'goodsShelf.jsp' starting page</title>
    
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
                            商品报溢<small>报溢商品.</small>
                        </h3>
                       
					</hr>
 
               
                        
                       
                                <table class="layui-table">
                                    <thead>
                                        <tr>
									  <th>仓库信息</th>
									  <th>商品信息</th> 
									  <th style="color: red">溢出数量</th>
									  <th>现有数量</th>
									  <th>操作人</th>
									
									  
								        </tr>
                                    </thead>
                                    <tbody>
                                     <tr>
                                      
                                            <td> 
                                            <input  id="sup_btn" type="text" class="validate" data-toggle="modal" data-target="#myModalgq" onkeydown="return false " style="height: 40px;">
                                            <input  id="sup_btn2" type="hidden" >
                                            </td>
                                            <td> 
                                                <input   id="ware_btn" type="text" class="validate" data-toggle="modal" data-target="#myModaler" onclick="sp()" onkeydown="return false" style="height: 40px;">
                                                <input  id="ware_btn2" type="hidden" >
                                            </td>
                                            <td> 
                                            <input  id="sl_btn" type="text" class="validate" style="height: 40px;">
                                            <input  id="sl_btn2" type="hidden" >
                                            </td>
                                            <td> 
                                            <input  id="num_btn" type="text" class="validate" onkeydown="return false" style="height: 40px;">
                                            <input  id="num_btn2" type="hidden" >
                                            </td>
                                            <td> 
                                            <input  id="na_btn" type="text"onkeydown="return false" class="validate"  value="${relaname}" style="height: 40px;">
                                            <input  id="na_btn2" type="hidden" >
                                            </td>
                                    </tr>
 <input type="hidden" id="pp">
 <input type="hidden" id="ll">
  <input type="hidden" id="kk">

                                    
                                    </tbody>
                                </table>
                       
                         
               <center><div style="position: relative; top: 300px;"><button type="button" class="btn btn-primary" onclick="btu()" style="width: 200px;height: 60px;">提交更改</button> </div>  </center> 
            
<!-- 仓库模态 -->
          <div class="modal fade" id="myModalgq" tabindex="-1"  role="dialog"  aria-labelledby="myModalLabel" aria-hidden="true" style="width: 1300px;height:600px;left: 500px;top: 150px;display: none">
		<div class="modal-dialog">
			
				<div class="modal-header" id="top">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h3 class="modal-title" id="myModalLabel">仓库列表</h3>
				</div>
				
			<div class="modal-body">
					<table class="layui-hide" id="test" >
			

  <div id="serch">
<input type="text" id="ipt" placeholder="请输入内容"  v-on:keyup.enter="serch(this)">
</div>
	<table class="layui-hide" id="myTab"></table>
	<div id="fenye"></div>
	<script type="text/html" id="barDemo">
  <button class="layui-btn layui-btn-normal"   onclick='getpandone(this)'>选择</button>
</script>
    </div>
	</table>
	</div>
  
</div>

</div>
   <!-- 商品模态 -->
             <div class="modal fade" id="myModaler" tabindex="-1"  role="dialog"  aria-labelledby="myModalLabel" aria-hidden="true" style="width: 1300px;left: 500px;height:500px;top: 150px;display: none">
		<div class="modal-dialog">
			
				<div class="modal-header" id="top">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h3 class="modal-title" id="myModalLabel">仓库列表</h3>
				</div>
				
			<div class="modal-body">
					<table class="layui-hide" id="test" >
  <div id="serche">
<input type="text" id="ipte" placeholder="请输入内容"  v-on:keyup.enter="serche(this)" style="height: 35px;">
</div>
	<table class="layui-hide" id="myTabe"></table>
	<div id="fenyee"></div>
	<script type="text/html" id="barDemoe">
  <button class="layui-btn layui-btn-normal" data-toggle='modal' data-target='#myModal'  onclick='getpandtwo(this)'>选择</button>
</script>
    </div>
	</table>
	</div>
  
</div>

</div>




	 
	
  
</body>

</html>

<script>

 Date.prototype.Format = function (fmt) { // author: meizz
    var o = {
        "M+": this.getMonth() + 1, // 月份
        "d+": this.getDate(), // 日
        "h+": this.getHours(), // 小时
        "m+": this.getMinutes(), // 分
        "s+": this.getSeconds(), // 秒
        "q+": Math.floor((this.getMonth() + 3) / 3), // 季度
        "S": this.getMilliseconds() // 毫秒
    };
    if (/(y+)/.test(fmt))
        fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
        if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
            return fmt;
} 

	var table = layui.table; //定义全局变量  方便使用layui的表格
	var laypage = layui.laypage, layer = layui.layer; //定义全局变量  方便使用layui的分页条
	/*页面加载时查询数据  并且分页*/
	$(function() {
	
      var re=$("#na_btn").val();

	$.ajax({
	    url:"seloff.action",
	    type:"post",
	    data:{RealName:re},
	    dataType:"json",
	     success:function(data){
	 
	
         $("#na_btn2").attr("value",data[0].ocId);
	     }
	      })
		fenye("",1,10); 
		
		       // 使用分页
	});
	var num=0;
	/*layui表格    传入三个参数   
	keyWord 模糊查询关键字
	pagenum 当前页
	limit   每页显示的条数
	*/
	function fenye(dept,pagenum,limit) {
	
		table.render({
			id : 'myTab', //table的id
			elem : '#myTab',   //同上
			height : 400,  //表格的高度
			url : 'dpr.action',
			where:{
			pageNum:pagenum,
			limit:limit,
			dept:dept,
			},
			cols : [ [ 
			/*表头  
			  checkbox：true  开启复选框
			  field : 你的列名
			  title : 你的标题  也就是 <th>
			  sort  : true   开启排序
			  edit: 'text'开启单元格编辑 	      tr+="<td>"+data[i].+"</td>";
                tr+="<td>"+data[i].+"</td>";
                tr+="<td>"+data[i].+"</td>";
                tr+="<td>"+data[i].+"</td>";
                tr+="<td>"+data[i].+"</td>";  */
			
			{field : 'whId',width:200,title : '编号',sort : true,}, 
			{field : 'whName',width:200,title : '名称',sort : true,}, 
			{field : 'whAddress',width:300,title : '地址',sort : true,}, 
			{field : 'whphone',width:300,title : '电话号码',sort : true,}, 
			{fixed: 'right',width:200, title:'操作', toolbar: '#barDemo',}
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
	
	//绑定input enter事件  在input输入完成   按下回车  调用
	new Vue({
	     el :"#serch",
	     methods:{
	        serch:function(){
	     
	             fenye($("#ipt").val(),1,10);
	        }
	     }
	});
     function getpandone(a) {
        var b= $(a).parent().parent().prev().prev().prev().children().html();
        var ww=$(a).parent().parent().prev().prev().prev().prev().children().html();

     $("#sup_btn").attr("value",b);
      $("#sup_btn2").attr("value",ww);
      $("#myModalgq").modal('hide');
      $("#ware_btn").val("");
         $("#num_btn").val("");
      
   	}
   	
   	
   		var table = layui.table; //定义全局变量  方便使用layui的表格
	var laypage = layui.laypage, layer = layui.layer; //定义全局变量  方便使用layui的分页条
	/*页面加载时查询数据  并且分页*/
	function sp() {
		fenyee("","",1,10); 

		       // 使用分页
	}
	var num=0;
	/*layui表格    传入三个参数   
	keyWord 模糊查询关键字
	pagenum 当前页
	limit   每页显示的条数
	*/
	function fenyee(re,whId,pagenum,limit) {
	var wh=$("#sup_btn2").val();
	
		table.render({
			id : 'myTabe', //table的id
			elem : '#myTabe',   //同上
			height : 500,  //表格的高度
			url : 'waresel.action',
			where:{
			pageNum:pagenum,
			limit:limit,
			re:re,
			whId:wh,
			},
			cols : [ [ 
			/*表头  
			  checkbox：true  开启复选框
			  field : 你的列名
			  title : 你的标题  也就是 <th>
			  sort  : true   开启排序
			  edit: 'text'开启单元格编辑 */
			
			{field : 'spId',width:111,title : '商品编号',sort : true,}, 
			{field : 'whName',width:120,title : '所属仓库',sort : true,}, 
			{field : 'spName',width:120,title : '商品名称',sort : true,}, 
			{field : 'rtPrice',width:100,title : '单价',sort : true,}, 
		{field : 'rtId',width:120,title : '库存ID',sort : true,}, 
			{field : 'whId',width:120,title : '仓库ID',sort : true,}, 
			
		{field : 'rtbegDate',width:150,title : '生产日期',sort : true,}, 
			{field : 'rtEndDate',width:150,title : '到期日期',sort : true,},
			{field : 'spAllNum',width:120,title : '总数量',sort : true,},  
			{fixed: 'right',width:110, title:'操作', toolbar: '#barDemoe',}
                   ] ],
               
             //回调函数 在表格渲染完成后 执行 用num判断  让它只在页面加载时执行一次   点击上一页下一页不执行
				done: function(res, curr, count){
	

			 
			}
		});
	

	}
			

	//绑定input enter事件  在input输入完成   按下回车  调用
	new Vue({
	     el :"#serche",
	     methods:{
	        serche:function(){
	   
	               fenyee($("#ipte").val(),$("#sup_btn2").val(),1,10);
	        }
	     }
	});
		function  getpandtwo(b) {
		    var b8=$(b).parent().parent().prev().children().html();
		    var b5=$(b).parent().parent().prev().prev().prev().prev().prev().children().html();
	  var b6=$(b).parent().parent().prev().prev().prev().children().html();
	 var b1= $(b).parent().parent().prev().prev().prev().prev().prev().prev().prev().children().html();
	  var b2= $(b).parent().parent().prev().prev().prev().prev().prev().prev().children().html();
      var b3=$(b).parent().parent().prev().prev().children().html();
       var b=$(b).parent().parent().prev().prev().prev().prev().prev().prev().prev().prev().prev().children().html();
   
  
$("#ll").val(b5)
	$("#pp").val(b2)
	$("#kk").val(b8)
          $("#ware_btn").attr("value",b1);
      $("#ware_btn2").attr("value",b);
          $.ajax({
           url:"selfo.action",
           type:"post",
           data:{"spId":b,"rtbegDate":b6,"rtEndDate":b3},
            dataType:"json",
            async:false,
             
          success:function(data){
   
     
           $("#num_btn").attr("value",data[0].rtNumber);
           
           }
         
          })
      $("#myModaler").modal('hide');
	}
	
	 function  btu() {
	
		  var real=$("#na_btn2").val();
		
		//当前系统时间
		 var time2 = new Date().Format("yyyy-MM-dd hh:mm:ss"); 

	//剩余数量
	 var aa=parseInt($("#num_btn").val()) + parseInt($("#sl_btn").val());

	  //获取损失数量	  
  var bb=$("#sl_btn").val();

//损失金额
 var ee=parseInt($("#pp").val());
   var ww=bb * ee;

  //仓库id
   var hh=$("#sup_btn2").val();

   //商品id
var da=$("#ware_btn2").val();
	var na=$("#na_btn").val();
var ll=$("#ll").val();
var kk=parseInt($("#kk").val());
var nn=parseInt(kk)+parseInt(bb)


  
if(real!="" && aa!="" && bb!="" && bb>0){
  $.ajax({
           url:"upsy.action",
           type:"post",
           data:{rtNumber:aa,rtid:ll},
            dataType:"json",
            async:false,
             success:function(data){
             }
             
            })
  jsonStb=[{"spid":da,"spAllNum":nn}]
                $.ajax({
	   url:"upsifo",
	    type:"post",
	    data:JSON.stringify(jsonStb),
	 contentType:"application/json;charset=utf-8", 
	    dataType:"json",
	 
	     success:function(data){
	
	     }
	      }); 
           var das= "{\"sspDate\":\""+time2+"\",\"whId\":\""+hh+"\",\"spId\":\""+da+"\",\"sspNum\":\""+aa+"\",\"sspDamageNum\":\""+bb+"\",\"sspLackMonery\":\""+ww+"\",\"ocId\":\""+real+"\"}";

   $.ajax({
	    url:"addstss.action",
	    type:"post",
 	   data:das,
	  /*   data:{sspDate:time2,whId:hh,spId:da,sspNum:aa,sspDamageNum:bb,sspLackMonery:ww,ocId:real}, */
       contentType:"application/json;charset=utf-8", 
	    dataType:"json",
	     success:function(data){
	     alert("记录成功，详情请看损溢记录")
	     window.location.href="backStage/words/sun.jsp";  
	     }
	      });
	 
	     }else{
     alert("输入有误")
	     return false;
	     } 
	}
   </script>

  
</body>

</html>
