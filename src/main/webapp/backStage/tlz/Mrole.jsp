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
    table th,tr {
    text-align: center;
    }
    li{
    list-style-type: none;
    }
   input[type="checkbox"]{
    -webkit-appearance: none;
    vertical-align:middle;
    margin-top:0;
    background:#fff;
    border:#999 solid 1px;
    border-radius: 3px;
    min-height: 17px;
    min-width: 17px;
}
input[type="checkbox"]:checked {
    background: #3190e8;
}
input[type=checkbox]:checked::after{
    content: '';
    top: 3px;
    left: 3px;
    position: absolute;
    background: transparent;
    border: #fff solid 2px;
    border-top: none;
    border-right: none;
    height: 6px;
    width: 10px;
    -moz-transform: rotate(-45deg);
    -ms-transform: rotate(-45deg);
    -webkit-transform: rotate(-45deg); 
    transform: rotate(-45deg);
}
  
    </style>
</head>
<body style="background-color: #ececec;">
  
	
        
		
          <div id="page" style="margin-top: 10px;padding: 10px;margin-left: 20px;margin-right: 20px; " > 
               
            <div class="row" style="background-color: #fff;">
                <div class="col-md-12">
                    <!-- Advanced Tables -->
                    <div class="card">
                    <br/> 
                        <div class="card-action">
                                            <h3>权限管理</h3>  <br/>  <br/> 
                        </div>
                        <div class="card-content">
                            <div > 
                            <div id="app">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr class="success" style="color: gray;">
                                            <th class="center">角色编号</th>
                                            <th class="center">角色名称</th>
                                            <th class="center">角色描述</th>
                                             <th class="center">角色状态</th>
                                            <th class="center">操作 （  <a class="btn btn-primary btn-lg" style="height: 25px;padding-top: 0px;"  data-toggle="modal" data-target="#myModaladdrole">添加</a> 
                                  ）</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                     
                                        <tr  v-for="site in sites"  ondblclick="updateRole2(this)">
                                      
                                            <td class="center">
                                             <span id="roleIdShow">{{site.roleId}}</span> 
         <input  v-model="site.roleId" style="width: 100px;display: none;text-align:center;" id="roleId" readonly="readonly">
                                            </td>
                                            <td class="center">
                                           <span id="roleNamespan">   {{site.roleName}}</span> 
          <input  v-model="site.roleName" style="width: 100px;display: none;text-align:center;" id="roleName">
                                            </td>
                                            <td class="center" width="300px;" >
                                            <span id="roleDescspan">  {{site.roleDesc}}</span>
                                          
                                             <input  v-model="site.roleDesc" style="width: 100px;display: none;text-align:center;" id="roleDesc">
                                            </td>
                                            <td class="center">
        
                                           <div v-if="site.roleFlag == 0">
	                                   <span id="roleFlagspan"> 正常</span> 
	                      <input  value="正常" style="width: 100px;display: none;text-align:center;" id="roleFlag" readonly="readonly">               
	                                   </div>
                                            <div v-else>
	                                        <span id="roleFlagspan2">禁用</span>
	                       <input  value="禁用" style="width: 100px;display: none;text-align:center;" id="roleFlag2" readonly="readonly">  
	                                   </div>
                                            
                                            </td>
                                             <td class="center" width="350px;" >
                                             
                                               <a class="btn btn-primary btn-lg" style="height: 25px;padding-top: 0px;" onclick="updateRole(this)">更新</a> &nbsp;&nbsp;
                                               <a class="btn btn-primary btn-lg" style="height: 25px;padding-top: 0px;" onclick="delrole(this)">删除</a>&nbsp;&nbsp;
                                               <a class="btn btn-primary btn-lg" style="height: 25px;padding-top: 0px;" @click="testVue(site.roleId,site.roleName)">查看功能</a>
                                       <!--   <a :href="'deleteRole?roleId='+site.roleId">这是一个动态链接</a>    --> 
                                        <!--  <button @click="testVue(site.roleId)">xx</button> -->
                                             </td>
                                              
                                        </tr>
                                
                       
                                    </tbody>
                                    <tr >
                                   </tr>
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
          
               
         
    <!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	<div class="modal-dialog">
	<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					<font size="4" color="green" id="roleNameMenu"></font>&nbsp;&nbsp;对应菜单<input type="hidden" id="roleId">
				</h4>
				<span>
				
				
				</span>
			</div>
			<div class="modal-body" style="padding-left: 120px;max-height: 580px;overflow: auto;">
				<ul class="RoleTreemenu">


			</ul>
				
				
			
			</div>
			<div class="modal-footer">
			<button type="button" class="btn btn-primary" style="margin-left: 200px;" onclick="getALlTreeMenu()" data-toggle="modal" data-target="#myModal3">
				添加菜单
				</button>
				
				<button type="button" class="btn btn-primary"  onclick="delRole()">
					删除
				</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
			</div>
			</div>
	</div><!-- /.modal -->
