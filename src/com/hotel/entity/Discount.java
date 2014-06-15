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
 * The persistent class for the discount database table.
 * 
 */
@Entity
@Table(name ="discount")
public class Discount implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="discounttId")
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int discounttId;

	@Column(name="closedDate")
	private String closedDate;

	@Column(name="`f&bpercentage`")
	private double f_bpercentage;

	@Column(name="initializedDate")
	private String initializedDate;

	@Column(name="minibarpercentage")
	private double minibarpercentage;

	@Column(name="otherDiscountPercentage")
	private double otherDiscountPercentage;

	@Column(name="roompercentage")
	private double roompercentage;

	@Column(name="status")
	private String status;

	@Column(name="type")
	private String type;
//
//	//bi-directional many-to-one association to Reservation
//	@OneToMany(mappedBy="discount", fetch=FetchType.EAGER)
//	private List<Reservation> reservations;

	public Discount() {
	}

	public int getDiscounttId() {
		return this.discounttId;
	}

	public void setDiscounttId(int discounttId) {
		this.discounttId = discounttId;
	}

	public String getClosedDate() {
		return this.closedDate;
	}

	public void setClosedDate(String closedDate) {
		this.closedDate = closedDate;
	}

	public double getF_bpercentage() {
		return this.f_bpercentage;
	}

	public void setF_bpercentage(double f_bpercentage) {
		this.f_bpercentage = f_bpercentage;
	}

	public String getInitializedDate() {
		return this.initializedDate;
	}

	public void setInitializedDate(String initializedDate) {
		this.initializedDate = initializedDate;
	}

	public double getMinibarpercentage() {
		return this.minibarpercentage;
	}

	public void setMinibarpercentage(double minibarpercentage) {
		this.minibarpercentage = minibarpercentage;
	}

	public double getOtherDiscountPercentage() {
		return this.otherDiscountPercentage;
	}

	public void setOtherDiscountPercentage(double otherDiscountPercentage) {
		this.otherDiscountPercentage = otherDiscountPercentage;
	}

	public double getRoompercentage() {
		return this.roompercentage;
	}

	public void setRoompercentage(double roompercentage) {
		this.roompercentage = roompercentage;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

//	public List<Reservation> getReservations() {
//		return this.reservations;
//	}
//
//	public void setReservations(List<Reservation> reservations) {
//		this.reservations = reservations;
//	}

}