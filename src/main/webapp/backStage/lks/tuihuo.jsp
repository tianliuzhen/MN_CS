<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>顾客退货</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!-- Bootstrap Styles-->
    <link href="backStage/assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FontAwesome Styles-->
    <!-- Morris Chart Styles-->
    <!-- Custom Styles-->
    <!-- Google Fonts-->
   <link href="backStage/assets/css/bootstrap.css" rel="stylesheet" />
    <!-- Google Fonts-->
    
  <script type="text/javascript" src="backStage/assets/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="backStage/assets/js/bootstrap.min.js"></script></head>
  <style>
   #top11{
    padding:18px 30px 0 30px;
    width:100%;
    height:10%;
    background-color:#F9F9F9;
   }
   #aa{
    width:50%;
   }
   span{
    font-size:26px;
   }
   tr th{
    text-align:center;
   }
   
  #mytbody{
   text-align:center;
  }
  #myfom input{
   width:30%;
  }
  </style>
  <body>
  <div class="alert alert-warning" style="display: none;" id="alert">
   <a href="#" class="close" data-dismiss="alert">
      &times;   </a>
   <strong>警告！</strong>该单号不存在。</div>
  
    <div id="top11">
     <span>销售订单号</span>&nbsp;&nbsp;&nbsp;&nbsp;
     <input  placeholder="请输入销售订单号" type="text"  id="aa" onblur="ccc()" style=" height:35px;"/>
     <input type="button" class="btn btn-primary btn-sm" onclick="aaa()" value="查询"/>
    </div>
     <div id="content11">
  		<table class="table table-striped table-bordered table-hover">
  		 <tr>
  		 <th>商品条码</th>
  		 <th>商品名称</th>
  		 <th>会员卡号</th>
  		 <th>商品价格</th>
  		 <th>商品数量</th>
  		 <th>支付方式</th>
  		 <th>商品操作</th>
  		 </tr>
  		 <tbody id="mytbody">
  		
  		 </tbody>
  		</table>
  		<div class="modal fade" id="myModalaaab" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">商品详情</h4>
            </div>
            <div class="modal-body">
            <form id="myfom">
            	 销售订单：<input readonly="readonly" id="a1" name="map['soid']"/>&nbsp;&nbsp;&nbsp;&nbsp;
            	 商品条码：<input readonly="readonly" id="a2" name="map['sptId']"/><br/><br/>
				 商品名称：<input readonly="readonly" id="a3"/>&nbsp;&nbsp;&nbsp;&nbsp;
				 商品类型：<input readonly="readonly" id="a4"/><br/><br/>
				 商品价格：<input readonly="readonly" id="a5" name="map['BgPrice']"/>&nbsp;&nbsp;&nbsp;&nbsp;
				 购买数量：<input readonly="readonly" id="a6" name="map['BgNum']"/><br/><br/>
				 消费时间：<input readonly="readonly" id="a7"/>&nbsp;&nbsp;&nbsp;&nbsp;
				 支付方式：<input readonly="readonly" id="a8"/><br/><br/>
				 会员卡号：<input readonly="readonly" id="a10" name="map['mpId']"/>&nbsp;&nbsp;&nbsp;&nbsp;
				 应退金额：<input readonly="readonly" id="a11"/><br/><br/>
				 收银工号：<input readonly="readonly" id="a9" name="map['Ocid']"/>&nbsp;&nbsp;&nbsp;&nbsp;
				 退货原因：<input name="map['Bg1']"/>
				 
				</form>
				<div id="qwe" style="display:none">
				 请不要重复退货
				</div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" id="ddd">关闭</button>
                <button type="button" class="btn btn-primary" onclick="tuihuo()">确认退货</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
  		
    </div>
  </body>
