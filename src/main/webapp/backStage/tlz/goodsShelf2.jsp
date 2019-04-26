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
   
   
   
   
    </style>
</head>
<body style="background-color: #ececec;">
  
	
        
		
            <div id="page-inner"> 
               
        
      
      <div style="background-color: #fff;padding-top: 5px;width: 293px;padding-left: 10px;height: 60px;border-radius:5px;">
      <form action="getAllMapGoodsDept" accept-charset="utf-8"  method="post">
     
									  <input name="getGoodsDept_input_Name" style="width: 192px;" placeholder="请输入查询部门">
									   <input type="submit" class="btn" value="查询" id="getGoodsDept">&nbsp;&nbsp;
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
                            
                            
                               <div style="background-color: #fff;padding-top: 5px;width: 310px;padding-left: 10px;height: 60px;border-radius:5px;">
      <form action="getAllMapGoodsDept" accept-charset="utf-8"  method="post">
    
									  <input id="getGoodsDept_input_Name2" style="width: 192px;" placeholder="请输入查询商品">
									   <input type="button" class="btn" value="查询商品" id="getGoodsDeptclick">&nbsp;&nbsp;
						 </form>			 
									</div>
            
                            
                            
                            
                         <!--   id="dataTables-example"  分页-->
                                <table class="table table-striped table-bordered table-hover" id="dataTables-exampleXia" >
                                    <thead>
                                        <tr class="info" style="color: gray;">
                                       
                                            <th  class='center'>商品</th>
                                            <th  class='center'>部门</th>
                                            <th  class='center'>商场位置</th>
                                            <th  class='center'>陈列方式(剩余数量)</th>
                                            <th  class='center'>售价</th>
                                            <th  class='center'>促销价</th>
                                            <th  class='center'>操作</th>
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
                               <td colspan="7" style="height: 30px;padding-top: 10px;">
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

>
	<div class="modal-dialog" >
	  <div class="modal-content"> 当天 &nbsp;<font id="todayGoodsname" color="green" size="5"></font> &nbsp;商品消费记录 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  消费数量&nbsp;&nbsp;<font id="todayGoodsNum" color="green" size="5"></font>
	    消费总额&nbsp;&nbsp;<font id="todayGoodsNumMonery" color="red" size="5"></font>
	    <font color="red" size="4">$</font>
	    &nbsp;&nbsp;
	  </div>
 		
			<div class="modal-body" >
				
				  <table class="table table-striped table-bordered table-hover" id="dataTables-exampleLaji"  >
                                    <thead>
                                        <tr class="info" style="color: gray;">
                                            <th  class='center'>商品名</th>
                                            <th  class='center'>消费数量</th>
                                            <th  class='center'>消费时间</th>
                                            <th  class='center'>操作</th>
                                        </tr>
                                    </thead>
                                    <tbody id="mybody2">
                                       
                                  
                                    </tbody>
                                      
                       
                              
                                   <tr>
                          
                             
                        <td colspan="4" align="right"> 
                        <button id="nextpage2" class='btn' style='height:27px;padding-top:3px;'>下一页</button> 
                        <button id="prepage2" class='btn' style='height:27px;padding-top:3px;'>上一页</button>  
                            当前第<span id="nowPage2"></span>页/共<span id="total2"></span>条<span id="pages2"></span>页</td>
                                    </tr>   
                                
                                </table>
				
				
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<button type="button" class="btn btn-primary" style="margin-left:10px;margin-right: 10px;">
					提交更改
				</button>
			</div>
	<!-- 	/.modal-content -->
	</div><!-- /.modal -->
</div>
        
        
        <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"

>
	<div class="modal-dialog" >
	 
 		<center><font id="app0" color="green" size="4" ></font>&nbsp;&nbsp;(补货)</center>
			<div class="modal-body" id="allApp" style="margin-left: 10px;">
			 
	 <font id="app2" color="green" size="4" ></font>&nbsp;&nbsp;总共：
	<font id="app3" color="green" size="4"></font>  还剩下：
	   (<font color="red" size="4" id="app4" ></font>)		
				<hr/>
				应再补:<font id="app5" color="green" size="5"></font><font>（数量）</font>
					<span class="btn" data-toggle='modal' data-target='#myModal3' style="margin-left: 320px;margin-bottom: 10px;" onclick="bufujilu()">补货记录</span>
				<br/>
		<!-- 	<div id="appvvvvb">
    <div v-html="message"></div>
     <div v-html="ok"></div>
</div> -->

