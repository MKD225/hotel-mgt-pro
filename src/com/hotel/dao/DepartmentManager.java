package com.hotel.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;

import com.hotel.entity.Department;
import com.hotel.entity.Menu;
import com.hotel.util.HibernateUtil;

public class DepartmentManager {
	public Department saveOrUpdate(Department department) throws Exception{
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		System.out.print("in department manager save");
		try {
			session.saveOrUpdate(department);
			session.getTransaction().commit();
		} catch (HibernateException e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			throw e;
		}
		return department;
	}

	@SuppressWarnings("unchecked")
	public List<Department> search() throws Exception {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		List<Department> departments = null;
		try {
			departments = (List<Department>) session.createQuery("from Department").list();
		} catch (HibernateException e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			throw e;
		}
		session.getTransaction().commit();
		return departments;
	}
	
	public Department delete(Department department) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		try {
			session.delete(department);
			session.getTransaction().commit();
		} catch (HibernateException e) {
			e.printStackTrace();
			session.getTransaction().rollback();		}
		return department;
	}

	public Department getDepartmentById(int id){
		System.out.println("in dao");
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		System.out.println("**dao***");
		Department department= (Department) session.get(Department.class,id);
		System.out.println(department.getDepartmentName());
		session.getTransaction().commit();
		return department;
		
	}

}
