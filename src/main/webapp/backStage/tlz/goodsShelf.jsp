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
	<meta content="text/html; charset=utf-8" http-equiv="Content-Type"/>
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
    .buhuo{
    background: #D9EDF7;
    border: 0px;
   
    }
   
 .modal-dialog{
 font-size: 19px;
 }
  
   .modal fade{
   background-color: #fff;
   }
   .success th{
   font-weight: 500;
   color: #000;
   }
 
    </style>
</head>
<body style="background-color: #ececec;height:2200px;">

  
	
		
            <div id="page" style="margin-top: 10px;padding: 10px;margin-left: 20px;margin-right: 20px; " > 
               
        
      
      <div style="background-color: #fff;padding-top: 10px;width: 100%;padding-left: 10px;height: 60px;border-radius:5px;">
      <form action="getAllMapGoodsDept" accept-charset="utf-8"  method="post">
     
									  <input name="getGoodsDept_input_Name" style="width: 252px;border:none;border-bottom: 1px solid gray;height: 30px;" placeholder="请输入查询部门">&nbsp;&nbsp;&nbsp;
									   <input type="submit" class="btn" value="查询部门" id="getGoodsDept" >&nbsp;&nbsp;&nbsp;
									   <input type="button" class="btn" value="货架预警" onclick="getGoodsDeptLitter()">
							<font style="margin-left: 870px;" size="5" color="gray">货架管理</font>
						 </form>		
					
									</div>
            
              <div class="row">
             
             <c:forEach items="${GoodsDept }" var="gd">
               
                    <div class="col-xs-12 col-sm-6 col-md-3"   data-to="dddmaodian"  onclick="getGdname('${gd.gdName}')">
					<div class="card horizontal cardIcon waves-effect waves-dark" style=" border-radius:10px;  ">
						<div class="${gd.dgStyleColor}">
						<i class="${gd.dgStyleImg}"></i>
						</div>
						<div class="card-stacked">
						<div class="card-content">
						商品种类：<font color="green" size="5">${gd.allSpId}</font><br/>
						需补货:<font color="red" size="5">${gd.nospid }</font>类
						</div>
						<div class="card-action">
						<span style="font-size: 17px;font-weight:540;"> ${gd.gdName}</span>
						</div>
						</div>
						</div> 
                    </div>
                    
                   </c:forEach>  
                    
                     
                </div>
             
           
             
                <div id="dataTables-exampleXia"></div>
            <div class="row">
                <div class="col-md-12">
                    <!-- Advanced Tables -->
                    <div class="card">
                       <%--   <table class="table">
                       <tr class="warning">
                           <c:forEach items="${GoodsDept }" var="gd">
                     <td onclick="getGdname('${gd.gdName}')">${gd.gdName}</td>
                     
                    </c:forEach>
                      </tr>
                    </table> --%>
                        <div class="card-content" id="dddmaodian" >
                            <div class="table-responsive" >
                          <div class="alert alert-danger alert-dismissable"  id="alert1" style="display: none">
	<button type="button" class="close" data-dismiss="alert"
			aria-hidden="true">
		&times;
	</button>
	警告！已经提交补货订单，等待审核 ！
</div>      
               <div class="card-content" id="dddmaodian" >
                            <div class="table-responsive" >
                          <div class="alert alert-danger alert-dismissable"  id="alertcun" style="display: none">
	<button type="button" class="close" data-dismiss="alert"
			aria-hidden="true">
		&times;
	</button>
	警告！已经提交该商品 ！
