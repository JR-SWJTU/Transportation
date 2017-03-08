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

<title>OD数据可视化</title>

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
					</a>
					</li>

					<li class="menu-list"><a href=""><i class="fa fa-tasks"></i>
							<span>公交线路浏览</span> </a>
						<ul class="sub-menu-list">
							<li><a href="./jsp/lineInfo.jsp"> 公交线路数据</a>
							</li>
							<li><a href="./jsp/lineSearch.jsp"> 公交线路搜索</a>
							</li>
						</ul></li>

					<li class="menu-list nav-active"><a href=""><i
							class="fa fa-th-list"></i> <span>公交OD数据</span> </a>
						<ul class="sub-menu-list">
							<li><a href="./jsp/ODTable.jsp"> 公交OD矩阵表</a>
							</li>
							<li class="active"><a href="./jsp/ODOnMap.jsp"> OD数据可视化</a>
							</li>
						</ul></li>

					<li class="menu-list"><a href=""><i
							class="fa fa-bar-chart-o"></i> <span>统计指标浏览</span> </a>
						<ul class="sub-menu-list">
							<li><a href="tabs-accordions.html"> 客流指标浏览</a>
							</li>
							<li><a href="./jsp/relationRules.jsp"> 运营指标浏览</a>
							</li>
							<li><a href="./jsp/relationRules.jsp"> 时空分布特性</a>
							</li>
						</ul></li>

					<li><a href="./jsp/login.jsp"><i class="fa fa-sign-in"></i>
							<span>退出账号</span> </a>
					</li>

				</ul>
				<!--sidebar nav end-->

			</div>
		</div>
		<!-- left side end-->

		<!-- main content start-->
		<div class="main-content">

			<jsp:include page="../header.jsp"></jsp:include>

			<!--body wrapper start-->
			<section class="wrapper">


				<div>
					<div id="map" style="width:100%; height:1000px;"></div>
				</div>

			</section>
			<!--body wrapper end-->

			<!--footer section start-->
			<%@include file="../footer.jsp"%>
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

	<script>
		//设置DomLibrary，jQuery或者Zepto
		AMapUI.setDomLibrary($);

		var map = new AMap.Map('map', {
			resizeEnable : true,
			zoom : 12,
			center : [ 104.071791, 30.668516 ]
		});

		//加载BasicControl，loadUI的路径参数为模块名中 'ui/' 之后的部分
		AMapUI.loadUI([ 'control/BasicControl' ], function(BasicControl) {

			//缩放控件
			map.addControl(new BasicControl.Zoom({
				position : 'rb', //右下角
				showZoomNum : true
			//显示zoom值
			}));

			//图层切换控件
			map.addControl(new BasicControl.LayerSwitcher({
				position : {
					top : '20px',
					right : '80px',
				}
			//right top，右上角
			}));

			//实时交通控件
			map.addControl(new BasicControl.Traffic({
				open : false,
				position : {
					top : '20px',
					right : '20px',
				}
			//右上角
			}));
		});

		function refresh() {
			var features = [];
			features.push("bg");
			features.push("road");
			features.push("building");
			//features.push("point");
			map.setFeatures(features);
		}

		refresh();

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
					pageSize : 10,
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
					var startPot = stops[0];
					var endPot = stops[stops.length - 1];

					var polyline = new AMap.Polyline({
						path : pathArr, //设置线覆盖物路径
						strokeColor : "#3366FF", //线颜色
						strokeOpacity : 1, //线透明度
						strokeWeight : 2, //线宽
						strokeStyle : "solid", //线样式
						strokeDasharray : [ 10, 5 ]
					//补充线样式
					});
					polyline.setMap(map);
				}
			}
		}

		lineSearch('111');
	</script>

</body>
</html>
