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
    .sss{
    position: absolute;
    border: 1px;
    background-color: red;
    width: 100px;
    height: 200px;
    top:10px;
  
    }
</style>

<body style="background-color: #ececec;padding:20px;">
	<div style="background-color: #fff;padding: 20px;">
		      <h3 >
                            商品处理<small>退货申请通过处理.</small>
                        </h3>
                       
					</hr>
<!-- 模态框（Modal） -->

	<div class="modal fade" id="myModalgq" tabindex="-1" role="dialog"aria-labelledby="myModalLabel" aria-hidden="true" style="width: 1500px;left: 400px;top: 150px; display: none">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" id="top">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">商品退货单详情</h4>
				</div>
			
				<div id="content">
				<table class="layui-hide" id="test">
				<div class="layui-btn-group demoTable">

	 <div id="serchg">
	
	 
<input type="text" id="iptg" placeholder="请输入内容"  v-on:keyup.enter="serchg(this)" style="border: 0px;border-bottom-color: 1px solid gray;width: 300px;height: 35px;">
			<div class="layui-btn-group demoTable">
 <button class="layui-btn" data-type="getCheckData" onclick="mon()">退货</button>

	 <input id="bs" type="hidden"><br>
</div>
</div>
	<table class="layui-hide" id="myTabg"  lay-filter="demo">
	
	</table>
	
	<div id="fenyeg"></div>

	<script type="text/html" id="barDemog">
 <a class="layui-btn layui-btn-primary layui-btn-normal" lay-event="detail" data-toggle='modal' data-target='#myModalgq' onclick="ck(this)">查看</a>

</script>
				</table>
				</div>
				<div class="modal-footer" id="vue">
				
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
	<!-- 驳回记录 -->
		<div class="modal fade" id="myModalboh" tabindex="-1" role="dialog"aria-labelledby="myModalLabel" aria-hidden="true" style="width: 1500px;left: 400px;top: 150px;height:500px; display: none">
		<div class="modal-dialog">
			<div class="modal-content">
			<div class="modal-header" id="top">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h3 class="modal-title" id="myModalLabel">商品驳回单</h3>
				</div>
				<div id="content">
				<table class="layui-hide" id="test">
				<div class="layui-btn-group demoTable">

	<div id="serchb">
<input type="text" id="iptb" placeholder="请输入内容"  v-on:keyup.enter="serchb(this)" style="border: 0px;border-bottom-color: 1px solid gray;width: 300px;height: 35px;">

</div>
	<table class="layui-hide" id="myTabb"  lay-filter="demo"></table>
	<div id="fenyeb"></div>
	<script type="text/html" id="barDemob">
 <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail"  data-toggle='modal' data-target='#myModalbos' onclick='bo(this)'>查看</a>

</script>

				</table>
				</div>
	
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
	<!-- 驳回详情 -->
	<div class="modal fade" id="myModalbos"  tabindex="-1" role="dialog"  aria-labelledby="myModalLabel" aria-hidden="true" style="width: 1620px;left: 300px;height:500px;top: 150px; display: none">
		<div class="modal-dialog">
			<input id="bo" type="hidden"><br>
				<div class="modal-header" id="top">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h3 class="modal-title" id="myModalLabel">驳回商品详情</h3>
				</div>
		
		
				
	
			<div class="modal-body">
<div id="serchbo">
<input type="text" id="iptbo" placeholder="请输入内容"  v-on:keyup.enter="serchbo(this)" style="border: 0px;border-bottom-color: 1px solid gray;width: 300px;height: 35px;">

</div>
	<table class="layui-hide" id="myTabbo"  lay-filter="demo"></table>
	<div id="fenyebo"></div>
        
			</div>
		
	</div>
  
		<!-- /.modal-content -->
	
		<!-- /.modal -->
</div>

<input value="${relaname}" type="hidden" id="mi">
<input type="hidden" id="mi2">
<input id="bbb" type="hidden">
<div id="serch">
    <input type="text" id="ipt" placeholder="请输入时间进行查询"  v-on:keyup.enter="serch(this)" style="border: 0px;border-bottom-color: 1px solid gray;width: 300px;height: 35px;">
 <button class="layui-btn" style="float: right;" onclick="boh()" data-toggle='modal' data-target='#myModalboh'>驳回记录</button>
</div>
	
<table class="layui-hide" id="myTab"></table>

	<div id="fenye"></div>
	<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-primary layui-btn-normal" lay-event="detail" data-toggle='modal' data-target='#myModalgq' onclick="ck(this)">查看</a>

</script>
	
