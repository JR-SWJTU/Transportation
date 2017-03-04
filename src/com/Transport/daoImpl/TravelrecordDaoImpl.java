package com.Transport.daoImpl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.Transport.bean.Travelrecord;
import com.Transport.bean.Travelrecord;
import com.Transport.dao.TravelrecordDao;
import com.Transport.util.HibernateSessionFactory;

public class TravelrecordDaoImpl implements TravelrecordDao {

	@Override
	public boolean addTravelrecordInfo(Travelrecord travelRecord) {
		Session session = null;
		Transaction transaction  = null;
		try {
			session = HibernateSessionFactory.getSession();
			transaction  = session.beginTransaction();
			session.save(travelRecord);
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
	public boolean deleteTravelrecordInfo(int travelRecordId) {
		Session session = null;
		Transaction transaction  = null;
		try {
			session = HibernateSessionFactory.getSession();
			transaction  = session.beginTransaction();
			Travelrecord travelRecord = (Travelrecord) session.get(Travelrecord.class, travelRecordId);
			session.delete(travelRecord);
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
	public Travelrecord queryOneTravelrecordInfo(int travelRecordId) {
		Session session = null;
		Transaction transaction  = null;
		try {
			session = HibernateSessionFactory.getSession();
			transaction  = session.beginTransaction();
			Travelrecord travelRecord = (Travelrecord) session.get(Travelrecord.class, travelRecordId);
			transaction.commit();
			return travelRecord;
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
	public List<Travelrecord> queryTravelrecordsInfo(int page , int num) {
		Session session = null;
		List<Travelrecord> travelRecords = new ArrayList<Travelrecord>();
		String sql = null;
		try {
			session = HibernateSessionFactory.getSession();
			sql = "from Travelrecord order by desbusTime desc";
			Query query = session.createQuery(sql);
			query.setFirstResult( (page - 1) * num);
			query.setMaxResults( page * num);
			travelRecords = query.list();
			return travelRecords;
		} catch (Exception e) {
	    	e.printStackTrace();
			return null;
		}
		finally{
			HibernateSessionFactory.closeSession();
		}
	}

	@Override
	public boolean updateTravelrecordInfo(Travelrecord travelRecord) {
		Session session = null;
		Transaction transaction  = null;
		try {
			session = HibernateSessionFactory.getSession();
			transaction  = session.beginTransaction();
			session.update(travelRecord);
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
