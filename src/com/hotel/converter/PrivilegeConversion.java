package com.hotel.converter;

import java.util.Map;

import org.apache.struts2.util.StrutsTypeConverter;

import com.hotel.dao.PrivilegeManager;
import com.hotel.entity.Privilege;

public class PrivilegeConversion extends StrutsTypeConverter {

	@SuppressWarnings("rawtypes")
	@Override
	public Object convertFromString(Map arg0, String[] arg1, Class arg2) {
		// TODO Auto-generated method stub
		Privilege privilege = new PrivilegeManager().getPrivilegeById(Integer.parseInt(arg1[0]));
		System.out.println(privilege.getPrivilegeType()+"*****************************");
		return privilege;
	}

	@SuppressWarnings("rawtypes")
	@Override
	public String convertToString(Map arg0, Object arg1) {
		// TODO Auto-generated method stub
		return null;
	}
}
