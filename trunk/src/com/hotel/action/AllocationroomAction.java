package com.hotel.action;

import java.util.List;

import com.hotel.dao.AllocationroomManager;
import com.hotel.entity.Allocationroom;
import com.hotel.entity.Guest;
import com.hotel.entity.Reservation;
import com.hotel.entity.Room;
import com.hotel.entity.Roomtype;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@SuppressWarnings("rawtypes")
public class AllocationroomAction extends ActionSupport implements ModelDriven {

	private static final long serialVersionUID = 1L;
	private Allocationroom allocationroom;
	private List<Allocationroom> allocationrooms;

	private Room roomConvert;
	private Reservation reservationConvert;
	private Guest guestConvert;
	
	public AllocationroomAction() {
		super();
		this.allocationroom = new Allocationroom();
	}

	public String search() {
		System.out.println("+++++++++++");
		try {
			
			this.allocationrooms = new AllocationroomManager().search();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public String addOrUpdate() {
		System.out.println("********+++++++++++");
		try {
			this.allocationroom.setGuest(guestConvert);
			this.allocationroom.setReservation(reservationConvert);
			this.allocationroom.setRoom(roomConvert);
			this.allocationroom = new AllocationroomManager().saveOrUpdate(this.allocationroom);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public String delete(){
		System.out.println("********delete action************");
		try{
			new AllocationroomManager().delete(this.allocationroom);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return SUCCESS;
	}
	@Override
	public Object getModel() {
		// TODO Auto-generated method stub
		return this.allocationroom;
	}


	public Allocationroom getAllocationroom() {
		return allocationroom;
	}

	public void setAllocationroom(Allocationroom allocationroom) {
		this.allocationroom = allocationroom;
	}

	public List<Allocationroom> getAllocationrooms() {
		return allocationrooms;
	}

	public void setAllocationrooms(List<Allocationroom> allocationrooms) {
		this.allocationrooms = allocationrooms;
	}


	public Room getRoomConvert() {
		return roomConvert;
	}

	public void setRoomConvert(Room roomConvert) {
		this.roomConvert = roomConvert;
	}

	public Reservation getReservationConvert() {
		return reservationConvert;
	}

	public void setReservationConvert(Reservation reservationConvert) {
		this.reservationConvert = reservationConvert;
	}

	public Guest getGuestConvert() {
		return guestConvert;
	}

	public void setGuestConvert(Guest guestConvert) {
		this.guestConvert = guestConvert;
	}

	
}
