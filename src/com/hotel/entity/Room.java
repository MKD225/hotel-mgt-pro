package com.hotel.entity;

import java.io.Serializable;
import javax.persistence.*;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;



/**
 * The persistent class for the room database table.
 * 
 */
@Entity
@Table(name= "Room")
public class Room implements Serializable {
	private static final long serialVersionUID = 1L;

	
	private int roomId;
	private String roomNumber;
	private String telephoneNumber;
	private String description;
	private String status;
	private Roomtype roomType;


	
//	//bi-directional many-to-one association to Allocationroom
//	@OneToMany(mappedBy="room", fetch=FetchType.EAGER)
//	private List<Allocationroom> allocationrooms;

	//bi-directional many-to-one association to Roomtype
	
//uni-directional many-to-one association to Roomtype
	
	
//	//bi-directional many-to-one association to Roomcalander
//	@OneToMany(mappedBy="room", fetch=FetchType.EAGER)
//	private List<Roomcalander> roomcalanders;

	public Room() {
	}

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name= "roomId")
	public int getRoomId() {
		return this.roomId;
	}

	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}
	
	@Column(name= "roomNumber")
	public String getRoomNumber() {
		return roomNumber;
	}

	public void setRoomNumber(String roomNumber) {
		this.roomNumber = roomNumber;
	}
	@Column(name= "telephoneNumber")
	public String getTephoneNumber() {
		return this.telephoneNumber;
	}

	public void setTephoneNumber(String telephoneNumber) {
		this.telephoneNumber = telephoneNumber;
	}


	@Column(name= "description")
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Column(name= "status")
	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="roomTypeId", nullable= false)
	public Roomtype getRoomtype() {
		return this.roomType;
	}

	public void setRoomtype(Roomtype roomtype) {
		this.roomType = roomtype;
	}
	
//	public List<Allocationroom> getAllocationrooms() {
//		return this.allocationrooms;
//	}
//
//	public void setAllocationrooms(List<Allocationroom> allocationrooms) {
//		this.allocationrooms = allocationrooms;
//	}
	

//	public List<Roomcalander> getRoomcalanders() {
//		return this.roomcalanders;
//	}
//
//	public void setRoomcalanders(List<Roomcalander> roomcalanders) {
//		this.roomcalanders = roomcalanders;
//	}

}