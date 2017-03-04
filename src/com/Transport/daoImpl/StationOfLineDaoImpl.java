package com.Transport.daoImpl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.Transport.bean.Stationofline;
import com.Transport.dao.StationOfLineDao;
import com.Transport.util.HibernateSessionFactory;

public class StationOfLineDaoImpl implements StationOfLineDao {

	@Override
	public boolean addStationoflineInfo(Stationofline stationOfLine) {
		Session session = null;
		Transaction transaction  = null;
		try {
			session = HibernateSessionFactory.getSession();
			transaction  = session.beginTransaction();
			session.save(stationOfLine);
			transaction.commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
	        if(transaction!=null){  
	            transaction.rollback();  
	        }
			return false;
		}
		finally{
			HibernateSessionFactory.closeSession();
		}
	}

	@Override
	public boolean deleteStationoflineInfo(int stationOfLineId) {
		Session session = null;
		Transaction transaction  = null;
		try {
			session = HibernateSessionFactory.getSession();
			transaction  = session.beginTransaction();
			Stationofline stationOfLine = (Stationofline) session.get(Stationofline.class, stationOfLineId);
			session.delete(stationOfLine);
			transaction.commit();
			return true;
		} catch (Exception e) {
	        if(transaction!=null){  
	            transaction.rollback();  
	        }
	    	e.printStackTrace();
			return false;
		}
		finally{
			HibernateSessionFactory.closeSession();
		}
	}

	@Override
	public Stationofline queryOneStationoflineInfo(int stationOfLineId) {
		Session session = null;
		Transaction transaction  = null;
		try {
			session = HibernateSessionFactory.getSession();
			transaction  = session.beginTransaction();
			Stationofline stationOfLine = (Stationofline) session.get(Stationofline.class, stationOfLineId);
			transaction.commit();
			return stationOfLine;
		} catch (Exception e) {
	        if(transaction!=null){  
	            transaction.rollback();  
	        }
	    	e.printStackTrace();
			return null;
		}
		finally{
			HibernateSessionFactory.closeSession();
		}
	}

	@Override
	public List<Stationofline> queryStationoflinesInfo(int num) {
		Session session = null;
		List<Stationofline> stationOfLines = new ArrayList<Stationofline>();
		String sql = null;
		try {
			session = HibernateSessionFactory.getSession();
			sql = "from Stationofline";
			Query query = session.createQuery(sql);
			query.setMaxResults(num);
			stationOfLines = query.list();
			return stationOfLines;
		} catch (Exception e) {
	    	e.printStackTrace();
			return null;
		}
		finally{
			HibernateSessionFactory.closeSession();
		}
	}

	@Override
	public boolean updateStationoflineInfo(Stationofline stationOfLine) {
		Session session = null;
		Transaction transaction  = null;
		try {
			session = HibernateSessionFactory.getSession();
			transaction  = session.beginTransaction();
			session.update(stationOfLine);
			transaction.commit();
			return true;
		} catch (Exception e) {
	        if(transaction!=null){  
	            transaction.rollback();  
	        }
	    	e.printStackTrace();
			return false;
		}
		finally{
			HibernateSessionFactory.closeSession();
		}
	}

}
