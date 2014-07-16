package com.hotel.converter;

import java.util.Map;

import org.apache.struts2.util.StrutsTypeConverter;

import com.hotel.dao.ShiftManager;
import com.hotel.entity.Shift;

public class ShiftConversion extends StrutsTypeConverter {
	
	@SuppressWarnings("rawtypes")
	@Override
	public Object convertFromString(Map arg0, String[] arg1, Class arg2) {
		// TODO Auto-generated method stub
		Shift shift = new ShiftManager().getShiftById(Integer.parseInt(arg1[0]));
		System.out.println(shift.getShiftName()+"*****************************");
		return shift;
	}

	@SuppressWarnings("rawtypes")
	@Override
	public String convertToString(Map arg0, Object arg1) {
		// TODO Auto-generated method stub
		return null;
	}

}
