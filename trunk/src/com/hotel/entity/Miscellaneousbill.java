package com.hotel.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the miscellaneousbill database table.
 * 
 */
@Entity
@Table(name="miscellaneousBill")
public class Miscellaneousbill implements Serializable {
	private static final long serialVersionUID = 1L;

	private int miscellaneousBillId;
	
	private Employee employee;

	private Allocationroom allocationroom;

	private double amount;

	private String dateTime;

	private String description;

	
	public Miscellaneousbill() {
	}

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name = "miscellaneousBillId")
	public int getMiscellaneousBillId() {
		return this.miscellaneousBillId;
	}

	public void setMiscellaneousBillId(int miscellaneousBillId) {
		this.miscellaneousBillId = miscellaneousBillId;
	}

	@Column(name = "amount")
	public double getAmount() {
		return this.amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	@Column(name = "dateTime")
	public String getDateTime() {
		return this.dateTime;
	}

	public void setDateTime(String dateTime) {
		this.dateTime = dateTime;
	}

	@Column(name = "description")
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	//bi-directional many-to-one association to Employee
		@ManyToOne
		@JoinColumn(name="employeeId")
	public Employee getEmployee() {
		return this.employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	//bi-directional many-to-one association to Allocationroom
		@ManyToOne
		@JoinColumns({
			@JoinColumn(name="reservationId", referencedColumnName="reservationId"),
			@JoinColumn(name="roomId", referencedColumnName="roomId")
			})
	public Allocationroom getAllocationroom() {
		return this.allocationroom;
	}

	public void setAllocationroom(Allocationroom allocationroom) {
		this.allocationroom = allocationroom;
	}

}