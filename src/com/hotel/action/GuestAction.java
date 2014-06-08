package com.hotel.action;

import java.util.List;

import com.hotel.dao.GuestManager;
import com.hotel.entity.Guest;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;


@SuppressWarnings("rawtypes")
public class GuestAction extends ActionSupport implements ModelDriven {

	private static final long serialVersionUID = 1L;
	private Guest guest;
	private List<Guest> guests;

	public GuestAction() {
		super();
		this.guest = new Guest();
	}

	public String search() {
		try {
			this.guests = new GuestManager().search();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public String addOrUpdate() {
		try {
			System.out.println(guest.getAnniversary());
			this.guest = new GuestManager().saveOrUpdate(this.guest);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}
	public String delete(){
		try {
			new GuestManager().delete(guest);
		} catch (Exception e) {
			e.printStackTrace();
			//error bean
		}
		return SUCCESS;
	}

	@Override
	public Object getModel() {
		// TODO Auto-generated method stub
		return this.guest;
	}

	public Guest getGuest() {
		return guest;
	}

	public void setGuest(Guest guest) {
		this.guest = guest;
	}

	public List<Guest> getGuests() {
		return guests;
	}

	public void setGuests(List<Guest> guests) {
		this.guests = guests;
	}

}
