package com.Transport.dao;

import java.util.List;

import com.Transport.bean.Travelrecord;

public interface TravelrecordDao {
	//增加乘客乘车记录信息
	public boolean addTravelrecordInfo(Travelrecord travelRecord);
	
	//删除乘客乘车记录信息
	public boolean deleteTravelrecordInfo(int travelRecordId);
	
	//查询一个乘客乘车记录的信息
	public Travelrecord queryOneTravelrecordInfo(int travelRecordId);
	
	//查询特定数量乘客乘车记录的信息
	public List<Travelrecord> queryTravelrecordsInfo(int page ,int num);
	
	//修改乘客乘车记录信息
	public boolean updateTravelrecordInfo(Travelrecord travelRecord);
}
