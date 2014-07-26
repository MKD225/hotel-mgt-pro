package com.hotel.converter;

import java.util.Map;

import org.apache.struts2.util.StrutsTypeConverter;

import com.hotel.dao.AgentManager;
import com.hotel.entity.Agent;

public class AgentConversion extends StrutsTypeConverter {

	@SuppressWarnings("rawtypes")
	@Override
	public Object convertFromString(Map arg0, String[] arg1, Class arg2) {
		// TODO Auto-generated method stub
		Agent agent = new AgentManager().getAgentById(Integer.parseInt(arg1[0]));
		System.out.println(agent.getFirstName()+"*****************************");
		return agent;
	}

	@SuppressWarnings("rawtypes")
	@Override
	public String convertToString(Map arg0, Object arg1) {
		// TODO Auto-generated method stub
		return null;
	}
}
