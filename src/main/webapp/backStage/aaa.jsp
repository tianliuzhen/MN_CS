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
	
     <link rel="stylesheet" type="text/css" href="backStage/assets/css/nav.css">
    <link rel="stylesheet" type="text/css" href="backStage/assets/font/iconfont.css">
	
    <script type="text/javascript" src="backStage/assets/js/jquery.min.js"></script>
    <script type="text/javascript" src="backStage/assets/js/nav.js"></script>
	
  </head>
  
  <body>
  <div class="nav">
        <div class="nav-top">
            <div id="mini" style="border-bottom:1px solid rgba(255,255,255,.1)"><img src="backStage/assets/images/mini.png" ></div>
        </div>
        <ul>
            <li class="nav-item">
                <a href="javascript:;"><i class="my-icon nav-icon icon_1"></i><span>网站配置</span><i class="my-icon nav-more"></i></a>
                <ul>
                    <li><a href="javascript:;"><span>网站设置</span></a></li>
                    <li><a href="javascript:;"><span>友情链接</span></a></li>
                    <li><a href="javascript:;"><span>分类管理</span></a></li>
                    <li><a href="javascript:;"><span>系统日志</span></a></li>
                </ul>
            </li>
            <li class="nav-item">
                <a href="javascript:;"><i class="my-icon nav-icon icon_2"></i><span>文章管理</span><i class="my-icon nav-more"></i></a>
                <ul>
                    <li><a href="javascript:;"><span>站内新闻</span></a></li>
                    <li><a href="javascript:;"><span>站内公告</span></a></li>
                    <li><a href="javascript:;"><span>登录日志</span></a></li>
                </ul>
            </li>
            <li class="nav-item">
                <a href="javascript:;"><i class="my-icon nav-icon icon_3"></i><span>订单管理</span><i class="my-icon nav-more"></i></a>
                <ul>
                    <li><a href="javascript:;"><span>订单列表</span></a></li>
                    <li><a href="javascript:;"><span>打个酱油</span></a></li>
                    <li><a href="javascript:;"><span>也打酱油</span></a></li>
                </ul>
            </li>
        </ul>
    </div>
  </body>
</html>
