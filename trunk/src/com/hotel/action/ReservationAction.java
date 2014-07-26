package com.hotel.action;

import java.util.List;

import com.hotel.dao.ReservationManager;
import com.hotel.entity.Agent;
import com.hotel.entity.CreditCardType;
import com.hotel.entity.Discount;
import com.hotel.entity.Externaldriver;
import com.hotel.entity.Guest;
import com.hotel.entity.Reservation;
import com.hotel.entity.Employee;
import com.hotel.entity.Resevationtype;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@SuppressWarnings("rawtypes")
public class ReservationAction extends ActionSupport implements ModelDriven {
	
	private static final long serialVersionUID = 1L;
	private Reservation reservation;
	private List<Reservation> reservations;
	private Employee internalArrivalDriverConvert;
	private Employee internalDepartureDriverConvert;
	private Employee guestAssistantConvert;
	private Externaldriver externalArravalDriverConvert;
	private Externaldriver externalDepartureDriverConvert;
	private Resevationtype resevationtypeConvert;
	private Guest guestConvert;
	private Agent agentConvert;
	private CreditCardType creditCardTypeConvert;
	private Discount discountConvert;
	


	public ReservationAction() {
		super();
		this.reservation = new Reservation();
	}


	public String search() {
		try {
			this.reservations = new ReservationManager().search();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public String addOrUpdate() {
		try {
			System.out.println("*****in reservation add");
			System.out.println(reservation.getReservedFirstName());
			this.reservation.setInternalArrivalDriver(internalArrivalDriverConvert);
			this.reservation.setInternalDepartureDriver(internalDepartureDriverConvert);
			this.reservation.setGuestAssistant(guestAssistantConvert);
			this.reservation.setExternalArrivalDriver(externalArravalDriverConvert);
			this.reservation.setExternalDepartureDriver(externalDepartureDriverConvert);
			this.reservation.setResevationtype(resevationtypeConvert);
			this.reservation.setAgent(agentConvert);
			this.reservation.setCreditCardType(creditCardTypeConvert);
			this.reservation.setDiscount(discountConvert);
			this.reservation = new ReservationManager().saveOrUpdate(this.reservation);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public String delete(){
		try {
			new ReservationManager().delete(this.reservation);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	@Override
	public Object getModel() {
		// TODO Auto-generated method stub
		return this.reservation;
	}

	public Reservation getReservation() {
		return reservation;
	}

	public void setReservation(Reservation reservation) {
		this.reservation = reservation;
	}

	public List<Reservation> getReservations() {
		return reservations;
	}

	public void setReservations(List<Reservation> reservations) {
		this.reservations = reservations;
	}

	public Employee getInternalArrivalDriverConvert() {
		return internalArrivalDriverConvert;
	}


	public void setInternalArrivalDriverConvert(
			Employee internalArrivalDriverConvert) {
		this.internalArrivalDriverConvert = internalArrivalDriverConvert;
	}


	public Employee getInternalDepartureDriverConvert() {
		return internalDepartureDriverConvert;
	}


	public void setInternalDepartureDriverConvert(
			Employee internalDepartureDriverConvert) {
		this.internalDepartureDriverConvert = internalDepartureDriverConvert;
	}


	public Employee getGuestAssistantConvert() {
		return guestAssistantConvert;
	}


	public void setGuestAssistantConvert(Employee guestAssistantConvert) {
		this.guestAssistantConvert = guestAssistantConvert;
	}


	public Externaldriver getExternalArravalDriverConvert() {
		return externalArravalDriverConvert;
	}


	public void setExternalArravalDriverConvert(
			Externaldriver externalArravalDriverConvert) {
		this.externalArravalDriverConvert = externalArravalDriverConvert;
	}


	public Externaldriver getExternalDepartureDriverConvert() {
		return externalDepartureDriverConvert;
	}


	public void setExternalDepartureDriverConvert(
			Externaldriver externalDepartureDriverConvert) {
		this.externalDepartureDriverConvert = externalDepartureDriverConvert;
	}


	public Resevationtype getResevationtypeConvert() {
		return resevationtypeConvert;
	}


	public void setResevationtypeConvert(Resevationtype resevationtypeConvert) {
		this.resevationtypeConvert = resevationtypeConvert;
	}


	public Guest getGuestConvert() {
		return guestConvert;
	}


	public void setGuestConvert(Guest guestConvert) {
		this.guestConvert = guestConvert;
	}


	public Agent getAgentConvert() {
		return agentConvert;
	}


	public void setAgentConvert(Agent agentConvert) {
		this.agentConvert = agentConvert;
	}

	public CreditCardType getCreditCardTypeConvert() {
		return creditCardTypeConvert;
	}


	public void setCreditCardTypeConvert(CreditCardType creditCardTypeConvert) {
		this.creditCardTypeConvert = creditCardTypeConvert;
	}
	
	public Discount getDiscountConvert() {
		return discountConvert;
	}


	public void setDiscountConvert(Discount discountConvert) {
		this.discountConvert = discountConvert;
	}

	
}
