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
</style>

<body style="background-color: #ececec;padding:20px;">
	<div style="background-color: #fff;padding: 20px;">
		      <h3 >
                            仓库商品退货<small>商品退货申请.</small>
                        </h3>
                       
					</hr>


				

		<input type="hidden" id="sss">
<!-- 模态框（Modal） -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="width:800px; height: 600px; left: 700px;display: none">
		<div class="modal-dialog" >
			<div class="modal-content" >
				<div class="modal-header" id="top">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h3 class="modal-title" id="myModalLabel">商品详情</h3>
				</div>
				<div id="content">
				<table class="layui-hide" id="test" >
				<input value="${relaname}" type="hidden" id="mi">
                <input  type="hidden" id="mi2">
				
			
			</div>
			<div class="modal-body" style=" height: 1400px;">
	
  
 <div class="layui-form-item">
 
    <label class="layui-form-label">订单编号</label>
    <div class="layui-input-block">
			<input style="height: 30px;width: 250px;" id="db" type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入标题" class="layui-input" style="width: 100px;" readonly="readonly"><br>
    </div>
  
 
    <div class="layui-form-item">
    <label class="layui-form-label">商品名称</label>
    <div class="layui-input-block">
			<input id="sm" type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入标题" class="layui-input"  style="height: 30px;width: 250px;"  readonly="readonly"><br>
    </div></div>
    <div class="layui-form-item">
    <label class="layui-form-label">退货人</label>
    <div class="layui-input-block">
			<input style="height: 30px;width: 250px;"  type="text" id="th" value="${relaname}" name="title" lay-verify="title" autocomplete="off" placeholder="请输入标题" class="layui-input"  readonly="readonly"><br>
    </div></div>
    <div class="layui-form-item">
    <label class="layui-form-label">所属仓库</label>
    <div class="layui-input-block">
			<input style="height: 30px;width: 250px;"  type="text" id="ck2"    lay-verify="title" autocomplete="off" placeholder="请输入标题" class="layui-input"  style="width: 100px;" readonly="readonly"><br>
    </div></div>
    <div class="layui-form-item">
    <label class="layui-form-label" style="color: red">退货数量</label>
    <div class="layui-input-block">
			<input style="height: 30px;width: 250px;"  type="text" id="sl"  name="title" lay-verify="title" autocomplete="off" placeholder="请输入退货数量 " class="layui-input"  style="width: 100px;"><br>
    </div>
    </div>
 <div class="layui-form-item layui-form-text">
    <label class="layui-form-label" style="color: red">退货原因</label>
    <div class="layui-input-block">
			<input style="height: 30px;width: 250px;"  type="text" id="yyin"  name="title" lay-verify="title" autocomplete="off" placeholder="请输入退货原因" class="layui-input"  style="width: 100px;"><br>
    </div>
</div>
    <div class="layui-form-item">
    <label style="color: red" class="layui-form-label">供货商选择</label>
    <div class="layui-input-block"> 
			<input style="height: 30px;width: 250px;" onkeydown="return false"  type="text" id="one"  name="title" lay-verify="title" autocomplete="off" placeholder="点击选择供货商" class="layui-input" data-toggle="modal" data-target="#myModaler" onclick="sp()" ><br>

    </div>
    </div>
       <!-- 仓库数量 --><input style="width: 100px;" id="rtm" type="hidden">
			<!--商品名id--><input style="width: 100px;" id="sid" type="hidden">
			<!-- 仓库ID --><input style="width: 100px;" id="ck" type="hidden">
				<!-- 单价 --><input style="width: 100px;" id="dj" type="hidden">
					<!-- 类型ID --><input style="width: 100px;" id="lid" type="hidden">
				<!-- 库存编号 -->	<input type="hidden" id="rts">
  </div>
		</div>
				</div>
				</table>
				</div>
				
				<div class="modal-footer" id="vue">
					<button type="button" class="btn btn-primary" onclick="btu()">保存</button>
					<button type="button" class="btn btn-default" onclick="btu2()">关闭 
					</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
	

	

	
	<!-- layui表格渲染 -->
		<div id="sercht">
		<input type="text" id="iptt" placeholder="请输入内容"
							v-on:keyup.enter="sercht(this)"
							style="border: 0px;border-bottom-color: 1px solid gray;width: 300px;height: 35px;">

					 <button class="layui-btn layui-btn-danger layui-btn-radius" data-toggle="modal" data-target="#myModalgq" onclick="gq()">过期警告</button>
					 <button class="layui-btn layui-btn-normal layui-btn-radius"  data-toggle="modal" data-target="#myModalww" onclick="tui()">退货单</button>
					
					</div>
					<table class="layui-hide" id="myTabt"></table>
					<div id="fenyet"></div>
					<script type="text/html" id="barDemot">

   <button class="layui-btn layui-btn-sm layui-btn-normal" data-toggle='modal' data-target='#myModal'  onclick='cli(this)'>加入退货单</button>                    
 </script>
 </div>
 
