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
     .dataTables_length label{
    font-size: 17px;
    font-weight: normal;
    }
    .dataTables_filter label{
    font-size: 18px;
      font-weight: normal;
    } 
    .table table-striped table-bordered table-hover dataTable no-footer{
    margin-top: 10px;
    }
    #trd th{
     text-align:center;
    }
    #mytab tr td{
    text-align:center;
    }
    form{
     white-space:nowrap;
    }
    #seo{
     position: relative;
  	 left: 75px;
  	 top: -30px;
    }
    </style>
<script type="text/javascript" src="backStage/assets/lks/js/sha1.js"></script></head>
<body style="background-color: #ececec;">
  
	
        
		
            <div id="page-inner"> 
               
           
                 
                
                <!--  -->
                    <!-- Advanced Tables -->
                    <div class="card">
                        <div class="card-action">
                                               <button class='btn btn-primary btn-sm' data-toggle='modal' data-target='#myModal'>添加会员</button>
                        </div>
                        <div class="card-content">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr class="success" id="trd">
                                            <th>会员编号</th>
                                            <th>会员名称</th>
                                            <th>累计消费</th>
                                            <th>手机号码</th>
                                            <th>会员密码</th>
                                            <th>会员类型</th>
                                            <th>注册时间</th>
                                            <th>会员状态</th>
                                            <th>操作</th>
                                        </tr>
                                    </thead>
                                    <tbody id="mytab">
                                        
                                    </tbody>
                                </table>
                            </div>
                            
                        
                    <!--End Advanced Tables -->
                </div>
            </div>
                <!-- /. ROW  -->
          <!-- 添加模态 -->
               <div style="width:670px; height:400px;" class="modal  fade  bs-example-modal-sm" id="myModal"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					会员信息
				</h4>
			</div>
			<div class="alert alert-warning" style="display: none;" id="alert1">
                <strong>警告！</strong>请输入完整的信息。</div>
			<div class="modal-body">
			<div class="row">
			    <div class="col s2">
			    
				 <form id="myfom">
				 会员名称：<input onblur="chana()" id="chan"  name="map['mpName']"/>&nbsp;&nbsp;&nbsp;&nbsp;
				 <span id="di4"></span>
				 会员密码：<input name="map['mpPassword']" value="123456"/><br/><br/>
				 *会员类型：<input readonly="readonly" name="map['mpType']" value="普通会员"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				   *累计消费：<input readonly="readonly" name="map['mpMonery']" value="0"/><br/><br/>
				  *会员状态：<input readonly="readonly" name="map['mpStatus']" value="正常"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				  手机号码：<input  name="map['mpBalMOnery']"/>
				 
				</form>
			</div>
			</div>
		</div>
			<div class="modal-footer">
				<button type="button" id="guan_btn" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<button type="button" class="btn btn-primary"  onclick="addlks()">
					添加
				</button>
			</div>

<!-- /.modal -->
</div>



<div  style="width:670px; height:400px;"  class="modal  fade" id="myModalsa" >
           <!--   <div id="responsive_oldgoods" class="modal hide fade"  -->
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					修改会员信息
				</h4>
			</div>
			<div class="modal-body">
			<div class="row">
			    <div class="col s2">
				<form id="myfom2">
				*会员编号：<input  readonly="readonly" id="mp4" name="map['mpId']"/>&nbsp;&nbsp;&nbsp;&nbsp;
				 *会员名称：<input readonly="readonly" id="mp1" name="map['mpName']"/><br/><br/>
				 会员密码：<input id="mp2" name="map['mpPassword']"/>&nbsp;&nbsp;&nbsp;&nbsp;
				 *会员类型：<input readonly="readonly" id="mp3" name="map['mpType']"/><br/><br/>
				 会员状态：<select id="seo" class="form-control" name="map['mpStatus']">
      				<option value="正常" >正常</option>
     			    <option value="停用" >停用</option>
   				 </select>
   				 手机号码：<input id="mp5" name="map['mpBalMOnery']"/>
				</form> 
				</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" id="guan_btn" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<button type="button" class="btn btn-primary"  onclick="upviplks()">
					提交更改
				</button>
			</div>
<!-- /.modal -->
            </div>
     
            
               
  </div>                                  
                  
         
           
 

    <!-- jQuery Js -->
    <script src="backStage/assets/js/jquery-1.10.2.js"></script>
	 <script>
	 $(function(){
	  aaa();
	 })
	 //查询会员
	 
   function aaa(){
   			$.ajax({
   			 url:"getvip",
             type:"post",
             data:{},
             dataType:"json",
             async:false,
             success:function(data){
   			var  tr="";
      	     for(var i=0;i<data.length;i++){
             
             tr+="<tr>";
             tr+="<td>"+data[i].mpId+"</td>";
             tr+="<td>"+data[i].mpName+"</td>";
             tr+="<td>"+data[i].mpMonery+"</td>";
             tr+="<td>"+data[i].mpBalMOnery+"</td>";
             tr+="<td>"+"******"+"</td>";
             tr+="<td>"+data[i].mpType+"</td>";
             tr+="<td>"+data[i].mpBeiDate+"</td>";
             tr+="<td>"+data[i].mpStatus+"</td>";
             tr+="<td><button id='"+data[i].mpId+"' onclick='chavip(this.id)' class='btn btn-primary btn-sm' data-toggle='modal' data-target='#myModalsa'>"+"修改会员"+"</button></td>";
             tr+="</tr>";
             }
             
      $("#dataTables-example").append(tr);
   //   alert(tr);
   }});};
   //添加会员
   function addlks(){
   if($("#chan").val()==""){
   $("#alert1").css("display","block");
   }else{
   $("#alert1").css("display","none");
    $.ajax({
     url:"addlks",
     type:"post",
     data:$("#myfom").serialize(),
     success:function(data){
     window.location.reload();
     }
     
    });
    }
   }
   //查询单个会员信息
   function chavip(mpId){
   	$.ajax({
   			 url:"getviplks",
             type:"post",
             data:{"mpId":mpId},
             dataType:"json",
             async:false,   
    success:function(data){
      $("#mp1").val(data[0].mpName);
      $("#mp2").val(data[0].mpPassword);
      var cc=$("#mp2").val();
      var newstr=cc.replace(cc,"*******");  
      $("#mp2").val(newstr);
      $("#mp3").val(data[0].mpType);
      $("#mp4").val(data[0].mpId);
      $("#mp5").val(data[0].mpBalMOnery);
   }
   });}
   //修改会员信息
   function upviplks(){
    $.ajax({
     url:"upviplks",
     type:"post",
     data:$("#myfom2").serialize(),
     success:function(data){
     window.location.reload();
     }
     
    });
   }
   function chana(){
    var dia=$("#chan").val();
		  if(dia!=""){
		  $("#di4").html("✔").css("color","green");
		  return true;
		 }else{
		  $("#di4").html("×").css("color","red");
		  return false;
		 }
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
            });
            
    </script>
    <!-- Custom Js -->
    <script src="backStage/assets/js/custom-scripts.js"></script> 
 
  
</body>

</html>
