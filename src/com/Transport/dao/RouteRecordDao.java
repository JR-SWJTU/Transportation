package com.Transport.dao;

import java.util.List;

import com.Transport.bean.Routerecord;

public interface RouteRecordDao {
	//���ӹ�����ʻ��¼��Ϣ
	public boolean addRouterecordInfo(Routerecord routeRecord);
	
	//ɾ��������ʻ��¼��Ϣ
	public boolean deleteRouterecordInfo(int routeRecordId);
	
	//��ѯһ��������ʻ��¼����Ϣ
	public Routerecord queryOneRouterecordInfo(int routeRecordId);
	
	//��ѯ�ض�����������ʻ��¼����Ϣ
	public List<Routerecord> queryRouterecordsInfo(int num);
	
	//�޸Ĺ�����ʻ��¼��Ϣ
	public boolean updateRouterecordInfo(Routerecord routeRecord);
}
