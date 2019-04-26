<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link rel="stylesheet" href="backStage/assets/materialize/css/materialize.min.css" media="screen,projection" />
    <!-- Bootstrap Styles-->
    <link href="backStage/assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FontAwesome Styles-->
    <link href="backStage/assets/css/font-awesome.css" rel="stylesheet" />
    <!-- Morris Chart Styles-->
    <link href="backStage/assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
    <!-- Custom Styles-->
    <link href="backStage/assets/css/custom-styles.css" rel="stylesheet" />
    <!-- Google Fonts-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <link rel="stylesheet" href="backStage/assets/js/Lightweight-Chart/cssCharts.css"> 
    <style type="text/css">
    *{
    padding: 0px;
    margin: 0px;
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
    table th{
    color: gray;
    }
    </style>
</head>
<body style="background-color: #ececec;height: 1800px">

  
	
        
	<!-- 	 -->
	 <!--  <div class="header"> 
                        <h2 class="page-header">
                             申请上架 <small>提交新的上架申请.</small>
                        </h2>
						<ol class="breadcrumb">
					  <li><a href="#">首页</a></li>
					  <li><a href="#">申请上架</a></li>
					  <li class="active">Data</li>
					</ol> 
									
		</div> -->
            <div id="page" style="margin-top: 10px;padding: 10px;margin-left: 20px;margin-right: 20px; " > 
               
            <div class="row">
                <div class="col-md-12">
                    <!-- Advanced Tables -->
                    <div class="card">
                        <div class="card-action" style="font-size: 16px;">
                        <h3>     申请上架</h3>  
                        </div>
                        <div class="card-content">
                            <div >
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr class="success">
                                            <th>商品名称</th>
                                            <th>商品类别</th>
                                             <th class='center'>库存数量</th>
                                            <th  class='center'>商品售价</th>
                                             <th  class='center'>商品进价</th>
                                              <th  class='center'>商品状态</th>
                                               <th  class='center'>操作</th>
                                        </tr>
                                    </thead>
                                    <tbody id="mytbody">
                                       
                       
                                    </tbody>
                                </table>
                            </div>
                            
                        </div>
                    </div>
                    <!--End Advanced Tables -->
                </div>
            </div>
                <!-- /. ROW  -->
          
               
 <!--       <h2>创建模态框（Modal）</h2>
按钮触发模态框
<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
	开始演示模态框
</button> -->
	
    <!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="height: 500px;margin-top: 100px;">
	<div class="modal-dialog" style="padding-left: 10px;">
	<!-- 	<div class="modal-content">	</div>/.modal-content -->
			<div class="modal-header" >
				
				<h3 class="modal-title" id="myModalLabel">
					申请上架
				</h3>
			</div>
			<div class="modal-body">
			
			
			
			
			
			
			<form role="form">
	<div class="form-group">
		<font size="4">选择百货部门</font>
		<select id="select1" class="form-control" style="width: 200px;">
		<c:forEach items="${getGoodsDeptOne }" var="gd">
		<option value="${gd.gdId }">${gd.gdName }</option>
		</c:forEach>
			
		</select>
		<font size="4">选择陈列方式</font>
		<select id="select2" class="form-control" style="width: 200px;">
		
		
		 	<c:forEach items="${getDisplayParseOne }" var="dp">
		<option value="${dp.dpId }">${dp.dpName }</option>
		</c:forEach>
		
		</select>
			<font size="4">选择通道序号</font>
		<select id="select3" class="form-control" style="width: 200px;">
			 
			 	<c:forEach items="${getAccessNoOne }" var="an">
		<option value="${an.anId }">${an.anName }</option>
		</c:forEach>
			
			 
		</select>
	<font size="4">	选择BAY序号</font>
		<select id="select4" class="form-control" style="width: 200px;">
			
		<c:forEach items="${getBayNoOne }" var="bn">
		<option value="${bn.bnId }">${bn.bnName }</option>
		</c:forEach>
			
			
		</select>
	</div>
</form>
			
			
			
			
			
			
			
			
			</div>
			<div class="modal-footer">
				<button type="button" id="addfromSpinfoss"  class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<button type="button" class="btn btn-primary" id="addfromSpinfo">
					提交更改
				</button>
			</div>
	
	</div><!-- /.modal -->
</div>
    <div id="page" style="margin-top: 10px;padding: 10px;margin-left: 20px;margin-right: 20px; " > 

<div class="row">
                <div class="col-md-12">
                    <!-- Advanced Tables -->
                    <div class="card">
                        <div class="card-action">
                                 <h4>        提交上架订单</h4>   
                        </div>
                        <div class="card-content">
                        
                     
                        
                        
                            <div class="table-responsive">
                            
                                <table class="table table-striped table-bordered table-hover" id="lastTrTable" >
                                    <thead>
                                        <tr class="success">
                                            <th>商品编号</th>
                                            <th>商品名称</th>
                                            、                                                                         <th>商品类型</th>
                                             <th>归属部门</th>
                                              <th>上架位置</th>
                                                 <th style="padding-left: 20px;">操作</th>
                                        </tr>
                                    </thead>
                                    <tbody id="lastTr">
                                        
              
                       
                                    </tbody>
                                     <tbody >
                                        
                                <tr ><td colspan="6" align="right"><center>
                               <button class='btn'style='height:25px;padding-top:2px;' onclick="tijiaoLast()" >提交申请</button>
                                 
                                 </center></td>
                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            
                        </div>
                    </div>
                    <!--End Advanced Tables -->
                </div>
            </div>
                <!-- /. ROW  -->
            </div>

 

    <!-- jQuery Js -->
    <script src="backStage/assets/js/jquery-1.10.2.js"></script>
    <script type="text/javascript" src="backStage/tlz/myJs/applyGoodsshelvesGo.js"></script>
	 <script>
   $(function(){
      
      /*    var  tr="";
             tr+="<tr>";
             tr+="<td>2</td>";
             tr+="<td>2</td>";
             tr+="<td>2</td>";
             tr+="<td>2</td>";
             tr+="<td>2</td>";
             tr+="</tr>";
      $("#dataTables-example").append(tr); */
   //   alert(tr);
   
    $.ajax({
          url:"getNoShelfGoods",
         type:"post",
        // data:{},
          dataType:"json",
          async:false,
         success:function(datas){
      //  alert(datas.length)
         
         var tr="";
         for(var i=0;i<datas.length;i++){
           tr+="<tr>";
             tr+="<td>"+datas[i].spName+"<input type='hidden' id='spId' value='"+datas[i].spId+"'></td>";
              tr+="<td ><input type='hidden' id='spName' value='"+datas[i].spName+"'><input type='hidden' id='sptName' value='"+datas[i].sptName+"'>"+datas[i].sptName+"</td>";
               tr+="<td class='center'>"+datas[i].spAllNum+"</td>";
             tr+="<td class='center'>"+datas[i].spSalePrice+"</td>";
              tr+="<td class='center'>"+datas[i].spBuyPrice+"</td>";
                tr+="<td class='center'>"+datas[i].spStatu+"</td>";
                  tr+="<td class='center'  ><button onclick='tijiaoaaa(this)'   class='btn btn-primary btn-lg' data-toggle='modal' data-target='#myModal' style='height:25px;padding-top:1px;font-size:15px;' >提交申请</button></td>";
             tr+="</tr>";
         
         
         }
         
        $("#mytbody").append(tr);
         
         
         },
         error:function(){
      //   alert(11)
         }
    })
   })
   
   </script>
   <script>
 var spId;
 var sptName;
 var spName;
     function tijiaoaaa(p){
     
   spId=$(p).parent().parent().find("#spId").val();
   sptName=$(p).parent().parent().find("#sptName").val();
   spName=$(p).parent().parent().find("#spName").val();//
     
   }
   $("#addfromSpinfo").click(function(){
 
      /* 
		    * 去除重复
		    * */
		    var ids = [];   //定义记录数组
		    ids.push(spName);
		    $("#lastTr > tr").each(function(){
		    	
		    var kc = $(this).children("td:eq(1)").text();
		    if(ids.indexOf(kc)<0){
		    ids.push(kc);
		    }else{
		    alert("不能重复添加！！");
		    $(this).remove();
		    }
        
		    }); 
 
 
 
 
  // $('#testSelect option:selected').text();//选中的文本
    var  gdId=$('#select1 option:selected') .val();
     var  dpId=$('#select2 option:selected') .val();
      var  anId=$('#select3 option:selected') .val();
       var  bnId=$('#select4 option:selected') .val();
     //  alert($('#select4 option:selected').text());
       
       var gds=$('#select1 option:selected').text();
       var  dps=$('#select2 option:selected') .text();
      var  ans=$('#select3 option:selected') .text();
       var  bns=$('#select4 option:selected') .text();
    // var  spId=$("#spId").val();
    
    
    var  tr="<tr>";
         tr+="<td>"+spId+"</td>";
          tr+="<td ><input name='gdId' type='hidden' id='gdId' value='"+gdId+"'>"+spName+"</td>";
           tr+="<td><input name='dpId' type='hidden' id='dpId' value='"+dpId+"'>"+sptName+"</td>";
            tr+="<td><input name='anId' type='hidden' id='anId' value='"+anId+"'>"+gds+"</td>";
             tr+="<td><input name='bnId' type='hidden' id='bnId' value='"+bnId+"'>"+ans+" - "+bns+"&nbsp; ("+dps+")"+"</td>"; 
               tr+="<td><button class='btn'style='height:25px;padding-top:2px;' onclick='del(this)' >删除</button></td>";
         tr+="</tr>";
    
    $("#lastTr").append(tr);
    
    
   $("#addfromSpinfoss").click();
    
    
    
      /*  $.ajax({
         url:"updateApplyGoodsShelf",
           contentType:"application/json;charset=utf-8", 
         type:"post",
        // data:'{"gdId":gdId,"dpId":dpId,"anId":anId,"bnId":bnId,"spId":spId}',
        data:"{\"gdId\":\""+gdId+"\",\"dpId\":\""+dpId+"\",\"anId\":\""+anId+"\",\"bnId\":\""+bnId+"\",\"spId\":\""+spId+"\"}",
          dataType:"json",
         success:function(datas){
        if(datas!=null){
       //  window.location.href="getAllapplyGoodsDept";
        }
         }
       }) */
   })
   function del(t){
   
   $(t).parent().parent().remove();
   }
   </script>
	<!-- Bootstrap Js -->
    <script src="backStage/assets/js/bootstrap.min.js"></script>
	
	、
	 <!-- DATA TABLE SCRIPTS -->
    <script src="backStage/assets/js/dataTables/jquery.dataTables.js"></script>
    <script src="backStage/assets/js/dataTables/dataTables.bootstrap.js"></script>
        <script>
            $(document).ready(function () {
                $('#dataTables-example').dataTable();
            });
    </script>
    <!-- Custom Js -->
    <script src="backStage/assets/js/custom-scripts.js"></script> 
 
  
</body>

</html>
