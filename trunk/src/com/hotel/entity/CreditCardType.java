package com.hotel.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "creditCardType")
public class CreditCardType {

	private int creditCardTypeId;

	private String creditCardType;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "creditCardTypeId")
	public int getCreditCardTypeId() {
		return creditCardTypeId;
	}

	public void setCreditCardTypeId(int creditCardTypeId) {
		this.creditCardTypeId = creditCardTypeId;
	}

	@Column(name = "creditCardType")
	public String getCreditCardType() {
		return creditCardType;
	}

	public void setCreditCardType(String creditCardType) {
		this.creditCardType = creditCardType;
	}
}
