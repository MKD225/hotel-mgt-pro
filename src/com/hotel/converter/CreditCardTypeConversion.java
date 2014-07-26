package com.hotel.converter;

import java.util.Map;

import org.apache.struts2.util.StrutsTypeConverter;

import com.hotel.dao.CreditCardTypeManager;
import com.hotel.entity.CreditCardType;

public class CreditCardTypeConversion extends StrutsTypeConverter{

	@SuppressWarnings("rawtypes")
	@Override
	public Object convertFromString(Map arg0, String[] arg1, Class arg2) {
		// TODO Auto-generated method stub
		CreditCardType creditCardType = new CreditCardTypeManager().getCreditCardTypeById(Integer.parseInt(arg1[0]));
		System.out.println(creditCardType.getCreditCardType()+"*****************************");
		return creditCardType;
	}

	@SuppressWarnings("rawtypes")
	@Override
	public String convertToString(Map arg0, Object arg1) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
