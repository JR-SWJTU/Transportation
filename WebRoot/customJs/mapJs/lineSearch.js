function lineSearch(line) {
	//���ع�����·��ѯ���
	//ʵ����������·��ѯ�ֻ࣬ȡ��һ��·��
	AMap.service([ "AMap.LineSearch" ], function() {
		  var linesearch = new AMap.LineSearch({
              pageIndex: 1,
              city: '�ɶ�',
              pageSize: 1,
              extensions: 'all'
          });
		  alert(line);
		//����line��ع�����·
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
 * ����·�߲�ѯ���񷵻����ݽ����ſ�
 * param Array[]  lineArr     ���ع�����·����
 * param String   lineName    ������·����
 * param String   lineCity    �������ڳ���
 * param String   company     ����������˾
 * param Number   stime       �װ೵ʱ��
 * param Number   etime       ĩ�೵ʱ��
 * param Number   bprice      ������Ʊ��
 * param Number   tprice      ����ȫ��Ʊ��
 * param Array[]  pathArr     ������··������
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
 *����·��
 */
function drawbusLine(startPot, endPot, BusArr) {
	//������㣬�յ�
	var stmarker = new AMap.Marker({
		map : map,
		position : [ startPot.lng, startPot.lat ], //����λ��
		icon : "http://webapi.amap.com/theme/v1.3/markers/n/start.png",
		zIndex : 10
	});
	var endmarker = new AMap.Marker({
		map : map,
		position : [ endPot.lng, endPot.lat ], //����λ��
		icon : "http://webapi.amap.com/theme/v1.3/markers/n/end.png",
		zIndex : 10
	});
	//���Ƴ˳���·��
	busPolyline = new AMap.Polyline({
		map : map,
		path : BusArr,
		strokeColor : "#09f",//����ɫ
		strokeOpacity : 0.8,//��͸����
		strokeWeight : 6
	//�߿�
	});
	map.setFitView();
}

/*����վ���ѯ�������ݽ���*/
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