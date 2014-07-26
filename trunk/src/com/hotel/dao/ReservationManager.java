package com.hotel.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;

import com.hotel.entity.Reservation;
import com.hotel.util.HibernateUtil;

public class ReservationManager {
	
	public Reservation saveOrUpdate(Reservation reservation) throws Exception{
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		try {
			session.saveOrUpdate(reservation);
			session.getTransaction().commit();
		} catch (HibernateException e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			throw e;
		}
		return reservation;
	}

	@SuppressWarnings("unchecked")
	public List<Reservation> search() throws Exception {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		List<Reservation> reservations = null;
		try {
			reservations = (List<Reservation>) session.createQuery("from Reservation").list();
		} catch (HibernateException e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			throw e;
		}
		session.getTransaction().commit();
		return reservations;
	}
	
	public Reservation delete(Reservation reservation) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		try {
			session.delete(reservation);
			session.getTransaction().commit();
		} catch (HibernateException e) {
			e.printStackTrace();
			session.getTransaction().rollback();		}
		return reservation;
	}

	public Reservation getReservationById(int id){
		System.out.println("in dao");
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		System.out.println("**dao***");
		Reservation reservation= (Reservation) session.get(Reservation.class,id);
		System.out.println(reservation.getReservedFirstName()+"this is reservation number");
		session.getTransaction().commit();
		return reservation;
		
	}
}
