<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
                            仓库盘点 <small>盘点仓库商品</small>
                        </h3>
                       
					</hr>
  <div id="serch">
<input type="text" id="ipt" placeholder="请输入内容"  v-on:keyup.enter="serch(this)"><div class="layui-btn-group demoTable">
  <button class="layui-btn" data-type="getCheckData"  data-toggle='modal' >盘点选中商品</button>
<input id="ss" type="hidden">
<input id="ww" type="hidden">
</div>
</div>
	<table class="layui-hide" id="myTab"></table>
	<div id="fenye"></div>



		<div class="modal fade" id="myModalboh" tabindex="-1" role="dialog"aria-labelledby="myModalLabel" aria-hidden="true" style="width: 1500px;left: 350px;top: 150px;height:500px; display: none">
		<div class="modal-dialog">
			<div class="modal-content">
			<div class="modal-header" id="top">
			<input  type="hidden" id="mi2">
			<input  type="hidden" id="mi3">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					
				</div>
				<div id="content">
				<table class="layui-hide" id="test">
				<div class="layui-btn-group demoTable">
 <input value="${relaname}" type="hidden" id="mi">
	<div id="serchb">
	
<div class="layui-btn-group demoTable">

<button class="layui-btn layui-btn-normal layui-btn-radius" data-type="getCheckData" onclick="mob()" style="width: 150px;">保存</button>
</div>
</div>
	<table class="layui-hide" id="myTabb"  lay-filter="demo"></table>
	<div id="fenyeb"></div>


				</table>
				</div>
	
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
</body>
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
	function fenye(pan,pagenum,limit) {
	
		table.render({
			id : 'myTab', //table的id
			elem : '#myTab',   //同上
			height : 570,  //表格的高度
			url : 'getpand.action',
			where:{
			pageNum:pagenum,
			limit:limit,
			pan:pan
			},
			cols : [ [ 
			/*表头  
			  checkbox：true  开启复选框
			  field : 你的列名
			  title : 你的标题  也就是 <th>
			  sort  : true   开启排序
			  edit: 'text'开启单元格编辑    */
				
						  {type:'checkbox',width:110,fixed : true,checkbox:true}, 
			
			{field : 'rtId',width:170,title : '库存编号',sort : true,}, 
			{field : 'rtNumber',width:200,title : '库存数量',sort : true,}, 
			{field : 'spName',width:200,title : '商品名称',sort : true,}, 
			{field : 'rtPrice',width:200,title : '库存商品价格',sort : true,}, 
			{field : 'whName',width:200,title : '所在仓库',sort : true,}, 
			{field : 'glName',width:130,title : '商品品牌',sort : true,}, 
			{field : 'gmName',width:170,title : '计量单位',sort : true,}, 
			{field : 'sptName',width:180,title : '类型名称',sort : true,edit: 'text'},
		
                   ] ],
             //回调函数 在表格渲染完成后 执行 用num判断  让它只在页面加载时执行一次   点击上一页下一页不执行
			done : function(res) {
			  if(num==0){
			  tool($("#ipt").val(),res.count);  //调用tool()函数   启用分页条  并传总数据数  res.count 
			  num+=1;
			  }
			}
			
			
		});
   var a=new Array();
    var $ = layui.$, active = {
    getCheckData: function(){ //获取选中数据
      var checkStatus = table.checkStatus('myTab')
      ,data = checkStatus.data;
 
    $("#ww").val(data.length)
 
         for (var i in data){
         var ai=data[i].rtId;

	  

          a.push(ai);

         }
     
       if(data.length>0){ fenyeb("",a,1,10);
       
       sp();
       }else{
         alert("至少选一项")
    return false;
       
        }
          
              
       
               
    }
   
   
  };
  
  $('.demoTable .layui-btn').on('click', function(){
    var type = $(this).data('type');
    active[type] ? active[type].call(this) : '';
  });


	}
	/*渲染分页工具条
	  同样传入两个参数   关键字   总数据
	*/
	function tool(pan,count) {
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
  function fenyeb(getone,a,pagenum,limit) {

		table.render({
			id : 'myTabb', //table的id
			elem : '#myTabb',   //同上
			height : 400,  //表格的高度
		   url : 'getpanone.action',
	
			where:{
			pageNum:pagenum,
			limit:limit,
			getone:getone,
		     rtid:JSON.stringify(a),
			},
			cols : [ [ 
			/*表头  
			  checkbox：true  开启复选框
			  field : 你的列名
			  title : 你的标题  也就是 <th>
			  sort  : true   开启排序
			  edit: 'text'开启单元格编辑
         */						  {type:'checkbox',width:110,fixed : true,checkbox:true,LAY_CHECKED:true,}, 
         
		    {field : 'rtId',width : 150,title : '商品编号',sort : true,}, 
		        {field : 'rtNumber',width : 150,title : '库存数量',sort : true,}, 
		            {field : 'spName',width : 150,title : '商品名称',sort : true,}, 
		                {field : 'rtPrice',width : 150,title : '库存商品价格',sort : true,}, 
		                    {field : 'whName',width : 120,title : '所在仓库',sort : true,}, 
		                        {field : 'glName',width : 120,title : '商品品牌',sort : true,}, 
		                          {field : 'gmName',width : 120,title : '计量单位',sort : true,}, 
		                            {field : 'sptName',width : 120,title : '类型名称',sort : true,}, 
		                              {field : 'whId',width : 50,title : '仓库Id',sort : true,}, 
		                                {field : 'spId',width : 120,title : '商品Id',sort : true,}, 
		                                 {field : 'spAllNum',width : 120,title : '商品Id',sort : true,}, 
		    		                          {field: 'srsl',width:143, title: '实际数量', sort: true,templet: function(){
			    	  return "<input onblur='aaa(this) 'style='padding:0 0 0 0;border:0px;width:80px;height:40px;color:red' class='aaa'>"
			      }},
		    
		 
                   ] ],
              
             //回调函数 在表格渲染完成后 执行 用num判断  让它只在页面加载时执行一次   点击上一页下一页不执行
	done:function(res) {
		        $("[data-field='spId']").css('display','none');
		        $("[data-field='whId']").css('display','none');
		       
	

}
	
	}) 
	  };
	function mob(){ //获取选中数据

 var time2 = new Date().Format("yyyy-MM-dd hh:mm:ss");  

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
      var checkStatus = table.checkStatus('myTabb')
      ,data = checkStatus.data;
  
         for (var i in data){
      

 var time2 = new Date().Format("yyyy-MM-dd hh:mm:ss"); 
       var sn=$("#myModalboh .layui-table tbody").children("tr").eq(i).find(".aaa").val();
       var aa=data[i].rtId
       var bb=data[i].spId
       var cc=data[i].rtPrice
       var dd=data[i].whId;
       var ee=parseInt(sn) - parseInt(data[i].rtNumber);
       var ff=ee*cc;
       var gg=$("#mi2").val()
    var kk=parseInt(data[i].spAllNum)
    var mm=kk-parseInt(-ee);

if(data.length>0){if(aa!="" && sn!="" && bb!="" && cc!="" && dd!="" && ee!="" && ff!="" && gg!=""){
 var path=/^\+?[1-9]\d*$/;
if(!path.test(sn)){
alert("请输入正确数量")
return false;
}
else{

     jsonStr=[{"sspDate":time2,"whId":dd,"spId":bb,"sspNum":sn,"sspDamageNum":ee,"sspLackMonery":ff,"ocId":gg}];
          jsonSta=[{"rtId":aa,"rtNumber":sn,}];
          jsonStb=[{"spid":bb,"spAllNum":mm}]
     $.ajax({
           url:"updatepand",
           type:"post",
           data:JSON.stringify(jsonSta),
           contentType:"application/json;charset=utf-8", 
            dataType:"json",
            async:false,
               success:function(data){
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
	   url:"addst",
	    type:"post",
	    data:JSON.stringify(jsonStr),
	 contentType:"application/json;charset=utf-8", 
	    dataType:"json",
	 
	     success:function(data){
	
	     }
	      });
               }
               })
                          window.location.href="backStage/words/pd.jsp";  
}


	      }else{
	      alert("实际数量不能为空")
	      return false;
	      }
	      }

	 }
	 	

 
   

  

	}
	  $('.demoTable .layui-btn').on('click', function(){
    var type = $(this).data('type');
    active[type] ? active[type].call(this) : '';
  });


	 

