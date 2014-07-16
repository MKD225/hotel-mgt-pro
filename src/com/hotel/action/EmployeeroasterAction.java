package com.hotel.action;

import java.util.List;

import com.hotel.dao.EmployeeroasterManager;
import com.hotel.entity.Employee;
import com.hotel.entity.Employeeroaster;
import com.hotel.entity.Shift;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@SuppressWarnings("rawtypes")
public class EmployeeroasterAction extends ActionSupport implements ModelDriven{

	private static final long serialVersionUID = 1L;
	private Employeeroaster employeeroaster;
	private List<Employeeroaster> employeeroasters;
	private Employee employeeConvert;
	private Shift shiftConvert;

	

	public EmployeeroasterAction() {
		super();
		this.employeeroaster = new Employeeroaster();

	}

	public String search() {
		try {
			this.employeeroasters = new EmployeeroasterManager().search();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	

	public String addOrUpdate() {
		try {
			System.out.println("*****in calander add");
			System.out.println(employeeroaster.getRemarks());
			this.employeeroaster.setEmployee(employeeConvert);
			this.employeeroaster.setShift(shiftConvert);
			this.employeeroaster = new EmployeeroasterManager().saveOrUpdate(this.employeeroaster);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public String delete() {
		try {
			this.employeeroaster = new EmployeeroasterManager().delete(this.employeeroaster);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	@Override
	public Object getModel() {
		// TODO Auto-generated method stub
		return this.employeeroaster;
	}

	public Employeeroaster getEmployeeroaster() {
		return employeeroaster;
	}

	public void setEmployeeroaster(Employeeroaster employeeroaster) {
		this.employeeroaster = employeeroaster;
	}

	public List<Employeeroaster> getEmployeeroasters() {
		return employeeroasters;
	}

	public void setEmployeeroasters(List<Employeeroaster> employeeroasters) {
		this.employeeroasters = employeeroasters;
	}

	public Employee getEmployeeConvert() {
		return employeeConvert;
	}

	public void setEmployeeConvert(Employee employeeConvert) {
		this.employeeConvert = employeeConvert;
	}

	public Shift getShiftConvert() {
		return shiftConvert;
	}

	public void setShiftConvert(Shift shiftConvert) {
		this.shiftConvert = shiftConvert;
	}
	
}
