<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>管理员登录</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="backStage/assets/css/style.css" tppabs="backStage/assets/css/style.css" />
	<style type="text/css">
	 .booth {
      width:400px;
      background:#ccc;
      border: 10px solid #ddd;
      margin: 0 auto;
    }
  body{height:100%;background:#16a085;overflow:hidden;}
canvas{z-index:-1;position:absolute;}
    
  </style>
  <script type="text/javascript" src="backStage/assets/js/jquery-1.8.3.min.js"></script>
<!-- -->
<script src="backStage/assets/js/verificationNumbers.js" tppabs="backStage/assets/js/verificationNumbers.js"></script>
<!--  -->
<script src="backStage/assets/js/Particleground.js" tppabs="backStage/assets/js/Particleground.js"></script> 
<script>
$(document).ready(function() {
  //粒子背景特效
  $('body').particleground({
    dotColor: '#5cbdaa',
    lineColor: '#5cbdaa'
  });
  //验证码
  createCode();
  //测试提交，对接程序删除即可
  $(".submit_btn").click(function(){
	  location.href="javascrpt:;"/*tpa=http://***index.html*/;
	  });
});
</script>
  </head>
  
  <body >
 <!--    <form action="backStage" method="post">
    账号：<input name="ocName"><br/>
    密码：<input name="ocPassword"><br/>
<input type="submit" value="登录" >
</form>
<div>
<video width="200px" height="150px"></video>
  <canvas id="canvas" width="200px" height="150px"></canvas>
  <p>
      <button id="start">打开摄像头</button>
      <button id="snap">截取图像</button>
      <button id="close">关闭摄像头</button>
         <button onclick="aa()">登录</button>
  </p>
 
</div> -->
<div id="putong">
<form action="backStage" method="post">

                 <dl class="admin_login">               
                 
 <dt>
  <strong>密码登录/<a href="backStage/loginFace.jsp">人脸登录</a></strong>
  <em>Management System</em>
 </dt>
 <dd class="user_icon">
  <input type="text" placeholder="账号" name="ocName" class="login_txtbx" style="height: 45px;width: 300px;"/>
 </dd>
 <dd class="pwd_icon">
  <input type="password" placeholder="密码" name="ocPassword" class="login_txtbx"  style="height: 45px;width: 300px;"/>
 </dd>
<!--  <dd class="val_icon">
  <div class="checkcode">
    <input type="text" id="J_codetext" placeholder="验证码" maxlength="4" class="login_txtbx">
    <canvas class="J_codeimg" id="myCanvas" onclick="createCode()">对不起，您的浏览器不支持canvas，请下载最新版浏览器!</canvas>
  </div>
  <input type="button" value="验证码核验" class="ver_btn" onClick="validate();">
 </dd>-->
 <dd> 
  <input type="submit" value="立即登陆" class="submit_btn"/>
 </dd>
 <dd>
  <p>© 2018-2019 tianliuzhen 版权所有</p>
  <p>豫p888888</p>
 </dd>
 
</dl>

      </form>                  
    </div>   
    
  <!--   
    <div id="renlian" style="margin-left: 29%;margin-top: 40px;">
<video width="200px" height="150px"></video>
  <canvas id="canvas" width="200px" height="150px"></canvas><br/><br/>
  <p>
      <button id="start" style="margin-left: 50px;border: none;border-radius:9px;height: 30px;">打开摄像头</button>
      <button id="snap22" style="margin-left: 50px;border: none;border-radius:9px;height: 30px;">截取图像</button>
      <button id="close" style="margin-left: 50px;border: none;border-radius:9px;height: 30px;">关闭摄像头</button><br/>
         <button onclick="renlian()" style="margin-left: 50px;border: none;border-radius:9px;height: 30px;margin-top: 40px;background-color: #2c445a;color:#fff;" onclick="aa()">&nbsp;密码&nbsp;登录&nbsp;</button>
        <button style="margin-left: 50px;border: none;border-radius:9px;height: 30px;margin-top: 40px;" onclick="aa()">点击登录</button>
  </p>
 
</div>  -->
    
    
                
  </body>
</html>
<script>
 /* function putong(){
$("#putong").css("display","none");
$("#renlian").css("display","block");
} 
function renlian(){
$("#putong").css("display","block");
$("#renlian").css("display","none");
} */
var  base="";
 var Pic="";
    window.onload = function () {
           var canvas = document.getElementsByTagName('canvas')[0],
               context = canvas.getContext('2d'),
               video = document.getElementsByTagName("video")[0],
               snap = document.getElementById("snap22"),
               close = document.getElementById("close"),
               start = document.getElementById("start"),
               MediaStreamTrack;
           start.addEventListener('click', function () {
               if (navigator.mediaDevices && navigator.mediaDevices.getUserMedia) {
                   navigator.mediaDevices.getUserMedia({
                       video: true,
                       audio: true
                   }).then(function (stream) {
                       console.log(stream);
                       MediaStreamTrack=typeof stream.stop==='function'?stream:stream.getTracks()[1];
                       video.src=(window.URL).createObjectURL(stream);
                       video.play();
                   }).catch(function(err){
                       console.log(err);
                   });
               }else if(navigator.getMedia){
                   navigator.getMedia({
                       video: true
                   }).then(function (stream) {
                       console.log(stream);
                       MediaStreamTrack=stream.getTracks()[1];
                       video.src=(window.webkitURL).createObjectURL(stream);
                       video.play();
                   }).catch(function(err){
                       console.log(err);
                   });
               }
           });
           snap.addEventListener('click', function () {
               context.drawImage(video, 0, 0,200,150);
                 Pic = document.getElementById("canvas").toDataURL("image/jpg");              
                 //对其进行base64编 之后的字符串
                 Pic = Pic.replace(/^data:image\/(png|jpg);base64,/,"")
           });
           close.addEventListener('click', function () {
               MediaStreamTrack && MediaStreamTrack.stop();
           });
           
           
                         
           
           
        //   var imgSrc = document.getElementById("canvas").toDataURL("image/jpg");
			//	  base= imgSrc.split("base64,")[1];
				 //alert(imgSrc.split("base64,")[1]);
		
				 
       }
     
        function aa(){
        		// alert(Pic); 
				 //
				$.ajax({
              url:"facelogin",
             type:"post",
             data:{"LoginBase":Pic},
             success:function(data){
            var  result= JSON.parse(data);
       //  alert(result.error_msg);  验证状态
       alert(result.result.user_list[0].user_id);
       if(result.result.user_list[0].user_id!=""){
     window.location.href="FrameIndex.jsp";
       }
             }
             });
        }
  </script>
 