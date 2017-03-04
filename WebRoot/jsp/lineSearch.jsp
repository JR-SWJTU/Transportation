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



<body class="sticky-header left-side-collapsed">
	<section>

		<!-- 左部导航栏  -->
		<div class="left-side sticky-left-side">

			<!--logo and iconic logo start-->
			<div class="logo">
				<a href="index.html"><img src="images/logo.png" alt="">
				</a>
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
							class="fa fa-home"></i> <span>主页</span>
					</a>
					</li>

					<li class="menu-list"><a href=""><i class="fa fa-tasks"></i>
							<span>公交线路浏览</span>
					</a>
						<ul class="sub-menu-list">
							<li><a href="./jsp/lineInfo.jsp"> 公交线路数据</a>
							</li>
							<li><a href="./jsp/lineSearch.jsp"> 公交线路搜索</a>
							</li>
						</ul></li>

					<li class="menu-list"><a href=""><i class="fa fa-th-list"></i>
							<span>公交OD数据</span>
					</a>
						<ul class="sub-menu-list">
							<li><a href="./jsp/ODTable.jsp"> 公交OD矩阵表</a>
							</li>
							<li><a href="./jsp/ODOnMap.jsp"> OD数据可视化</a>
							</li>
						</ul></li>

					<li class="menu-list"><a href=""><i
							class="fa fa-bar-chart-o"></i> <span>统计指标浏览</span>
					</a>
						<ul class="sub-menu-list">
							<li><a href="tabs-accordions.html"> 客流指标浏览</a>
							</li>
							<li><a href="./jsp/relationRules.jsp"> 运营指标浏览</a>
							</li>
							<li><a href="./jsp/relationRules.jsp"> 时空分布特性</a>
							</li>
						</ul></li>

					<li><a href="./jsp/login.jsp"><i class="fa fa-sign-in"></i>
							<span>退出账号</span>
					</a>
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

				<div>
					<form class="form-horizontal adminex-form" method="get">
						<div class="col-sm-10">
							<input type="text" class="form-control" id="searchInput">
						</div>
					</form>
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

	//加载BasicControl，loadUI的路径参数为模块名中 'ui/' 之后的部分
	AMapUI.loadUI([ 'control/BasicControl' ], function(BasicControl) {

		var map = new AMap.Map('map', {
			// resizeEnable : true,
			zoom : 10,
			center : [ 104.071791, 30.668516 ]
		});

		//缩放控件
		map.addControl(new BasicControl.Zoom({
			position : 'rb', //右下角
			showZoomNum : true
		//显示zoom值
		}));

		//图层切换控件
		map.addControl(new BasicControl.LayerSwitcher({
			position :  {	top:'20px', right:'80px',} //right top，右上角
		}));

		//实时交通控件
		map.addControl(new BasicControl.Traffic({
			position : {	top:'20px', right:'20px',}//右上角
		}));
	});
	

	//加载PoiPicker，loadUI的路径参数为模块名中 'ui/' 之后的部分
	AMapUI.loadUI([ 'misc/PoiPicker' ], function(PoiPicker) {
		var poiPicker = new PoiPicker({
			input : 'searchInput' //输入框id
		});
		//监听poi选中信息
		poiPicker.on('poiPicked', function(poiResult) {
			//用户选中的poi点信息
		});
		
		AMap.service('AMap.StationSearch', function() {//回调函数
			//实例化StationSearch
			stationSearch = new AMap.StationSearch();
			//TODO: 使用stationSearch对象调用行政区查询的功能
		})

		AMap.service('AMap.LineSearch', function() {//回调函数
			//实例化LineSearch
			lineSearch = new AMap.LineSearch();
			//TODO: 使用lineSearch对象调用行政区查询的功能
		})
	});
</script>

</body>
</html>