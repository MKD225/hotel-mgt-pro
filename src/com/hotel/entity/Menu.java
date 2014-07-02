package com.hotel.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name= "menu")
public class Menu {
	
	private int menuId;
	private String name;
	private String action;
	private String description;
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="menuId")
	public int getMenuId() {
		return menuId;
	}
	public void setMenuId(int menuId) {
		this.menuId = menuId;
	}
	
	@Column(name="name")
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Column(name="action")
	public String getAction() {
		return action;
	}
	public void setAction(String action) {
		this.action = action;
	}
	
	@Column(name="description")
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	

}