<div id="myapp">

        <table class="table table-striped table-bordered table-hover" id="dataTables-exampleLaji"  >
                                    <thead>
                                        <tr class="info" style="color: gray;">
                                            <th  class='center'>仓库</th>
                                            <th  class='center'>数量</th>
                                            <th  class='center'>生产日期</th>
                                            <th  class='center'>到期日期</th>
                                            <th  class='center'>操作</th>
                                        </tr>
                                    </thead>
                                    <tbody id="mybody5">
                                       <tr v-for="site in sites" >
            <td class='center' ><!-- {{site.whName}} -->   </td>
             <td class='center' ><!-- {{site.rtNumber}} -->     </td>
            <td class='center' v-text="site.rtbegDate"></td>
            <td class='center' v-text="site.rtEndDate"></td>
            <td class='center' ><button class="btn" style='height:25px;padding-top:2px;' >补货</button></td>
           </tr>

                                  
                                    </tbody>
                                    </table>

</div>





			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<button type="button" class="btn btn-primary" style="margin-left:10px;margin-right: 10px;">
					提交更改
				</button>
			</div>
	<!-- 	/.modal-content -->
	</div><!-- /.modal -->
</div>
        
          
          
          
          

          
          
               
          
            </div>
     </div>
             <!-- /. PAGE INNER  -->
            </div>
         <!-- /. PAGE WRAPPER  -->
     <!-- /. WRAPPER  -->
    <!-- JS Scripts-->
 
 
 
 
 
    <!-- 模态框（Modal） -->
<div class="modal fade" id="myModalTidy" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" >
		
			<center>
				<font id="app0092" color="green" size="4" ></font>&nbsp;&nbsp;(理货)</center><hr/>
			&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; <font id="app2m" color="green" size="4" ></font>&nbsp;&nbsp;总共：
	  <font id="app3m" color="green" size="4"></font>  还剩下：
	   (<font color="red" size="4" id="app4m" ></font>)		<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 温馨提醒（待补货数量）:<font id="app5m" color="red" size="5"></font><font>（数量）</font>
			</hr>
			
			
			<div class="modal-body" style="margin-left: 10px;">

				
			
			
			  <table class="table table-striped table-bordered table-hover"  >
                                    <thead>
                                        <tr class="info" style="color: gray;">
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
			
			
			</div>
			<div class="modal-footer">&nbsp;&nbsp;
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>&nbsp;&nbsp;
			<button  class="btn" style="margin-left: 10px;margin-right: 10px;" data-toggle='modal' data-target='#myModal3'  onclick="bufujilu()">补货记录</button>
				<button type="button" class="btn btn-primary">
					提交更改
				</button>
			</div>
		
	</div><!-- /.modal -->
</div>


 


 <div class="modal fade" id="myModal9" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
style="margin-top: 50px;margin-left: 360px;"
>
	<div class="modal-dialog"  >
	 
 		<center>提交&nbsp;&nbsp;<font id="GooodsBubuy" color="green" size="4" ></font>&nbsp;&nbsp;补货申请</center><br/>
			<div class="modal-body" id="allApp" style="padding-left: 100px;">
			 
	
	   
<form class="form-horizontal" role="form">
  <div class="form-group">
    <label for="firstname" class="col-sm-2 control-label" style="font-size: 15px;font-weight: normal;color: #000; ">数&nbsp;&nbsp;&nbsp;&nbsp;量 </label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="firstname"  readonly="readonly"  style="width: 280px;color: green;font-size: 17px;background-color: #fff; ">
    </div>
  </div>
  <div class="form-group">
    <label for="lastname" class="col-sm-2 control-label"  style="font-size: 15px;font-weight: normal;color: #000;">补货员 </label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="lastname" readonly="readonly" placeholder="请输入姓" value="${relaname }"style="width: 280px;color: #000;background-color: #fff;"/>
    </div>
  </div>
 
 

	   
	      

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<button type="button" class="btn btn-primary" onclick="applyBuGoods()" style="margin-left:10px;margin-right: 10px;">
					提交申请
				</button>
			</div>
			</form>
	<!-- 	/.modal-content -->
	</div><!-- /.modal -->
</div>






                     <div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
style="margin-top: 50px;margin-left: 360px;"
>
	<div class="modal-dialog" >
	 
 		<center><font id="app009" color="green" size="4" ></font>&nbsp;&nbsp;(补货记录 最近五天)</center>
			<div class="modal-body" id="allApp" style="margin-left: 10px;">
			 
	

        <table class="table table-striped table-bordered table-hover" id="dataTables-exampleLaji"  >
                                    <thead>
                                        <tr class="info" style="color: gray;">
                                           <th  class='center'>仓库</th>
                                            <th  class='center'>补货数量</th>
                                            <th  class='center'>补货时间</th>
                                            <th  class='center'>补货员</th>
                                        </tr>
                                    </thead>
                                    <tbody id="mybody6">
                                    
                                  
                                    </tbody>
                                    </table>

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<button type="button" class="btn btn-primary" style="margin-left:10px;margin-right: 10px;">
					提交更改
				</button>
			</div>
	<!-- 	/.modal-content -->
	</div><!-- /.modal -->
