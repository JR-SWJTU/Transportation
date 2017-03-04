package com.Transport.dao;

import java.util.List;

import com.Transport.bean.Bus;

public interface BusDao {

	//���ӳ�����Ϣ
	public boolean addBusInfo(Bus bus);
	
	//ɾ��������Ϣ
	public boolean deleteBusInfo(int busId);
	
	//��ѯһ��������Ϣ
	public Bus queryOneBusInfo(int busId);
	
	//��ѯ�ض�������������Ϣ
	public List<Bus> queryBussInfo(int num);
	
	//�޸ĳ�����Ϣ
	public boolean updateBusInfo(Bus bus);
}