</body>
</html>
<script>
        	 $(function() {
                
		   var re=$("#mi").val();
	$.ajax({
	    url:"seloff.action",
	    type:"post",
	    data:{RealName:re},
	    dataType:"json",
	     success:function(data){
	    
	
         $("#mi2").val(data[0].ocId);
     
	     }
	      })
	})
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
		fenye("",1,10);  //调用layui表格
		        // 使用分页
	});
	var num=0;
	/*layui表格    传入三个参数   
	keyWord 模糊查询关键字
	pagenum 当前页
	limit   每页显示的条数
	*/
	function fenye(bsq,pagenum,limit) {
		table.render({
			id : 'myTab', //table的id
			elem : '#myTab',   //同上
			height : 650,  //表格的高度
		   url : 'selbsq.action',
	
			where:{
			pageNum:pagenum,
			limit:limit,
			bsq:bsq,
		
			},
			cols : [ [ 
			/*表头  
			  checkbox：true  开启复选框
			  field : 你的列名
			  title : 你的标题  也就是 <th>
			  sort  : true   开启排序
			  edit: 'text'开启单元格编辑*/
		    {field : 'bsId',width : 300,title : '退货单号',sort : true,}, 
		    {field : 'bsDate',width : 250,title : '退货日期',sort : true,}, 
		     {field : 'btauts',width : 200,title : '状态',sort : true,}, 
		     {field : 'checkDate',width : 300,title : '审核日期',sort : true,}, 
		       {field : 'NoReason',width : 310,title : '驳回原因',sort : true,}, 
		    {fixed: 'right', title:'操作', toolbar: '#barDemo', width:200}
                   ] ],
                     page: true,
             //回调函数 在表格渲染完成后 执行 用num判断  让它只在页面加载时执行一次   点击上一页下一页不执行
			done:function(res) {
		        
		        $("[data-field='NoReason']").children().each(function(){
				if($(this).text()==''){	
					 $(this).text("无原因")	
				}
								  					});
		$("[data-field='btauts']").children().each(function(){
				if($(this).text()=='1'){	
					 $(this).text("已通过")	
				}
								  					});
		}
		});
		
	

	}
		new Vue({
	     el :"#serch",
	     methods:{
	        serch:function(){
	             fenye($("#ipt").val(),1,10);
	        }
	     }
	});
	
	
	
	
	
	
	
	//通过数据
	
		var table = layui.table; //定义全局变量  方便使用layui的表格
	var laypage = layui.laypage, layer = layui.layer; //定义全局变量  方便使用layui的分页条
      function ck(a) {
         var ss=$(a).parent().parent().prev().prev().prev().prev().prev().children().html();
         $("#bs").val(ss)
  
		fenyeg("","",1,10); 
		 //调用layui表格
      // 使用分页
  
	}

	var num=0;
	/*layui表格    传入三个参数   
	keyWord 模糊查询关键字
	pagenum 当前页
	limit   每页显示的条数
	*/
	function fenyeg(bs,bsId,pagenum,limit) {

var ss=$("#bs").val()

		table.render({
			id : 'myTabg', //table的id
			elem : '#myTabg',   //同上
			height : 300,  //表格的高度
		     url : 'selsale.action',
			where:{
			pageNum:pagenum,
			limit:limit,
			bs:bs,
			bsId:ss,
			},
			cols : [ [ 
			/*表头  
			  checkbox：true  开启复选框
			  field : 你的列名
			  title : 你的标题  也就是 <th>
			  sort  : true   开启排序
			  edit: 'text'开启单元格编辑    */
			  {type:'checkbox',fixed : true,width : 100,LAY_CHECKED:true,}, 
		    {field : 'rtId',width : 150,title : '库存编号',sort : true,}, 
		      {field : 'rtNumber',width : 150,title : '库存数量',sort : true,},
		    {field : 'spAllNum',width : 100,title : '总数量',sort : true,}, 
		     {field : 'bsuNum',width : 150,title : '退货数量',sort : true,}, 
		    {field : 'bsuAllMonery',width : 150,title : '退货金额',sort : true,}, 
			{field : 'spName',width : 150,title : '商品名称',sort : true,}, 
			{field : 'rtPrice',width : 100,title : '价格',sort : true,}, 
			{field : 'whName',width : 130,title : '所在仓库',sort : true,}, 
			{field : 'whId',width : 150,title : '仓库编号',sort : true,}, 
			{field : 'glName',width : 150,title : '商品品牌',sort : false,}, 
			{field : 'spId',width : 150,title : '牌',sort : false,}, 
			{field : 'sptId',width : 150,title : 's牌',sort : false,}, 
			{field : 'bsId',width : 150,title : '订单编号',sort : false,}, 
			{field : 'rtEndDate',width : 150,title : '到期日期',sort : true,}, 
			{field : 'BsReason',width : 150,title : '退货原因',sort : true,},
			{field : 'sptName',width : 150,title : '类型名称',sort : true,edit: 'text'},
		
                   ] ],
                    page: true,

      
             //回调函数 在表格渲染完成后 执行 用num判断  让它只在页面加载时执行一次   点击上一页下一页不执行
		done: function(res, curr, count){
$("[data-field='spId']").css('display','none');
$("[data-field='whId']").css('display','none');
$("[data-field='sptId']").css('display','none');
$("[data-field='rtEndDate']").css('display','none');
$("[data-field='BsReason']").css('display','none');
$("[data-field='glName']").css('display','none');




}
			
		});


  
 
	}
	

	
		
		
  function mon(){ //获取选中数据

      var checkStatus = table.checkStatus('myTabg')
      ,data = checkStatus.data;
 ;

   for (var i in data){

           if(data.length>0 && data.length<100000000){
          
             var bb=data[i].spId;
               var ll=data[i].rtPrice;
                var dd=data[i].bsuNum;
             var kk=data[i].bsuAllMonery;
                  var ff=data[i].sptId;
                   var gg=data[i].whId;
              var oo=$("#mi2").val();
               var time2 = new Date().Format("yyyy-MM-dd");  
             var ww=$("#bs").val()
              var aa=data[i].rtId;
                var ee= data[i].rtNumber-data[i].bsuNum;
                var cc=data[i].bsId;
                var jj=data[i].BsReason;
             var xx=data[i].spAllNum;
             var xx1=xx-data[i].bsuNum
    
                 jsonStc=[{"spid":bb,"owuPrice":ll,"owuNum":dd,"owuAllMonery":kk,"sptId":ff,"owreason":jj,"whid":gg,"ocId":oo,"owDate":time2}];
                 jsonStr=[{"rtId":aa,"rtNumber":ee}];
                 jsonSta=[{"bsId":cc,"btauts":3}];
      jsonStb=[{"spid":bb,"spAllNum":xx1}]
                $.ajax({
	   url:"upsifo",
	    type:"post",
	    data:JSON.stringify(jsonStb),
	 contentType:"application/json;charset=utf-8", 
	    dataType:"json",
	 
	     success:function(data){
	
	     }
	      }); 
                          $.ajax({
                                 url:'uptuih.action',
                                 contentType:"application/json;charset=utf-8",
                                 type:"post",
                                 data:JSON.stringify(jsonStr),
                                 dataType:'json',
                             
                                 })  
                                   $.ajax({
                                 url:'uptuizt.action',
                                 contentType:"application/json;charset=utf-8",
                                 type:"post",
                                 data:JSON.stringify(jsonSta),
                                 dataType:'json',
                                
                                 })    
                                   $.ajax({
                                 url:'addck.action',
                                 contentType:"application/json;charset=utf-8",
                                 type:"post",
                                 data:JSON.stringify(jsonStc),
                                 dataType:'json',
                                 success:function(data){
                        
                                 }
                                 })     
                                   window.location.href="backStage/words/cl.jsp";                      
       }else{
  alert("请保单子的完整性")
return false;
}
    
}
    }


  
  $('.demoTable .layui-btn').on('click', function(){
    var type = $(this).data('type');
    active[type] ? active[type].call(this) : '';
  });
	/*渲染分页工具条
	  同样传入两个参数   关键字   总数据
	*/
 
	
	function toolg(bs,count) {

		laypage.render({
			elem : 'fenyeg',//分页条的作用域   页面中di'v的id
			count : count,  //总数据数
			limit:10,      //每页显示的条数
			layout : [ 'prev', 'page', 'next','limit','skip' ],
			jump : function(obj, first) {
			/*判断如果不是第一页执行里面的方法*/
				if (!first) {
				/*重新调用分页方法*/
					fenyeg($("#iptg").val(),obj.curr,obj.limit);
				}
			}
		});
	}
	//绑定input enter事件  在input输入完成   按下回车  调用
	new Vue({
	     el :"#serchg",
	     methods:{
	        serchg:function(){
	 
	             fenyeg($("#iptg").val(),$("#bs").val(),1,10);
	        }
	     }
	});


