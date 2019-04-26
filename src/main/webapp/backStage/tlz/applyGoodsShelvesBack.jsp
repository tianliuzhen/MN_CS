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
<body style="background-color: #ececec;height: 1800px; ">

  
	
        
	<!-- 	 -->
               <div id="page" style="margin-top: 10px;padding: 20px;margin-left: 20px;margin-right: 20px; background-color: #fff;" > 
               
            <div class="row">
                <div class="col-md-12">
                    <!-- Advanced Tables -->
                    <div class="card">
                        <div class="card-action" style="font-size: 16px;">
                       <h3>      申请&nbsp;下架&nbsp;</h3><br/><br/>
                        </div>
                        <div class="card-content">
                           
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr class="success">
                                            <th>名称</th>
                                            <th>类别</th>
                                         <!--    <th>仓库</th> -->
                                             <th class='center'>库存</th>
                                            <th  class='center'>陈列方式(剩余数量)</th>
                                             <th  class='center'>上架位置</th>
                                             <th  class='center'>价格</th>
                                              <th  class='center'>状态</th>
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
                <!-- /. ROW  -->
          
                       <!--End Advanced Tables -->
                </div>
            </div>
 
<div id="page" style="margin-top: 20px;padding: 10px;margin-left: 20px;margin-right: 20px;background-color: #fff; " > 

<div class="row">
                <div class="col-md-12">
                    <!-- Advanced Tables -->
                    <div class="card">
                        
                        <h4>
                                            提交下架订单</h4>
                       
                        <div class="card-content">
                        
                     
                        
                        
                            <div class="table-responsive">
                            
                                <table class="table table-striped table-bordered table-hover" id="lastTrTable" >
                                    <thead>
                                        <tr class="success">
                                            <th>商品编号</th>
                                            <th>商品名称</th>
                                            、                                                                         <th>商品类型</th>
                                             <th>归属部门</th>
                                            
                                                 <th class="center">操作</th>
                                        </tr>
                                    </thead>
                                    <tbody id="lastTr">
                                        
              
                       
                                    </tbody>
                                     <tbody >
                                        
                                <tr >
                                
                              
                                <td colspan="5" align="right"><center>
                               
                               <button class="btn btn-primary"style='height:25px;padding-top:2px;position: relative;' onclick="tijiaoLast2()" data-toggle="modal" data-target="#myModal" >提交申请</button>
                                 
                                 </center></td>
                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            
                        </div>
                    </div>
            
                <!-- /. ROW  -->
            </div>
         <!-- /. PAGE WRAPPER  -->
     <!-- /. WRAPPER  -->
    <!-- JS Scripts-->
 
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	<div class="modal-dialog">
		<div class="modal-content"> 
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					填写退货理由
				</h4>
			</div>
			<div class="modal-body">
					<font size="4">选择下架理由：</font>
		<select id="select2" class="form" style="width: 200px;height: 30px;font-size: 17px;">
		
		
		<option value="滞销">滞销</option>
		<option value="其他">其他</option>
		</select>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<button type="button" class="btn btn-primary" onclick="tijiaoLast()">
					提交下架申请
				</button>
			</div>
		 </div>
	</div><!-- /.modal -->
</div>
    <!-- jQuery Js -->
    <script src="backStage/assets/js/jquery-1.10.2.js"></script>
    <script type="text/javascript" src="backStage/tlz/myJs/applyGoodsShelvesBack.js"></script>
	 <script>
   $(function(){
      
     
    ajaxgetNoShelfGoods();
   })
   
   
    function  ajaxgetNoShelfGoods(){
      $.ajax({
          url:"getAlreadyShelfGoods",
         type:"post",
          dataType:"json",
          async:false,
         success:function(datas){
         
         var tr="";
         for(var i=0;i<datas.length;i++){
           tr+="<tr>";
             tr+="<td >"+datas[i].spName+"<input name='spId' type='hidden' id='spId' value='"+datas[i].spId+"'></td>";
              tr+="<td >"+datas[i].sptName+"<input name='spName' type='hidden' id='spName' value='"+datas[i].spName+"'><input name='sptName' type='hidden' id='sptName' value='"+datas[i].sptName+"'></td>";
             /*  tr+="<td >"+datas[i].whName+"</td>"; */
               tr+="<td class='center'>"+datas[i].spAllNum+"</td>";
                tr+="<td  class='center'>"+"<span style='color:green;'>"+datas[i].dpName+"</span>"+" ("+datas[i].dnMaxNum+") "+" / "+"<span style='color:red;'>"+datas[i].spDnNum+"</sapn>"+"<input   type='hidden' id='dnNum' value='"+datas[i].dnNum+"'></td>";
                tr+="<td class='center'>"+datas[i].gdName+"("+datas[i].anName+" - "+datas[i].bnName+")"+"</td>";
              tr+="<td class='center'>"+datas[i].spSalePrice+"</td>";
                tr+="<td class='center'><input name='gdName' type='hidden' id='gdName' value='"+datas[i].gdName+"'>"+datas[i].spStatu+"</td>";
                  tr+="<td class='center'  ><button   class='btn btn-primary btn-lg' id='shenhe2' style='height:25px;padding-top:1px;font-size:15px;' >选 择</button></td>";
             tr+="</tr>";
         
         
         }
         
        $("#mytbody").append(tr);
         
         
         },
         error:function(){
         }
    })
      }
   
   
  
    $("body").delegate("#shenhe","click", function(){ 
   
          
       
   
   
   var open=confirm("确认提交申请！！");
  if(open==true){
            
  // $('#testSelect option:selected').text();//选中的文本
   //alert($('#select1 option:selected') .val());
  //  alert($('#select2 option:selected') .val());
    // alert($('#select3 option:selected') .val());
     var  spId=$(this).parent().parent().find("#spId").val();
     var  dnNum=$("#dnNum").val();
  
       $.ajax({
         url:"updateApplyGoodsShelf2",
           contentType:"application/json;charset=utf-8", 
         type:"post",
        // data:'{"gdId":gdId,"dpId":dpId,"anId":anId,"bnId":bnId,"spId":spId}',
        data:"{\"dnNum\":\""+dnNum+"\",\"spId\":\""+spId+"\"}",
          dataType:"json",
         success:function(datas){
        if(datas!=null){
          window.location.href="backStage/tlz/applyGoodsShelvesBack.jsp";
        }
         }
       })
   
               
  }else{
  //alert(2)
   }
  
  })
   function del(t){
   
   $(t).parent().parent().remove();
   }
   </script>
   <script type="text/javascript" src="backStage/tlz/myJs/applyGoodsshelves.js"></script>
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
            });
    </script>
    <!-- Custom Js -->
    <script src="backStage/assets/js/custom-scripts.js"></script> 
 
  
</body>

</html>
