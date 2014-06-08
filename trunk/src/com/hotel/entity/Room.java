package com.hotel.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the room database table.
 * 
 */
@Entity
@Table(name= "room")
public class Room implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int roomId;
	
	private String roomNumber;
	private String telephoneNumber;
	private String description;

	private String status;

	
//	//bi-directional many-to-one association to Allocationroom
//	@OneToMany(mappedBy="room", fetch=FetchType.EAGER)
//	private List<Allocationroom> allocationrooms;

	//bi-directional many-to-one association to Roomtype
	
//uni-directional many-to-one association to Roomtype
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="roomTypeId")
	private Roomtype roomTypeId;

//	//bi-directional many-to-one association to Roomcalander
//	@OneToMany(mappedBy="room", fetch=FetchType.EAGER)
//	private List<Roomcalander> roomcalanders;

	public Room() {
	}

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
	@Column(name= "tephoneNumber")
	public String getTephoneNumber() {
		return this.telephoneNumber;
	}

	public void setTephoneNumber(String tephoneNumber) {
		this.telephoneNumber = tephoneNumber;
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

	
//	public List<Allocationroom> getAllocationrooms() {
//		return this.allocationrooms;
//	}
//
//	public void setAllocationrooms(List<Allocationroom> allocationrooms) {
//		this.allocationrooms = allocationrooms;
//	}

	@Column(name= "Roomtype")
	public Roomtype getRoomtype() {
		return this.roomTypeId;
	}

	public void setRoomtype(Roomtype roomtype) {
		this.roomTypeId = roomtype;
	}

	
	

//	public List<Roomcalander> getRoomcalanders() {
//		return this.roomcalanders;
//	}
//
//	public void setRoomcalanders(List<Roomcalander> roomcalanders) {
//		this.roomcalanders = roomcalanders;
//	}

}