</div>
    <!-- JS Scripts-->
 

 
   <div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="margin-left: 300px;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					全部权限菜单
				</h4>
			</div>
			<div class="modal-body" style="height:  580px;overflow: auto;">
					<ul class="RoleTreemenuAll">


			</ul>
			</div>
			<div class="modal-footer">
			<button type="button" class="btn btn-primary" style="margin-left: 200px;" onclick="addTreeMenu2()"  data-target="#myModal3">
				添加菜单
				</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<button type="button" class="btn btn-primary">
					提交更改
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
   
   
     <div class="modal fade" id="myModaladdrole" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					添加角色
				</h4>
			</div>
			<div class="modal-body">
				
				
				
				
<form class="form-horizontal" role="form" action="addRole" method="post">
  <div class="form-group">
    <label for="firstname" class="col-sm-2 control-label">角色名字</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="firstname" placeholder="请输入名字" style="width: 200px;" name="roleName">
    </div>
  </div>
  <div class="form-group">
    <label for="lastname" class="col-sm-2 control-label">角色描述</label>
    <div class="col-sm-10">
   <input type="text" class="form-control" id="lastname" placeholder="请输入角色状态" style="width: 200px;" name="roleDesc">
    </div>
  </div>
   
   <div class="form-group">
    <label for="lastname" class="col-sm-2 control-label">角色状态</label>
    <div class="col-sm-10">
    <select class="form-control" style="width: 200px;" name="roleFlag">
      <option value="0" >正常</option>
      <option value="1" >停用</option>
    
    </select>
    </div>
  </div>

				
				
				
				
				
				
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<button type="submit" class="btn btn-primary">
					提交
				</button>
				</form>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
     

    <!-- jQuery Js -->
    <script src="backStage/assets/js/jquery-1.10.2.js"></script>
 <script type="text/javascript" src="backStage/tlz/js/vue.min.js"></script>
  <script type="text/javascript" src="backStage/assets/yhx_js/vue-resource.min.js"></script>
  <script src="backStage/assets/js/bootstrap.min.js"></script>
	 <script>
	 
	 function  addTreeMenu2(){
	
	 
	   if(confirm("确认添加吗？")){
	   
	     var treeids=new Array(); //定义全局数组
	 
	 $(":checkbox:checked").closest("li").find(":text").each(function(i, eleDom){
  
  
   treeids.push(eleDom.value);
      
    // 遍历每个被选中的复选框所在行的文本框的值, 看你怎么用了，你要哪个
   //alert('第 ' + (i+1) + ' 个文本框的值: ' + eleDom.value);
   });
  // alert(JSON.stringify(treeids)); 
	   
	   $.ajax({
           url:"addRtMiddle",
             type:"post",
             data:{"rtMiddleId":JSON.stringify(treeids),"roleId":$("#roleId").val()},
              dataType:"json",
             success:function(data){
           //  alert(data);
              window.location.href="backStage/tlz/Mrole.jsp";
             }
             })
	 
	  }
	 
	 
	 $("input:checkbox").removeProp("checked");//取消checkbox所有选中状态    不然上次选中的checkbox会残留
	 
	 }
	 
	 
	function  getALlTreeMenu(){
	 
	 $(".RoleTreemenuAll").html("");
	   $.ajax({
             url:"getMenuTreelast",
             type:"post",
             dataType:"json",
             success:function(data){
               // alert(data);
   var ul="";
  for(var k=0;k<data.length;k++){
   ul+="<li  ><span ><input style='display:none;'  value="+data[k].menuid+"></span> <a  href='javascript:void(0)' style='color:#000;font-size:18px;'  class='waves-effect waves-dark'  ><i class='fa fa-bar-chart-o'></i>"+data[k].menuname+"</a>	<input type='checkbox'  class='checkParnet2' /><ul>";
    for(var i=0;i<data[k].menus.length;i++){
     ul+="<li  id='xxxx' > <span ><input style='display:none;'  value="+data[k].menus[i].menuid+"></span>";
    ul+="<a href='javascript:void(0)' style='font-size:17px;'   class='waves-effect waves-dark' ><i class='fa fa-qrcode'></i>"+data[k].menus[i].menuname+"</a>";
    
    ul+="<input type='checkbox' /></li>";
   
    }
       ul+="</ul></li>";
             }
            //  alert(ul);
              $(".RoleTreemenuAll").append(ul); 
             }
             });
	 
	 
	}
	 //checkParnet2
	   $("body").delegate(".checkParnet2","click", function(){      
	   
	 //  alert($(this).prop('checked'));	   
	     if($(this).prop('checked')==true){
	              $(this).parent().find("input").prop('checked',true);  //点击父菜单全选
	             }else{
	              $(this).parent().find("input").prop('checked',false);
	             }
	   
       })
       
	 
	 function testVue(q,w){
	 $(".RoleTreemenu").html("");
	$("#roleNameMenu").html(w);
	 $("#myModal").modal("show");
	 $("#roleId").val(q);
	 $.ajax({
             url:"getMenuTree2",
             type:"post",
             data:{"roleid":parseInt(q)},
             dataType:"json",
             success:function(data){
  
   var ul="";
  for(var k=0;k<data.length;k++){
   ul+="<li  ><span ><input style='display:none;'  value="+data[k].menuid+"></span> <a  href='javascript:void(0)' style='color:#000;font-size:18px;'  class='waves-effect waves-dark'  ><i class='fa fa-bar-chart-o'></i>"+data[k].menuname+"</a>	<input type='checkbox' onclick=checkParnetAll(this); class='checkParnet' /><ul>";
    for(var i=0;i<data[k].menus.length;i++){
     ul+="<li  id='xxxx' > <span ><input style='display:none;'  value="+data[k].menus[i].menuid+"></span>";
    ul+="<a href='javascript:void(0)' style='font-size:17px;'   class='waves-effect waves-dark' ><i class='fa fa-qrcode'></i>"+data[k].menus[i].menuname+"</a>";
    
    ul+="<input type='checkbox' /></li>";
   
    }
       ul+="</ul></li>";
             }
            //  alert(ul);
              $(".RoleTreemenu").append(ul); 
             }
             })
	 
	 
	  $("input:checkbox").removeProp("checked");//取消checkbox所有选中状态    不然上次选中的checkbox会残留
	 
	 };
	 
	            function checkParnetAll(t){
	            
	          // alert($(t).parent().html());
	             //$('input').prop('checked',true);
	          // alert($(t).prop('checked')==true);
	            
	             if($(t).prop('checked')==true){
	              $(t).parent().find("input").prop('checked',true);  //点击夫菜单全选
	             }else{
	              $(t).parent().find("input").prop('checked',false);
	             }
	            }
	 
	    function  delRole(){
	     if(confirm("确认删除？")){
	    var treeids2=new Array(); //定义全局数组
         // 找到选中行的input
  $(":checkbox:checked").closest("li").find(":text").each(function(i, eleDom){
  
  
   treeids2.push(eleDom.value);
      
    // 遍历每个被选中的复选框所在行的文本框的值, 看你怎么用了，你要哪个
   //alert('第 ' + (i+1) + ' 个文本框的值: ' + eleDom.value);
   });
   //alert(JSON.stringify(treeids2)); 
   
    ///  deleteRtMiddle
        $.ajax({
           url:"deleteRtMiddle",
            //contentType:"application/json",
             type:"post",
             data:{"rtMiddleId":JSON.stringify(treeids2),"roleId":$("#roleId").val()},
              dataType:"json",
             success:function(data){
           //  alert(data);
            window.location.href="backStage/tlz/Mrole.jsp";  
             }
             })
   
    $("input:checkbox").removeProp("checked");//取消checkbox所有选中状态    不然上次选中的checkbox会残留
   
	    }
	 }
	 
	 
	 function delrole(p){
	 // alert($(p).parent().parent().find("#roleIdShow").html());
	  if(confirm("确认删除？")){
	   $.ajax({
          url:"deleteRole",
         type:"post",
         data:{"roleId":$(p).parent().parent().find("#roleIdShow").html()},
          dataType:"json",
         success:function(datas){
         window.location.href="backStage/tlz/Mrole.jsp";
          
         }
         })
	 
	  }
	 }
	 
	 function updateRole(p){
	 //roleNamespan roleName
	  if(confirm("确认更新？")){
	  
	  var roleDesc= $(p).parent().parent().find("#roleDesc").val();
	   var roleName= $(p).parent().parent().find("#roleName").val();
	//  alert(roleDesc);
	   $.ajax({
          url:"updateRole",
         type:"post",
         data:{"roleId":$(p).parent().parent().find("#roleIdShow").html(),"roleDesc":roleDesc,"roleName":roleName},
          dataType:"json",
         success:function(datas){
         window.location.href="backStage/tlz/Mrole.jsp";
          
         }
         })
	 
	  }
	
	 }
	 
	  function updateRole2(o){
	//alert(11); roleNamespan roleName  roleIdShow  roleId  roleFlagspan
	 $(o).find("#roleFlag").show();
	 $(o).find("#roleFlagspan").hide();
	  $(o).find("#roleFlag2").show();
	 $(o).find("#roleFlagspan2").hide();
	 $(o).find("#roleId").show();
	 $(o).find("#roleIdShow").hide();
	 $(o).find("#roleDesc").show();
	 $(o).find("#roleDescspan").hide();
	  $(o).find("#roleName").show();
	 $(o).find("#roleNamespan").hide();
	 }
  /*  $(function(){
      ajax();
   })
   function  ajax(){
       var vm = new Vue({
        el:'#app',
        data:{
            sites:[],
        },
        mounted:function(){  //页面加载自动触发
        this.getRole();  //
        }     ,
        methods:{
            getRole:function(){
          
                //发送 post 请求
                this.$http.post('selectRole',{"spid":"1"},{emulateJSON:true}).then(function(res){
                  vm.sites=res.body;
                  alert(vm.sites);
                },function(res){
                    console.log(res.status);
                });
            }
        }
    });
   } */
   </script>
   <script>
   
/*    function  updateRole(o){
  // handle.seen=true;
  //$("#roleDesc").show(); 
  $(o).find("#roleDesc").show();
  $(o).find("#roleDescspan").hide();
  //alert($(o).html());
  // alert($(o).find("#roleDesc").val());
   
   
   
   } */
   
   
      var handle=  new Vue({
        el: '#app',
        data: {
            sites: [],
             seen: false
        },
        created: function () {
      //为了在内部函数能使用外部函数的this对象，要给它赋值了一个名叫self的变量。
            var self = this;
       //  this.data=null;
           
      //      this.$forceUpdate();
            $.ajax({
                url: 'selectRole',
                type: 'get',
                //  data:{"spid":spIds},
                async:false,
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
   
   </script>
	<!-- Bootstrap Js -->
    
	
	
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