<!-- 过期模态 -->
<div class="modal fade" id="myModalgq" tabindex="-1"  role="dialog"  aria-labelledby="myModalLabel" aria-hidden="true" style="width: 1300px;left: 500px;top: 150px;display: none">
		<div class="modal-dialog">
			
				<div class="modal-header" id="top">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h3 class="modal-title" id="myModalLabel">过期商品集合</h3>
				</div>
		
		
				
	
			<div class="modal-body" style="height: 600px;">
					<table class="layui-hide" id="test" >
				<input value="${relaname}" type="hidden" id="mi">
                <input  type="hidden" id="mi2">
	     <input id="bs" type="hidden"><br>

	 <div id="serchg">
<input type="text" id="iptg" placeholder="请输入内容"  v-on:keyup.enter="serchg(this)" style="border: 0px;border-bottom-color: 1px solid gray;width: 300px;height: 35px;">
<div class="layui-btn-group demoTable">

<button class="layui-btn layui-btn-normal layui-btn-radius" data-type="getCheckData" onclick="mob()">退货</button>
</div>
</div>
	<table class="layui-hide" id="myTabg"  lay-filter="demo"></table>
	<div id="fenyeg"></div>
    </div>
	</table>
	</div>
  
		<!-- /.modal-content -->
	
		<!-- /.modal -->
</div>
<!-- sssssssssssss -->
	<!-- 退货单模态 -->
<div class="modal fade" id="myModalww"  tabindex="-1" role="dialog"  aria-labelledby="myModalLabel" aria-hidden="true" style="width: 1500px;left: 350px;top: 150px; display: none">
		<div class="modal-dialog">
			
				<div class="modal-header" id="top">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h3 class="modal-title" id="myModalLabel">商品退货单详情</h3>
				</div>
		
		
				
	
			<div class="modal-body">
<div id="serch">
<input type="text" id="ipt" placeholder="请输入内容"  v-on:keyup.enter="serch(this)">
<!-- 退货ID --><input style="width: 100px;" id="t1" type="hidden">
<input style="width: 100px;" id="t2" type="hidden">
<input style="width: 100px;" id="t3" type="hidden">
</div>
	<table class="layui-hide" id="myTab"></table>
	<div id="fenye"></div>
	<script type="text/html" id="barDemo">
  <button class="layui-btn layui-btn-xs" data-toggle='modal' data-target='#myModalss'  onclick='one(this)'>编辑</button>
<button class="layui-btn layui-btn-xs"  onclick='two(this)'>移除</button>
</script>

        
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<button type="button" class="btn btn-primary" onclick="utd()">
					提交更改
				</button>
	</div>
  
		<!-- /.modal-content -->
	
		<!-- /.modal -->
</div>

</div>
</div>