</div>                   

                               <div style="background-color: #fff;padding-top: 10px;width: 310px;padding-left: 10px;height: 60px;border-radius:5px;">
      <form action="getAllMapGoodsDept" accept-charset="utf-8"  method="post">
    
									  <input id="getGoodsDept_input_Name2" style="width: 192px;border:none;border-bottom: 1px solid gray;" placeholder="请输入查询商品">
									   <input type="button" class="btn" value="查询商品" id="getGoodsDeptclick">&nbsp;&nbsp;
						 </form>			 
									</div>
            
                  
                            
                         <!--   id="dataTables-example"  分页-->
                                <table class="table table-striped table-bordered table-hover"  >
                                    <thead>
                                        <tr class="success" style="color: gray;">
                                             <th  class='center'>记录</th>
                                            <th  class='center'>商品</th>
                                            <th  class='center'>部门</th>
                                            <th  class='center'>商场位置</th>
                                            <th  class='center'>陈列方式(剩余数量)</th>
                                            <th  class='center'>售价</th>
                                            <th  class='center'>促销价</th>
                                            <th  class='center'>查看</th>
                                            <th  class='center'>操作</th>
                                        </tr>
                                    </thead>
                                    <tbody id="mybody">
                                       
                                    <!-- <tr class="info" style="color: gray;">
                                            <th  class='center'>商品</th>
                                            <th  class='center'>部门</th>
                                            <th  class='center'>商场位置</th>
                                            <th  class='center'>陈列方式(剩余数量)</th>
                                            <th  class='center'>售价</th>
                                            <th  class='center'>促销价</th>
                                            <th  class='center'>操作</th>
                                            <th  class='center'>操作</th>
                                        </tr> -->
                                        
                       
                                    </tbody>
                                  
                               <tr>
                               <td colspan="8" style="height: 30px;padding-top: 10px;">
                               <ul class="pagination" id="pageFootNo" style="height: 35px;">   </ul> 
                           
                               </td>
                               <td colspan="1" style="padding-top: 30px;padding-left: 10px;">
                                     当前第<span id="nowPage"></span>页/共<span id="total"></span>条<span id="pages"></span>页
                               </td>
                                 <tr>
                                    
                                </table>
                      <div > 
                                  
          </div>
                               
                            </div>
                            
                        </div>
                    </div>
                    <!--End Advanced Tables -->
                </div>
            </div>
                <!-- /. ROW  -->
        
        
        
        
        
        
        
        
        
     <!--    <h2>创建模态框（Modal）</h2>
按钮触发模态框
<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
	开始演示模态框
</button> -->
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"

 style="margin-left: 400px;margin-top: 150px;background-color: #fff;width: 700px;height: 500px;padding: 0px; ">
	<div class="modal-dialog" >
	  <div ><center>当天 &nbsp;<font id="todayGoodsname" color="green" size="5"></font> &nbsp;商品消费记录 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br/>
	  <br/>
	</center>  
	&nbsp;&nbsp;&nbsp;&nbsp;  消费数量&nbsp;&nbsp;<font id="todayGoodsNum" color="green" size="5"></font>
	   &nbsp;&nbsp;&nbsp;&nbsp;消费总额&nbsp;&nbsp;<font id="todayGoodsNumMonery" color="red" size="5"></font>
	    <font color="red" size="5">$</font>
	    &nbsp;&nbsp;
	  </div>
 		
			<div class="modal-body" >
				
				  <table class="table table-striped table-bordered table-hover" id="dataTables-exampleLaji"  >
                                    <thead>
                                        <tr class="success" style="color: gray;">
                                            <th  class='center'>商品名</th>
                                            <th  class='center'>消费数量</th>
                                            <th  class='center'>消费时间</th>
                                            <th  class='center'>操作</th>
                                        </tr>
                                    </thead>
                                    <tbody id="mybody2">
                                       
                                  
                                    </tbody>
                                      
                       
                              
                                   <tr>
                          
                             
                        <td colspan="3" align="right"> 
                        
                        <button id="prepage2" class='btn' style='height:27px;padding-top:3px;'>上一页</button>  
                        <button id="nextpage2" class='btn' style='height:27px;padding-top:3px;'>下一页</button> 
                           </td>
                                   <td colspan="1">
                                  当前第<span id="nowPage2"></span>页/共<span id="total2"></span>条<span id="pages2"></span>页  
                                   </td>
                                    </tr>   
                                
                                </table>
				
				
			</div>
			<div class="modal-footer"  style="background-color: #fff;">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<button type="button" class="btn" style="margin-left:10px;margin-right: 10px;">
					提交更改
				</button>
			</div>
	<!-- 	/.modal-content -->
	</div><!-- /.modal -->
</div>
        
        
      
        
          
          
          
          

          
          
               
        
 
 
 
 
 
    <!-- 模态框（Modal） -->
