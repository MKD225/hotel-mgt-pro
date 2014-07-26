package com.hotel.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;

import com.hotel.entity.Resevationtype;
import com.hotel.entity.Resevationtype;
import com.hotel.util.HibernateUtil;


public class ResevationtypeManager {

	public Resevationtype saveOrUpdate(Resevationtype resevationtype) throws Exception{
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		try {
			session.saveOrUpdate(resevationtype);
			session.getTransaction().commit();
		} catch (HibernateException e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			throw e;
		}
		return resevationtype;
	}

	@SuppressWarnings("unchecked")
	public List<Resevationtype> search() throws Exception {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		List<Resevationtype> resevationtypes = null;
		try {
			resevationtypes = (List<Resevationtype>) session.createQuery("from Resevationtype").list();
		} catch (HibernateException e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			throw e;
		}
		session.getTransaction().commit();
		return resevationtypes;
	}
	public Resevationtype delete(Resevationtype resevationtype) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		try {
			session.delete(resevationtype);
			session.getTransaction().commit();
		} catch (HibernateException e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			throw e;
		}
		return resevationtype;
	}
	
	public Resevationtype getResevationtypeById(int id){
		System.out.println("in dao");
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		System.out.println("**dao***");
		Resevationtype resevationtype= (Resevationtype) session.get(Resevationtype.class,id);
		System.out.println(resevationtype.getReservationTypeName()+"this is resevationtype number");
		session.getTransaction().commit();
		return resevationtype;
		
	}

}
