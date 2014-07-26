package com.hotel.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;

import com.hotel.entity.CreditCardType;
import com.hotel.util.HibernateUtil;

public class CreditCardTypeManager {
	
	public CreditCardType saveOrUpdate(CreditCardType creditCardType) throws Exception{
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		try {
			session.saveOrUpdate(creditCardType);
			session.getTransaction().commit();
		} catch (HibernateException e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			throw e;
		}
		return creditCardType;
	}

	@SuppressWarnings("unchecked")
	public List<CreditCardType> search() throws Exception {
		System.out.println("********search************");
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		List<CreditCardType> creditCardTypes = null;
		System.out.println("********search************1");
		try {
			creditCardTypes = (List<CreditCardType>) session.createQuery("from CreditCardType").list();
			System.out.println("********search************2");
		} catch (HibernateException e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			throw e;
		}
		session.getTransaction().commit();
		return creditCardTypes;
	}
	
	public CreditCardType delete(CreditCardType creditCardType) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		try {
			session.delete(creditCardType);
			session.getTransaction().commit();
		} catch (HibernateException e) {
			e.printStackTrace();
			session.getTransaction().rollback();		}
		return creditCardType;
	}

	public CreditCardType getCreditCardTypeById(int id){
		System.out.println("in dao");
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		System.out.println("**dao***");
		CreditCardType creditCardType= (CreditCardType) session.get(CreditCardType.class,id);
		System.out.println(creditCardType.getCreditCardType()+"this is creditCardType number");
		session.getTransaction().commit();
		return creditCardType;
		
	}

}