/*  

 var time2 = new Date().Format("yyyy-MM-dd hh:mm:ss"); 

  //剩余数量
  var bb=$("#nump").val();
  //获取损失数量
var aa=$("#nump").val()-$("#aa1").html();

   //损失金额
   var ee=$("#pp").html();
 
   var ww=aa * ee;

   //仓库id
   var hh=$("#hh").html();

   //商品id
 var da=$("#da").html();
var oo=$("#mi2").val();
*/
 /* 
              var aa=data[i].rtId;
                var bb=data[i].rtNumber;
               var cc=data[i].spName;
                var dd=data[i].rtPrice;
                var ee= whName;
                  var ff=data[i].glName;
                   var gg=data[i].gmName;
                   var tt=data[i].sptName;
                   var hh=data[i].whId;
                   var da=data[i].spId;
                     $("#tt").html(data[0].sptName)
           $("#hh").html(data[0].whId); 
           $("#da").html(data[0].spId)
              var oo=$("#mi2").val();
               var time2 = new Date().Format("yyyy-MM-dd");  
        alert(oo) */
            /*      jsonStr=[{"spid":bb,"owuPrice":cc,"owuNum":dd,"owuAllMonery":ee,"sptId":aa,"owreason":"过期","whid":gg,"ocId":oo,"owDate":time2}];
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
                                 }) */
                   
