package com.hotel.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;

import com.hotel.entity.Menu;
import com.hotel.entity.Room;
import com.hotel.util.HibernateUtil;

public class RoomManager {

	public Room saveOrUpdate(Room room) throws Exception{
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		try {
			session.saveOrUpdate(room);
			session.getTransaction().commit();
		} catch (HibernateException e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			throw e;
		}
		return room;
	}

	@SuppressWarnings("unchecked")
	public List<Room> search() throws Exception {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		List<Room> rooms = null;
		try {
			rooms = (List<Room>) session.createQuery("from Room").list();
		} catch (HibernateException e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			throw e;
		}
		session.getTransaction().commit();
		return rooms;
	}
	
	public Room delete(Room room) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		try {
			session.delete(room);
			session.getTransaction().commit();
		} catch (HibernateException e) {
			e.printStackTrace();
			session.getTransaction().rollback();		}
		return room;
	}

	public Room getRoomById(int id){
		System.out.println("in dao");
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		System.out.println("**dao***");
		Room room= (Room) session.get(Room.class,id);
		System.out.println(room.getRoomNumber()+"this is room number");
		session.getTransaction().commit();
		return room;
		
	}
}
