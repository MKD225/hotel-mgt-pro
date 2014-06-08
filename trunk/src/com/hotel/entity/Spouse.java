package com.hotel.entity;

import java.io.Serializable;
import javax.persistence.*;

import java.util.Date;


/**
 * The persistent class for the spouse database table.
 * 
 */
@Entity
@Table(name="Spouse")
public class Spouse implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name = "spouseId")
	private int spouseId;

	@Column(name = "country")
	private String country;

	@Column(name = "dateOfBirth")
	private String dateOfBirth;

	@Column(name = "nationality")
	private String nationality;

	@Column(name = "passportNumber")
	private String passportNumber;

	@Column(name = "remarks")
	private String remarks;

	@Column(name = "firstName")
	private String firstName;
	
	@Column(name = "title")
	private String title;
	
	@Column(name = "lastName")
	private String lastName;

	

	//bi-directional one-to-one association to Spouse
	@OneToOne
	@JoinColumn(name="spouseId")
	private Spouse spouse;

	public Spouse() {
	}

	public int getSpouseId() {
		return this.spouseId;
	}

	public void setSpouseId(int spouseId) {
		this.spouseId = spouseId;
	}

	public String getCountry() {
		return this.country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getDateOfBirth() {
		return this.dateOfBirth;
	}

	public void setDateOfBirth(String dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public String getNationality() {
		return this.nationality;
	}

	public void setNationality(String nationality) {
		this.nationality = nationality;
	}

	public String getPassportNumber() {
		return this.passportNumber;
	}

	public void setPassportNumber(String passportNumber) {
		this.passportNumber = passportNumber;
	}

	public String getRemarks() {
		return this.remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getFirstName() {
		return this.firstName;
	}

	public void setSpouseName(String firstName) {
		this.firstName = firstName;
	}
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public Spouse getSpouse() {
		return this.spouse;
	}

	public void setSpouse(Spouse spouse) {
		this.spouse = spouse;
	}

}