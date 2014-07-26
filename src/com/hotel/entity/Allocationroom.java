package com.hotel.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;
import java.util.List;


/**
 * The persistent class for the allocationroom database table.
 * 
 */
@IdClass(com.hotel.entity.Allocationroom.class)
@Entity
@Table(name="allocationRoom")
public class Allocationroom implements Serializable {
	private static final long serialVersionUID = 1L;

	private String allocateDateTime;

	private String deallocateDateTime;

	private int extraBeds;

	private Reservation reservation;
	
	private Room room;
	
	private Guest guest;

	
	public Allocationroom() {
	}

	@Column(name="allocateDateTime")
	public String getAllocateDateTime() {
		return this.allocateDateTime;
	}

	public void setAllocateDateTime(String allocateDateTime) {
		this.allocateDateTime = allocateDateTime;
	}
	
	@Column(name="deallocateDateTime")
	public String getDeallocateDateTime() {
		return this.deallocateDateTime;
	}

	public void setDeallocateDateTime(String deallocateDateTime) {
		this.deallocateDateTime = deallocateDateTime;
	}

	@Column(name="extraBeds")
	public int getExtraBeds() {
		return this.extraBeds;
	}

	public void setExtraBeds(int extraBeds) {
		this.extraBeds = extraBeds;
	}

	//bi-directional many-to-one association to Reservation
	@Id
	@ManyToOne
	@JoinColumn(name="reservationId")
	public Reservation getReservation() {
		return this.reservation;
	}

	public void setReservation(Reservation reservation) {
		this.reservation = reservation;
	}

	//bi-directional many-to-one association to Room
	@Id
	@ManyToOne
	@JoinColumn(name="roomId")
	public Room getRoom() {
		return this.room;
	}

	public void setRoom(Room room) {
		this.room = room;
	}

	//bi-directional many-to-one association to Guest
	@ManyToOne
	@JoinColumn(name="guestId")
	public Guest getGuest() {
		return this.guest;
	}

	public void setGuest(Guest guest) {
		this.guest = guest;
	}

	

}