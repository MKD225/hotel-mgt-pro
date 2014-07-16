package com.hotel.action;

import java.util.List;

import com.hotel.dao.RoomManager;
import com.hotel.entity.Room;
import com.hotel.entity.Roomtype;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@SuppressWarnings("rawtypes")
public class RoomAction extends ActionSupport implements ModelDriven {

	private static final long serialVersionUID = 1L;
	private Room room;
	private List<Room> rooms;
	private Roomtype roomtypeConvert;
		

	public RoomAction() {
		super();
		this.room = new Room();

	}

	public String search() {
		try {
			this.rooms = new RoomManager().search();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public String addOrUpdate() {
		try {
			System.out.println("*****in calander add");
			System.out.println(room.getRoomId());
			this.room.setRoomtype(roomtypeConvert);
			this.room = new RoomManager().saveOrUpdate(this.room);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public String delete() {
		try {
			this.room = new RoomManager().delete(this.room);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	@Override
	public Object getModel() {
		// TODO Auto-generated method stub
		return this.room;
	}

	public Room getRoom() {
		return room;
	}

	public void setRoom(Room room) {
		this.room = room;
	}

	public List<Room> getRooms() {
		return rooms;
	}

	public void setRooms(List<Room> rooms) {
		this.rooms = rooms;
	}

	public Roomtype getRoomtypeConvert() {
		return roomtypeConvert;
	}

	public void setRoomtypeConvert(Roomtype roomtypeConvert) {
		this.roomtypeConvert = roomtypeConvert;
	}

}
