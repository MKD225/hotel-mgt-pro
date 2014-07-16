package com.hotel.entity;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * The persistent class for the agent database table.
 * 
 */
@Entity
@Table(name = "Agent")
public class Agent implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "agentId")
	private int agentId;

	@Column(name = "title")
	private String title;

	@Column(name = "country")
	private String country;

	@Column(name = "emailAddress")
	private String emailAddress;

	@Column(name = "firstName")
	private String firstName;

	@Column(name = "lastName")
	private String lastName;

	@Column(name = "permitNumber")
	private String permitNumber;

	@Column(name = "remarks")
	private String remarks;

	@Column(name = "status")
	private String status;

	@Column(name = "telephoneNumber")
	private String telephoneNumber;

	// //bi-directional many-to-one association to Reservation
	// @OneToMany(mappedBy="agent", fetch=FetchType.EAGER)
	// private List<Reservation> reservations;

	public Agent() {
	}

	public int getAgentId() {
		return this.agentId;
	}

	public void setAgentId(int agentId) {
		this.agentId = agentId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCountry() {
		return this.country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getEmailAddress() {
		return this.emailAddress;
	}

	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}

	public String getFirstName() {
		return this.firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return this.lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getPermitNumber() {
		return this.permitNumber;
	}

	public void setPermitNumber(String permitNumber) {
		this.permitNumber = permitNumber;
	}

	public String getRemarks() {
		return this.remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getTelephoneNumber() {
		return this.telephoneNumber;
	}

	public void setTelephoneNumber(String telephoneNumber) {
		this.telephoneNumber = telephoneNumber;
	}

	// public List<Reservation> getReservations() {
	// return this.reservations;
	// }
	//
	// public void setReservations(List<Reservation> reservations) {
	// this.reservations = reservations;
	// }

}