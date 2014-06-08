package com.hotel.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the resevationtype database table.
 * 
 */
@Entity
public class Resevationtype implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name= "resevationTypeId")
	private int resevationTypeId;

	@Column(name= "description")
	private String description;

	@Column(name= "reservationTypeCode")
	private String reservationTypeCode;

	@Column(name= "reservationTypeName")
	private String reservationTypeName;

//	//bi-directional many-to-one association to Reservation
//	@OneToMany(mappedBy="resevationtype", fetch=FetchType.EAGER)
//	private List<Reservation> reservations;

	public Resevationtype() {
	}

	public int getResevationTypeId() {
		return this.resevationTypeId;
	}

	public void setResevationTypeId(int resevationTypeId) {
		this.resevationTypeId = resevationTypeId;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getReservationTypeCode() {
		return this.reservationTypeCode;
	}

	public void setReservationTypeCode(String reservationTypeCode) {
		this.reservationTypeCode = reservationTypeCode;
	}

	public String getReservationTypeName() {
		return this.reservationTypeName;
	}

	public void setReservationTypeName(String reservationTypeName) {
		this.reservationTypeName = reservationTypeName;
	}

//	public List<Reservation> getReservations() {
//		return this.reservations;
//	}
//
//	public void setReservations(List<Reservation> reservations) {
//		this.reservations = reservations;
//	}

}