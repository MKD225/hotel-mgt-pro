package com.hotel.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;

import com.hotel.entity.Department;
import com.hotel.entity.Privilege;
import com.hotel.util.HibernateUtil;

public class PrivilegeManager {

	public Privilege saveOrUpdate(Privilege privilege) throws Exception{
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		try {
			session.saveOrUpdate(privilege);
			session.getTransaction().commit();
		} catch (HibernateException e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			throw e;
		}
		return privilege;
	}

	@SuppressWarnings("unchecked")
	public List<Privilege> search() throws Exception {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		List<Privilege> privileges = null;
		try {
			privileges = (List<Privilege>) session.createQuery("from Privilege").list();
		} catch (HibernateException e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			throw e;
		}
		session.getTransaction().commit();
		return privileges;
	}
	
	public Privilege delete(Privilege privilege) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		try {
			session.delete(privilege);
			session.getTransaction().commit();
		} catch (HibernateException e) {
			e.printStackTrace();
			session.getTransaction().rollback();		}
		return privilege;
	}
	
	public Privilege getPrivilegeById(int id){
		System.out.println("in dao");
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		System.out.println("**privilage***dao***");
		Privilege privilege= (Privilege) session.get(Privilege.class,id);
		System.out.println(privilege.getPrivilegeType());
		session.getTransaction().commit();
		return privilege;
		
	}


}
