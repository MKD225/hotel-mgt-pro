package com.hotel.action;

import java.util.List;

import com.hotel.dao.ResevationtypeManager;
import com.hotel.entity.Resevationtype;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@SuppressWarnings("rawtypes")
public class ResevationtypeAction extends ActionSupport implements ModelDriven {

	private static final long serialVersionUID = 1L;
	private Resevationtype resevationtype;
	private List<Resevationtype> resevationtypes;

	public ResevationtypeAction() {
		super();
		this.resevationtype = new Resevationtype();
	}

	public String search() {
		try {
			this.resevationtypes = new ResevationtypeManager().search();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public String addOrUpdate() {
		try {
			System.out.println(resevationtype.getReservationTypeName());
			this.resevationtype = new ResevationtypeManager().saveOrUpdate(this.resevationtype);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}
	public String delete(){
		try {
			new ResevationtypeManager().delete(this.resevationtype);
		} catch (Exception e) {
			e.printStackTrace();
			//error bean
		}
		return SUCCESS;
	}

	@Override
	public Object getModel() {
		// TODO Auto-generated method stub
		return this.resevationtype;
	}

	public Resevationtype getResevationtype() {
		return resevationtype;
	}

	public void setResevationtype(Resevationtype resevationtype) {
		this.resevationtype = resevationtype;
	}

	public List<Resevationtype> getResevationtypes() {
		return resevationtypes;
	}

	public void setResevationtypes(List<Resevationtype> resevationtypes) {
		this.resevationtypes = resevationtypes;
	}

}
