package com.Transport.dao;

import java.util.List;

import com.Transport.bean.Stationofline;

public interface StationOfLineDao {
	//增加公交站点与公交线路间关系信息
	public boolean addStationoflineInfo(Stationofline stationOfLine);
	
	//删除公交站点与公交线路间关系信息
	public boolean deleteStationoflineInfo(int stationOfLineId);
	
	//查询一条公交站点与公交线路间关系的信息
	public Stationofline queryOneStationoflineInfo(int stationOfLineId);
	
	//查询特定数量公交站点与公交线路间关系的信息
	public List<Stationofline> queryStationoflinesInfo(int num);
	
	//修改公交站点与公交线路间关系信息
	public boolean updateStationoflineInfo(Stationofline stationOfLine);
}
