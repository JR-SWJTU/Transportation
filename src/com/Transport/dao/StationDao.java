package com.Transport.dao;

import java.util.List;

import com.Transport.bean.Station;

public interface StationDao {
	//增加公交站点信息
	public boolean addStationInfo(Station station);
	
	//删除公交站点信息
	public boolean deleteStationInfo(int stationId);
	
	//查询一个公交站点的信息
	public Station queryOneStationInfo(int stationId);
	
	//查询特定数量公交站点的信息
	public List<Station> queryStationsInfo(int num);
	
	//修改公交站点信息
	public boolean updateStationInfo(Station station);
}
