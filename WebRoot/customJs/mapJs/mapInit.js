		var map = new AMap.Map('map', {
			// resizeEnable : true,
			zoom : 13,
			center : [ 104.071791, 30.668516 ]
		});
		//设置DomLibrary，jQuery或者Zepto
		AMapUI.setDomLibrary($);

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
				position : {
					top : '20px',
					right : '20px',
				}
			//右上角
			}));
		});

/*		//加载PoiPicker，loadUI的路径参数为模块名中 'ui/' 之后的部分
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
			});

		});*/