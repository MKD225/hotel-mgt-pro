package com.hotel.action;

import java.util.List;

import com.hotel.dao.PrivilegeManager;
import com.hotel.entity.Menu;
import com.hotel.entity.Room;
import com.hotel.entity.Privilege;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@SuppressWarnings("rawtypes")
public class PrivilegeAction extends ActionSupport implements ModelDriven {

	private static final long serialVersionUID = 1L;
	private Privilege privilege;
	private List<Privilege> privileges;
	private Menu menuConvert;

	public PrivilegeAction() {
		super();
		this.privilege = new Privilege();
	}


	public String search() {
		try {
			this.privileges = new PrivilegeManager().search();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public String addOrUpdate() {
		try {
			System.out.println("*****in calander add");
			System.out.println(privilege.getPrivilegeType());
			this.privilege.setMenu(menuConvert);
			this.privilege = new PrivilegeManager().saveOrUpdate(this.privilege);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	public String delete(){
		try {
			new PrivilegeManager().delete(this.privilege);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	@Override
	public Object getModel() {
		// TODO Auto-generated method stub
		return this.privilege;
	}

	public Privilege getPrivilege() {
		return privilege;
	}

	public void setPrivilege(Privilege privilege) {
		this.privilege = privilege;
	}

	public List<Privilege> getPrivileges() {
		return privileges;
	}

	public void setPrivileges(List<Privilege> privileges) {
		this.privileges = privileges;
	}

	public Menu getMenuConvert() {
		return menuConvert;
	}

	public void setMenuConvert(Menu menuConvert) {
		this.menuConvert = menuConvert;
	}
	

}