<div class="modal fade" id="myModalTidy" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" 
style="margin-left: 300px;margin-top: 150px;height: 435px;background-color: #fff;width: 680px;"
>
	<div class="modal-dialog" >
		
			<center>
				<font id="app0092" color="green" size="5" ></font>&nbsp;&nbsp;(理货)</center><hr/>
			&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; <font id="app2m" color="green" size="5" ></font>&nbsp;&nbsp;总共：
	  <font id="app3m" color="green" size="5"></font>  还剩下：
	   (<font color="red" size="5" id="app4m" ></font>)		<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 温馨提醒（待补货数量）:<font id="app5m" color="red" size="5"></font><font>（数量）</font>
			</hr>
			
			
			<div class="modal-body" style="margin-left: 10px;">

				
			
			
			  <table class="table table-striped table-bordered table-hover"  >
                                    <thead>
                                        <tr class="success" style="color: gray;font-weight: normal;">
                                            <th  class='center'>剩余数量</th>
                                            <th  class='center'>生产日期</th>
                                            <th  class='center'>保质期</th>
                                            <th  class='center'>到期日期</th>
                                            <th  class='center'>操作</th>
                                        </tr>
                                    </thead>
                                    <tbody id="clearTbbody">
                                    
                                    </tbody>
                                    </table>
			
			<div class="alert alert-danger alert-dismissable" id="alertdate" style="display: none;" >
	<a href="#" class="close" data-dismiss="alert">
		&times;
	</a>
	<strong>警告！</strong>该商品到期时间日期不足一个月 ！
</div>
			</div>
			<div class="modal-footer" style="background-color: #fff;">&nbsp;&nbsp;
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>&nbsp;&nbsp;
			<button  class="btn" style="margin-left: 10px;margin-right: 10px;" data-toggle='modal' data-target='#myModal3'  onclick="bufujilu()">补货记录</button>
				
			</div>
		
	</div><!-- /.modal -->
</div>


 


 



                     <div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
style="margin-top: 50px;margin-left: 360px;background-color: #fff;height: 420px;"
>
	<div class="modal-dialog" >
	 
 		<center><font id="app009" color="green" size="5" ></font>&nbsp;&nbsp;(补货记录 最近五天)</center>
			<div class="modal-body" id="allApp" style="margin-left: 10px;">
			 
	

        <table class="table table-striped table-bordered table-hover" id="dataTables-exampleLaji"  >
                                    <thead>
                                        <tr class="success" style="color: gray;">
                                           <th  class='center'>仓库</th>
                                            <th  class='center'>补货数量</th>
                                            <th  class='center'>补货时间</th>
                                            <th  class='center'>库存编号</th>
                                            <th  class='center'>补货员</th>
                                        </tr>
                                    </thead>
                                    <tbody id="mybody6">
                                    
                                  
                                    </tbody>
                                    </table>

			</div>
			<div class="modal-footer"  style="background-color: #fff;">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<button type="button" class="btn" style="margin-left:10px;margin-right: 10px;">
					提交更改
				</button>
			</div>
	<!-- 	/.modal-content -->
	</div><!-- /.modal -->
</div>



<div id="page" style="margin-top: 10px;padding: 10px;margin-left: 20px;margin-right: 20px; " > 

<div class="row">
                <div class="col-md-12">
                    <!-- Advanced Tables -->
                    <div class="card">
                        <div class="card-action">
                                            提交补货订单
                        </div>
                        <div class="card-content">
                        
                        <div class="alert alert-warning" id="alert3" style="display: none;">
	<a href="#" class="close" data-dismiss="alert">
		&times;
	</a>
	<strong>警告！</strong>你未提交补货订单 。
</div>
                        
                        
                            <div class="table-responsive">
                            
                                <table class="table table-striped table-bordered table-hover" id="lastTrTable" >
                                    <thead>
                                        <tr class="success">
                                            <th>补货商品编号</th>
                                            <th>补货商品名称</th>
                                            <th>补货数量</th>
                                             <th>归属部门</th>
                                                 <th style="padding-left: 20px;">操作</th>
                                        </tr>
                                    </thead>
                                    <tbody id="lastTr">
                                        
              
                       
                                    </tbody>
                                     <tbody >
                                        
                                <tr ><td colspan="4" align="right"><center>
                               <button class='btn'style='height:25px;padding-top:2px;' onclick="tijiaoLast()" >提交申请</button>
                                 
                                 </center></td>
                          <td colspan="1"  style="padding-left: 20px;">
                          
                          <button class='btn'style='height:25px;padding-top:2px;'  onclick="deleteTR()">删除</button>
                          </td></tr>
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



