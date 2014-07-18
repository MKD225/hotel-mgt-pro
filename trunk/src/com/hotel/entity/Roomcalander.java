package com.hotel.entity;

import java.io.Serializable;
import javax.persistence.*;

import com.opensymphony.xwork2.inject.Factory;

import java.util.Date;

/**
 * The persistent class for the roomcalander database table.
 * 
 */
@Entity
@Table(name= "roomcalander")
public class Roomcalander implements Serializable {
	private static final long serialVersionUID = 1L;

	private int roomCalanderId;

	private String endDateTime;

	private String remarks;

	private String startDateTime;

	private String status;

	private Room room;

	public Roomcalander() {
	}

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "roomCalanderId")
	public int getRoomCalanderId() {
		return this.roomCalanderId;
	}

	public void setRoomCalanderId(int roomCalanderId) {
		this.roomCalanderId = roomCalanderId;
	}

	@Column(name = "endDateTime")
	public String getEndDateTime() {
		return this.endDateTime;
	}

	public void setEndDateTime(String endDateTime) {
		this.endDateTime = endDateTime;
	}

	@Column(name = "remarks")
	public String getRemarks() {
		return this.remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	@Column(name = "startDateTime")
	public String getStartDateTime() {
		return this.startDateTime;
	}

	public void setStartDateTime(String startDateTime) {
		this.startDateTime = startDateTime;
	}

	@Column(name = "status")
	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name = "roomId", nullable =false)
	public Room getRoom() {
		return this.room;
	}

	public void setRoom(Room room) {
		this.room = room;
	}

}