//驳回记录
var table = layui.table; //定义全局变量  方便使用layui的表格
	var laypage = layui.laypage, layer = layui.layer; //定义全局变量  方便使用layui的分页条
	/*页面加载时查询数据  并且分页*/
	function boh() {
		fenyeb("",1,10);  //调用layui表格
		         // 使用分页
	}
	var num=0;
	/*layui表格    传入三个参数   
	keyWord 模糊查询关键字
	pagenum 当前页
	limit   每页显示的条数
	*/
	function fenyeb(bsj,pagenum,limit) {
		table.render({
			id : 'myTabb', //table的id
			elem : '#myTabb',   //同上
			height : 300,  //表格的高度
		   url : 'selboj.action',
		
			where:{
			pageNum:pagenum,
			limit:limit,
			bsj:bsj,
		
			},
			cols : [ [ 
			/*表头  
			  checkbox：true  开启复选框
			  field : 你的列名
			  title : 你的标题  也就是 <th>
			  sort  : true   开启排序
			  edit: 'text'开启单元格编辑*/
		    {field : 'bsId',width : 300,title : '退货单号',sort : true,}, 
		    {field : 'bsDate',width : 200,title : '退货日期',sort : true,},
		    {field : 'NoReason',width : 280,title : '驳回原因',sort : true,}, 
		    {field : 'checkDate',width : 200,title : '驳回日期',sort : true,}, 
		    {field : 'btauts',width : 200,title : '状态',sort : true,},   
		    {fixed: 'right', title:'操作', toolbar: '#barDemob', width:200}
                   ] ],
                     page: true,
             //回调函数 在表格渲染完成后 执行 用num判断  让它只在页面加载时执行一次   点击上一页下一页不执行
			done:function(res) {
		        
		        $("[data-field='NoReason']").children().each(function(){
				if($(this).text()==''){	
					 $(this).text("无原因")	
				}
								  					});
								  					        
		        $("[data-field='btauts']").children().each(function(){
				if($(this).text()=='2'){	
					 $(this).text("已被驳回")	
				}
								  					});
								  					
		}
		});

	}
		new Vue({
	     el :"#serchb",
	     methods:{
	        serchb:function(){
	             fenyeb($("#iptb").val(),1,10);
	        }
	     }
	});
	
	
	
	
	var table = layui.table; //定义全局变量  方便使用layui的表格
	var laypage = layui.laypage, layer = layui.layer; //定义全局变量  方便使用layui的分页条
      function bo(a) {
         var bo=$(a).parent().parent().prev().prev().prev().prev().prev().children().html();
         
           $("#bo").val(bo)
		fenyebo("","",1,10); 
		 //调用layui表格
      // 使用分页
  
	}

	var num=0;
	/*layui表格    传入三个参数   
	keyWord 模糊查询关键字
	pagenum 当前页
	limit   每页显示的条数
	*/
	function fenyebo(bs,bsId,pagenum,limit) {
	var bo=$("#bo").val()

		table.render({
			id : 'myTabbo', //table的id
			elem : '#myTabbo',   //同上
			height : 300,  //表格的高度
		     url : 'selsale.action',
			where:{
			pageNum:pagenum,
			limit:limit,
			bs:bs,
			bsId:bo,
			},
			cols : [ [ 
			/*表头  
			  checkbox：true  开启复选框
			  field : 你的列名
			  title : 你的标题  也就是 <th>
			  sort  : true   开启排序
			  edit: 'text'开启单元格编辑    */
			
		    {field : 'rtId',width : 120,title : '库存编号',sort : true,}, 
		    {field : 'rtNumber',width : 150,title : '库存数量',sort : true,}, 
		     {field : 'bsuNum',width : 150,title : '退货数量',sort : true,}, 
		    {field : 'bsuAllMonery',width : 150,title : '退货金额',sort : true,}, 
			{field : 'spName',width : 150,title : '商品名称',sort : true,}, 
			{field : 'rtPrice',width : 100,title : '价格',sort : true,}, 
			{field : 'whName',width : 130,title : '所在仓库',sort : true,}, 
			{field : 'whId',width : 150,title : '仓库编号',sort : true,}, 
			{field : 'glName',width : 150,title : '商品品牌',sort : false,}, 
			{field : 'spId',width : 150,title : '牌',sort : false,}, 
			{field : 'sptId',width : 150,title : 's牌',sort : false,}, 
			{field : 'bsId',width : 150,title : '订单编号',sort : false,}, 
			{field : 'rtEndDate',width : 150,title : '到期日期',sort : true,}, 
			{field : 'BsReason',width : 150,title : '退货原因',sort : true,},
			{field : 'sptName',width : 150,title : '类型名称',sort : true,edit: 'text'},
		
                   ] ],
                    page: true,

      
             //回调函数 在表格渲染完成后 执行 用num判断  让它只在页面加载时执行一次   点击上一页下一页不执行
		done: function(res, curr, count){
$("[data-field='spId']").css('display','none');
$("[data-field='whId']").css('display','none');
$("[data-field='sptId']").css('display','none');
$("[data-field='rtEndDate']").css('display','none');



}
			
		});


  
 
	}
	

	
	
	//绑定input enter事件  在input输入完成   按下回车  调用
	new Vue({
	     el :"#serchbo",
	     methods:{
	        serchbo:function(){
	        
	             fenyebo($("#iptbo").val(),$("#bo").val(),1,10);
	        }
	     }
	});
	

</script>
