package com.hotel.converter;

import java.util.Map;

import org.apache.struts2.util.StrutsTypeConverter;

import com.hotel.dao.RoomtypeManager;
import com.hotel.entity.Roomtype;

public class RoomtypeConversion extends StrutsTypeConverter {

	@SuppressWarnings("rawtypes")
	@Override
	public Object convertFromString(Map arg0, String[] arg1, Class arg2) {
		System.out.println("converter*****************************");
		Roomtype roomtype = new RoomtypeManager().getRoomtypeById(Integer.parseInt(arg1[0]));
		System.out.println(roomtype.getRoomTypeName()+"*****************************");
		return roomtype;
		
	}

	@SuppressWarnings("rawtypes")
	@Override
	public String convertToString(Map arg0, Object arg1) {
		// TODO Auto-generated method stub
		return null;
	}

}
