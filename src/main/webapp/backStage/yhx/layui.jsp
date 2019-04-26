<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'ckcx.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<script type="text/javascript" src="backStage/assets/yhx_js/jquery.js"></script>
<script type="text/javascript" src="backStage/assets/layui/layui.all.js"></script>
<link rel="stylesheet" href="backStage/assets/layui/css/layui.css" type="text/css"></link>
</head>
<body>
        <input type="text" name="date" id="date" lay-verify="date" placeholder="请选择日期" autocomplete="off" class="layui-input">
</body>
 
</html>
<script type="text/javascript">
  var laydate = layui.laydate;
  //日期
  laydate.render({
    elem: '#date',
    done: function(value){//控件选择完毕后的回调---点击日期、清空、现在、确定均会触发。
    alert(value)
  }
  });

</script>
