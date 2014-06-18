package com.hotel.dao;

	import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;

import com.hotel.entity.Shift;
import com.hotel.util.HibernateUtil;

public class ShiftManager {

	

	

		public Shift saveOrUpdate(Shift shift) throws Exception{
			// TODO Auto-generated method stub
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();
			try {
				session.saveOrUpdate(shift);
				session.getTransaction().commit();
			} catch (HibernateException e) {
				e.printStackTrace();
				session.getTransaction().rollback();
				throw e;
			}
			return shift;
		}

		@SuppressWarnings("unchecked")
		public List<Shift> search() throws Exception {
			// TODO Auto-generated method stub
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();
			List<Shift> shifts = null;
			try {
				shifts = (List<Shift>) session.createQuery("from Shift").list();
			} catch (HibernateException e) {
				e.printStackTrace();
				session.getTransaction().rollback();
				throw e;
			}
			session.getTransaction().commit();
			return shifts;
		}
		public Shift delete(Shift shift) {
			// TODO Auto-generated method stub
			
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();
			try {
				System.out.print("------delete manager***************");
				session.delete(shift);
				session.getTransaction().commit();
			} catch (HibernateException e) {
				e.printStackTrace();
				session.getTransaction().rollback();
				throw e;
			}
			return shift;
		}

		
	}


