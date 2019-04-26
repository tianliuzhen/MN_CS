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
<body style="background-color: #ececec;"  >
  
	
        
	<!-- 	 -->
            <div id="page-inner"> 
               
            <div class="row">
                <div class="col-md-12" style="background-color: #fff;">
                    <!-- Advanced Tables -->
                    <div class="card"><br/>
                        <div class="card-action" style="font-size: 16px;font-weight: 600">
                             <h3>货架补货&nbsp;审核&nbsp;查阅</h3>
                        </div><br/><br/>
                        <div class="card-content">
                            <div >
                                       
                                       
                                       
                                            <div class="app">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr class="success" style="color: gray;">
                                            <th class="center">补货编号</th>
                                            <th class="center">补货部门</th>
                                            <th class="center">申请时间</th>
                                              <th class="center">补货员</th>
                                             <th class="center">审核状态</th>
                                              <th class="center">查看</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                     
                                        <tr  v-for="site in sites"  ondblclick="updateRole2(this)">
                                      
                                            <td class="center">
                                             {{site.bgcNoId}}
                                           </td>
                                            <td class="center">
                                            {{site.gdName}}
                                            </td>
                                            <td class="center" >
                                          {{site.bgcDate}}
                                          
                                            </td>
                                            <td class="center">
                                         {{site.ocId}}
                                            </td>
                                          
                                               <td class="center">
                                         {{site.bgcStatus}}
                                            </td>
                                             <td class="center"  >
                                   <a class="btn btn-primary" style="height: 25px;padding-top: 2px;"   @click="LookUtil(site.bgcNoId)"  data-toggle="modal" data-target="#myModal">查看详情</a>
                                       <!--   <a :href="'deleteRole?roleId='+site.roleId">这是一个动态链接</a>    --> 
                                        <!--  <button @click="testVue(site.roleId)">xx</button> -->
                                             </td>
                                              
                                        </tr>
                                
                       
                                    </tbody>
                                </table>
                               <!--   <input type="button" @click="getRole()" value="点我异步获取数据(Post)"> -->
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
 

    <!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	<div class="modal-dialog" style="width: 720px;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					补货订单详情
				</h4>
			</div>
			<div class="modal-body" style="width: 717px;height: 400px; overflow-y: scroll;" >
				
				
				  <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr class="success" style="color: gray;">
                                            <th >商品编号</th>
                                             <th >昵称</th>
                                            <th >类别</th>
                                            <th >仓库</th>
                                            <th >数量</th>
                                             <th >生产批次</th>
                                          <!--   <th >进货批次编号</th> -->
                                            <th >补货员</th>
                                            
                                        </tr>
                                    </thead>
                                    <tbody id="buhuo">
                                     
                                       
                                    </tbody>
                                </table>
				
				
				
				
					
	
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<button type="button" class="btn btn-primary" style="margin-left: 10px;margin-right: 10px;" onclick="sure()">
					确认审核
				</button>
			</div>
	</div>
	</div><!-- /.modal -->
</div>

    <!-- jQuery Js -->
    <script src="backStage/assets/js/jquery-1.10.2.js"></script>
     <script type="text/javascript" src="backStage/tlz/js/vue.min.js"></script>
  <script type="text/javascript" src="backStage/assets/yhx_js/vue-resource.min.js"></script>
	 <script>
	 var  bgcNoId;
	function LookUtil(q){
	$("#myModal").modal("show");
	
	}

  


  function sure(){
  if(confirm(" 请确认你的操作？")){
 // alert(bgcNoId);
    
   $.ajax({
         url:"sureBuGoodsSuccess",
         type:"post",
         data:{"bgcNoId":bgcNoId},
          dataType:"text",
         success:function(datas){
         if(datas=="true"){
         window.location.href="backStage/tlz/buGoodsCheckLook.jsp";
          }
         }
         })
  
  }
   
   }
   
 
   </script>
   <script>
   
       var handle=  new Vue({
        el: '.app',
        data: {
            sites: [],
             sitesTwo: []
        },
        created: function () {
      //为了在内部函数能使用外部函数的this对象，要给它赋值了一个名叫self的变量。
            var self = this;
          
            $.ajax({
                url: 'getAllNocheckbuGoodsCheck',
                type: 'post',
                async:false,
                dataType: 'json'
            }).then(function (res) {
         //   alert(res);
              //  console.log(res);
         //把从json获取的数据赋值给数组
           self.sites = res;
            }).fail(function () {
                console.log('失败');
            })
        }, methods:{
            LookUtil:function(q){
               bgcNoId=q;
            $("#buhuo").html("");
                //发送 post 请求
                this.$http.post('getUtilNocheckbuGoodsCheck',{"bgcNoId":q},{emulateJSON:true}).then(function(res){
                       handle.sites2=res.body;
              
                     var   tr="";
                     for(var i=0;i<res.body.length;i++){
                     tr+="<tr>";
                    tr+="<td>"+res.body[i].spBarCode+"</td>";
                      tr+="<td>"+res.body[i].sptName+"</td>";
                       tr+="<td>"+res.body[i].spName+"</td>";
                        tr+="<td>"+res.body[i].whName+"</td>";
                           tr+="<td>"+res.body[i].bgNum+"</td>";
                            tr+="<td>"+res.body[i].rtbegDate+"</td>";
                      /*     tr+="<td class='center'>"+res.body[i].rtId+"</td>"; */
                          tr+="<td>"+res.body[i].ocId+"</td>";
                      tr+="</tr>";
                    }
                    $("#buhuo").append(tr);
                   
                    
                },function(res){
                    console.log(res.status);
                });
            }
        }
    })
   
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
