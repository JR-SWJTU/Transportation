<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
<meta name="description" content="">
<meta name="author" content="ThemeBucket">
<link rel="shortcut icon" href="#" type="image/png">

<title>公交OD矩阵表</title>

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
					<li><a href="./jsp/home.jsp"><i class="fa fa-home"></i> <span>主页</span>
					</a></li>

					<li class="menu-list"><a href=""><i class="fa fa-tasks"></i>
							<span>公交线路浏览</span> </a>
						<ul class="sub-menu-list">
							<li><a href="./jsp/lineInfo.jsp"> 公交线路数据</a></li>
							<li><a href="./jsp/lineSearch.jsp"> 公交线路搜索</a></li>
						</ul>
					</li>

					<li class="menu-list nav-active"><a href=""><i
							class="fa fa-th-list"></i> <span>公交OD数据</span> </a>
						<ul class="sub-menu-list">
							<li class="active"><a href="./servlet/ODTable?currentPage=1">
									公交OD矩阵表</a></li>
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
					<div class="col-sm-12">
						<section class="panel">
							<header class="panel-heading">
								公交OD矩阵表 <span class="tools pull-right"> <a
									href="javascript:;" class="fa fa-chevron-down"></a> <a
									href="javascript:;" class="fa fa-times"></a> </span>
							</header>
							<div class="panel-body">
								<table class="table table-hover">
									<thead>
										<tr>
											<th>序号</th>
											<th>线路编号</th>
											<th>公交车辆编号</th>
											<th>乘客Mac地址</th>
											<th>上车站点</th>
											<th>上车时间</th>
											<th>下车站点</th>
											<th>下车时间</th>
											<!-- 											<th>下车站点上车人数</th>
											<th>下车站点下车人数</th>
											<th>车载人数</th> -->
											<th>WiFi设备比例系数</th>
										</tr>
									</thead>
									<tbody>
										<%int i =1; %>
										<c:forEach items="${travelrecords}" var="travelrecord">
											<tr>
												<td></td>
												<td>${travelrecord.getLine().lineId}</td>
												<td>${travelrecord.getBus().busId }</td>
												<td>${travelrecord.macId}</td>
												<td>${travelrecord.getStationByAboardState().stationId
													}</td>
												<td>${travelrecord.aboardTime}</td>
												<td>${travelrecord.getStationByDesbusState().stationId
													}</td>
												<td>${travelrecord.desbusTime}</td>
												<td>${travelrecord.busK}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>

								<div align="right">
									<div class="">
										<ul class="pagination">
											<li><a href="#">«</a></li>
											<li class="active"><a href="#">${currentPage}</a></li>
											<li ><a href="#">${currentPage+1}</a></li>
											<li><a href="#">${currentPage+2}</a></li>
											<li><a href="#">${currentPage+3}</a></li>
											<li><a href="#">${currentPage+4}</a></li>
											<li><a href="#">»</a></li>
										</ul>
									</div>
								</div>
						</section>
					</div>
				</div>



			</div>
			<!--body wrapper end-->

			<!--footer section start-->
			<footer> 2016 &copy; 数据集合信息科技有限公司 </footer>
			<!--footer section end-->

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
