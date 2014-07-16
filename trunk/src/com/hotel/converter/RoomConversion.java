package com.hotel.converter;

import java.util.Map;

import org.apache.struts2.util.StrutsTypeConverter;

import com.hotel.dao.RoomManager;
import com.hotel.entity.Room;

public class RoomConversion extends StrutsTypeConverter {

	@SuppressWarnings("rawtypes")
	@Override
	public Object convertFromString(Map arg0, String[] arg1, Class arg2) {
		// TODO Auto-generated method stub
		System.out.println("in room conversion"
				+ "*****************************");
		Room room = new RoomManager().getRoomById(Integer.parseInt(arg1[0]));
		System.out.println(room.getTephoneNumber()
				+ "*****************************");
		return room;
	}

	@SuppressWarnings("rawtypes")
	@Override
	public String convertToString(Map arg0, Object arg1) {
		// TODO Auto-generated method stub
		return null;
	}

}
