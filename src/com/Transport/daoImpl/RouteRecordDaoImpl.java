package com.Transport.daoImpl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.Transport.bean.Routerecord;
import com.Transport.bean.Routerecord;
import com.Transport.dao.RouteRecordDao;
import com.Transport.util.HibernateSessionFactory;

public class RouteRecordDaoImpl implements RouteRecordDao {

	@Override
	public boolean addRouterecordInfo(Routerecord routeRecord) {
		Session session = null;
		Transaction transaction  = null;
		try {
			session = HibernateSessionFactory.getSession();
			transaction  = session.beginTransaction();
			session.save(routeRecord);
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
	public boolean deleteRouterecordInfo(int routeRecordId) {
		Session session = null;
		Transaction transaction  = null;
		try {
			session = HibernateSessionFactory.getSession();
			transaction  = session.beginTransaction();
			Routerecord routeRecord = (Routerecord) session.get(Routerecord.class, routeRecordId);
			session.delete(routeRecord);
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
	public Routerecord queryOneRouterecordInfo(int routeRecordId) {
		Session session = null;
		Transaction transaction  = null;
		try {
			session = HibernateSessionFactory.getSession();
			transaction  = session.beginTransaction();
			Routerecord routeRecord = (Routerecord) session.get(Routerecord.class, routeRecordId);
			transaction.commit();
			return routeRecord;
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
	public List<Routerecord> queryRouterecordsInfo(int num) {
		Session session = null;
		List<Routerecord> routeRecords = new ArrayList<Routerecord>();
		String sql = null;
		try {
			session = HibernateSessionFactory.getSession();
			sql = "from Routerecord";
			Query query = session.createQuery(sql);
			query.setMaxResults(num);
			routeRecords = query.list();
			return routeRecords;
		} catch (Exception e) {
	    	e.printStackTrace();
			return null;
		}
		finally{
			HibernateSessionFactory.closeSession();
		}
	}

	@Override
	public boolean updateRouterecordInfo(Routerecord routeRecord) {
		Session session = null;
		Transaction transaction  = null;
		try {
			session = HibernateSessionFactory.getSession();
			transaction  = session.beginTransaction();
			session.update(routeRecord);
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
