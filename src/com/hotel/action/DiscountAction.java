package com.hotel.action;

import java.util.List;

import com.hotel.dao.DiscountManager;
import com.hotel.entity.Discount;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;


@SuppressWarnings("rawtypes")
public class DiscountAction extends ActionSupport implements ModelDriven {

	private static final long serialVersionUID = 1L;
	private Discount discount;
	private List<Discount> discounts;

	public DiscountAction() {
		super();
		this.discount = new Discount();
	}

	public String search() {
		try {
			this.discounts = new DiscountManager().search();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public String addOrUpdate() {
		try {
			System.out.println(discount.getRoompercentage());
			this.discount = new DiscountManager().saveOrUpdate(this.discount);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}
	public String delete(){
		try {
			new DiscountManager().delete(this.discount);
		} catch (Exception e) {
			e.printStackTrace();
			//error bean
		}
		return SUCCESS;
	}

	@Override
	public Object getModel() {
		// TODO Auto-generated method stub
		return this.discount;
	}

	public Discount getDiscount() {
		return discount;
	}

	public void setDiscount(Discount discount) {
		this.discount = discount;
	}

	public List<Discount> getDiscounts() {
		return discounts;
	}

	public void setDiscounts(List<Discount> discounts) {
		this.discounts = discounts;
	}

}
