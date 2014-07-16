package com.hotel.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.sql.Time;


/**
 * The persistent class for the log database table.
 * 
 */
@Entity
@Table(name="log")
public class Log implements Serializable {
	private static final long serialVersionUID = 1L;

	
	private int logId;

	private String actionClass;

	private String actionMethod;

	private String objectAttributes;

	private String time;
	
	private Employee employee;

	public Log() {
	}

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="logId")
	public int getLogId() {
		return this.logId;
	}

	public void setLogId(int logId) {
		this.logId = logId;
	}

	@Column(name="actionClass")
	public String getActionClass() {
		return this.actionClass;
	}

	public void setActionClass(String actionClass) {
		this.actionClass = actionClass;
	}

	@Column(name="actionMethod")
	public String getActionMethod() {
		return this.actionMethod;
	}

	public void setActionMethod(String actionMethod) {
		this.actionMethod = actionMethod;
	}

	@Column(name="objectAttributes")
	public String getObjectAttributes() {
		return this.objectAttributes;
	}

	public void setObjectAttributes(String objectAttributes) {
		this.objectAttributes = objectAttributes;
	}

	@Column(name="time")
	public String getTime() {
		return this.time;
	}

	public void setTime(String time) {
		this.time = time;
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

}