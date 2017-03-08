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
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
<meta name="description" content="">
<meta name="author" content="ThemeBucket">
<link rel="shortcut icon" href="#" type="image/png">

<title>公交线路数据</title>

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
					</a></li>

					<li class="menu-list nav-active"><a href=""><i
							class="fa fa-tasks"></i> <span>公交线路浏览</span> </a>
						<ul class="sub-menu-list">
							<li class="active"><a href="./jsp/lineInfo.jsp"> 公交线路数据</a>
							</li>
							<li><a href="./jsp/lineSearch.jsp"> 公交线路搜索</a></li>
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

			<jsp:include page="../header.jsp"></jsp:include>

			<!--body wrapper start-->
			<div class="wrapper">

				<div class="row">
					<div class="col-sm-12">
						<section class="panel">
							<header class="panel-heading">
								公交线路数据 <span class="tools pull-right"> <a
									href="javascript:;" class="fa fa-chevron-down"></a> <a
									href="javascript:;" class="fa fa-times"></a> </span>
							</header>
							<div class="panel-body" id="showTable">
							</div>

							<div align="right">
								<div class="">
									<ul class="pagination">
										<li><a href="#">«</a>
										</li>
										<li class="active"><a href="#">${currentPage}</a>
										</li>
										<li><a href="#">${currentPage+1}</a>
										</li>
										<li><a href="#">${currentPage+2}</a>
										</li>
										<li><a href="#">${currentPage+3}</a>
										</li>
										<li><a href="#">${currentPage+4}</a>
										</li>
										<li><a href="#">»</a>
										</li>
									</ul>
								</div>
							</div>
						</section>
					</div>
				</div>



			</div>
			<!--body wrapper end-->

			<footer class="sticky-footer"> 2016 &copy; 数据集合信息科技有限公司 </footer>
			<%-- <%@include file="../footer.jsp"%> --%>
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
				var tableHtml = "";
			
				tableHtml += "<table class='table table-hover'><thead><tr>";
				tableHtml += "<th>序号</th><th>线路编号</th><th>起点</th>"
					+ "<th>终点</th><th>站点个数</th><th>线路长度</th><th>平均站间距离</th>"
					+ "<th>线路非直线系数</th><th>站点详情</th><th>地图上查看</th></tr></thead>"
					+ "<tbody>";
			
				for ( var i = 0; i < lineNum; i++) {
					var pathArr = lineArr[i].path;
					var stops = lineArr[i].via_stops;
					var startPot = stops[0];
					var endPot = stops[stops.length - 1];
					
					var serial = i + 1;
					tableHtml +="<tr>";
					tableHtml +="<td>" + serial + "</td>";
					tableHtml +="<td>" + lineArr[i].name + "</td>";
					tableHtml +="<td>" + startPot.name + "</td>";
					tableHtml +="<td>" + endPot.name + "</td>";
					tableHtml +="<td>" + stops.length + "</td>";
					tableHtml +="<td>" + lineArr[i].distance + '千米' + "</td>";
					tableHtml +="<td>" + lineArr[i].distance / stops.length + '米' + "</td>";
					var spaceDis = startPot.location.distance(endPot.location);
					tableHtml +="<td>" + lineArr[i].distance / spaceDis + "</td>";
					tableHtml +="<td><a role='button' class='btn btn-info' href='./jsp/driverInfo_certificate.jsp'>站点详情</a></td>";
					tableHtml +="<td><a role='button' class='btn btn-info' href='./jsp/driverInfo_certificate.jsp'>地图查看</a></td>";
					tableHtml += "</tr>";
				}
				tableHtml += "</tbody></table>";
				$("#showTable").html(tableHtml);
			}
		}
		
		lineSearch('111');
	</script>
</body>
</html>
