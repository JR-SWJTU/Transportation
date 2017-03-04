package com.Transport.unitTest;

import static org.junit.Assert.*;

import java.util.ArrayList;

import org.junit.Test;

import com.Transport.bean.Travelrecord;
import com.Transport.dao.StationDao;
import com.Transport.dao.TravelrecordDao;
import com.Transport.daoImpl.StationDaoImpl;
import com.Transport.daoImpl.TravelrecordDaoImpl;

public class NormalTest {

	@Test
	public void test() {
		ArrayList<Travelrecord> travelrecords = new ArrayList<Travelrecord>();
		TravelrecordDao travelrecordDao = new TravelrecordDaoImpl();
		int currentPage = 1;
		int num = 10;
		travelrecords = (ArrayList<Travelrecord>) travelrecordDao.queryTravelrecordsInfo(currentPage , num);
		Travelrecord travelrecord = new Travelrecord();
		StationDao stationDao = new StationDaoImpl();
		for(int i = 0;i<travelrecords.size();i++){
			travelrecord = travelrecords.get(i);
			travelrecord.setStationByAboardState( stationDao.queryOneStationInfo(travelrecord.getStationByAboardState().getStationId()));
			System.out.println(travelrecords.get(i).getStationByAboardState().getStationName());
		}
	}

}
