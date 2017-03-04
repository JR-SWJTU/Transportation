package com.Transport.dao;

import java.util.List;

import com.Transport.bean.Stationofline;

public interface StationOfLineDao {
	//���ӹ���վ���빫����·���ϵ��Ϣ
	public boolean addStationoflineInfo(Stationofline stationOfLine);
	
	//ɾ������վ���빫����·���ϵ��Ϣ
	public boolean deleteStationoflineInfo(int stationOfLineId);
	
	//��ѯһ������վ���빫����·���ϵ����Ϣ
	public Stationofline queryOneStationoflineInfo(int stationOfLineId);
	
	//��ѯ�ض���������վ���빫����·���ϵ����Ϣ
	public List<Stationofline> queryStationoflinesInfo(int num);
	
	//�޸Ĺ���վ���빫����·���ϵ��Ϣ
	public boolean updateStationoflineInfo(Stationofline stationOfLine);
}
