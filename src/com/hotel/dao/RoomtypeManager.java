package com.hotel.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;

import com.hotel.entity.Room;
import com.hotel.entity.Roomtype;
import com.hotel.util.HibernateUtil;


public class RoomtypeManager {

	public Roomtype saveOrUpdate(Roomtype roomtype) throws Exception{
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		try {
			session.saveOrUpdate(roomtype);
			session.getTransaction().commit();
		} catch (HibernateException e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			throw e;
		}
		return roomtype;
	}

	@SuppressWarnings("unchecked")
	public List<Roomtype> search() throws Exception {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		List<Roomtype> roomtypes = null;
		try {
			roomtypes = (List<Roomtype>) session.createQuery("from Roomtype").list();
		} catch (HibernateException e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			throw e;
		}
		session.getTransaction().commit();
		return roomtypes;
	}
	public Roomtype delete(Roomtype roomtype) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		try {
			session.delete(roomtype);
			session.getTransaction().commit();
		} catch (HibernateException e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			throw e;
		}
		return roomtype;
	}

	public Roomtype getRoomById(int id){
	Session session = HibernateUtil.getSessionFactory().getCurrentSession();
	session.beginTransaction();
	Roomtype roomtype = (Roomtype) session.get(Room.class,id);
	session.getTransaction().commit();
	return roomtype;
		
	}
}