</html>
<script src="backStage/assets/js/jquery-1.10.2.js"></script>
<script>
//根据退货单号查询订单信息
    function aaa(){
  			$.ajax({
   			 url:"querytuihuolks",
             type:"post",
             data:{"soid":$("#aa").val()},
             dataType:"json", 
             async:false,   
    success:function(data){
     $("#mytbody").html("");
      var tr="";
    if(data.length>0){
     $("#alert").css("display","none");
      for(var i=0;i<data.length;i++){
    tr+="<tr>";
    tr+="<td>"+data[i].ssBarCode+"</td>";
    tr+="<td>"+data[i].spName+"</td>";
    tr+="<td>"+data[i].mpId+"</td>";
    tr+="<td>"+data[i].spSalePrice+"</td>";
    tr+="<td>"+data[i].ssSaleNum+"</td>";
    tr+="<td>"+data[i].ssPayType+"</td>";
    tr+="<td><button id='"+data[i].ssBarCode+"'  onclick='chabackgoods(this.id)' class='btn btn-primary btn-sm' data-toggle='modal' data-target='#myModalaaab'>"+"退货"+"</button></td>";
    tr+="</tr>";
    }
    $("#mytbody").append(tr);
    }else{
     $("#alert").css("display","block");
    }
  }
  
  
});
}
//查看该商品详细信息
var abcd;
function chabackgoods(ssBarCode){
abcd=ssBarCode;
$.ajax({
   			 url:"querybackorderlks",
             type:"post",
             data:{"soid":$("#aa").val(),"sptId":ssBarCode},
             dataType:"json", 
             async:false, 
    success:function(data){
    if(data.length>0){
     $("#myfom").css("display","none");
     $("#qwe").css("display","block");
    }else{
     $.ajax({
   			 url:"querytuihuomigxilks",
             type:"post",
             data:{"ssBarCode":ssBarCode,"soid":$("#aa").val()},
             dataType:"json",
             async:false,   
    success:function(data){
    $("#a1").val(data[0].soid);
    $("#a2").val(data[0].ssBarCode);
    $("#a3").val(data[0].spName);
    $("#a4").val(data[0].sptName);
    $("#a5").val(data[0].ssSalePrice);
    $("#a6").val(data[0].ssSaleNum);
    $("#a7").val(data[0].ssDate);
    $("#a8").val(data[0].ssPayType);
    $("#a9").val(data[0].ocId);
    $("#a10").val(data[0].mpId);
    $("#a11").val( $("#a5").val()* $("#a6").val());
    }
    });
    }
    }})
    
		
}
//确认退货
function tuihuo(){

  $.ajax({
     url:"addbackOrderGoodslks",
     type:"post",
     data:$("#myfom").serialize(),
     success:function(data){
     $("#"+abcd+"").parent().parent().remove();
     $("#ddd").click();
     }
    });
}
</script>
<!-- Bootstrap Js -->
    <script src="backStage/assets/js/bootstrap.min.js"></script>
	
	<script src="backStage/assets/materialize/js/materialize.min.js"></script>
	
    <!-- Metis Menu Js -->
    <script src="backStage/assets/js/jquery.metisMenu.js"></script>
    <!-- Morris Chart Js -->
    <script src="backStage/assets/js/morris/raphael-2.1.0.min.js"></script>
    <script src="backStage/assets/js/morris/morris.js"></script>
	
	
	<script src="backStage/assets/js/easypiechart.js"></script>
	<script src="backStage/assets/js/easypiechart-data.js"></script>
	
	 <script src="backStage/assets/js/Lightweight-Chart/jquery.chart.js"></script>
	 <!-- DATA TABLE SCRIPTS -->
    <script src="backStage/assets/js/dataTables/jquery.dataTables.js"></script>
    <script src="backStage/assets/js/dataTables/dataTables.bootstrap.js"></script>
        <script>
            $(document).ready(function () {
                $('#dataTables-example').dataTable();
                $('#identifier').modal(options);
            });
    </script>
    <!-- Custom Js -->
    <script src="backStage/assets/js/custom-scripts.js"></script> 

