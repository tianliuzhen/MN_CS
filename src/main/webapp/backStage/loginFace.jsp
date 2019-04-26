<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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

<link rel="stylesheet" type="text/css" href="backStage/assets/css/style.css" />
<style>
body {
	height: 100%;
	background: #16a085;
	overflow: hidden;
}

canvas {
	z-index: -1;
	position: absolute;
}
</style>
<script src="backStage/assets/js/jquery.js"></script>
<script src="backStage/assets/js/verificationNumbers.js"></script>
<script src="backStage/assets/js/Particleground.js"></script>
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
  /* $(".submit_btn").click(function(){
	  localhost.href="index.jsp";
	  }); */
});
</script>


<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

body {
	height: 100vh;
	background-position: center;
	overflow: hidden;
}

h1 {
	color: #fff;
	text-align: center;
	font-weight: 100;
	margin-top: 40px;
}

#media {
	width: 280px;
	height: 250px;
	margin: 10px 10px;
	border-radius: 30px;
	overflow: hidden;
	opacity: 0.7px;
}

#video {
	
}

#canvas {
	display: none;
}

#btn {
	width: 160px;
	height: 50px;
	background: #03a9f4;
	margin: 70px auto 0;
	text-align: center;
	line-height: 50px;
	color: #fff;
	border-radius: 40px;
}
#loading {
width:180px;
height:25px;
border:0px solid #C3DAF9;
position:absolute;
top:21.5%;
left:45%; 
z-index:10000; 
background-color:#F7F9FC;
line-height:25px;
vertical-align:middle;
font-size:11pt;
display:none;
}
</style>
</head>

<body>
<div id="loading"><img width="20px" height="20px;" src="backStage/tlz/image/wait.gif" alt=""/>&nbsp;正在匹配人脸,请稍候...</div>
	<form >
		<dl class="admin_login" style="margin-top: 50px;">
			<dt>
				<strong>（<a href="backStage/login.jsp">点击返回密码登录</a>）</strong><em>Management System</em> <strong>请把你的脸放摄像头面前</strong>
			</dt>
			<div id="" >
				<video id="video" width="300" height="300" autoplay ></video>
				<canvas  id="canvas" width="300" height="300"></canvas>
			</div>
			<dd>
				<input type="button" onclick="query()" value="立即登录"
					class="submit_btn" />
			</dd>

		</dl>
		<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
		<script type="text/javascript">
  		//var 是定义变量
  		var video = document.getElementById("video"); //获取video标签
  		var context = canvas.getContext("2d");
  		var con  ={
  			audio:false,
  			video:{
  			width:1980,
  			height:1024,
  			}
  		};	
  			
  			//导航 获取用户媒体对象
  			navigator.mediaDevices.getUserMedia(con)
  			.then(function(stream){
  				video.src = window.URL.createObjectURL(stream);
  				video.onloadmetadate = function(e){
  					video.play();
  				}
  			});
  			
  	
  			function query(){
  				
  				//把流媒体数据画到convas画布上去
  				context.drawImage(video,0,0,300,250);
  				var base = getBase64();
  				
  				
  				$.ajax({
  					type:"post",
  					beforeSend: function () {
ShowDiv();
},
complete: function () {
HiddenDiv();
},
  					url:"facelogin",
  					data:{"LoginBase":base},
  					
  					success:function(data){
  					//	alert(data);
  						/* alert(data) */
						//	 var  result= JSON.parse(data);
        //result.result.user_list[0].user_id!=""
							if(data=="true"){
								// location.replace("/www.baidu.com");
								 //location.href='text.jsp';//此处跳转页面
								 
								// alert("登录成功")
								 //location.href="/localhost:8180/ssh-five/putong.jsp";
							   window.location.href="index.jsp";
								}else if(data=="false") {
									alert("面容识别失败,请继续验证...");
								}else if(data=="null"){
								
								};
								
							}
						});

			}
			function getBase64() {
				var imgSrc = document.getElementById("canvas").toDataURL(
						"image/png");
				//alert(imgSrc);
				return imgSrc.split("base64,")[1];

			};
		</script>
		<script type="text/javascript">

//显示加载数据
function ShowDiv() {
$("#loading").show();
}
//隐藏加载数据
function HiddenDiv() {
$("#loading").hide();
}

</script>
	</form>
</body>
</html>
