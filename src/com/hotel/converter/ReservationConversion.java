package com.hotel.converter;

import java.util.Map;

import org.apache.struts2.util.StrutsTypeConverter;

import com.hotel.dao.ReservationManager;
import com.hotel.entity.Reservation;

public class ReservationConversion extends StrutsTypeConverter {

	@SuppressWarnings("rawtypes")
	@Override
	public Object convertFromString(Map arg0, String[] arg1, Class arg2) {
		// TODO Auto-generated method stub
		System.out.println("in room conversion"+ "*****************************");
		Reservation reservation = new ReservationManager().getReservationById(Integer.parseInt(arg1[0]));
		System.out.println(reservation.getReservedFirstName()+ "*****************************");
		return reservation;
	}

	@SuppressWarnings("rawtypes")
	@Override
	public String convertToString(Map arg0, Object arg1) {
		// TODO Auto-generated method stub
		return null;
	}
	
}

