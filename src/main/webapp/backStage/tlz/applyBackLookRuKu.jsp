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
<body style="background-color: #ececec;">
  
	
        
	<!-- 	 -->
         <div id="page-inner"> 
               
            <div class="row" style="background-color: #fff;padding-top: 20px;">
                <div class="col-md-12">
                    <!-- Advanced Tables -->
                    <div class="card">
                        <div class="card-action" style="font-size: 18px;">
                          <h3>下架&nbsp;入库&nbsp;查阅</h3>  
                        </div>
                        <br/> <br/>
                        <div class="card-content">
                            <div >
                             <div id="app">
                             
                             
                             
                           
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr class="success">
                                            <th>申请编号</th>
                                            <th>申请人</th>
                                            <th>申请时间</th>
                                            <th>下架数量</th>
                                             <th >审核状态</th>
                                               <th >下架原因</th>
                                           <th class='center'>操作</th>
                                        </tr>
                                    </thead>
                                    <tbody id="mytbody1">
                                       <tr v-for="site in sites" >
                                       <td>{{site.spucId}}</td>
                                        <td>{{site.ocId}}</td>
                                         <td>{{site.ucDate}}</td>
                                          <td>{{site.ucNum}}</td>
                                           <td>{{site.ucStatus}}</td>
                                            <td>{{site.ucReason}}</td>
                                            <td class='center'>
                                            
                                          <button @click="testVue(site.spucId)" type="button" class="btn btn-primary" style="height: 25px;padding-top: 2px;"  data-toggle="modal" data-target="#myModal">
					查&nbsp;看
				</button>  
                                            
                                            </td>
                                       </tr>
                                    </tbody>
                                </table>
                                
                                
                                  </div>
                                
                            </div>
                            
                        </div>
                    </div>
                    <!--End Advanced Tables -->
                </div>
            </div>
                <!-- /. ROW  -->
          
               
 
         <!-- /. PAGE WRAPPER  -->
     <!-- /. WRAPPER  -->
    <!-- JS Scripts-->
 
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	<div class="modal-dialog" style="width: 1000px;height: 400px;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					下架审核
				</h4>
			</div>
			<div class="modal-body" style="width: 998px;height: 400px;overflow-y: scroll;">
				
				
				  <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr class="success">
                                            <th>名称</th>
                                            <th>类别</th>
                                          <!--   <th>仓库</th> -->
                                             <th class='center'>库存</th>
                                            <th  class='center'>陈列(数量)</th>
                                             <th  class='center'>下架位置</th>
                                             <th  class='center'>价格</th>
                                              <th  class='center'>状态</th>
                                               
                                        </tr>
                                    </thead>
                                    <tbody id="mytbody">
                                       
                       
                                    </tbody>
                                </table>
                                
				
				
				
				
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<button type="button" class="btn btn-primary" id="shenhe">
					确认审核
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>

    <!-- jQuery Js -->
    <script src="backStage/assets/js/jquery-1.10.2.js"></script>
     <script type="text/javascript" src="backStage/tlz/js/vue.min.js"></script>
  <script type="text/javascript" src="backStage/assets/yhx_js/vue-resource.min.js"></script>
  <script>
  
       var handle=  new Vue({
        el: '#app',
        data: {
            sites: [],
             seen: false
        },
        created: function () {
      //为了在内部函数能使用外部函数的this对象，要给它赋值了一个名叫self的变量。
            var self = this;
            $.ajax({
                url: 'getListMapUpanddownCheck3',
                type: 'get',
                //  data:{"spid":spIds},
                async:false,
                dataType: 'json'
            }).then(function (res) {
           self.sites = res;
           //  alert(self.sites);
            }).fail(function () {
                console.log('失败');
            })
        }
    })
   
   </script>
	 <script>
	 var  spucId;
  /*  $(function(){
      
     
    ajaxgetNoShelfGoods();
   }) */
   function testVue(q){
  spucId=q;
  $("#mytbody").html("");
  ajaxgetNoShelfGoods();
   }
   
    function  ajaxgetNoShelfGoods(){
      $.ajax({
          url:"getNoShelfGoodsLook2",
         type:"post",
         data:{"spucId":spucId},
          dataType:"json",
         success:function(datas){
         var tr="";
         for(var i=0;i<datas.length;i++){
           tr+="<tr>";
             tr+="<td >"+datas[i].spName+"<input name='spId' type='hidden' id='spId' value='"+datas[i].spId+"'></td>";
              tr+="<td >"+datas[i].sptName+"<input name='spucId' type='hidden' id='spucId' value='"+datas[i].spucId+"'></td>";
             /*  tr+="<td >"+datas[i].whName+"</td>"; */
               tr+="<td class='center'>"+datas[i].spAllNum+"</td>";
                tr+="<td class='center'>"+datas[i].dpName+" ("+datas[i].spDnNum+") "+"<input type='hidden' name='spDnNum'' value='"+datas[i].spDnNum+"'></td>";
                tr+="<td class='center'>"+datas[i].gdName+"("+datas[i].anName+" - "+datas[i].bnName+")"+"<input type='hidden' name='rtId'' value='"+datas[i].rtId+"'></td>";
              tr+="<td class='center'>"+datas[i].spSalePrice+"</td>";
                tr+="<td class='center'>"+datas[i].spStatu+"</td>";
             tr+="</tr>";
         
         
         }
         
        $("#mytbody").append(tr);
         
         
         },
         error:function(){
         }
    })
      }
   
   
  
    $("#shenhe").click(function(){
    
    var jsonArr=new Array();
     $('#mytbody  tr').each(function(i){                   // 遍历 tr
			  josnStr={"spId":$(this).find("input[name=spId]").val(),"spucId":$(this).find("input[name=spucId]").val(),"spDnNum":$(this).find("input[name=spDnNum]").val(),"rtId":$(this).find("input[name=rtId]").val()};
			 
	           jsonArr.push(josnStr); 
			   
			       
			       });
    
    
  //alert(JSON.stringify(jsonArr));
   var open=confirm("请确认你的操作！！");
  if(open==true){
            
             $.ajax({
          url:"updateApplyGoodsShelfCheck2",
         contentType:"application/json;charset=utf-8", 
		         type:"post",
		        data:JSON.stringify(jsonArr),
		          dataType:"json",
		         success:function(datas){
         //alert(datas);
        
           window.location.href="backStage/tlz/applyBackLook.jsp";
         
         }
         })
               
  }else{
  //alert(2)
   }
  
  })
   </script>
   <script type="text/javascript" src="backStage/tlz/myJs/applyGoodsshelves.js"></script>
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