<!-- 修改商品信息 -->
<div class="modal fade" id="myModalss" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="width:700px; height: 400px; left: 700px;display: none">
		<div class="modal-dialog"style=" height: 800px;" >
			<div class="modal-content" >
				<div class="modal-header" id="top">
					<button type="button" class="close" 
						aria-hidden="true"  onclick="aa()">&times;</button>
					<h3 class="modal-title" id="myModalLabel">退货修改</h3>
				</div>
				<div id="content">
				<table class="layui-hide" id="test" >
				<input value="${relaname}" type="hidden" id="mi">
                <input  type="hidden" id="mi2">
				
			
			</div>
			<div class="modal-body">
	
  
 <input type="hidden" id="pp">
  <div class="layui-form-item">
    <label class="layui-form-label"><b>商品名称</b></label>
    <div class="layui-input-block"  style="width: 300px">
      <input type="text" name="title" style="height: 35px;width: 250px;" lay-verify="title" autocomplete="off" class="layui-input" id="mm1" readonly="readonly">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label"><b style="color: red">退货数量</b></label>
    <div class="layui-input-block" style="width: 100px">
      <input type="text" name="username" style="height: 35px;width: 250px;" lay-verify="required"  autocomplete="off" class="layui-input" id="numb">
        <input  id="numc" type="hidden">
    </div>
  </div>
  <div class="layui-form-item layui-form-text">
    <label class="layui-form-label"><b style="color: red">退货原因</b></label>
    <div class="layui-input-block">
      <textarea placeholder="请输入内容" class="layui-textarea" id="numa"></textarea>
    </div>
  </div>
  
  <div class="layui-form-item">
    <div class="layui-input-block">
   <button type="button" class="btn btn-primary"  onclick="xiu()">
					提交更改
				</button>
      <button type="button"  class="btn btn-default" onclick="aa()">关闭</button>
    </div>
    
  </div>

  </div>
		
	      
	   
				
				</div>
				</table>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
    
    
    
     <div class="modal fade" id="myModaler" tabindex="-1"  role="dialog"  aria-labelledby="myModalLabel" aria-hidden="true" style="width: 800px;left: 800px;height:500px;top: 150px;display: none">
		<div class="modal-dialog">
			
				<div class="modal-header" id="top">
		
					<h3 class="modal-title" id="myModalLabel">供货商列表</h3>
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
 layer.config({
  skin: 'demo-class',
  offset: ['100px', '50px']
})
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
		fenyet("",1,10);  //调用layui表格
		toolt();          // 使用分页
	});
	var num=0;
	/*layui表格    传入三个参数   
	keyWord 模糊查询关键字
	pagenum 当前页
	limit   每页显示的条数
	*/
	function fenyet(jia,pagenum,limit) {
		table.render({
			id : 'myTabt', //table的id
			elem : '#myTabt',   //同上
			height :570,  //表格的高度
		   url : 'seltui.action',
			where:{
			pageNum:pagenum,
			limit:limit,
			jia:jia,
			},
			cols : [ [ 
			/*表头  
			  checkbox：true  开启复选框
			  field : 你的列名
			  title : 你的标题  也就是 <th>
			  sort  : true   开启排序
			  edit: 'text'开启单元格编辑    */
		    {field : 'rtId',width:100,title : '库存编号',sort : true,}, 
		    {field : 'rtNumber',width:120,title : '库存数量',sort : true,}, 
			{field : 'spName',width:120,title : '商品名称',sort : true,}, 
			{field : 'rtPrice',width:120,title : '价格',sort : true,}, 
			{field : 'whName',width:120,title : '所在仓库',sort : true,}, 
			{field : 'gsName',width:120,title : '商品规格',sort : true,}, 
			{field : 'glName',width:120,title : '商品品牌',sort : true,}, 
			{field : 'gmName',width:120,title : '计量单位',sort : true,},
			{field : 'rtbegDate',width:150,title : '生产日期',sort : true,}, 
				{field : 'rtEndDate',width:150,title : '到期日期',sort : true,}, 
			{field : 'sptName',width:150,title : '类型名称',sort : true,edit: 'text'},
			{fixed: 'right',width:150, title:'操作', toolbar: '#barDemot'}
                   ] ],
             //回调函数 在表格渲染完成后 执行 用num判断  让它只在页面加载时执行一次   点击上一页下一页不执行
			done : function(res) {
			  if(num==0){
			
			  toolt($("#iptt").val(),res.count);  //调用tool()函数   启用分页条  并传总数据数  res.count 
			  num+=1;
			  }
			}
		});
	}
	/*渲染分页工具条
	  同样传入两个参数   关键字   总数据
	*/

	function toolt(jia,count) {
	
		laypage.render({
			elem : 'fenyet',//分页条的作用域   页面中di'v的id
			count : count,  //总数据数
			limit:10,      //每页显示的条数
			layout : [ 'prev', 'page', 'next','limit','skip' ],
			jump : function(obj, first) {
			/*判断如果不是第一页执行里面的方法*/
				if (!first) {
				/*重新调用分页方法*/
					fenyet($("#iptt").val(),obj.curr,obj.limit);
				}
				
			}
		});
	}
	//绑定input enter事件  在input输入完成   按下回车  调用
	new Vue({
	     el :"#sercht",
	     methods:{
	        sercht:function(){
	             fenyet($("#iptt").val(),1,10);
	        }
	     }
	});
