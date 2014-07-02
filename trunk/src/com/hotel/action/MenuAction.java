package com.hotel.action;

import java.util.List;

import com.hotel.dao.MenuManager;
import com.hotel.entity.Menu;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@SuppressWarnings("rawtypes")
public class MenuAction extends ActionSupport implements ModelDriven {

	private static final long serialVersionUID = 1L;
	private Menu menu;
	private List<Menu> menus;

	public MenuAction() {
		super();
		this.menu = new Menu();
	}

	public String search() {
		try {
			this.menus = new MenuManager().search();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public String addOrUpdate() {
		try {
			System.out.println(menu.getName());
			this.menu = new MenuManager().saveOrUpdate(this.menu);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}
	public String delete(){
		try {
			new MenuManager().delete(this.menu);
		} catch (Exception e) {
			e.printStackTrace();
			//error bean
		}
		return SUCCESS;
	}

	@Override
	public Object getModel() {
		// TODO Auto-generated method stub
		return this.menu;
	}

	public Menu  getMenu() {
		return menu;
	}

	public void setResevationtype(Menu menu) {
		this.menu = menu;
	}

	public List<Menu> getMenus() {
		return menus;
	}

	public void setMenus(List<Menu> menus) {
		this.menus = menus;
	}

	
}
