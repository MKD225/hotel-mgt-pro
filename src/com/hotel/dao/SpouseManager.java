package com.hotel.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;

import com.hotel.entity.Department;
import com.hotel.entity.Spouse;
import com.hotel.entity.Spouse;
import com.hotel.util.HibernateUtil;

public class SpouseManager {

	public Spouse saveOrUpdate(Spouse spouse) throws Exception{
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		try {
			session.saveOrUpdate(spouse);
			session.getTransaction().commit();
		} catch (HibernateException e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			throw e;
		}
		return spouse;
	}

	@SuppressWarnings("unchecked")
	public List<Spouse> search() throws Exception {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		List<Spouse> spouses = null;
		try {
			spouses = (List<Spouse>) session.createQuery("from Spouse").list();
		} catch (HibernateException e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			throw e;
		}
		session.getTransaction().commit();
		return spouses;
	}
	
	public Spouse delete(Spouse spouse) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		try {
			session.delete(spouse);
			session.getTransaction().commit();
		} catch (HibernateException e) {
			e.printStackTrace();
			session.getTransaction().rollback();		}
		return spouse;
	}

	
	public Spouse getSpouseById(int id){
		System.out.println("in dao");
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		System.out.println("**dao***");
		Spouse spouse= (Spouse) session.get(Spouse.class,id);
		System.out.println(spouse.getCountry());
		session.getTransaction().commit();
		return spouse;
		
	}

}
