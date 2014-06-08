package com.hotel.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;

import com.hotel.entity.Roomcalander;
import com.hotel.util.HibernateUtil;

public class RoomcalanderManager {

	public Roomcalander saveOrUpdate(Roomcalander roomcalander) throws Exception{
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		try {
			session.saveOrUpdate(roomcalander);
			session.getTransaction().commit();
		} catch (HibernateException e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			throw e;
		}
		return roomcalander;
	}

	@SuppressWarnings("unchecked")
	public List<Roomcalander> search() throws Exception {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		List<Roomcalander> roomcalanders = null;
		try {
			roomcalanders = (List<Roomcalander>) session.createQuery("from Roomcalander").list();
		} catch (HibernateException e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			throw e;
		}
		session.getTransaction().commit();
		return roomcalanders;
	}
	
	

}
