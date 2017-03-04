<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <base href="<%=basePath%>">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="ThemeBucket">
  <link rel="shortcut icon" href="#" type="image/png">

  <title>实名审核司机名单</title>

  <!--common-->
  <link href="css/style.css" rel="stylesheet">
  <link href="css/style-responsive.css" rel="stylesheet">


  <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <![endif]-->
</head>



<body class="sticky-header">
<section>

	<!-- 左部导航栏  -->
	<div class="left-side sticky-left-side">
		
		 <!--logo and iconic logo start-->
        <div class="logo">
            <a href="index.html"><img src="images/logo.png" alt=""></a>
        </div>

        <div class="logo-icon text-center">
            <a href="index.html"><img src="images/logo_icon.png" alt=""></a>
        </div>
        <!--logo and iconic logo end-->
        
	    <!--sidebar nav start-->
	    <div class="left-side-inner">
	    <ul class="nav nav-pills nav-stacked custom-nav">
	        <li class="active"><a href="./jsp/home.jsp"><i class="fa fa-home"></i> <span>主页</span></a></li>
	        
	        <li class="menu-list"><a href=""><i class="fa fa-tasks"></i> <span>用户信息管理</span></a>
	            <ul class="sub-menu-list">
	                <li><a href="./jsp/driverInfoManage.jsp"> 司机信息管理</a></li>
	                <li><a href="./jsp/customerInfoManage.jsp"> 货主信息管理</a></li>
	                <li><a href="./jsp/administratorInfoManage.jsp"> 管理员信息管理</a></li>
	
	            </ul>
	        </li>
	        
	        <li class="menu-list"><a href=""><i class="fa fa-th-list"></i> <span>基本信息管理</span></a>
	            <ul class="sub-menu-list">
	                <li><a href="general.html"> 订单信息管理</a></li>
	                <li><a href="buttons.html"> 车辆信息管理</a></li>
	                <li><a href="tabs-accordions.html"> 货物信息管理</a></li>
	                <li><a href="tabs-accordions.html"> 用户协议修改</a></li>
	            </ul>
	        </li>
		
			<li class="menu-list"><a href=""><i class="fa fa-bar-chart-o"></i> <span>推荐信息管理</span></a>
		                 <ul class="sub-menu-list">
		                 	<li><a href="tabs-accordions.html"> 系统数据报表</a></li>
		                     <li><a href="general.html"> 地区关联规则</a></li>
		                 </ul>
		             </li>
		             
		             <li class="menu-list"><a href=""><i class="fa fa-envelope"></i> <span>用户反馈</span></a>
		                 <ul class="sub-menu-list">
		                     <li><a href="mail.html"> 用户投诉</a></li>
		                     <li><a href="mail_compose.html"> 用户建议</a></li>
		                     <li><a href="mail_view.html"> 消息推送</a></li>
		                 </ul> 
		             </li>
		
		
		             <li><a href="./jsp/login.jsp"><i class="fa fa-sign-in"></i> <span>退出账号</span></a></li>
		
		         </ul>
		         <!--sidebar nav end-->
		
		     </div>
	 </div>
  <!-- left side end-->
    
  <!-- main content start-->
    <div class="main-content" >

		<jsp:include page="../header.jsp"></jsp:include>
	
        <!--body wrapper start-->
        <div class="wrapper">
                
        </div>
        <!--body wrapper end-->
	  
	  	<%@include file="../footer.jsp"%>
	 </div>
  <!-- main content end-->
    
</section>

<!-- Placed js at the end of the document so the pages load faster -->
<script src="js/jquery-1.10.2.min.js"></script>
<script src="js/jquery-ui-1.9.2.custom.min.js"></script>
<script src="js/jquery-migrate-1.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/modernizr.min.js"></script>
<script src="js/jquery.nicescroll.js"></script>

<!--common scripts for all pages-->
<script src="js/scripts.js"></script>

</body>
</html>
