package com.hotel.converter;

import java.util.Map;

import org.apache.struts2.util.StrutsTypeConverter;

import com.hotel.dao.EmployeeManager;
import com.hotel.dao.MenuManager;
import com.hotel.entity.Employee;
import com.hotel.entity.Menu;


public class EmployeeConversion extends StrutsTypeConverter {
	
	
	@SuppressWarnings("rawtypes")
	@Override
	public Object convertFromString(Map arg0, String[] arg1, Class arg2) {
		// TODO Auto-generated method stub
		Employee employee = new EmployeeManager().getEmployeeById(Integer.parseInt(arg1[0]));
		System.out.println(employee.getFirstName()+"*****************************");
		return employee;
	}

	@SuppressWarnings("rawtypes")
	@Override
	public String convertToString(Map arg0, Object arg1) {
		// TODO Auto-generated method stub
		return null;
	}

}
