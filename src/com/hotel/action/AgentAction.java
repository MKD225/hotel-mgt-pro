package com.hotel.action;

import java.util.List;

import com.hotel.dao.AgentManager;
import com.hotel.entity.Agent;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@SuppressWarnings("rawtypes")
public class AgentAction extends ActionSupport implements ModelDriven {

	private static final long serialVersionUID = 1L;
	private Agent agent;
	private List<Agent> agents;

	public AgentAction() {
		super();
		this.agent = new Agent();
	}

	public String search() {
		System.out.println("+++++++++++");
		try {
			this.agents = new AgentManager().search();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public String addOrUpdate() {
		System.out.println("********+++++++++++");
		try {
			System.out.println(agent.getFirstName());
			this.agent = new AgentManager().saveOrUpdate(this.agent);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public String delete(){
		System.out.println("********delete action************");
		try{
			new AgentManager().delete(this.agent);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return SUCCESS;
	}
	@Override
	public Object getModel() {
		// TODO Auto-generated method stub
		return this.agent;
	}

	public Agent getAgent() {
		return agent;
	}

	public void setAgent(Agent agent) {
		this.agent = agent;
	}

	public List<Agent> getAgents() {
		return agents;
	}

	public void setAgents(List<Agent> agents) {
		this.agents = agents;
	}

}
