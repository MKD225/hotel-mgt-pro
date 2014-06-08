package com.hotel.action;

import java.util.List;

import com.hotel.dao.SpouseManager;
import com.hotel.entity.Spouse;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@SuppressWarnings("rawtypes")
public class SpouseAction extends ActionSupport implements ModelDriven {

	private static final long serialVersionUID = 1L;
	private Spouse spouse;
	private List<Spouse> spouses;

	public SpouseAction() {
		super();
		this.spouse = new Spouse();
	}

	public String search() {
		try {
			this.spouses = new SpouseManager().search();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public String addOrUpdate() {
		try {
			System.out.println(spouse.getFirstName());
			this.spouse = new SpouseManager().saveOrUpdate(this.spouse);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	@Override
	public Object getModel() {
		// TODO Auto-generated method stub
		return this.spouse;
	}

	public Spouse getSpouse() {
		return spouse;
	}

	public void setSpouse(Spouse spouse) {
		this.spouse = spouse;
	}

	public List<Spouse> getSpouses() {
		return spouses;
	}

	public void setSpouses(List<Spouse> spouses) {
		this.spouses = spouses;
	}

}
