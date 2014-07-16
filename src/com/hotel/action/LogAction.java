package com.hotel.action;

import java.util.List;

import com.hotel.dao.LogManager;
import com.hotel.entity.Employee;
import com.hotel.entity.Log;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@SuppressWarnings("rawtypes")
public class LogAction extends ActionSupport implements ModelDriven {

	
	private static final long serialVersionUID = 1L;
	private Log log;
	private List<Log> logs;
	private Employee employeeConvert;
	

	public LogAction() {
		super();
		this.log = new Log();

	}

	public String search() {
		try {
			this.logs = new LogManager().search();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public String addOrUpdate() {
		try {
			System.out.println("*****in calander add");
			System.out.println(log.getTime());
			this.log.setEmployee(employeeConvert);
			this.log = new LogManager().saveOrUpdate(this.log);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public String delete() {
		try {
			this.log = new LogManager().delete(this.log);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	@Override
	public Object getModel() {
		// TODO Auto-generated method stub
		return this.log;
	}

	public Log getLog() {
		return log;
	}

	public void setLog(Log log) {
		this.log = log;
	}

	public List<Log> getLogs() {
		return logs;
	}

	public void setLogs(List<Log> logs) {
		this.logs = logs;
	}

	public Employee getEmployeeConvert() {
		return employeeConvert;
	}

	public void setEmployeeConvert(Employee employeeConvert) {
		this.employeeConvert = employeeConvert;
	}
}
