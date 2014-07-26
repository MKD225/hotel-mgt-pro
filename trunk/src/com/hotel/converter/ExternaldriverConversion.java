package com.hotel.converter;

import java.util.Map;

import org.apache.struts2.util.StrutsTypeConverter;

import com.hotel.dao.ExternaldriverManager;
import com.hotel.entity.Externaldriver;

public class ExternaldriverConversion extends StrutsTypeConverter {

	@SuppressWarnings("rawtypes")
	@Override
	public Object convertFromString(Map arg0, String[] arg1, Class arg2) {
		// TODO Auto-generated method stub
		Externaldriver externaldriver = new ExternaldriverManager().getExternaldriverById(Integer.parseInt(arg1[0]));
		System.out.println(externaldriver.getName()+"*****************************");
		return externaldriver;
	}

	@SuppressWarnings("rawtypes")
	@Override
	public String convertToString(Map arg0, Object arg1) {
		// TODO Auto-generated method stub
		return null;
	}
}
