package com.hotel.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the employeeroaster database table.
 * 
 */
@Entity
@Table(name="employeeRoaster")
public class Employeeroaster implements Serializable {
	private static final long serialVersionUID = 1L;

	
	private int employeeRosterId;
	
	private String assignDate;

	private String remarks;

	private String roasterDate;
	
	private Employee employee;
	
	private Shift shift;

	public Employeeroaster() {
	}

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="employeeRosterId")
	public int getEmployeeRosterId() {
		return this.employeeRosterId;
	}

	public void setEmployeeRosterId(int employeeRosterId) {
		this.employeeRosterId = employeeRosterId;
	}

	@Column(name="assignDate")
	public String getAssignDate() {
		return this.assignDate;
	}

	public void setAssignDate(String assignDate) {
		this.assignDate = assignDate;
	}

	@Column(name="remarks")
	public String getRemarks() {
		return this.remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	@Column(name="roasterDate")
	public String getRoasterDate() {
		return this.roasterDate;
	}

	public void setRoasterDate(String roasterDate) {
		this.roasterDate = roasterDate;
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

	//bi-directional many-to-one association to Shift
	@ManyToOne
	@JoinColumn(name="shiftId")
	public Shift getShift() {
		return this.shift;
	}

	public void setShift(Shift shift) {
		this.shift = shift;
	}

}