<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset= utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
<meta name="keywords"
	content="admin, dashboard, bootstrap, template, flat, modern, theme, responsive, fluid, retina, backend, html5, css, css3">
<meta name="description" content="">
<meta name="author" content="ThemeBucket">
<link rel="shortcut icon" href="#" type="image/png">

<title>主页</title>

<!--icheck-->
<link href="js/iCheck/skins/minimal/minimal.css" rel="stylesheet">
<link href="js/iCheck/skins/square/square.css" rel="stylesheet">
<link href="js/iCheck/skins/square/red.css" rel="stylesheet">
<link href="js/iCheck/skins/square/blue.css" rel="stylesheet">

<!--dashboard calendar-->
<link href="css/clndr.css" rel="stylesheet">

<!--Morris Chart CSS -->
<link rel="stylesheet" href="js/morris-chart/morris.css">

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
				<a href="index.html"><img src="images/logo.png" alt=""> </a>
			</div>

			<div class="logo-icon text-center">
				<a href="index.html"><img src="images/logo_icon.png" alt="">
				</a>
			</div>
			<!--logo and iconic logo end-->

			<!--sidebar nav start-->
			<div class="left-side-inner">
				<ul class="nav nav-pills nav-stacked custom-nav">
					<li class="active"><a href="./jsp/home.jsp"><i class="fa fa-home"></i> <span>主页</span>
					</a></li>

					<li class="menu-list"><a href=""><i class="fa fa-tasks"></i>
							<span>公交线路浏览</span> </a>
						<ul class="sub-menu-list">
							<li><a href="./jsp/lineInfo.jsp"> 公交线路数据</a></li>
							<li><a href="./jsp/lineSearch.jsp"> 公交线路搜索</a></li>
						</ul>
					</li>

					<li class="menu-list"><a href=""><i class="fa fa-th-list"></i>
							<span>公交OD数据</span> </a>
						<ul class="sub-menu-list nav-active">
							<li class="active"><a href="./jsp/ODTable.jsp"> 公交OD矩阵表</a>
							</li>
							<li><a href="./jsp/ODOnMap.jsp"> OD数据可视化</a></li>
						</ul>
					</li>

					<li class="menu-list"><a href=""><i
							class="fa fa-bar-chart-o"></i> <span>统计指标浏览</span> </a>
						<ul class="sub-menu-list">
							<li><a href="tabs-accordions.html"> 客流指标浏览</a></li>
							<li><a href="./jsp/relationRules.jsp"> 运营指标浏览</a></li>
							<li><a href="./jsp/relationRules.jsp"> 时空分布特性</a></li>
						</ul>
					</li>

					<li><a href="./jsp/login.jsp"><i class="fa fa-sign-in"></i>
							<span>退出账号</span> </a></li>

				</ul>
				<!--sidebar nav end-->

			</div>
		</div>
		<!-- left side end-->

		<!-- main content start-->
		<div class="main-content">

			<jsp:include page="../header.jsp"></jsp:include>

			<!--body wrapper start-->
			<div class="wrapper">

				<div class="row">
					<div class="col-md-6">
						<!--statistics start-->
						<div class="row state-overview">
							<div class="col-md-6 col-xs-12 col-sm-6">
								<div class="panel purple">
									<div class="symbol">
										<i class="fa fa-gavel"></i>
									</div>
									<div class="state-value">
										<div class="value">5306</div>
										<div class="title">线路总数/条</div>
									</div>
								</div>
							</div>
							<div class="col-md-6 col-xs-12 col-sm-6">
								<div class="panel red">
									<div class="symbol">
										<i class="fa fa-tags"></i>
									</div>
									<div class="state-value">
										<div class="value">3498</div>
										<div class="title">站点总数/个</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row state-overview">
							<div class="col-md-6 col-xs-12 col-sm-6">
								<div class="panel blue">
									<div class="symbol">
										<i class="fa fa-money"></i>
									</div>
									<div class="state-value">
										<div class="value">22014</div>
										<!-- <div class="title"> Total CarSource</div> -->
										<div class="title">公交数量/辆</div>
									</div>
								</div>
							</div>
							<div class="col-md-6 col-xs-12 col-sm-6">
								<div class="panel green">
									<div class="symbol">
										<i class="fa fa-eye"></i>
									</div>
									<div class="state-value">
										<div class="value">32014</div>
										<div class="title">线路总长/米</div>
									</div>
								</div>
							</div>
						</div>
						<!--statistics end-->
					</div>

					<div class="col-md-6">
						<!--more statistics box start-->
						<div class="panel deep-purple-box">
							<div class="panel-body">
								<div class="row">
									<div class="col-md-7 col-sm-7 col-xs-7">
										<div id="graph-donut" class="revenue-graph"></div>

									</div>
									<div class="col-md-5 col-sm-5 col-xs-5">
										<ul class="bar-legend">
											<li><span class="blue"></span> 4.5-5.0分用户</li>
											<li><span class="green"></span> 4.0-4.5分用户</li>
											<li><span class="purple"></span> 3.5-4.0分用户</li>
											<li><span class="red"></span> 3.0-3.5分用户</li>
											<li><span class="orange"></span> <3.0分用户</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<!--more statistics box end-->
					</div>
				</div>

				<div class="row">
					<div class="col-md-8">
						<div class="panel">
							<div class="panel-body">
								<div class="row revenue-states">
									<div class="col-md-6 col-sm-6 col-xs-12">
										<h4>月度平均用户数量统计报告</h4>
										<div class="icheck">
											<div class="square-red single-row">
												<div class="checkbox ">
													<input type="checkbox" checked> <label>在线</label>
												</div>
											</div>
											<div class="square-blue single-row">
												<div class="checkbox ">
													<input type="checkbox"> <label>离线 </label>
												</div>
											</div>
										</div>

									</div>
									<div class="col-md-6 col-sm-6 col-xs-12">
										<ul class="revenue-nav">
											<li><a href="#">weekly</a>
											</li>
											<li><a href="#">monthly</a>
											</li>
											<li class="active"><a href="#">yearly</a>
											</li>
										</ul>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<div class="clearfix">
											<div id="main-chart-legend" class="pull-right"></div>
										</div>

										<div id="main-chart">
											<div id="main-chart-container" class="main-chart"></div>
										</div>
										<ul class="revenue-short-info">
											<li>
												<h1 class="red">73%</h1>
												<p>Driver Online</p></li>
											<li>
												<h1 class="purple">67%</h1>
												<p>Customer Online</p></li>
											<li>
												<h1 class="green">184%</h1>
												<p>Car Source</p></li>
											<li>
												<h1 class="blue">134%</h1>
												<p>Merchandise</p></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="col-md-4">
						<div class="panel">
							<header class="panel-heading">
								上月订单统计 <span class="tools pull-right"> <a
									href="javascript:;" class="fa fa-chevron-down"></a> <a
									href="javascript:;" class="fa fa-times"></a> </span>
							</header>
							<div class="panel-body">
								<ul class="goal-progress">
									<li>
										<div class="prog-avatar">
											<img src="images/indents/blue.png" alt="" />
										</div>
										<div class="details">
											<div class="title">
												<a href="#">成功交易</a> - 27630份
											</div>
											<div class="progress progress-xs">
												<div class="progress-bar progress-bar-info"
													role="progressbar" aria-valuenow="20" aria-valuemin="0"
													aria-valuemax="100" style="width: 87%">
													<span class="">87%</span>
												</div>
											</div>
										</div></li>
									<li>
										<div class="prog-avatar">
											<img src="images/indents/green.png" alt="" />
										</div>
										<div class="details">
											<div class="title">
												<a href="#">交易失败</a> - 3720份
											</div>
											<div class="progress progress-xs">
												<div class="progress-bar progress-bar-success"
													role="progressbar" aria-valuenow="20" aria-valuemin="0"
													aria-valuemax="100" style="width: 13%">
													<span class="">13%</span>
												</div>
											</div>
										</div></li>
									<li>
										<div class="prog-avatar">
											<img src="images/indents/orange.png" alt="" />
										</div>
										<div class="details">
											<div class="title">
												<a href="#">已评价</a> - 21275份
											</div>
											<div class="progress progress-xs">
												<div class="progress-bar progress-bar-warning"
													role="progressbar" aria-valuenow="20" aria-valuemin="0"
													aria-valuemax="100" style="width: 77%">
													<span class="">77%</span>
												</div>
											</div>
										</div></li>
									<li>
										<div class="prog-avatar">
											<img src="images/indents/red.png" alt="" />
										</div>
										<div class="details">
											<div class="title">
												<a href="#">未评价</a> - 6355份
											</div>
											<div class="progress progress-xs">
												<div class="progress-bar progress-bar-danger"
													role="progressbar" aria-valuenow="20" aria-valuemin="0"
													aria-valuemax="100" style="width: 23%">
													<span class="">23%</span>
												</div>
											</div>
										</div></li>
									<li>
										<div class="prog-avatar">
											<img src="images/indents/green.png" alt="" />
										</div>
										<div class="details">
											<div class="title">
												<a href="#">订单总数</a> - 27630份
											</div>
											<div class="progress progress-xs">
												<div class="progress-bar progress-bar-success"
													role="progressbar" aria-valuenow="20" aria-valuemin="0"
													aria-valuemax="100" style="width: 100%">
													<span class="">100%</span>
												</div>
											</div>
										</div></li>
								</ul>
								<div class="text-center">
									<a href="#">详情查看</a>
								</div>
							</div>
						</div>
					</div>
				</div>
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

	<!--easy pie chart-->
	<script src="js/easypiechart/jquery.easypiechart.js"></script>
	<script src="js/easypiechart/easypiechart-init.js"></script>

	<!--Sparkline Chart-->
	<script src="js/sparkline/jquery.sparkline.js"></script>
	<script src="js/sparkline/sparkline-init.js"></script>

	<!--icheck -->
	<script src="js/iCheck/jquery.icheck.js"></script>
	<script src="js/icheck-init.js"></script>

	<!-- jQuery Flot Chart-->
	<script src="js/flot-chart/jquery.flot.js"></script>
	<script src="js/flot-chart/jquery.flot.tooltip.js"></script>
	<script src="js/flot-chart/jquery.flot.resize.js"></script>


	<!--Morris Chart-->
	<script src="js/morris-chart/morris.js"></script>
	<script src="js/morris-chart/raphael-min.js"></script>

	<!--Calendar-->
	<script src="js/calendar/clndr.js"></script>
	<script src="js/calendar/evnt.calendar.init.js"></script>
	<script src="js/calendar/moment-2.2.1.js"></script>
	<script
		src="http://cdnjs.cloudflare.com/ajax/libs/underscore.js/1.5.2/underscore-min.js"></script>

	<!--common scripts for all pages-->
	<script src="js/scripts.js"></script>

	<!--Dashboard Charts-->
	<script type="text/javascript" src="js/dashboard-chart-init.js"
		charset="UTF-8"></script>


</body>
</html>
