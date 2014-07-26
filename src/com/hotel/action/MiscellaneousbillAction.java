package com.hotel.action;

import java.util.List;

import com.hotel.dao.MiscellaneousbillManager;
import com.hotel.entity.Allocationroom;
import com.hotel.entity.Employee;
import com.hotel.entity.Miscellaneousbill;
import com.hotel.entity.Room;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@SuppressWarnings("rawtypes")
public class MiscellaneousbillAction extends ActionSupport implements ModelDriven {
	
	private static final long serialVersionUID = 1L;
	private Miscellaneousbill miscellaneousbill;
	private List<Miscellaneousbill> miscellaneousbills;
	private Room roomConvert;
	private Employee employeeConvert;
		

	public MiscellaneousbillAction() {
		super();
		this.miscellaneousbill = new Miscellaneousbill();

	}

	public String search() {
		try {
			this.miscellaneousbills = new MiscellaneousbillManager().search();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public String addOrUpdate() {
		try {
			System.out.println("*****in calander add");
			System.out.println(miscellaneousbill.getMiscellaneousBillId());
			//this.miscellaneousbill.set(roomConvert);
			this.miscellaneousbill.setEmployee(employeeConvert);
			this.miscellaneousbill = new MiscellaneousbillManager().saveOrUpdate(this.miscellaneousbill);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public String delete() {
		try {
			this.miscellaneousbill = new MiscellaneousbillManager().delete(this.miscellaneousbill);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	@Override
	public Object getModel() {
		// TODO Auto-generated method stub
		return this.miscellaneousbill;
	}

	public Miscellaneousbill getMiscellaneousbill() {
		return miscellaneousbill;
	}

	public void setMiscellaneousbill(Miscellaneousbill miscellaneousbill) {
		this.miscellaneousbill = miscellaneousbill;
	}

	public List<Miscellaneousbill> getMiscellaneousbills() {
		return miscellaneousbills;
	}

	public void setMiscellaneousbills(List<Miscellaneousbill> miscellaneousbills) {
		this.miscellaneousbills = miscellaneousbills;
	}

//	public Allocationroom getAllocationroomConvert() {
//		return allocationroomConvert;
//	}
//
//	public void setAllocationroomConvert(Allocationroom allocationroomConvert) {
//		this.allocationroomConvert = allocationroomConvert;
//	}

	public Employee getEmployeeConvert() {
		return employeeConvert;
	}

	public void setEmployeeConvert(Employee employeeConvert) {
		this.employeeConvert = employeeConvert;
	}
}
