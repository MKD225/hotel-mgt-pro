package com.hotel.action;

import java.util.List;

import com.hotel.dao. CreditCardTypeManager;
import com.hotel.entity. CreditCardType;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@SuppressWarnings("rawtypes")
public class CreditCardTypeAction extends ActionSupport implements ModelDriven {
	
	private static final long serialVersionUID = 1L;
	private  CreditCardType  creditCardType;
	private List< CreditCardType>  creditCardTypes;

	public CreditCardTypeAction() {
		super();
		this. creditCardType = new  CreditCardType();
	}

	public String search() {
		System.out.println("+++++++++++");
		try {
			this.creditCardTypes = new CreditCardTypeManager().search();
			System.out.println("+++++++++++");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public String addOrUpdate() {
		try {
			System.out.println( creditCardType.getCreditCardType());
			this. creditCardType = new  CreditCardTypeManager().saveOrUpdate(this. creditCardType);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}
	public String delete(){
		try {
			new  CreditCardTypeManager().delete(this. creditCardType);
		} catch (Exception e) {
			e.printStackTrace();
			//error bean
		}
		return SUCCESS;
	}

	@Override
	public Object getModel() {
		// TODO Auto-generated method stub
		return this. creditCardType;
	}

	public CreditCardType getCreditCardType() {
		return creditCardType;
	}

	public void setCreditCardType(CreditCardType creditCardType) {
		this.creditCardType = creditCardType;
	}

	public List<CreditCardType> getCreditCardTypes() {
		return creditCardTypes;
	}

	public void setCreditCardTypes(List<CreditCardType> creditCardTypes) {
		this.creditCardTypes = creditCardTypes;
	}

	


}
