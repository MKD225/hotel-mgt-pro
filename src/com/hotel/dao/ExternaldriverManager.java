package com.hotel.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;

import com.hotel.entity.Externaldriver;
import com.hotel.util.HibernateUtil;

public class ExternaldriverManager {

	public Externaldriver saveOrUpdate(Externaldriver externaldriver) throws Exception{
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		try {
			session.saveOrUpdate(externaldriver);
			session.getTransaction().commit();
		} catch (HibernateException e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			throw e;
		}
		return externaldriver;
	}

	@SuppressWarnings("unchecked")
	public List<Externaldriver> search() throws Exception {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		List<Externaldriver> externaldrivers = null;
		try {
			externaldrivers = (List<Externaldriver>) session.createQuery("from Externaldriver").list();
		} catch (HibernateException e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			throw e;
		}
		session.getTransaction().commit();
		return externaldrivers;
	}
	public Externaldriver delete(Externaldriver externaldriver) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		try {
			session.delete(externaldriver);
			session.getTransaction().commit();
		} catch (HibernateException e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			throw e;
		}
		return externaldriver;
	}
	
	public Externaldriver getExternaldriverById(int id){
		System.out.println("in dao");
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		System.out.println("**dao***");
		Externaldriver externaldriver= (Externaldriver) session.get(Externaldriver.class,id);
		System.out.println(externaldriver.getName()+"this is externaldriver number");
		session.getTransaction().commit();
		return externaldriver;
		
	}

	
}
