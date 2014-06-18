package com.hotel.action;


import java.util.List;


import com.hotel.dao.ShiftManager;
import com.hotel.entity.Shift;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;


	@SuppressWarnings("rawtypes")
	public class ShiftAction extends ActionSupport implements ModelDriven {

		/**
		 * 
		 */
		private static final long serialVersionUID = 1L;
		private Shift shift;
		private List<Shift> shifts;

		public ShiftAction() {
			super();
			this.shift = new Shift();
		}

		public String search() {
			try {
				this.shifts = new ShiftManager().search();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return SUCCESS;
		}

		public String addOrUpdate() {
			System.out.println("********shift+++++++++++");
			try {
				System.out.println(shift.getShiftName());
				this.shift = new ShiftManager().saveOrUpdate(this.shift);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return SUCCESS;
		}
		public String delete(){
			try {
				System.out.print("************delete action");
				new ShiftManager().delete(shift);
			} catch (Exception e) {
				e.printStackTrace();
				//error bean
			}
			return SUCCESS;
		}

		@Override
		public Object getModel() {
			// TODO Auto-generated method stub
			return this.shift;
		}

		public Shift getShift() {
			return shift;
		}

		public void setShift(Shift shift) {
			this.shift = shift;
		}

		public List<Shift> getShifts() {
			return shifts;
		}

		public void setShifts(List<Shift> shifts) {
			this.shifts = shifts;
		}

		
	}
	
