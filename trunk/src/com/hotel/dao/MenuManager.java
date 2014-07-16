package com.hotel.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;

import com.hotel.entity.Menu;
import com.hotel.entity.Room;
import com.hotel.util.HibernateUtil;

public class MenuManager {


	public Menu saveOrUpdate(Menu menu) throws Exception{
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		try {
			session.saveOrUpdate(menu);
			session.getTransaction().commit();
		} catch (HibernateException e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			throw e;
		}
		return menu;
	}

	@SuppressWarnings("unchecked")
	public List<Menu> search() throws Exception {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		List<Menu> menus = null;
		try {
			menus = (List<Menu>) session.createQuery("from Menu").list();
		} catch (HibernateException e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			throw e;
		}
		session.getTransaction().commit();
		return menus;
	}
	public Menu delete(Menu menu) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		try {
			session.delete(menu);
			session.getTransaction().commit();
		} catch (HibernateException e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			throw e;
		}
		return menu;
	}
	
	public Menu getMenuById(int id){
		System.out.println("in dao");
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		System.out.println("**dao***");
		Menu menu= (Menu) session.get(Menu.class,id);
		System.out.println(menu.getAction());
		session.getTransaction().commit();
		return menu;
		
	}
}

