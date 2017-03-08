function lineSearch(line) {
	//加载公交线路查询插件
	//实例化公交线路查询类，只取回一条路线
	AMap.service([ "AMap.LineSearch" ], function() {
		  var linesearch = new AMap.LineSearch({
              pageIndex: 1,
              city: '成都',
              pageSize: 1,
              extensions: 'all'
          });
		  alert(line);
		//搜索line相关公交线路
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
			var startPot = stops[0].location;
			var endPot = stops[stops.length - 1].location;

			if (i == 0)
				drawbusLine(startPot, endPot, pathArr);
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
		position : [ startPot.lng, startPot.lat ], //基点位置
		icon : "http://webapi.amap.com/theme/v1.3/markers/n/start.png",
		zIndex : 10
	});
	var endmarker = new AMap.Marker({
		map : map,
		position : [ endPot.lng, endPot.lat ], //基点位置
		icon : "http://webapi.amap.com/theme/v1.3/markers/n/end.png",
		zIndex : 10
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
        for (var i = 0; i < searchNum; i++) {
            var marker = new AMap.Marker({
                position: stationArr[i].location,
                map: map,
                title: stationArr[i].name
            });
            marker.info = new AMap.InfoWindow({
                content: stationArr[i].name,
                offset: new AMap.Pixel(0, -30)
            });
            marker.on('click', function(e) {
                e.target.info.open(map, e.target.getPosition())
            });
        }
    }
	map.setFitView();
}