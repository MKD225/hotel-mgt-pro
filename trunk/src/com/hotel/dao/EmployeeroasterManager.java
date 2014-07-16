package com.hotel.dao;


	import java.util.List;

	import org.hibernate.HibernateException;
	import org.hibernate.Session;

	import com.hotel.entity.Employeeroaster;
	import com.hotel.util.HibernateUtil;

	public class EmployeeroasterManager {

		public Employeeroaster saveOrUpdate(Employeeroaster employeeroaster) throws Exception{
			// TODO Auto-generated method stub
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();
			try {
				session.saveOrUpdate(employeeroaster);
				session.getTransaction().commit();
			} catch (HibernateException e) {
				e.printStackTrace();
				session.getTransaction().rollback();
				throw e;
			}
			return employeeroaster;
		}

		@SuppressWarnings("unchecked")
		public List<Employeeroaster> search() throws Exception {
			// TODO Auto-generated method stub
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();
			List<Employeeroaster> employeeroasters = null;
			try {
				employeeroasters = (List<Employeeroaster>) session.createQuery("from Employeeroaster").list();
			} catch (HibernateException e) {
				e.printStackTrace();
				session.getTransaction().rollback();
				throw e;
			}
			session.getTransaction().commit();
			return employeeroasters;
		}
		
		public Employeeroaster delete(Employeeroaster employeeroaster) {
			// TODO Auto-generated method stub
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();
			try {
				session.delete(employeeroaster);
				session.getTransaction().commit();
			} catch (HibernateException e) {
				e.printStackTrace();
				session.getTransaction().rollback();		}
			return employeeroaster;
		}
		
		public Employeeroaster getEmployeeroasterById(int id){
			System.out.println("in dao");
			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();
			System.out.println("**dao***");
			Employeeroaster employeeroaster= (Employeeroaster) session.get(Employeeroaster.class,id);
			System.out.println(employeeroaster.getRemarks());
			session.getTransaction().commit();
			return employeeroaster;
			
		}

	}

	

