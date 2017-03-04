package com.Transport.dao;

import java.util.List;

import com.Transport.bean.Travelrecord;

public interface TravelrecordDao {
	//���ӳ˿ͳ˳���¼��Ϣ
	public boolean addTravelrecordInfo(Travelrecord travelRecord);
	
	//ɾ���˿ͳ˳���¼��Ϣ
	public boolean deleteTravelrecordInfo(int travelRecordId);
	
	//��ѯһ���˿ͳ˳���¼����Ϣ
	public Travelrecord queryOneTravelrecordInfo(int travelRecordId);
	
	//��ѯ�ض������˿ͳ˳���¼����Ϣ
	public List<Travelrecord> queryTravelrecordsInfo(int page ,int num);
	
	//�޸ĳ˿ͳ˳���¼��Ϣ
	public boolean updateTravelrecordInfo(Travelrecord travelRecord);
}
