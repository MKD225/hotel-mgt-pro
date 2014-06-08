package com.hotel.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;

import com.hotel.entity.Agent;
import com.hotel.util.HibernateUtil;

public class AgentManager {

	public Agent saveOrUpdate(Agent agent) throws Exception{
		// TODO Auto-generated method stub
		System.out.println("********Insert************");
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		try {
			session.saveOrUpdate(agent);
			session.getTransaction().commit();
		} catch (HibernateException e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			throw e;
		}
		return agent;
	}

	@SuppressWarnings("unchecked")
	public List<Agent> search() throws Exception {
		System.out.println("********search************");
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		List<Agent> agents = null;
		try {
			agents = (List<Agent>) session.createQuery("from Agent").list();
		} catch (HibernateException e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			throw e;
		}
		session.getTransaction().commit();
		return agents;
	}

	public Agent delete(Agent agent){
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		try {
			session.delete(agent);
			session.getTransaction().commit();
		} catch (HibernateException e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			throw e;
		}
		return agent;
		
	}
}
