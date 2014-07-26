package com.hotel.entity;

import java.io.Serializable;
import javax.persistence.*;

/**
 * The persistent class for the reservation database table.
 * 
 */
@Entity
@Table(name = "reservation")
public class Reservation implements Serializable {
	private static final long serialVersionUID = 1L;

	private int reservationId;

	private String title;

	private String reservedFirstName;

	private String reservedLastName;
	
	private int numberOfAdults;

	private int numberOfChildren;

	private int numberOfRooms;

	private String reservedDate;

	private String arrivalDateTime;

	private String departureDateTime;

	private String allocationDateTime;
	
	private String country;

	private Resevationtype resevationtype;

	private String paymentType;

	private CreditCardType creditCardType;

	private String creditCardNumber;

	private Agent agent;

	private String remarks;

	private String status;

	private String telephoneNumber;

	private String emailAddress;

	private String passportNumber;

	private String flightnumber;

	private String pickUpTime;
	
	private Employee internalArrivalDriver;

	private Externaldriver externalArrivalDriver;
	
	private Employee internalDepartureDriver;

	private Externaldriver externalDepartureDriver;

	private Guest guest;

	private Employee guestAssistant;

	private Discount discount;

	public Reservation() {
	}

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "reservationId")
	public int getReservationId() {
		return this.reservationId;
	}

	public void setReservationId(int reservationId) {
		this.reservationId = reservationId;
	}

	@Column(name = "allocationDateTime")
	public String getAllocationDateTime() {
		return this.allocationDateTime;
	}

	public void setAllocationDateTime(String allocationDateTime) {
		this.allocationDateTime = allocationDateTime;
	}

	@Column(name = "arrivalDateTime")
	public String getArrivalDateTime() {
		return this.arrivalDateTime;
	}

	public void setArrivalDateTime(String arrivalDateTime) {
		this.arrivalDateTime = arrivalDateTime;
	}

	@Column(name = "creditCardNumber")
	public String getCreditCardNumber() {
		return this.creditCardNumber;
	}

	public void setCreditCardNumber(String creditCardNumber) {
		this.creditCardNumber = creditCardNumber;
	}

	@Column(name = "departureDateTime")
	public String getDepartureDateTime() {
		return this.departureDateTime;
	}

	public void setDepartureDateTime(String departureDateTime) {
		this.departureDateTime = departureDateTime;
	}

	@Column(name = "emailAddress")
	public String getEmailAddress() {
		return this.emailAddress;
	}

	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}

	@Column(name = "flightnumber")
	public String getFlightnumber() {
		return this.flightnumber;
	}

	public void setFlightnumber(String flightnumber) {
		this.flightnumber = flightnumber;
	}

	@Column(name = "numberOfAdults")
	public int getNumberOfAdults() {
		return this.numberOfAdults;
	}

	public void setNumberOfAdults(int numberOfAdults) {
		this.numberOfAdults = numberOfAdults;
	}

	@Column(name = "numberOfChildren")
	public int getNumberOfChildren() {
		return numberOfChildren;
	}

	public void setNumberOfChildren(int numberOfChildren) {
		this.numberOfChildren = numberOfChildren;
	}

	@Column(name = "numberOfRooms")
	public int getNumberOfRooms() {
		return this.numberOfRooms;
	}

	public void setNumberOfRooms(int numberOfRooms) {
		this.numberOfRooms = numberOfRooms;
	}

	@Column(name = "passportNumber")
	public String getPassportNumber() {
		return this.passportNumber;
	}

	public void setPassportNumber(String passportNumber) {
		this.passportNumber = passportNumber;
	}

	@Column(name = "paymentType")
	public String getPaymentType() {
		return this.paymentType;
	}

	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}

	@Column(name = "pickUpTime")
	public String getPickUpTime() {
		return this.pickUpTime;
	}

	public void setPickUpTime(String pickUpTime) {
		this.pickUpTime = pickUpTime;
	}

	@Column(name = "remarks")
	public String getRemarks() {
		return this.remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	@Column(name = "reservedDate")
	public String getReservedDate() {
		return this.reservedDate;
	}

	public void setReservedDate(String reservedDate) {
		this.reservedDate = reservedDate;
	}

	@Column(name = "reservedFirstName")
	public String getReservedFirstName() {
		return this.reservedFirstName;
	}

	public void setReservedFirstName(String reservedFirstName) {
		this.reservedFirstName = reservedFirstName;
	}

	@Column(name = "reservedLastName")
	public String getReservedLastName() {
		return this.reservedLastName;
	}

	public void setReservedLastName(String reservedLastName) {
		this.reservedLastName = reservedLastName;
	}

	@Column(name = "status")
	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Column(name = "telephoneNumber")
	public String getTelephoneNumber() {
		return this.telephoneNumber;
	}

	public void setTelephoneNumber(String telephoneNumber) {
		this.telephoneNumber = telephoneNumber;
	}

	@Column(name = "title")
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	@Column(name="country")
	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	// uni-directional many-to-one association to Externaldriver
	@ManyToOne
	@JoinColumn(name = "externalArrivalDriverId")
	public Externaldriver getExternalArrivalDriver() {
		return this.externalArrivalDriver;
	}

	public void setExternalArrivalDriver(Externaldriver externalArrivalDriver) {
		this.externalArrivalDriver = externalArrivalDriver;
	}

	// uni-directional many-to-one association to Employee
	@ManyToOne
	@JoinColumn(name = "internalArrivalDriverId")
	public Employee getInternalArrivalDriver() {
		return this.internalArrivalDriver;
	}

	public void setInternalArrivalDriver(Employee internalArrivalDriver) {
		this.internalArrivalDriver = internalArrivalDriver;
	}

	// uni-directional many-to-one association to Employee
	@ManyToOne
	@JoinColumn(name = "internalDepartureDriverId")
	public Employee getInternalDepartureDriver() {
		return this.internalDepartureDriver;
	}

	public void setInternalDepartureDriver(Employee internalDepartureDriver) {
		this.internalDepartureDriver = internalDepartureDriver;
	}

	// uni-directional many-to-one association to Employee
	@ManyToOne
	@JoinColumn(name = "guestAssistant")
	public Employee getGuestAssistant() {
		return this.guestAssistant;
	}

	public void setGuestAssistant(Employee guestAssistant) {
		this.guestAssistant = guestAssistant;
	}

	// uni-directional many-to-one association to Resevationtype
	@ManyToOne
	@JoinColumn(name = "resevationTypeId")
	public Resevationtype getResevationtype() {
		return this.resevationtype;
	}

	public void setResevationtype(Resevationtype resevationtype) {
		this.resevationtype = resevationtype;
	}

	// uni-directional many-to-one association to Agent
	@ManyToOne
	@JoinColumn(name = "agentId")
	public Agent getAgent() {
		return this.agent;
	}

	public void setAgent(Agent agent) {
		this.agent = agent;
	}

	// uni-directional many-to-one association to Externaldriver
	@ManyToOne
	@JoinColumn(name = "externalDepartureDriverId")
	public Externaldriver getExternalDepartureDriver() {
		return this.externalDepartureDriver;
	}

	public void setExternalDepartureDriver(
			Externaldriver externalDepartureDriver) {
		this.externalDepartureDriver = externalDepartureDriver;
	}

	// uni-directional many-to-one association to Guest
	@ManyToOne
	@JoinColumn(name = "guestId")
	public Guest getGuest() {
		return this.guest;
	}

	public void setGuest(Guest guest) {
		this.guest = guest;
	}

	// uni-directional many-to-one association to Discuont
	@ManyToOne
	@JoinColumn(name = "discountId")
	public Discount getDiscount() {
		return this.discount;
	}

	public void setDiscount(Discount discount) {
		this.discount = discount;
	}

	// uni-directional many-to-one association to Discuont
	@ManyToOne
	@JoinColumn(name = "creditCardTypeId")
	public CreditCardType getCreditCardType() {
		return creditCardType;
	}

	public void setCreditCardType(CreditCardType creditCardType) {
		this.creditCardType = creditCardType;
	}

	
}