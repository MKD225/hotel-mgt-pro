package com.hotel.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.sql.Time;
import java.util.List;


/**
 * The persistent class for the shift database table.
 * 
 */
@Entity
@Table(name= "shift")
public class Shift implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int shiftId;

	private String description;

	private String endTime;

	private String shiftName;

	private String startTime;

//	//bi-directional many-to-one association to Employeeroaster
//	@OneToMany(mappedBy="shift", fetch=FetchType.EAGER)
//	private List<Employeeroaster> employeeroasters;

	public Shift() {
	}

	@Column(name="shiftId")
	public int getShiftId() {
		return this.shiftId;
	}

	public void setShiftId(int shiftId) {
		this.shiftId = shiftId;
	}

	@Column(name="description")
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Column(name="endTime")
	public String getEndTime() {
		return this.endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	@Column(name="shiftName")
	public String getShiftName() {
		return this.shiftName;
	}

	public void setShiftName(String shiftName) {
		this.shiftName = shiftName;
	}

	@Column(name="startTime")
	public String getStartTime() {
		return this.startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

//	public List<Employeeroaster> getEmployeeroasters() {
//		return this.employeeroasters;
//	}
//
//	public void setEmployeeroasters(List<Employeeroaster> employeeroasters) {
//		this.employeeroasters = employeeroasters;
//	}

}