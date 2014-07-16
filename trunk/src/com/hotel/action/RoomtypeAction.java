package com.hotel.action;

import java.util.List;

import com.hotel.dao.RoomtypeManager;
import com.hotel.entity.Roomtype;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class RoomtypeAction extends ActionSupport implements ModelDriven {
	
	private static final long serialVersionUID = 1L;
	private Roomtype roomtype;
	private List<Roomtype> roomtypes;

	public RoomtypeAction() {
		super();
		this.roomtype = new Roomtype();
	}

	public String search() {
		try {
			this.roomtypes = new RoomtypeManager().search();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public String addOrUpdate() {
		try {
			System.out.println(roomtype.getRoomTypeName());
			this.roomtype = new RoomtypeManager().saveOrUpdate(this.roomtype);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}
	public String delete(){
		try {
			new RoomtypeManager().delete(this.roomtype);
		} catch (Exception e) {
			e.printStackTrace();
			//error bean
		}
		return SUCCESS;
	}

	@Override
	public Object getModel() {
		// TODO Auto-generated method stub
		return this.roomtype;
	}

	public Roomtype  getRoomtype() {
		return roomtype;
	}

	public void setResevationtype(Roomtype roomtype) {
		this.roomtype = roomtype;
	}

	public List<Roomtype> getRoomtypes() {
		return roomtypes;
	}

	public void setRoomtypes(List<Roomtype> roomtypes) {
		this.roomtypes = roomtypes;
	}


}
