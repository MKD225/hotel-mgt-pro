package com.hotel.action;

import java.util.List;

import com.hotel.dao.EmployeeManager;
import com.hotel.entity.Department;
import com.hotel.entity.Employee;
import com.hotel.entity.Privilege;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@SuppressWarnings("rawtypes")
public class EmployeeAction extends ActionSupport implements ModelDriven {

	private static final long serialVersionUID = 1L;
	private Employee employee;
	private List<Employee> employees;
	private Department departmentConvert;
	private Privilege privilegeConvert;

	

	public EmployeeAction() {
		super();
		this.employee = new Employee();

	}

	public String search() {
		try {
			this.employees = new EmployeeManager().search();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public String addOrUpdate() {
		try {
			System.out.println("*****in calander add");
			System.out.println(employee.getLastName());
			this.employee.setDepartment(departmentConvert);
			this.employee.setPrivilege(privilegeConvert);
			this.employee = new EmployeeManager().saveOrUpdate(this.employee);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public String delete() {
		try {
			this.employee = new EmployeeManager().delete(this.employee);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	@Override
	public Object getModel() {
		// TODO Auto-generated method stub
		return this.employee;
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public List<Employee> getEmployees() {
		return employees;
	}

	public void setEmployees(List<Employee> employees) {
		this.employees = employees;
	}

	public Department getDepartmentConvert() {
		return departmentConvert;
	}

	public void setDepartmentConvert(Department departmentConvert) {
		this.departmentConvert = departmentConvert;
	}
	
	public Privilege getPrivilegeConvert() {
		return privilegeConvert;
	}

	public void setPrivilegeConvert(Privilege privilegeConvert) {
		this.privilegeConvert = privilegeConvert;
	}

}