<div class="modal fade" id="myModalpandian" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="margin-left: 200px;margin-top: 100px;height: 400px;background-color: #fff;width: 680px;">
	<div class="modal-dialog">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
				</h4>
					<font id="app0092p" color="green" size="5" ></font>（盘点）
					今日已经消费<font color="red" size="5" id="spendNumxxx11"></font>（数量）
					今日盘点<font color="red" size="5" id="SetPointNumxxx11"></font>（数量）
			</div>
			<div class="modal-body" >
				
				
				<div >
				
<form class="form-horizontal" role="form">

  <div class="form-group">
    <label for="firstname" class="col-sm-2 control-label"><font style="font-size: 16px;font-weight: normal;">货架剩余</font></label>
    <div class="col-sm-10">
      <input type="text" class="form-control" readonly="readonly"  style="width: 200px;font-size: 17px;color: green;" id="goodsshelfhaiyou">
    </div>
  </div>
  <div class="form-group">
    <label for="lastname" class="col-sm-2 control-label"><font style="font-size: 16px;font-weight: normal;">商品损毁</font></label>
    <div class="col-sm-10">
      <input type="text" class="form-control" value="0" placeholder="请输入商品损毁数量" style="width: 200px;" id="goodsSuohui">
    </div>
  </div>
  <div class="form-group">
    <label for="lastname" class="col-sm-2 control-label"><font style="font-size: 16px;font-weight: normal;">商品丢失</font></label>
    <div class="col-sm-10">
      <input type="text" class="form-control" value="0" placeholder="请输入商品丢失数量" style="width: 200px;"  id="goodsDiushi">
    </div>
  </div>
 
  
</form>
			  <div class="alert alert-danger alert-dismissable" id="lastpandianggalert" style="display: none;">
            <button type="button" class="close" data-dismiss="alert"
                    aria-hidden="true">
                &times;
            </button>
            错误！请输入正确的数量！（丢失+索贿应小于等于剩余数量）
        </div>	
			</div>	
				
			</div>
			<div class="alert alert-warning" id="alert2" style="display: none;margin-left: 15px;" >
	<a href="#" class="close" data-dismiss="alert">
		&times;
	</a>
	<strong>警告！</strong>你没有修改数据 ！
</div>
			<div class="modal-footer"  style="background-color: #fff;">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<button type="button" class="btn" style="margin-right: 10px;margin-left: 10px;" onclick="submitPandain()" >提交
				</button>
			</div>
	</div><!-- /.modal -->
