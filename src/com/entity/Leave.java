package com.entity;

import java.util.Date;

public class Leave {
	private int id;
	private String empSN;
	private Date startTime;
	private Date endTime;
	private double leaveDay;
	private String leaveType;
	private String reason;
	private String nextDealSn;
	private String apprcveOpinion;
	private String status;
	private Employee employee;
	private LeaveItem leaveItem;
	private String starttime;
	private String endtime;
	
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getEmpSN() {
		return empSN;
	}
	public void setEmpSN(String empSN) {
		this.empSN = empSN;
	}
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	public double getLeaveDay() {
		return leaveDay;
	}
	public void setLeaveDay(double leaveDay) {
		this.leaveDay = leaveDay;
	}
	public String getLeaveType() {
		return leaveType;
	}
	public void setLeaveType(String leaveType) {
		this.leaveType = leaveType;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getNextDealSn() {
		return nextDealSn;
	}
	public void setNextDealSn(String nextDealSn) {
		this.nextDealSn = nextDealSn;
	}
	public String getApprcveOpinion() {
		return apprcveOpinion;
	}
	public void setApprcveOpinion(String apprcveOpinion) {
		this.apprcveOpinion = apprcveOpinion;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Employee getEmployee() {
		return employee;
	}
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	public LeaveItem getLeaveItem() {
		return leaveItem;
	}
	public void setLeaveItem(LeaveItem leaveItem) {
		this.leaveItem = leaveItem;
	}
	public String getStarttime() {
		return starttime;
	}
	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}
	public String getEndtime() {
		return endtime;
	}
	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}
	
	
	
 
}