</div>















    <!-- jQuery Js -->
    <script src="backStage/assets/js/jquery-1.10.2.js"></script>
    
 <script type="text/javascript" src="backStage/tlz/myJs/goodsShelf.js"></script>
 <script type="text/javascript" src="backStage/tlz/js/vue.min.js"></script>
 <script type="text/javascript" src="backStage/assets/yhx_js/vue-resource.min.js"></script>
	 <script type="text/javascript">
	function applyBuGoods(){   //提交补货申请
	//alert($("#firstname").val())
		 $.ajax({
          url:"insertBuGoodsCheck",
         type:"post",
         data:{"spid":spIds,"bgNum":$("#firstname").val()},
          dataType:"json",
         success:function(datas){
         if(datas=="true"){
         $("#myModal9").modal("hide");  //补货申请
         }
         }
	})
	
	}
	
	
	
	 var  quanJugdname="";
	 
	 $(function(){
	 getGdname2("化妆部");
//alert(document.body.offsetHeight);获取页面高度
	 })
	 
	
	 function getGdname(gdname){
	 $('#dataTables-exampleXia')[0].scrollIntoView(true);  //页面加载到指定位置
	 quanJugdname=gdname;
	// alert(gdname);
	ajaxRepart(gdname,1);
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
     
         ul+="<td  class='center' ><input type='hidden' value="+data[i].spName+" id='spName' /><input type='hidden' value="+data[i].spId+" id='spId' />"+data[i].spName+"</td>";
           ul+="<td  class='center'><input type='hidden' value="+data[i].dpName+" id='dpName' />"+data[i].gdName+"</td>";
         ul+="<td  class='center'><input type='hidden' value="+data[i].gdName+" id='gdName' />"+data[i].anName+" - "+data[i].bnName+"</td>";
           ul+="<td  class='center' > <input type='hidden' value="+data[i].dnMaxNum+" id='dnMaxNum' /><input type='hidden' value="+data[i].spDnNum+" id='spDnNum' />"+"<span style='color:green;'>"+data[i].dpName+"</span>"+" ("+data[i].dnMaxNum+") "+" /<span style='color:green;'> "+data[i].spDnNum+"</td>";
            ul+="<td  class='center' style='color:red;font-size:18px;'>"+data[i].spSalePrice +"  $"+"</td>";
             ul+="<td  class='center' style='color:red;font-size:18px;'>"+data[i].spDisPrice+"  $"+"</td>";
              ul+="<td  class='center'><button class='btn'style='height:25px;padding-top:2px;' onclick='SaleUtil("+data[i].spId+")' data-toggle='modal' data-target='#myModal' >销售情况</button></td>";
               ul+="<td  class='center'>";
               if(parseInt(data[i].spDnNum)<parseInt(data[i].dnMaxNum)){
              ul+="<button class='btn'style='height:25px;padding-top:2px;background-color:#F44336;'  onclick='SaleUtil2(this)' >补货</button>&nbsp;&nbsp;<button class='btn'style='height:25px;padding-top:2px;'  onclick='clearGoods(this)' data-toggle='modal' data-target='#myModalTidy' >理货</button>";
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
	 quanJugdname=$("#getGoodsDept_input_Name2").val();
	 ajaxRepart(quanJugdname,1);
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
         nowPage+1
         }
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
	 
	  var spidss;
	 function SaleUtil(spid,pageNum){
	 $("#mybody2").html("");
	 spidss=spid;
	var  pageNum=1;
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
         nowPage+1
         }
          SaleUtil(spidss,nowPage);
     })
     
      $("#prepage2").click(function(){    //得到上一页的页码   
	 
       
        var nowPage=parseInt($("#nowPage2").html());
         if(parseInt(nowPage)<=1){
         nowPage=2;
         }
     //    alert(nowPage);
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
              tr+="<td class='center'>"+data[i].guNum+"</td>";
             tr+="<td class='center'>"+data[i].rtbegDate+"</td>";
              tr+="<td class='center'>"+data[i].rtPeriod+"</td>";
               tr+="<td class='center'>"+data[i].rtEndDate+"</td>";
               tr+="<td class='center'><button class='btn'style='height:25px;padding-top:2px;'>盘点</button></td>";
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
