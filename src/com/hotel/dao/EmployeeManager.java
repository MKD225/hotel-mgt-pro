package com.hotel.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;

import com.hotel.entity.Employee;
import com.hotel.entity.Employee;
import com.hotel.entity.Menu;
import com.hotel.util.HibernateUtil;

public class EmployeeManager {

	public Employee saveOrUpdate(Employee employee) throws Exception{
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		try {
			session.saveOrUpdate(employee);
			session.getTransaction().commit();
		} catch (HibernateException e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			throw e;
		}
		return employee;
	}

	@SuppressWarnings("unchecked")
	public List<Employee> search() throws Exception {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		List<Employee> employees = null;
		try {
			employees = (List<Employee>) session.createQuery("from Employee").list();
		} catch (HibernateException e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			throw e;
		}
		session.getTransaction().commit();
		return employees;
	}
	
	public Employee delete(Employee employee) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		try {
			session.delete(employee);
			session.getTransaction().commit();
		} catch (HibernateException e) {
			e.printStackTrace();
			session.getTransaction().rollback();		}
		return employee;
	}
	
	public Employee getEmployeeById(int id){
		System.out.println("in dao");
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		System.out.println("**dao***");
		Employee employee= (Employee) session.get(Employee.class,id);
		System.out.println(employee.getFirstName());
		session.getTransaction().commit();
		return employee;
		
	}

}
