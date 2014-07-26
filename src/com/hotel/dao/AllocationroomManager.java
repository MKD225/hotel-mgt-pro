package com.hotel.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;

import com.hotel.entity.Allocationroom;
import com.hotel.util.HibernateUtil;

public class AllocationroomManager {

	public Allocationroom saveOrUpdate(Allocationroom allocationroom) throws Exception{
		// TODO Auto-generated method stub
		System.out.println("********Insert************");
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		try {
			session.saveOrUpdate(allocationroom);
			session.getTransaction().commit();
		} catch (HibernateException e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			throw e;
		}
		return allocationroom;
	}

	@SuppressWarnings("unchecked")
	public List<Allocationroom> search() throws Exception {
		System.out.println("********search************");
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		List<Allocationroom> allocationrooms = null;
		try {
			allocationrooms = (List<Allocationroom>) session.createQuery("from Allocationroom").list();
		} catch (HibernateException e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			throw e;
		}
		session.getTransaction().commit();
		return allocationrooms;
	}

	public Allocationroom delete(Allocationroom allocationroom){
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		try {
			session.delete(allocationroom);
			session.getTransaction().commit();
		} catch (HibernateException e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			throw e;
		}
		return allocationroom;
		
	}
	
	public Allocationroom getAllocationroomById(int id){
		System.out.println("in dao");
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		System.out.println("**dao***");
		Allocationroom allocationroom= (Allocationroom) session.get(Allocationroom.class,id);
		System.out.println(allocationroom.getExtraBeds()+"this is allocationroom number");
		session.getTransaction().commit();
		return allocationroom;
		
	}
	
}
