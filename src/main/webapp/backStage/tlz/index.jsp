<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    <script src="backStage/assets/js/jquery-1.10.2.js"></script>
 <script type="text/javascript" src="backStage/tlz/js/vue.min.js"></script>
  <script type="text/javascript" src="backStage/assets/yhx_js/vue-resource.min.js"></script></head>
  
  <body>
  <div id="app">

      <table class="table table-striped table-bordered table-hover" id=""  >
                                    <thead>
                                        <tr class="info" style="color: gray;">
                                            <th  >仓库</th>
                                            <th  >数量</th>
                                            <th  >生产日期</th>
                                            <th  >到期日期</th>
                                            <th  >操作</th>
                                        </tr>
                                    </thead>
                                   <tbody id="mybody5">
                                       <tr v-for="site in sites" >
            <td  >{{site.whName}}   </td>
             <td  >{{site.rtNumber}}     </td>
            <td  v-text="site.rtbegDate"></td>
            <td  v-text="site.rtEndDate"></td>
            <td  ><button class="btn" style='height:25px;padding-top:2px;' >补货</button></td>
           </tr>

                                  
                                    </tbody>
                                    </table>
             
   
	 <input type="button" @click="post(1)" value="点我异步获取数据(Post)">
	  <input type="button" @click="post(2)" value="点我异步获取数据(Post)">
    </div>
  </body>
</html>
<script>


window.onload = function(){
    var vm = new Vue({
        el:'#app',
        data:{
            sites:[],
        },
        methods:{
            post:function(o){
            alert(o);
                //发送 post 请求
                this.$http.post('getAllMapGoodsDifferentUtil',{"spid":o},{emulateJSON:true}).then(function(res){
                  vm.sites=res.body;
                  alert(vm.sites);
                },function(res){
                    console.log(res.status);
                });
            }
        }
    });
}


    
      var timeTask=setInterval(function(){     
	var date=new Date();      
	var h=date.getHours();   
	var m=date.getMinutes();  
	var s=date.getSeconds();      
	if(h==24&&m==0&&s==0){          
		
		callFunction();  }
	},1000);   
function callFunction(){  
   $.ajax({
             url:"uppdz.action",
             type:"post",
             dataType:"json",
             async:false,
          
             })    
   
	}  






</script>