//过期
	
	
$(function() {
		fenyeg("",1,10);  //调用layui表格
      // 使用分页
      $.ajax({
           url:"selbs.action",
           type:"post",
            dataType:"json",
            async:false,
          success:function(data){
          $("#bs").val(data[0].bsId)
        
          }})
	})
	var num=0;
	/*layui表格    传入三个参数   
	keyWord 模糊查询关键字
	pagenum 当前页
	limit   每页显示的条数
	*/
	function fenyeg(gq,pagenum,limit) {
		table.render({
			id : 'myTabg', //table的id
			elem : '#myTabg',   //同上
			height : 300,  //表格的高度
			
		   url : 'selgq.action',
			where:{
			pageNum:pagenum,
			limit:limit,
			gq:gq,
			},
			cols : [ [ 
			/*表头  
			  checkbox：true  开启复选框
			  field : 你的列名
			  title : 你的标题  也就是 <th>
			  sort  : true   开启排序
			  edit: 'text'开启单元格编辑    */
			  {type:'checkbox',width:110,fixed : true,checkbox:true}, 
		    {field : 'rtId',width:120,title : '库存编号',sort : true,}, 
		    {field : 'rtNumber',width:120,title : '库存数量',sort : true,}, 
			{field : 'spName',width:150,title : '商品名称',sort : true,}, 
			{field : 'rtPrice',width:150,title : '价格',sort : true,}, 
			{field : 'whName',width:150,title : '所在仓库',sort : true,}, 
			{field : 'whId',width:150,title : '仓库编号',sort : true,}, 
			{field : 'glName',width:150,title : '商品品牌',sort : false,}, 
			{field : 'spId',width:150,title : '牌',sort : false,}, 
			{field : 'sptId',width:150,title : '类型编号',sort : false,}, 
			{field : 'rtbegDate',width:150,title : '生产日期',sort : true,}, 
		
			{field : 'sptName',width:135,title : '类型名称',sort : true,edit: 'text'},
			
                   ] ],
                    page: true,

      
             //回调函数 在表格渲染完成后 执行 用num判断  让它只在页面加载时执行一次   点击上一页下一页不执行
		done: function(res, curr, count){
$("[data-field='spId']").css('display','none');
$("[data-field='whId']").css('display','none');
$("[data-field='sptId']").css('display','none');
}
			
		});

	}
 
 function mob(){ //获取选中数据

      var checkStatus = table.checkStatus('myTabg'),
      data = checkStatus.data;
      if(data!=""){
  
       for (var i in data){

             var ww=$("#bs").val()
              var aa=data[i].rtId;
                var bb=data[i].spId;
               var cc=data[i].rtPrice;
                var dd=data[i].rtNumber;
                var ee= data[i].rtPrice* data[i].rtNumber;
                  var ff=data[i].sptId;
                   var gg=data[i].whId;
              var oo=$("#mi2").val();
               var time2 = new Date().Format("yyyy-MM-dd");  
        
                 jsonStr=[{"spid":bb,"owuPrice":cc,"owuNum":dd,"owuAllMonery":ee,"sptId":aa,"owreason":"过期","whid":gg,"ocId":oo,"owDate":time2}];
                  jsonSta=[{"rtId":aa}];
     
                
                         $.ajax({
                             url:'addck.action',
                                 contentType:"application/json;charset=utf-8",
                                 type:"post",
                                 data:JSON.stringify(jsonStr),
                                 dataType:'json',
                                 success:function(data){
                        
                                 }
                                 })
                                   $.ajax({
                             url:'delgq.action',
                                 contentType:"application/json;charset=utf-8",
                                 type:"post",
                                 data:JSON.stringify(jsonSta),
                                 dataType:'json',
                                 success:function(data){
                        
                                 }
                                 })
                   
         }
                                
    window.location.href="backStage/words/depot.jsp"; 
     }else{
     alert("未选择商品")
     }
   

  };
  
  $('.demoTable .layui-btn').on('click', function(){
    var type = $(this).data('type');
    active[type] ? active[type].call(this) : '';
  });

	
	/*渲染分页工具条
	  同样传入两个参数   关键字   总数据
	*/
 
	
	function toolg(gq,count) {

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
	             fenyeg($("#iptg").val(),1,10);
	        }
	     }
	});

   //过期  


