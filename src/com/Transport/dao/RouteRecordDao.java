package com.Transport.dao;

import java.util.List;

import com.Transport.bean.Routerecord;

public interface RouteRecordDao {
	//增加公交行驶记录信息
	public boolean addRouterecordInfo(Routerecord routeRecord);
	
	//删除公交行驶记录信息
	public boolean deleteRouterecordInfo(int routeRecordId);
	
	//查询一条公交行驶记录的信息
	public Routerecord queryOneRouterecordInfo(int routeRecordId);
	
	//查询特定数量公交行驶记录的信息
	public List<Routerecord> queryRouterecordsInfo(int num);
	
	//修改公交行驶记录信息
	public boolean updateRouterecordInfo(Routerecord routeRecord);
}
