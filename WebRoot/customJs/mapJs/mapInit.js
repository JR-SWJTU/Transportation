		var map = new AMap.Map('map', {
			// resizeEnable : true,
			zoom : 13,
			center : [ 104.071791, 30.668516 ]
		});
		//����DomLibrary��jQuery����Zepto
		AMapUI.setDomLibrary($);

		//����BasicControl��loadUI��·������Ϊģ������ 'ui/' ֮��Ĳ���
		AMapUI.loadUI([ 'control/BasicControl' ], function(BasicControl) {

			//���ſؼ�
			map.addControl(new BasicControl.Zoom({
				position : 'rb', //���½�
				showZoomNum : true
			//��ʾzoomֵ
			}));

			//ͼ���л��ؼ�
			map.addControl(new BasicControl.LayerSwitcher({
				position : {
					top : '20px',
					right : '80px',
				}
			//right top�����Ͻ�
			}));

			//ʵʱ��ͨ�ؼ�
			map.addControl(new BasicControl.Traffic({
				position : {
					top : '20px',
					right : '20px',
				}
			//���Ͻ�
			}));
		});

/*		//����PoiPicker��loadUI��·������Ϊģ������ 'ui/' ֮��Ĳ���
		AMapUI.loadUI([ 'misc/PoiPicker' ], function(PoiPicker) {
			var poiPicker = new PoiPicker({
				input : 'searchInput' //�����id
			});
			//����poiѡ����Ϣ
			poiPicker.on('poiPicked', function(poiResult) {
				//�û�ѡ�е�poi����Ϣ
			});

			AMap.service('AMap.StationSearch', function() {//�ص�����
				//ʵ����StationSearch
				stationSearch = new AMap.StationSearch();
				//TODO: ʹ��stationSearch���������������ѯ�Ĺ���
			});

		});*/