function cli(a) {
    var ss= $(a).parent().parent().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().children().html();
    var ss1= $(a).parent().parent().prev().prev().children().html();
     var ss2= $(a).parent().parent().prev().prev().prev().children().html();



		  $.ajax({
           url:"selbs.action",
           type:"post",
            dataType:"json",
            async:false,
          success:function(data){
          $("#db").val(data[0].bsId) 
          	  $.ajax({
           url:"gettone.action",
           type:"post",
           data:{rtid:ss,rtbegDate:ss2,rtEndDate:ss1},
            dataType:"json",
            async:false,
         success:function(data){


         $("#rts").val(data[0].rtId)
          $("#rtm").val(data[0].rtNumber)
        $("#sid").val(data[0].spId);
        $("#sm").val(data[0].spName);
         $("#ck").val(data[0].whId);
          $("#ck2").val(data[0].whName)
          $("#dj").val(data[0].rtPrice)
         $("#lid").val(data[0].sptId)
       
         
      }

   })
          }
         
 })  
}

function btu() {

var aa=$("#db").val();
var bb=$("#sid").val();
var cc=$("#dj").val();
var dd=parseInt($("#sl").val());
var ee=cc*dd;
var ff=$("#lid").val();
var gg=$("#yyin").val();
var hh=$("#ck").val();
var ii=$("#mi2").val();
var jj=$("#one").val();
 var rtm=parseInt($("#rtm").val());
 var rts=$("#rts").val();


  $.ajax({
           url:"selpan.action",
           type:"post",
            dataType:"json",
            data:{spid:bb},
            async:false,
          success:function(data){
 
      if(data[0].dd>0){

      alert("该商品已添加过了，详情请查看退货单")
  return false;
      }else{

      if(dd>0 && gg!="" && dd!="" && gg!=""  && jj!="" && dd<rtm && rts!=""){

        $.ajax({
           url:"addback.action",
           type:"post",
           contentType: "application/x-www-form-urlencoded; charset=UTF-8",
           data:{"bsId":aa,"spid":bb,"bsuPrice":cc,"bsuNum":dd,"bsuAllMonery":ee,"sptId":ff,"BsReason":gg,"whid":hh,"bsgName":jj,"rtId":rts},
            dataType:"json",
            async:false,
                success:function(data){
         
                   $.ajax({
           url:"addback.action",
           type:"post",
           data:{ocId:ii,btauts:0},
            dataType:"json",
            async:false,
            
            });
                 window.location.href="backStage/words/depot.jsp";  
                }
            })  

   	 }else{
   	 alert("对不起！您输入有误！退货数量 不能大于库存数量!")
   	 return false;
   	 } 
      }
        }
   
       
          }) 


}