/*          }
                                
    window.location.href="backStage/words/depot.jsp"; 
     }else{
     alert("未选择商品")
     }
   

  };
  
  $('.demoTable .layui-btn').on('click', function(){
    var type = $(this).data('type');
    active[type] ? active[type].call(this) : '';
  });
	} */ 



  
 



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

   	function getpandone(a) {
    


   	  $.ajax({
           url:"getpanone.action",
           type:"post",
           data:{rtid:ss},
            dataType:"json",
            async:false,
             
          success:function(data){


         $("#pid").html(data[0].rtId);
         $("#aa1").html(data[0].rtNumber)
         $("#nump").val(data[0].rtNumber)
         $("#ss").html(data[0].spName)
         $("#pp").html(data[0].rtPrice)
          $("#wh").html(data[0].whName)
          $("#gg").html(data[0].glName) 
          $("#mm").html(data[0].gmName)   
         $("#tt").html(data[0].sptName)
           $("#hh").html(data[0].whId); 
           $("#da").html(data[0].spId)
            
          }
          
          })
   	}
   function btu() {
   var lo=$("#aa1").html();

   if($("#nump").val()>0){
		  $.ajax({
           url:"updatepand.action",
           type:"post",
           data:{rtId:$("#pid").html(),rtNumber:$("#nump").val()},
            dataType:"json",
            async:false,
               success:function(data){
      
               //获取当前时间
 var time2 = new Date().Format("yyyy-MM-dd hh:mm:ss"); 

  //剩余数量
  var bb=$("#nump").val();
  //获取损失数量
var aa=$("#nump").val()-$("#aa1").html();

   //损失金额
   var ee=$("#pp").html();
 
   var ww=aa * ee;

   //仓库id
   var hh=$("#hh").html();

   //商品id
 var da=$("#da").html();
var oo=$("#mi2").val();
  var das= "{\"sspDate\":\""+time2+"\",\"whId\":\""+hh+"\",\"spId\":\""+da+"\",\"sspNum\":\""+bb+"\",\"sspDamageNum\":\""+aa+"\",\"sspLackMonery\":\""+ww+"\",\"ocId\":\""+oo+"\"}";

 //添加ajax
	  $.ajax({
	   url:"addstss",
	    type:"post",
	    data:das,
	 contentType:"application/json;charset=utf-8", 
	    dataType:"json",
	 
	     success:function(data){
	
	     }
	      });
	 
	         alert("盘点成功")
	            window.location.href="backStage/words/pd.jsp";  
	        }
            
            })
    
}
else{

alert("请输入正确的盘点值");
return false;
}
}

function sp() {

  $("#myModalboh").modal();

}



   </script>

  
</body>

</html>
