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
#main-menu  li{
  font-size: 18px;
  color: #000;
  }
  #main-menu  li ul li{
  font-size: 15px;
  
  }
    </style>
</head>
<body style="background-color: #ececec;">
  
	 
	
        
		
         <div id="page" style="margin-top: 10px;padding: 10px;margin-left: 20px;margin-right: 20px; " > 
               
          
               
               
            <div class="row" >
                <div class="col-md-12">
                    <!-- Advanced Tables -->
                    <div class="card">
                        <div class="card-action">
                                           <h3>功能管理</h3>  <br/> <br/> 
                        </div>
                        <div class="card-content">
                            <div class="table-responsive" style="margin-left: 150px;"> 
                            <div id="app">
                              <ul  id="main-menu"></ul>
                               <!--   <input type="button" @click="getRole()" value="点我异步获取数据(Post)"> -->
                            </div>
                            </div>
                        </div>
                    </div>
                    <!--End Advanced Tables -->
                    
                    
                         <div class="fixed-action-btn horizontal click-to-toggle" style="position: absolute;top: 85%;">
    <a class="btn-floating btn-large green" style="color: #fff;text-decoration: none;" >
     编辑
    </a>
    <ul >
      <li ><a class="btn-floating orange" style="width: 50px;height: 50px;padding-top: 5px;padding-right: 11px;color: #fff;text-decoration: none;" onclick="addparent()">添父</a></li>
      <li ><a class="btn-floating red" style="width: 50px;height: 50px;padding-top: 5px;padding-right: 11px;color: #fff;text-decoration: none;" onclick="addchildren()">添子</a></li>
        <li ><a class="btn-floating red" style="width: 50px;height: 50px;padding-top: 5px;padding-right: 11px;color: #fff;text-decoration: none;" onclick="addAll()">添加</a></li>
      <li><a class="btn-floating green " style="width: 50px;height: 50px;padding-top: 5px;padding-right: 11px;color: #fff;text-decoration: none;" onclick="deleteTreemenuggg()" >删除</a></li>
      <li><a class="btn-floating #5ea6eb" style="width: 50px;height: 50px;padding-top: 5px;padding-right: 11px;color: #fff;text-decoration: none;" onclick="UpdateTree()">更改</a></li>
    </ul>
  </div>
                    
                    
                    
                </div>
            </div>
                <!-- /. ROW  -->
          
               


    <!-- jQuery Js -->
    <script src="backStage/assets/js/jquery-1.10.2.js"></script>
 <script type="text/javascript" src="backStage/tlz/js/vue.min.js"></script>
  <script type="text/javascript" src="backStage/assets/yhx_js/vue-resource.min.js"></script>
  <script src="backStage/assets/js/bootstrap.min.js"></script>
  <script>
    
  var i=1;  //定义动态记录Id
 var  a=false;    //定义全局判断
  var  b=false;    //定义全局判断
   var  c=false;    //定义全局判断
   var  treeidMax;//
     function addparent(){  //添加父菜单
    
    
    var li="<li id='li"+i+"' ><span ></span><span id='ppp' > <i class='fa fa-edit' ></i>&nbsp;&nbsp;";
   li+="  <input name='menuname'  style='border:0px;border-bottom:1px solid gray;width:100px;' /></span>";
    li+="  <input  name='url'  type='hidden' value='xxx'  / > ";
    li+="   <input name='menuid' value='0' type='hidden' / >";
     li+="  &nbsp;&nbsp;&nbsp;<input name='tpid' id='tpid"+i+"' style='border:0px;border-bottom:1px solid gray;width:50px;'  />	</a>";
    li+="   <input type='checkbox'  class='checkParnet2'  />";
    
     $("#main-menu").append(li); 
     
      $.ajax({
		         url:"getMaxTreeid",
		          type:"post",
		          async:false,
		          success:function(data){
		         if(i==1){
		          treeidMax=data;
		          }
		          
		         // alert(data);
		       //  alert(treeidMax);
		          }
		          })
     
      $("#tpid"+i+"").val(treeidMax);
     treeidMax++;
     
     i++;
    }
    
    
       function  addchildren(){//添加子菜单
   
   var ul="";
       ul+="<ul ><li  id='xxxx' > <span ><input style='display:none;'   name='tpid' /></span>";
    ul+="<i class='fa fa-qrcode'></i>&nbsp;<input name='menuname'  style='width:100px;border:0px;border-bottom:1px solid gray;text-align:center'' />&nbsp;&nbsp;&nbsp;<input name='url'  style='border:0px;border-bottom:1px solid gray;width:200px;text-align:center'' />";
    
   ul+="  <input name='menuid'  style='width:40px;border:0px;border-bottom:1px solid gray;text-align:center'/>";
    // ul+="<select class='form-control' style='width: 40px;'><option>22</option></select>";
    ul+="<input type='checkbox' /> </li></ul>";
   
   if(i==1){
   $("#main-menu").append(ul);
   }else{
    $("#main-menu").find("#li"+(i-1)+"").append(ul);
   }
   
   
   } 
    
     $(function(){
         
         
       $.ajax({
             url:"getMenuTreelast",
             type:"post",
             dataType:"json",
             success:function(data){
            //   alert(JSON.stringify(data));
   var ul="";
  for(var k=0;k<data.length;k++){
   ul+="<li  ><span ><input style='display:none;' name='tpid'  value="+data[k].menuid+">";
  ul+=" <input style='display:none;' name='menuid'  value="+data[k].parent+"></span>";
  ul+=" <span id='ppp' ><i class='fa fa-edit' ></i>&nbsp;";
  ul+=" <input name='menuname' value="+data[k].menuname+" style='border:0px;border-bottom:1px solid gray;width:120px;text-align:center' /></span>	";
   ul+=" &nbsp; &nbsp;&nbsp;<input type='checkbox'  class='checkParnet2'  />&nbsp; &nbsp;&nbsp;( "+data[k].menuid+" ) <ul class='twourl'>";
    for(var i=0;i<data[k].menus.length;i++){
     ul+="<li  id='xxxx' > <span ><input style='display:none;'  value="+data[k].menus[i].menuid+" name='tpid' /></span>";
    ul+="<i class='fa fa-edit'></i>&nbsp;";
    ul+=" <input name='menuname' value="+data[k].menus[i].menuname+" style='width:100px;border:0px;border-bottom:1px solid gray;text-align:center'' />";
    ul+=" &nbsp;&nbsp;&nbsp;<input name='url' value="+data[k].menus[i].url.url+" style='border:0px;border-bottom:1px solid gray;width:300px;text-align:center'' />";
   ul+="  &nbsp;&nbsp;&nbsp;<input name='menuid' value="+data[k].menus[i].parent+" style='width:40px;border:0px;border-bottom:1px solid gray;text-align:center'/>  ";
    
    ul+="     <input type='checkbox' /> </li>";
   
    }
       ul+="</ul></li>";
             }
            //  alert(ul);
              $("#main-menu").append(ul); 
               $(".twourl").hide();
             }
             });
     })
        $("body").delegate(".checkParnet2","click", function(){      
	   
	 //  alert($(this).prop('checked'));	   
	     if($(this).prop('checked')==true){
	              $(this).parent().find("input").prop('checked',true);  //点击父菜单全选
	               $(this).parent().find("ul").show();
	             }else{
	              $(this).parent().find("input").prop('checked',false);
	               $(this).parent().find("ul").hide();
	             }
	   
       })
         $("body").delegate("#ppp","click", function(){      
          // alert($(this).parent().find("ul").html());
	     if($(this).parent().find("ul").css('display')=='block'){
	       $(this).parent().find("ul").css('display','none');
	     }else{
	      $(this).parent().find("ul").show();
	     };
	   
      
       })
       
          var treemenu=new Array(); //定义全局数组
      function UpdateTree(){
          
     
        actionCheck();
      
     // alert(JSON.stringify(treemenu));
   
     if(a==false){
    alert("更新前 请勾选！");
		           }else{
		           
		             if(confirm("确认你的操作！")){      
        
           
        $.ajax({
		         url:"updateTreeMenu",
		        contentType:"application/json",
		          type:"post",
		          data:JSON.stringify(treemenu),
		          success:function(data){
		     window.location.href="backStage/tlz/treeMenu.jsp";
		          }
		           })
		           }else{
		        
		           }
		           
		           
		           }
      }
      function  deleteTreemenuggg(){
    
      actionCheck();
      //  alert(JSON.stringify(treemenu));
          if(b==false){
       
        
           alert("删除前 请勾选！")
     
		           }else{
		           if(confirm("确认你的操作！")){
		           
		              $.ajax({
		         url:"deleteTreeMenu",
		        contentType:"application/json",
		          type:"post",
		          data:JSON.stringify(treemenu),
		          success:function(data){
		     window.location.href="backStage/tlz/treeMenu.jsp";
		          }
		           })
		           }
		           
		           
		           }
      }
         function addAll(){
       
    
       
      actionCheck();
        // alert(JSON.stringify(treemenu));  
         if(c==false){
         
         alert("添加前 请勾选！");
		         
      }else{
      
           if(confirm("确认你的操作！")){   
        
        $.ajax({
		         url:"addTreeMenu",
		        contentType:"application/json",
		          type:"post",
		          data:JSON.stringify(treemenu),
		          success:function(data){
		     window.location.href="backStage/tlz/treeMenu.jsp";
		          }
		           })
		           }
         
      }
      }
         function   actionCheck(){
         
          
         // 找到选中行的input
  $(":checkbox:checked").each(function(){
  a=true; b=true; c=true;
  var menuname=$(this).parent().find("input[name='menuname']").val();
  var menuid=$(this).parent().find("input[name='menuid']").val();
  var url=$(this).parent().find("input[name='url']").val();
  var tpid=$(this).parent().find("input[name='tpid']").val();
  var treemenuArr={"menuname":menuname,"menuid":menuid,"url":url,"tpid":tpid};
 // var treemenuArr="{\"menuname\":\""+menuname+"\",\"menuid\":\""+menuid+"\",\"url\":\""+url+"\",\"tpid\":\""+tpid+"\"}";
    treemenu.push(treemenuArr);
      
    // 遍历每个被选中的复选框所在行的文本框的值, 看你怎么用了，你要哪个
  //alert('第 ' + (i+1) + ' 个文本框的值: ' + eleDom.value);
   });
         }
  </script>
	 <script>
	 
	 
	 
	 
	
	
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
                this.$http.post('selectRole',{"spid":"1"},{async: false},{emulateJSON:true}).then(function(res){
                  vm.sites=res.body;
                  alert(vm.sites);
                },function(res){
                    console.log(res.status);
                });
            }
        }
    });
   }  */
   </script>
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
  
	
	<script src="backStage/assets/materialize/js/materialize.min.js"></script>
	
  
  <script>
      
    
  
  
  </script>
</body>

</html>
