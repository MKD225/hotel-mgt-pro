package com.hotel.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the roomtype database table.
 * 
 */
@Entity
public class Roomtype implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="roomTypeId")
	private int roomTypeId;

	@Column(name="`a/c`")
	private boolean a_c;

	@Column(name="description")
	private String description;

	@Column(name="roomRate")
	private double roomRate;

	@Column(name="roomTypeName")
	private String roomTypeName;

	@Column(name="view")
	private String view;

//	//bi-directional many-to-one association to Allocateroomtype
//	@OneToMany(mappedBy="roomtype", fetch=FetchType.EAGER)
//	private List<Allocateroomtype> allocateroomtypes;
//
//	//bi-directional many-to-one association to Room
//	@OneToMany(mappedBy="roomtype", fetch=FetchType.EAGER)
//	private List<Room> rooms;

	public Roomtype() {
	}

	public int getRoomTypeId() {
		return this.roomTypeId;
	}

	public void setRoomTypeId(int roomTypeId) {
		this.roomTypeId = roomTypeId;
	}

	public boolean getA_c() {
		return this.a_c;
	}

	public void setA_c(boolean a_c) {
		this.a_c = a_c;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public double getRoomRate() {
		return this.roomRate;
	}

	public void setRoomRate(double roomRate) {
		this.roomRate = roomRate;
	}

	public String getRoomTypeName() {
		return this.roomTypeName;
	}

	public void setRoomTypeName(String roomTypeName) {
		this.roomTypeName = roomTypeName;
	}

	public String getView() {
		return this.view;
	}

	public void setView(String view) {
		this.view = view;
	}

//	public List<Allocateroomtype> getAllocateroomtypes() {
//		return this.allocateroomtypes;
//	}
//
//	public void setAllocateroomtypes(List<Allocateroomtype> allocateroomtypes) {
//		this.allocateroomtypes = allocateroomtypes;
//	}
//
//	public List<Room> getRooms() {
//		return this.rooms;
//	}
//
//	public void setRooms(List<Room> rooms) {
//		this.rooms = rooms;
//	}

}