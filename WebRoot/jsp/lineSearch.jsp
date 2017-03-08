<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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

<title>公交线路搜索</title>

<!--common-->
<link href="css/style.css" rel="stylesheet">
<link href="css/style-responsive.css" rel="stylesheet">

<!-- 地图依赖的js文件 -->
<script type="text/javascript"
	src="http://webapi.amap.com/maps?v=1.3&key=4e7c4753cd3214ede99420f44125b893"></script>
<!--引入UI组件库（1.0版本） -->
<script src="//webapi.amap.com/ui/1.0/main.js"></script>

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <![endif]-->
</head>



<!-- <body class="sticky-header left-side-collapsed"> -->
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
					<li class="active"><a href="./jsp/home.jsp"><i
							class="fa fa-home"></i> <span>主页</span> </a></li>

					<li class="menu-list nav-active"><a href=""><i
							class="fa fa-tasks"></i> <span>公交线路浏览</span> </a>
						<ul class="sub-menu-list">
							<li><a href="./jsp/lineInfo.jsp"> 公交线路数据</a></li>
							<li class="active"><a href="./jsp/lineSearch.jsp">
									公交线路搜索</a></li>
						</ul>
					</li>

					<li class="menu-list"><a href=""><i class="fa fa-th-list"></i>
							<span>公交OD数据</span> </a>
						<ul class="sub-menu-list">
							<li><a href="./jsp/ODTable.jsp"> 公交OD矩阵表</a></li>
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

			<!-- header section start-->
			<jsp:include page="../header.jsp"></jsp:include>
			<!-- header section end-->


			<!--body wrapper start-->
			<section class="wrapper">


				<div>
					<div id="map" style="width:100%; height:1000px;"></div>
				</div>


				<div class="form-group" style="position:fixed;left:42%;top:80px;">
					<div class="col-lg-6">
						<div class="input-group input-group-lg m-bot15">
							<span class="input-group-btn">
								<button type="button" class="btn btn-default" id="lineSearch">
									<i class="fa fa-search"></i>
								</button> </span> <input type="text" class="form-control input-lg"
								placeholder="搜索公交线路" id="line">
						</div>
					</div>
				</div>


				<div class="col-lg-3" style="position:fixed;left:13%;top:80px;">
					<section class="panel">
						<header class="panel-heading">
							111路公交信息 <span class="tools pull-right"> <a
								href="javascript:;" class="fa fa-chevron-down"></a> <a
								href="javascript:;" class="fa fa-times"></a> </span>
						</header>
						<div class="panel-body">
							<table class="table table-hover">
								<tbody>
									<tr>
										<td>线路起点：</td>
										<td id="startPot"></td>
									</tr>
									<tr>
										<td>线路终点：</td>
										<td id="endPot"></td>
									</tr>
									<tr>
										<td>站点个数：</td>
										<td id="stationNum"></td>
									</tr>
									<tr>
										<td>线路长度：</td>
										<td id="lineLen"></td>
									</tr>
									<tr>
										<td>平均站间距离：</td>
										<td id="avgDis"></td>
									</tr>
									<tr>
										<td>线路非直线系数：</td>
										<td id="lineK"></td>
									</tr>
								</tbody>
							</table>
						</div>
					</section>
				</div>

			</section>
			<!--body wrapper end-->

			<!--footer section start-->
			<!-- <footer  class="sticky-footer"> 2016 &copy; 数据集合信息科技有限公司 </footer> -->
			<%-- <%@include file="../footer.jsp"%> --%>
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

	<!-- 引入自定义的地图js -->
	<script src="customJs/mapJs/mapInit.js"></script>
	<!-- 	<script src="customJs/mapJs/lineSearch.js"></script> -->

	<script>
		/*
		 *公交线路查询
		 */
		function lineSearch(line) {
			//加载公交线路查询插件
			//实例化公交线路查询类，只取回一条路线
			AMap.service([ "AMap.LineSearch" ], function() {
				var linesearch = new AMap.LineSearch({
					pageIndex : 1,
					city : '成都',
					pageSize : 1,
					extensions : 'all'
				});
				//搜索“536”相关公交线路
				linesearch.search(line, function(status, result) {
					if (status === 'complete' && result.info === 'OK') {
						lineSearch_Callback(result);
					} else {
						alert(result);
					}
				});
			});
		}
		/*
		 * 公交路线查询服务返回数据解析概况
		 * param Array[]  lineArr     返回公交线路总数
		 * param String   lineName    公交线路名称
		 * param String   lineCity    公交所在城市
		 * param String   company     公交所属公司
		 * param Number   stime       首班车时间
		 * param Number   etime       末班车时间
		 * param Number   bprice      公交起步票价
		 * param Number   tprice      公交全程票价
		 * param Array[]  pathArr     公交线路路径数组
		 */
		function lineSearch_Callback(data) {
			var lineArr = data.lineInfo;
			var lineNum = data.lineInfo.length;
			if (lineNum == 0) {
				resLine = data.info;
			} else {
				for ( var i = 0; i < lineNum; i++) {
					var pathArr = lineArr[i].path;
					var stops = lineArr[i].via_stops;
					stationSearch_CallBack(stops);
					var startPot = stops[0];
					var endPot = stops[stops.length - 1];
					
					if (i == 0)
						drawbusLine(startPot, endPot, pathArr);
						
					$("#startPot").html(startPot.name);
					$("#endPot").html(endPot.name);
					$("#stationNum").html(stops.length);
					$("#avgDis").html(lineArr[i].distance / stops.length + '米');
					$("#lineLen").html(lineArr[i].distance + '千米');
					var spaceDis = startPot.location.distance(endPot.location);
					$("#lineK").html(lineArr[i].distance / spaceDis);
				}
			}
		}
		/*
		 *绘制路线
		 */
		function drawbusLine(startPot, endPot, BusArr) {
			//绘制起点，终点
			var stmarker = new AMap.Marker({
				map : map,
				position : [ startPot.location.lng, startPot.location.lat ], //基点位置
				icon : "http://webapi.amap.com/theme/v1.3/markers/n/start.png",
				zIndex : 10
			});
			stmarker.info = new AMap.InfoWindow({
				content : startPot.name,
				offset : new AMap.Pixel(0, -30)
			});
			stmarker.on('click', function(e) {
				e.target.info.open(map, e.target.getPosition())
			});
			var endmarker = new AMap.Marker({
				map : map,
				position : [ endPot.location.lng, endPot.location.lat ], //基点位置
				icon : "http://webapi.amap.com/theme/v1.3/markers/n/end.png",
				zIndex : 10
			});
			endmarker.info = new AMap.InfoWindow({
				content : endPot.name,
				offset : new AMap.Pixel(0, -30)
			});
			endmarker.on('click', function(e) {
				e.target.info.open(map, e.target.getPosition());
			});
			//绘制乘车的路线
			busPolyline = new AMap.Polyline({
				map : map,
				path : BusArr,
				strokeColor : "#09f",//线颜色
				strokeOpacity : 0.8,//线透明度
				strokeWeight : 6
			//线宽
			});
			map.setFitView();
		}

		/*公交站点查询返回数据解析*/
		function stationSearch_CallBack(searchResult) {
			var stationArr = searchResult;
			var searchNum = stationArr.length;
			if (searchNum > 0) {
				for ( var i = 1; i < searchNum - 1; i++) {
					var marker = new AMap.Marker({
						position : stationArr[i].location,
						map : map,
						title : stationArr[i].name
					});
					marker.info = new AMap.InfoWindow({
						content : stationArr[i].name,
						offset : new AMap.Pixel(0, -30)
					});
					marker.on('click', function(e) {
						e.target.info.open(map, e.target.getPosition())
					});
				}
			}
			map.setFitView();
		}

		$("#lineSearch").click(function() {
			var line = $("#line").val();
			lineSearch(line);
		});
	</script>

</body>
</html>
