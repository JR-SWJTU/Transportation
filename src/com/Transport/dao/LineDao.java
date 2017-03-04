package com.Transport.dao;

import java.util.List;

import com.Transport.bean.Line;

public interface LineDao {
	//���ӹ�����·��Ϣ
	public boolean addLineInfo(Line line);
	
	//ɾ��������·��Ϣ
	public boolean deleteLineInfo(int lineId);
	
	//��ѯһ��������·����Ϣ
	public Line queryOneLineInfo(int lineId);
	
	//��ѯ�ض�����������·����Ϣ
	public List<Line> queryLinesInfo(int num);
	
	//�޸Ĺ�����·��Ϣ
	public boolean updateLineInfo(Line line);
}
