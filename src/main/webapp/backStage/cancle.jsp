<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'cancel.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  <script type="text/javascript" src="backStage/assets/js/jquery-1.8.3.min.js"></script></head>
  
  <body>
    <%
	 response.setHeader("refresh","3;URL=login.jsp");
	 session.invalidate();
     %>
     <h3>&nbsp;&nbsp;&nbsp;&nbsp;注销成功</h3>&nbsp;&nbsp;&nbsp;&nbsp;<span id="time" style="font-size: 22px;color:red;">3</span>秒自动到登陆页面
     如果没有跳转点击这里&nbsp;&nbsp;<a href="login.jsp">这里</a><br/>
     
     
  </body>
</html>
<script>
 var time;
     var second=4;
	    function aa(){
		 second--;
		var day=parseInt(second/86400);
		var hourLeft=second%86400;
		var hour=parseInt(hourLeft/3600);
		var minuteLeft=hourLeft%3600;
		var minute=parseInt(minuteLeft/60);
        var secondLeft=minuteLeft%60;
		$("#time").html(secondLeft);
		time=setTimeout("aa()",1000);
		}
		window.onload=aa;
</script>