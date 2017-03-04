package com.Transport.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Transport.bean.Travelrecord;
import com.Transport.dao.StationDao;
import com.Transport.dao.TravelrecordDao;
import com.Transport.daoImpl.StationDaoImpl;
import com.Transport.daoImpl.TravelrecordDaoImpl;

public class ODTable extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ODTable() {
		super();
	}

	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setHeader("Content-type", "text/html;charset=UTF-8");
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");

		HttpSession session = request.getSession();
		ArrayList<Travelrecord> travelrecords = new ArrayList<Travelrecord>();
		TravelrecordDao travelrecordDao = new TravelrecordDaoImpl();
		int currentPage = Integer.parseInt( request.getParameter("currentPage") );
		int num = 10;
		travelrecords = (ArrayList<Travelrecord>) travelrecordDao.queryTravelrecordsInfo(currentPage , num);
		Travelrecord travelrecord = new Travelrecord();
		StationDao stationDao = new StationDaoImpl();
		for(int i = 0;i<travelrecords.size();i++){
			travelrecord = travelrecords.get(i);
			travelrecord.setStationByAboardState( stationDao.queryOneStationInfo(travelrecord.getStationByAboardState().getStationId()));
			travelrecord.setStationByDesbusState( stationDao.queryOneStationInfo(travelrecord.getStationByDesbusState().getStationId()));
		}

		session.setAttribute("travelrecords", travelrecords);
		session.setAttribute("travelrecordSize", travelrecords.size());
		session.setAttribute("currentPage", currentPage);
		System.out.println(travelrecords.size());
		System.out.println("ÔËÐÐÖÐ" + currentPage);
		response.sendRedirect("../jsp/ODTable.jsp");
	}

	public void init() throws ServletException {
		// Put your code here
	}

}
