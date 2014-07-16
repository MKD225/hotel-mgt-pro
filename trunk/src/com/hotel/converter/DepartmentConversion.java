package com.hotel.converter;

import java.util.Map;

import org.apache.struts2.util.StrutsTypeConverter;

import com.hotel.dao.DepartmentManager;
import com.hotel.entity.Department;

public class DepartmentConversion extends StrutsTypeConverter {

	@SuppressWarnings("rawtypes")
	@Override
	public Object convertFromString(Map arg0, String[] arg1, Class arg2) {
		// TODO Auto-generated method stub
		Department department = new DepartmentManager().getDepartmentById(Integer.parseInt(arg1[0]));
		System.out.println(department.getDepartmentName()+"*****************************");
		return department;
	}

	@SuppressWarnings("rawtypes")
	@Override
	public String convertToString(Map arg0, Object arg1) {
		// TODO Auto-generated method stub
		return null;
	}

}
