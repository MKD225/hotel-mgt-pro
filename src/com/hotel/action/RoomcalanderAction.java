package com.hotel.action;

import java.util.List;

import com.hotel.converter.RoomConversion;
import com.hotel.dao.RoomcalanderManager;
import com.hotel.entity.Room;
import com.hotel.entity.Roomcalander;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@SuppressWarnings("rawtypes")
public class RoomcalanderAction extends ActionSupport implements ModelDriven {

	private static final long serialVersionUID = 1L;
	private Roomcalander roomcalander;
	private List<Roomcalander> roomcalanders;
	private Room roomConvert;

	public RoomcalanderAction() {
		super();
		this.roomcalander = new Roomcalander();
	}

	public String search() {
		try {
			this.roomcalanders = new RoomcalanderManager().search();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public String addOrUpdate() {
		try {
			System.out.println("*****in calander add");
			System.out.println(roomcalander.getStartDateTime());
			this.roomcalander.setRoom(roomConvert);
			this.roomcalander = new RoomcalanderManager().saveOrUpdate(this.roomcalander);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	public String delete(){
		try {
			new RoomcalanderManager().delete(this.roomcalander);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	@Override
	public Object getModel() {
		// TODO Auto-generated method stub
		return this.roomcalander;
	}

	public Roomcalander getRoomcalander() {
		return roomcalander;
	}

	public void setRoomcalander(Roomcalander roomcalander) {
		this.roomcalander = roomcalander;
	}

	public List<Roomcalander> getRoomcalanders() {
		return roomcalanders;
	}

	public void setRoomcalanders(List<Roomcalander> roomcalanders) {
		this.roomcalanders = roomcalanders;
	}

	public Room getRoomConvert() {
		return roomConvert;
	}

	public void setRoomConvert(Room roomConvert) {
		this.roomConvert = roomConvert;
	}

}
