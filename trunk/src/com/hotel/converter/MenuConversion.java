package com.hotel.converter;

import java.util.Map;

import org.apache.struts2.util.StrutsTypeConverter;

import com.hotel.dao.MenuManager;
import com.hotel.entity.Menu;

public class MenuConversion extends StrutsTypeConverter {
	
	@SuppressWarnings("rawtypes")
	@Override
	public Object convertFromString(Map arg0, String[] arg1, Class arg2) {
		// TODO Auto-generated method stub
		Menu menu = new MenuManager().getMenuById(Integer.parseInt(arg1[0]));
		System.out.println(menu.getAction()+"*****************************");
		return menu;
	}

	@SuppressWarnings("rawtypes")
	@Override
	public String convertToString(Map arg0, Object arg1) {
		// TODO Auto-generated method stub
		return null;
	}

}