</div>


    <!-- jQuery Js -->
    <script src="backStage/assets/js/jquery-1.10.2.js"></script>
    
 <script type="text/javascript" src="backStage/tlz/myJs/goodsShelf.js" ></script>
 <script type="text/javascript" src="backStage/tlz/js/vue.min.js"></script>
 <script type="text/javascript" src="backStage/assets/yhx_js/vue-resource.min.js"></script>
	 <script type="text/javascript">
	
	  
	
	 var  quanJugdname="";
	
	 $(function(){
	 getGdname2("化妆部");
//alert(document.body.offsetHeight);获取页面高度
	 })
	 
	 var  lastgdname999;
	
	 function getGdname(gdname){
	 $('html,body').animate({scrollTop:600},100);
	 //$('#dataTables-exampleXia')[0].scrollIntoView(true);  //页面加载到指定位置
	 quanJugdname=gdname;
	 lastgdname999=gdname;
	// alert(gdname);
	ajaxRepart(gdname,1);
	 }
	 
	 
	   function getGoodsDeptLitter(){
	   quanJugdname="";
	   $('html,body').animate({scrollTop:600},100);
	ajaxRepart("",1);
	   
   }
	 
	 
	 
	  function getGdname2(gdname){  //页面自动加载
	ajaxRepart(gdname,1);
	 }
	 
	 function  ajaxRepart(gdname,pageNum){
	   $("#mybody").html("");
	 $.ajax({
          url:"getAllShelfGoodsDeptPageInfo",
         type:"post",
         data:{"gdName":gdname,"pageNum":pageNum},
          dataType:"json",
         success:function(datas){
        	 var data=datas.list;
        	// alert(data);
         var ul="";
          for(var i=0;i<data.length;i++){
         ul+="<tr class='gradeA' >";
         if(parseInt(data[i].spDnNum)<parseInt(data[i].dnMaxNum)){
         ul+="<td><div class='switch'><label><input type='checkbox' onclick='SaleUtil4(this)' ><span class='lever'> </span></label></div></td>";
         }else{
      	ul+="<td><div class='switch'><label><input type='checkbox' disabled  ><span class='lever'> </span></label></div></td>";
       }
         ul+="<td  class='center' ><input type='hidden' value="+data[i].spName+" id='spName' /><input type='hidden' value="+data[i].spId+" id='spId' />"+data[i].spName+"</td>";
           ul+="<td  class='center'><input type='hidden' value="+data[i].dpName+" id='dpName' />"+data[i].gdName+"</td>";
         ul+="<td  class='center'><input type='hidden' value="+data[i].gdName+" id='gdName' />"+data[i].anName+" - "+data[i].bnName+"</td>";
           ul+="<td  class='center' > <input type='hidden' value="+data[i].dnMaxNum+" id='dnMaxNum' /><input type='hidden' value="+data[i].spDnNum+" id='spDnNum' />"+"<span style='color:green;'>"+data[i].dpName+"</span>"+" ("+data[i].dnMaxNum+") "+" /<span style='color:green;'> "+data[i].spDnNum+"</td>";
            ul+="<td  class='center' style='color:red;font-size:18px;'>"+data[i].spSalePrice +"  $"+"</td>";
             ul+="<td  class='center' style='color:red;font-size:18px;'>"+data[i].spDisPrice+"  $"+"</td>";
              ul+="<td  class='center'><button class='btn'style='height:25px;padding-top:2px;' onclick='SaleUtil("+data[i].spId+")' data-toggle='modal' data-target='#myModal' >销售情况</button></td>";
               ul+="<td  class='center'>";
               if(parseInt(data[i].spDnNum)<parseInt(data[i].dnMaxNum)){
              ul+="<button class='btn'style='height:25px;padding-top:2px;background-color:#F44336;'  onclick='SaleUtil3(this)' >补货</button>&nbsp;&nbsp;<button class='btn'style='height:25px;padding-top:2px;'  onclick='clearGoods(this)' data-toggle='modal' data-target='#myModalTidy' >理货</button>";
               }else{
            ul+="<button class='btn'style='height:25px;padding-top:2px;' onclick='clearGoods(this)' data-toggle='modal' data-target='#myModalTidy' >理货</button>";
               }
               ul+="</td>";
                ul+="</tr>";
         }
         // alert(ul);
         $("#mybody").append(ul);
         $("#nowPage").html(datas.pageNum); //当前页码
           $("#total").html(datas.total); //总条数
         $("#pages").html(datas.pages);  //总页数
         
         //分页脚
         //pageFootNo
         var  pageLi="<li><a href='javascript:void(0)' id='prepage'>上一页</a></li>"
         
          for(var j=1;j<=datas.pages;j++){
          pageLi+="<li><a href='javascript:void(0)' onclick='pageByOne("+j+")'>"+j+"</a></li>";
          }
         pageLi+="<li><a href='javascript:void(0)' onclick='nextpage()' >下一页</a></li>";
             $("#pageFootNo").html(pageLi);  
                  }
                  
         
         }); 
	 }
	 //
	 
	 $("#getGoodsDeptclick").click(function(){
	// alert($("#getGoodsDept_input_Name2").val());
	var quanJugdname3=$("#getGoodsDept_input_Name2").val();
	 if(quanJugdname3.length<=0){
	 quanJugdname3=quanJugdname;
	 }
	 ajaxRepart(quanJugdname3,1);
	 })
	 
	 
	 
      
       $("body").delegate("#prepage","click", function(){   //点击上一页
      
   /*    delegate() 方法为指定的元素（属于被选元素的子元素）添加一个或多个事件处理程序，并规定当这些事件发生时运行的函数。
                       使用 delegate() 方法的事件处理程序适用于当前或未来的元素（比如由脚本创建的新元素）。 */
                       
       var nowPage=parseInt($("#nowPage").html());
         if(parseInt(nowPage)<=1){
         nowPage=2;
         }
       //  alert(nowPage);
          ajaxRepart(quanJugdname,nowPage-1);
      
      
       })
       
       
       
      
      
      function nextpage(){        //点击下一页
          //得到下一页的页码   
         var nowPage=parseInt($("#nowPage").html());
         if(nowPage>=parseInt($("#pages").html())){
         nowPage=parseInt($("#pages").html());
        
         }else{
         nowPage++;
         }
       //  alert(nowPage)
         // alert(nowPage);
          ajaxRepart(quanJugdname,nowPage);
     }
     
	 
	function  pageByOne(nowPage){
	//alert(PageNum);
	ajaxRepart(quanJugdname,nowPage);
	}
	 
	 </script>
	 <script>
	 /* 查询商品消费详情分页 */
	 var  pageNumJ=1;
	  var spidss;
	
	 function SaleUtil(spid,pageNumJ){
	  var  pageNum;
	 
	if(typeof(pageNumJ)==="undefined"){
     pageNum=1;
      }else{
     pageNum= pageNumJ;
          }
	 $("#mybody2").html("");
	 spidss=spid;
	
	 $.ajax({
          url:"getAllSaleUtilByOneOnGoodSDept",
         type:"post",
         data:{"spId":spid,"pageNum":pageNum},
          dataType:"json",
         success:function(datas){
        var data=datas.list;
      //  alert(data);
         var tr="";
         var todayGoodsname;//
         var countGoodsNum=0; // 消费该商品总数量
         var spSalePrice=0;  // 消费该商品总额
         for(var i=0;i<data.length;i++){
         tr+="<tr class='gradeA' >";
         tr+="<td  class='center' >"+data[i].spName+"</td>";
         tr+="<td  class='center' >"+data[i].ssSaleNum+"</td>";
            tr+="<td  class='center' >"+data[i].ssDate+"</td>";
              tr+="<td  class='center' >"+data[i].ssDate+"</td>";
         tr+="</tr>";
         countGoodsNum+=parseInt(data[i].ssSaleNum);
         spSalePrice=parseFloat(data[i].ssSalePrice);
         todayGoodsname=data[i].spName;
         }
        // alert(countGoodsNum*spSalePrice);
        $("#todayGoodsname").html(todayGoodsname);
          $("#todayGoodsNum").html(countGoodsNum);
      
         $("#todayGoodsNumMonery").html(countGoodsNum*spSalePrice);
         $("#mybody2").html(tr);
             $("#nowPage2").html(datas.pageNum);
           $("#total2").html(datas.total);
         $("#pages2").html(datas.pages);
         }
         })
	 }
	 
	 $("#nextpage2").click(function(){    //得到下一页的页码   
	 
       
         var nowPage=parseInt($("#nowPage2").html());
         if(nowPage>=parseInt($("#pages2").html())){
         nowPage=parseInt($("#pages2").html());
        
         }else{
         nowPage++;
         }
       //  alert(nowPage);
          SaleUtil(spidss,nowPage);
     })
     
      $("#prepage2").click(function(){    //得到上一页的页码   
	 
       
        var nowPage=parseInt($("#nowPage2").html());
         if(parseInt(nowPage)<=1){
         nowPage=2;
         }
          SaleUtil(spidss,nowPage-1);
     })
     
	 </script>
	 <script>//spId,dpName,dnMaxNum,spDnNum spId
	 
	 var spIds;
	 function clearGoods(q){   //理货
	 $("#clearTbbody").html("");
	 var spId=$(q).parent().parent().find("#spId").val();
	 spIds=spId;
	 var dpName=$(q).parent().parent().find("#dpName").val();
 	var dnMaxNum=$(q).parent().parent().find("#dnMaxNum").val();
	var spDnNum=$(q).parent().parent().find("#spDnNum").val();
	var spName=$(q).parent().parent().find("#spName").val();
	var needGooDsNum=parseInt(dnMaxNum)-parseInt(spDnNum);
	$("#app0092").html(spName);
	$("#app0092p").html(spName);
	 $("#app2m").html(dpName);
	$("#app3m").html(dnMaxNum);
	$("#app4m").html(spDnNum);
	$("#app5m").html(needGooDsNum);
	    $.ajax({
           url:"getClearGoods",
             type:"post",
             data:{spid:spId},
              dataType:"json",
             success:function(data){
             var  tr="";
             
             for(var i=0;i<data.length;i++){
             tr+="<tr>";
              tr+="<td class='center'><input type='hidden' value="+data[i].rtId+" id='rtIdcvb123' /><input type='hidden' value="+data[i].guTotalNum+" id='guTotalNumcvb123' />"+data[i].guNum+"</td>";
             tr+="<td class='center'><input type='hidden' value="+data[i].spId+" id='sptIdcvb123' />"+data[i].rtbegDate+"</td>";
              tr+="<td class='center'><input type='hidden' value="+data[i].whId+" id='whIdcvb123' />"+data[i].rtPeriod+"</td>";
               tr+="<td class='center'><input type='hidden' value="+data[i].spBuyPrice+" id='spBuyPricecvb123' /><input type='hidden' value="+data[i].rtEndDate+" id='rtEndDate' />";               
              
              if(getDaysByDateString(getNowFormatDate(),data[i].rtEndDate)<=30){
                $("#alertdate").show();
               tr+="<font color='red'>"+data[i].rtEndDate+"</font></td>";
              }else{
              $("#alertdate").hide();
               tr+=""+data[i].rtEndDate+"</td>";
               }
               tr+="<td class='center'><input type='hidden' value="+data[i].guNum+" id='guNumcvb123' /><button class='btn' style='height:25px;padding-top:2px;' data-toggle='modal' data-target='#myModalpandian' onclick='pandian(this)' >盘点</button></td>";
                tr+="</tr>"
                
				
             }
             $("#clearTbbody").append(tr);
             }
             })
	 
	  
	
	 }
	 
	 //11
	  
	//11
	
	 
	  var myModel={list:[]};
	 
	 var  gdName2buGoods;
	 function SaleUtil2(q){   //理货  data-toggle='modal' data-target='#myModal2'
	 
	  gdName2buGoods=$(q).parent().parent().find("#gdName").val();
	var spId=$(q).parent().parent().find("#spId").val();
	spIds=spId;
	var dpName=$(q).parent().parent().find("#dpName").val();
	var dnMaxNum=$(q).parent().parent().find("#dnMaxNum").val();
	var spDnNum=$(q).parent().parent().find("#spDnNum").val();
	var spName=$(q).parent().parent().find("#spName").val();
	var needGooDsNum=parseInt(dnMaxNum)-parseInt(spDnNum);
	$("#app0").html(spName);
	$("#app009").html(spName);
	
	$("#app2").html(dpName);
	$("#app3").html(dnMaxNum);
	$("#app4").html(spDnNum);
	$("#app5").html(needGooDsNum);
	
	$("#GooodsBubuy").html(spName);
	$("#firstname").val(needGooDsNum);
	 
	 
	
	      $.ajax({
          url:"selectBuGoodsCheckIf",
         type:"post",
         data:{"spid":spId},
          dataType:"text",
         success:function(datas){

       // alert(datas);
         if(datas=="补货待审核"){
           $("#myModal9").modal("hide");  //补货申请
          alert("正在审核中！");
          $("#alert1").css("display","block");
          }else if(datas=="补货已审核"){
         // alert("审核已通过！");     
          $("#myModal2").modal("show");  //直接拿货
          $("#mybody5").html(" ");
           $.ajax({
          url:"getAllMapGoodsDifferentUtil",
         type:"post",
         data:{"spid":spId},
          dataType:"json",
         success:function(datas){
      //   alert(datas);
     
         var tr="";
         for(var i=0;i<datas.length;i++){
         tr+="<tr>"
         tr+="<td class='center' ><input type='hidden' value="+datas[i].rtId+" id='rtId' />"+datas[i].whName+"</td>";
           tr+="<td class='center' style='color:green;' id='rtNumber'>"+datas[i].rtNumber+"</td>";
             tr+="<td class='center'><input type='hidden' value="+datas[i].spId+" id='spIdbu' />"+datas[i].rtbegDate+"</td>";
               tr+="<td class='center'>"+datas[i].rtEndDate+"</td>";
               tr+="<td class='center'><button class='btn'style='height:25px;padding-top:2px;' onclick='cangku(this)'>选择该仓库</button></td>";
                 tr+="</tr>";
         }
        $("#mybody5").append(tr);
         }
         }) 
          
          
          }else if(datas=="等待提交审核"){
          $("#myModal9").modal("show");  //补货申请
        //  alert("请先提交审核！");
          } 

         }
         })
	 
	 
	   
	// $("#myModal2").modal("show");  //直接拿货
	 
	 
	 

   
  
   
}
	
	 function cangku(o){
	var rtId =$(o).parent().parent().find("#rtId").val();
		var rtNumber =$(o).parent().parent().find("#rtNumber").html();
		var spIdbu=$(o).parent().parent().find("#spIdbu").val();
 	 var buNum=$("#app5").html();
	if(parseInt(buNum)>parseInt(rtNumber)){   //此时rtNumber 为
	
	
	 $.ajax({
          url:"BackOrder",
           contentType:"application/json;charset=utf-8", 
         type:"post",
        // data:'{"gdId":gdId,"dpId":dpId,"anId":anId,"bnId":bnId,"spId":spId}',
        data:"{\"rtId\":\""+rtId+"\",\"rtNumber\":\""+rtNumber+"\",\"spIdbu\":\""+spIdbu+"\",\"buNum\":\""+buNum+"\"}",
          dataType:"json",
         success:function(datas){
         $("#app5").html(parseInt(buNum)-parseInt(rtNumber))
          $("#app4").html(parseInt($("#app4").html())+parseInt(rtNumber))
            $(o).parent().parent().remove();
	 $('#dataTables-exampleXia')[0].scrollIntoView(true);  //页面加载到指定位置
	 //alert(gdName2buGoods);
	ajaxRepart(gdName2buGoods,1);
            //刷新页面
              alert("请继续补货");
         }
       })
	
	
	
	}else if(parseInt($("#app5").html())==0){
	alert("不用补货!!");
	}else if(parseInt(buNum)<=parseInt(rtNumber)){
	
	   $.ajax({
          url:"BackOrder",
           contentType:"application/json;charset=utf-8", 
         type:"post",
        // data:'{"gdId":gdId,"dpId":dpId,"anId":anId,"bnId":bnId,"spId":spId}',
        data:"{\"rtId\":\""+rtId+"\",\"rtNumber\":\""+rtNumber+"\",\"spIdbu\":\""+spIdbu+"\",\"buNum\":\""+buNum+"\"}",
          dataType:"json",
         success:function(datas){
	 $('#dataTables-exampleXia')[0].scrollIntoView(true);  //页面加载到指定位置
	 //alert(gdName2buGoods);
	ajaxRepart(gdName2buGoods,1);
	$("#myModal2").modal("hide");
            //刷新页面
         }
       })
	       
	
	}
	
	
	 }
  
	//  补货记录
	
 function	bufujilu(){
    $("#mybody6").html(" ");
                
                  $.ajax({
          url:"getAllMapBuGoods",
         type:"post",
         data:{"spid":spIds},
          dataType:"json",
         success:function(datas){
     
         var tr="";
         for(var i=0;i<datas.length;i++){
         tr+="<tr>"
         tr+="<td class='center' >"+datas[i].whName+"</td>";
           tr+="<td class='center' >"+datas[i].bgNum+"</td>";
             tr+="<td class='center'>"+datas[i].bgDate+"</td>";
               tr+="<td class='center'>"+datas[i].rtId+"</td>";
               tr+="<td class='center'>"+datas[i].ocid+"</td>";
                 tr+="</tr>";
         }
        $("#mybody6").append(tr);
         }
         }) 
    
    
    
 }
	 </script>
	 <script>
	
	/* 
	 var handle=  new Vue({
        el: '#myapp',
        data: {
            sites: []
        },
        created: function () {
      //为了在内部函数能使用外部函数的this对象，要给它赋值了一个名叫self的变量。
            var self = this;
       //  this.data=null;
           
      //      this.$forceUpdate();
            $.ajax({
                url: 'getAllMapGoodsDifferentUtil',
                type: 'get',
                  data:{"spid":spIds},
                dataType: 'json'
            }).then(function (res) {
              //  console.log(res);
         //把从json获取的数据赋值给数组
           self.sites = res;
      //   self.listMoveX.splice(0,1,res);
        //   handle.$set(handle.$data,"sites",res);
   
    
               // Vue.set(this.gc,0,{name:'lisi',age:22}) //这样就能被vue监控到，更新视图    
            //   alert(self.sites);
            }).fail(function () {
                console.log('失败');
            })
        }
    })
	 */
	
	
	
 /* $.ajax({
          url:"getAllMapGoodsDifferentUtil",
         type:"post",
         data:{"spid":spId},
          dataType:"json",
         success:function(datas){
         alert(datas);
         
        
         
         var vm=    new Vue({
        el: '#myapp',
        data: {
            sites: []
        }
         
         })
        //  vm.sites=;
          vm.$set(vm.$data, 'sites', datas)
      //  vm.$forceUpdate();
         }
         })  */

	 </script>
	 <script type="text/javascript">
	 
	 
	 
	 
	 </script>
	<!-- Bootstrap Js -->
	
    <script src="backStage/assets/js/bootstrap.min.js"></script>
	
	
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
