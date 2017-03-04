package com.Transport.dao;

import java.util.List;

import com.Transport.bean.Bus;

public interface BusDao {

	//增加车辆信息
	public boolean addBusInfo(Bus bus);
	
	//删除车辆信息
	public boolean deleteBusInfo(int busId);
	
	//查询一辆车的信息
	public Bus queryOneBusInfo(int busId);
	
	//查询特定数量车辆的信息
	public List<Bus> queryBussInfo(int num);
	
	//修改车辆信息
	public boolean updateBusInfo(Bus bus);
}
