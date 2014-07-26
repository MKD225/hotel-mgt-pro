package com.hotel.converter;

import java.util.Map;

import org.apache.struts2.util.StrutsTypeConverter;

import com.hotel.dao.ResevationtypeManager;
import com.hotel.entity.Resevationtype;

public class ResevationtypeConversion extends StrutsTypeConverter {

	@SuppressWarnings("rawtypes")
	@Override
	public Object convertFromString(Map arg0, String[] arg1, Class arg2) {
		// TODO Auto-generated method stub
		Resevationtype resevationtype = new ResevationtypeManager().getResevationtypeById(Integer.parseInt(arg1[0]));
		System.out.println(resevationtype.getReservationTypeName()+"*****************************");
		return resevationtype;
	}

	@SuppressWarnings("rawtypes")
	@Override
	public String convertToString(Map arg0, Object arg1) {
		// TODO Auto-generated method stub
		return null;
	}
}
