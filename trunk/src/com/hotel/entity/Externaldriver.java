package com.hotel.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the externaldriver database table.
 * 
 */
@Entity
@Table(name= "externalDriver")
public class Externaldriver implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int externalDriverId;

	private String name;
	
	private String licenceNo;

	private String address;

	private String emailAddress;	
	
	private String telephoneNumber;

//	//bi-directional many-to-one association to Reservation
//	@OneToMany(mappedBy="externaldriver1", fetch=FetchType.EAGER)
//	private List<Reservation> reservations1;
//
//	//bi-directional many-to-one association to Reservation
//	@OneToMany(mappedBy="externaldriver2", fetch=FetchType.EAGER)
//	private List<Reservation> reservations2;

	public Externaldriver() {
	}

	@Column(name="externalDriverId")
	public int getExternalDriverId() {
		return this.externalDriverId;
	}

	public void setExternalDriverId(int externalDriverId) {
		this.externalDriverId = externalDriverId;
	}

	@Column(name="address")
	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Column(name="emailAddress")
	public String getEmailAddress() {
		return this.emailAddress;
	}

	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}

	@Column(name="licenceNo")
	public String getLicenceNo() {
		return this.licenceNo;
	}

	public void setLicenceNo(String licenceNo) {
		this.licenceNo = licenceNo;
	}

	@Column(name="name")
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name="telephoneNumber")
	public String getTelephoneNumber() {
		return this.telephoneNumber;
	}

	public void setTelephoneNumber(String telephoneNumber) {
		this.telephoneNumber = telephoneNumber;
	}

//	public List<Reservation> getReservations1() {
//		return this.reservations1;
//	}
//
//	public void setReservations1(List<Reservation> reservations1) {
//		this.reservations1 = reservations1;
//	}
//
//	public List<Reservation> getReservations2() {
//		return this.reservations2;
//	}
//
//	public void setReservations2(List<Reservation> reservations2) {
//		this.reservations2 = reservations2;
//	}

}