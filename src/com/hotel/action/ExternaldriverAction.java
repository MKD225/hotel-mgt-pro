package com.hotel.action;

import java.util.List;

import com.hotel.dao.ExternaldriverManager;
import com.hotel.entity.Externaldriver;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@SuppressWarnings("rawtypes")
public class ExternaldriverAction extends ActionSupport implements ModelDriven {

	private static final long serialVersionUID = 1L;
	private Externaldriver externaldriver;
	private List<Externaldriver> externaldrivers;

	public ExternaldriverAction() {
		super();
		this.externaldriver = new Externaldriver();
	}

	public String search() {
		try {
			this.externaldrivers = new ExternaldriverManager().search();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public String addOrUpdate() {
		System.out.println("********roomType+++++++++++");
		try {
			System.out.println(externaldriver.getName());
			this.externaldriver = new ExternaldriverManager().saveOrUpdate(this.externaldriver);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}
	public String delete(){
		try {
			new ExternaldriverManager().delete(externaldriver);
		} catch (Exception e) {
			e.printStackTrace();
			//error bean
		}
		return SUCCESS;
	}

	@Override
	public Object getModel() {
		// TODO Auto-generated method stub
		return this.externaldriver;
	}

	public Externaldriver getExternaldriver() {
		return externaldriver;
	}

	public void setExternaldriver(Externaldriver externaldriver) {
		this.externaldriver = externaldriver;
	}

	public List<Externaldriver> getExternaldrivers() {
		return externaldrivers;
	}

	public void setExternaldrivers(List<Externaldriver> externaldrivers) {
		this.externaldrivers = externaldrivers;
	}

}
