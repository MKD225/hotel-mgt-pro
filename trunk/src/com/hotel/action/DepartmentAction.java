package com.hotel.action;
import java.util.List;

import com.hotel.entity.Department;
import com.hotel.entity.Employee;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.hotel.dao.DepartmentManager;


	@SuppressWarnings("rawtypes")
	public class DepartmentAction extends ActionSupport implements ModelDriven {
		

			private static final long serialVersionUID = 1L;
			private Department department;
			private List<Department> departments;
			private Employee employeeConvert;

			public DepartmentAction() {
				super();
				this.department = new Department();
			}


			public String search() {
				try {
					this.departments = new DepartmentManager().search();
				} catch (Exception e) {
					e.printStackTrace();
				}
				return SUCCESS;
			}

			public String addOrUpdate() {
				try {
					System.out.println("*****in department add");
					System.out.println(department.getDepartmentCode());
					this.department.setEmployee(employeeConvert);
					this.department = new DepartmentManager().saveOrUpdate(this.department);
				} catch (Exception e) {
					e.printStackTrace();
				}
				return SUCCESS;
			}

			public String delete(){
				try {
					new DepartmentManager().delete(this.department);
				} catch (Exception e) {
					e.printStackTrace();
				}
				return SUCCESS;
			}

			@Override
			public Object getModel() {
				// TODO Auto-generated method stub
				return this.department;
			}

			public Department getDepartment() {
				return department;
			}

			public void setDepartment(Department department) {
				this.department = department;
			}

			public List<Department> getDepartments() {
				return departments;
			}

			public void setDepartments(List<Department> departments) {
				this.departments = departments;
			}

			
			public Employee getEmployeeConvert() {
				return employeeConvert;
			}


			public void setEmployeeConvert(Employee employeeConvert) {
				this.employeeConvert = employeeConvert;
			}
		
	}


