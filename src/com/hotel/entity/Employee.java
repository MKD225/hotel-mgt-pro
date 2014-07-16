package com.hotel.entity;

import java.io.Serializable;
import javax.persistence.*;

import java.util.List;

/**
 * The persistent class for the employee database table.
 * 
 */
@Entity
@Table(name = "employee")
public class Employee implements Serializable {
	private static final long serialVersionUID = 1L;

	private int employeeId;
	
	private String title;

	private String email;

	private String firstName;

	private String home;

	private String lastName;

	private String mobile;
	
	private String address;

	private String nicNumber;

	private String password;

	private String userName;

	private Privilege privilege;

	private Department department;
	
	private String description;

	public Employee() {
	}

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "employeeId")
	public int getEmployeeId() {
		return this.employeeId;
	}

	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
	}

	@Column(name = "email")
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "firstName")
	public String getFirstName() {
		return this.firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	@Column(name = "home")
	public String getHome() {
		return this.home;
	}

	public void setHome(String home) {
		this.home = home;
	}

	@Column(name = "lastName")
	public String getLastName() {
		return this.lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	@Column(name = "mobile")
	public String getMobile() {
		return this.mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	@Column(name = "nicNumber")
	public String getNicNumber() {
		return this.nicNumber;
	}

	public void setNicNumber(String nicNumber) {
		this.nicNumber = nicNumber;
	}

	@Column(name = "password")
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "userName")
	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	@Column(name = "address")
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	@Column(name = "title")
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	@Column(name = "description")
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "departmentId")
	public Department getDepartment() {
		return this.department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "privilegeId")
	public Privilege getPrivilege() {
		return privilege;
	}

	public void setPrivilege(Privilege privilege) {
		this.privilege = privilege;
	}

}