var table = layui.table; //定义全局变量  方便使用layui的表格
	var laypage = layui.laypage, layer = layui.layer; //定义全局变量  方便使用layui的分页条
	
	 
	/*页面加载时查询数据  并且分页*/
	function tui() {
	   $.ajax({
           url:"selbs.action",
           type:"post",
            dataType:"json",
            async:false,
          success:function(data){
        
          $("#t1").val(data[0].bsId)
          
          },
       
          }) 
	fenye("","",1,10);  //调用layui表格
	         // 使用分页
	};
	var num=0;
	/*layui表格    传入三个参数   
	keyWord 模糊查询关键字
	pagenum 当前页
	limit   每页显示的条数
	*/
	function fenye(tui,bsId,pagenum,limit) {
	 var ss=$("#t1").val()
      var ff1=$("#t2").val()
      var ff2=$("#t3").val()
    
		table.render({
			id : 'myTab', //table的id
			elem : '#myTab',   //同上
			height : 300,  //表格的高度
			url : 'seltd.action',
			where:{
			pageNum:pagenum,
			limit:limit,
			tui:tui,
		    bsId:ss,
			},
		
			cols : [ [ 
			/*表头  
			  checkbox：true  开启复选框
			  field : 你的列名
			  title : 你的标题  也就是 <th>
			  sort  : true   开启排序
			  edit: 'text'开启单元格编辑    */
		
			{field : 'bsId',width:150,title : '退货单号',sort : true,}, 
			{field : 'rtId',width:120,title : '库存编号',sort : true,}, 
			{field : 'spName',width:120,title : '商品名称',sort : true,}, 
			{field : 'bsuNum',width:120,title : '退货数量',sort : true,}, 
			{field : 'bsuUtilId',width:120,title : '商品退货编号',sort : true,}, 
			{field : 'bsuPrice',width:100,title : '单价',sort : true,}, 
			{field : 'whName',width:150,title : '所在仓库',sort : true,}, 
		    {field : 'rtNumber',width:100,title : '库存数量',sort : true,}, 
			{field : 'bsuAllMonery',width:100,title : '退货总价',sort : true,}, 
			{field : 'BsReason',width:150,title : '原因',sort : true,}, 
			{field : 'bsgName',width:100,title : '供货商',sort : true,}, 
		
			{fixed: 'right',width:100, title:'操作', toolbar: '#barDemo',}
                   ] ],
                 page: true,   
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
	function tool(tui,count) {

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
	
	             fenye($("#ipt").val(),$("#t1").val(),1,1);
	        }
	     }
	});

function utd() {

 var ss=$("#t1").val()

 var time2 = new Date().Format("yyyy-MM-dd");  

 $.ajax({
           url:"uptd.action",
           type:"post",
           data:{bsId:ss,bsDate:time2},
            dataType:"json",
            async:false,
            success:function(data){
        
               $.ajax({
           url:"addsale.action",
           type:"post",
           data:{ocId:1,btauts:4},
            dataType:"json",
            async:false,
            success:function(data){
            
            }
            
            })
               window.location.href="backStage/words/depot.jsp";  
            }
            
            }) 
}

