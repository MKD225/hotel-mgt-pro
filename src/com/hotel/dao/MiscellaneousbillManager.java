package com.hotel.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;

import com.hotel.entity.Miscellaneousbill;
import com.hotel.util.HibernateUtil;

public class MiscellaneousbillManager {

	public Miscellaneousbill saveOrUpdate(Miscellaneousbill miscellaneousbill) throws Exception{
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		try {
			session.saveOrUpdate(miscellaneousbill);
			session.getTransaction().commit();
		} catch (HibernateException e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			throw e;
		}
		return miscellaneousbill;
	}

	@SuppressWarnings("unchecked")
	public List<Miscellaneousbill> search() throws Exception {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		List<Miscellaneousbill> miscellaneousbills = null;
		try {
			miscellaneousbills = (List<Miscellaneousbill>) session.createQuery("from Miscellaneousbill").list();
		} catch (HibernateException e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			throw e;
		}
		session.getTransaction().commit();
		return miscellaneousbills;
	}
	
	public Miscellaneousbill delete(Miscellaneousbill miscellaneousbill) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		try {
			session.delete(miscellaneousbill);
			session.getTransaction().commit();
		} catch (HibernateException e) {
			e.printStackTrace();
			session.getTransaction().rollback();		}
		return miscellaneousbill;
	}

	
	
}
