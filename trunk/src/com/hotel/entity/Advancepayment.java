package com.hotel.entity;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;



/**
 * The persistent class for the advancepayment database table.
 * 
 */
@Entity
@Table(name="advancePayment")
public class Advancepayment implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int advancePaymentId;

	
	@Column(name="`100%PaidDate`")
	private String $100PaidDate;

	@Column(name="`25%PaidDate`")
	private String $25PaidDate;

	@Column(name="`50%PaidDate`")
	private String $50PaidDate;

	private String status;

	private double tolalAdvance;

//	//bi-directional many-to-one association to Reservation
//	@ManyToOne
//	@JoinColumn(name="reservationId")
//	private Reservation reservation;

	public Advancepayment() {
	}

	@Column(name="")
	public int getAdvancePaymentId() {
		return this.advancePaymentId;
	}

	public void setAdvancePaymentId(int advancePaymentId) {
		this.advancePaymentId = advancePaymentId;
	}

	@Column(name="$100PaidDate")
	public String get$100PaidDate() {
		return this.$100PaidDate;
	}

	public void set_00_PaidDate(String $100PaidDate) {
		this.$100PaidDate = $100PaidDate;
	}

	@Column(name="$50PaidDate")
	public String get$50PaidDate() {
		return this.$50PaidDate;
	}

	public void set$50PaidDate(String $50PaidDate) {
		this.$50PaidDate = $50PaidDate;
	}

	@Column(name="$50PaidDate")
	public String get$25PaidDate() {
		return this.$25PaidDate;
	}

	public void set$25PaidDate(String $25PaidDate) {
		this.$25PaidDate = $25PaidDate;
	}

	@Column(name="status")
	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Column(name="tolalAdvance")
	public double getTolalAdvance() {
		return this.tolalAdvance;
	}

	public void setTolalAdvance(double tolalAdvance) {
		this.tolalAdvance = tolalAdvance;
	}

//	public Reservation getReservation() {
//		return this.reservation;
//	}
//
//	public void setReservation(Reservation reservation) {
//		this.reservation = reservation;
//	}

}