function one(b) {
    var ss= $(b).parent().parent().prev().prev().prev().prev().prev().prev().prev().prev().prev().children().html();
    var ii=$(b).parent().parent().prev().prev().prev().prev().prev().prev().prev().prev().children().html();
     var oo=$(b).parent().parent().prev().prev().prev().prev().prev().prev().prev().children().html();
       var qq=$(b).parent().parent().prev().prev().children().html();
        var pp=$(b).parent().parent().prev().prev().prev().prev().children().html();
		$("#mm1").val(ss)
     $("#numa").val(qq);
     $("#numb").val(ii);
      $("#pp").val(oo);
      $("#numc").val(pp);

}
function xiu(){
	var x1= $("#pp").val();
    var x2=$("#numa").val();
     var x3=$("#numb").val();
     var x4=$("#numc").val();
 
     if(parseInt(x3)<parseInt(x4) && x3!=="" && x2!==""){
    $.ajax({
           url:"upback.action",
           type:"post",
             contentType: "application/x-www-form-urlencoded; charset=UTF-8",
           data:{bsuUtilId:x1,BsReason:x2,bsuNum:x3},
            dataType:"json",
            success:function(data){
            $("#myModalss").modal('hide');
             tui();
            }
            })
       }else{
       	 alert("对不起！您输入有误！")
      
       return  false;
       
       }
         
}
function  two(b) {
 var oo=$(b).parent().parent().prev().prev().prev().prev().prev().prev().prev().children().html();

 
	   $.ajax({
           url:"delback.action",
           type:"post",
           data:{bsuUtilId:oo},
            dataType:"json",
            async:false,
            success:function(data){
            tui();
            }
            })
}
   $(function(){
        $.ajax({
url:"selgh.action",
contentType:"application/json;charset=utf-8",
type:"post",
dataType:"json",
success:function(data){
var b="";
for(var i=0;i<data.length;i++){
  b+="<option value='"+data[i].supName+"'>"+data[i].supName+"</option>"
}
$("#one").append(b);

}


});
   });
function aa() {
$("#myModalss").modal('hide');
	
}
function vv() {
$("#myModaler").modal('hide');

}



var table = layui.table; //定义全局变量  方便使用layui的表格
	var laypage = layui.laypage, layer = layui.layer; //定义全局变量  方便使用layui的分页条
	/*页面加载时查询数据  并且分页*/
	function sp() {
		fenyee("",1,10); 
		       // 使用分页
		         $("#myModal").modal('hide');
	}
	var num=0;
	/*layui表格    传入三个参数   
	keyWord 模糊查询关键字
	pagenum 当前页
	limit   每页显示的条数
	*/
	function fenyee(su,pagenum,limit) {

	
		table.render({
			id : 'myTabe', //table的id
			elem : '#myTabe',   //同上
			height : 250,  //表格的高度
			url : 'selghw.action',
			where:{
			pageNum:pagenum,
			limit:limit,
			su:su,
			},
			cols : [ [ 
			/*表头  
			  checkbox：true  开启复选框
			  field : 你的列名
			  title : 你的标题  也就是 <th>
			  sort  : true   开启排序
			  edit: 'text'开启单元格编辑 */
		
			{field : 'supName',width:150,title : '供货商名称',sort : true,}, 
			{field : 'supAddress',width:180,title : '地址',sort : true,}, 
			{field : 'supPhone',width:150,title : '电话',sort : true,}, 
			{field : 'supState',width:150,title : '创建时间',sort : true,}, 
			{fixed: 'right',width:100, title:'操作', toolbar: '#barDemoe',}
                   ] ],
               
             //回调函数 在表格渲染完成后 执行 用num判断  让它只在页面加载时执行一次   点击上一页下一页不执行
			done : function(res) {
			  if(num==0){
			  toole($("#ipte").val(),res.count);  //调用tool()函数   启用分页条  并传总数据数  res.count 
			  num+=1;
			  }
			}
		});
	

	}
			

	//绑定input enter事件  在input输入完成   按下回车  调用
	new Vue({
	     el :"#serche",
	     methods:{
	        serche:function(){
	   
	             fenyee($("#ipte").val(),1,10);
	        }
	     }
	});
	function getpandtwo(b) {
		 	 var b1= $(b).parent().parent().prev().prev().prev().prev().children().html();
	        $("#one").val(b1)
	
     
            $("#myModaler").modal('hide');
	}
	      function  btu2() {
		      $("#myModal").modal('hide');
		      $("#sl").val("");
		      $("#yyin").val("");
		      $("#one").val("");
	}

</script>