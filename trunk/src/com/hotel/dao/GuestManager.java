package com.hotel.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;

import com.hotel.entity.Guest;
import com.hotel.entity.Spouse;
import com.hotel.util.HibernateUtil;

public class GuestManager {

	public Guest saveOrUpdate(Guest guest) throws Exception{
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		try {
			session.saveOrUpdate(guest);
			session.getTransaction().commit();
		} catch (HibernateException e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			throw e;
		}
		return guest;
	}

	@SuppressWarnings("unchecked")
	public List<Guest> search() throws Exception {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		List<Guest> guests = null;
		try {
			guests = (List<Guest>) session.createQuery("from Guest").list();
		} catch (HibernateException e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			throw e;
		}
		session.getTransaction().commit();
		return guests;
	}
	
	public Guest delete(Guest guest){
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		try {
			session.delete(guest);
			session.getTransaction().commit();
		} catch (HibernateException e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			throw e;
		}
		return guest;	
		
	}

	public Guest getGuestById(int id){
		System.out.println("in dao");
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		System.out.println("**dao***");
		Guest guest= (Guest) session.get(Guest.class,id);
		System.out.println(guest.getCountry());
		session.getTransaction().commit();
		return guest;
		
	}
}
