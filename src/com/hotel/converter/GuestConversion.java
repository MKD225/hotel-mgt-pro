package com.hotel.converter;

import java.util.Map;
import org.apache.struts2.util.StrutsTypeConverter;

import com.hotel.dao.GuestManager;
import com.hotel.dao.SpouseManager;
import com.hotel.entity.Guest;
import com.hotel.entity.Spouse;

public class GuestConversion extends StrutsTypeConverter {
	
	@SuppressWarnings("rawtypes")
	@Override
	public Object convertFromString(Map arg0, String[] arg1, Class arg2) {
		// TODO Auto-generated method stub
		Guest guest = new GuestManager().getGuestById(Integer.parseInt(arg1[0]));
		System.out.println(guest.getCountry()+"*****************************");
		return guest;
	}

	@SuppressWarnings("rawtypes")
	@Override
	public String convertToString(Map arg0, Object arg1) {
		// TODO Auto-generated method stub
		return null;
	}

}
