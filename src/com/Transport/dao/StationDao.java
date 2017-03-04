package com.Transport.dao;

import java.util.List;

import com.Transport.bean.Station;

public interface StationDao {
	//���ӹ���վ����Ϣ
	public boolean addStationInfo(Station station);
	
	//ɾ������վ����Ϣ
	public boolean deleteStationInfo(int stationId);
	
	//��ѯһ������վ�����Ϣ
	public Station queryOneStationInfo(int stationId);
	
	//��ѯ�ض���������վ�����Ϣ
	public List<Station> queryStationsInfo(int num);
	
	//�޸Ĺ���վ����Ϣ
	public boolean updateStationInfo(Station station);
}
