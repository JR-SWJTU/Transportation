package com.Transport.dao;

import java.util.List;

import com.Transport.bean.Line;

public interface LineDao {
	//增加公交线路信息
	public boolean addLineInfo(Line line);
	
	//删除公交线路信息
	public boolean deleteLineInfo(int lineId);
	
	//查询一条公交线路的信息
	public Line queryOneLineInfo(int lineId);
	
	//查询特定数量公交线路的信息
	public List<Line> queryLinesInfo(int num);
	
	//修改公交线路信息
	public boolean updateLineInfo(Line line);
}
