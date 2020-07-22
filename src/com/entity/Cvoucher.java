package com.entity;

import java.util.Date;
import java.util.List;

public class Cvoucher {
	
	private int id;
	private String nextDealSn;
	private String createSn;
	private Date createTime;
	private Date modifyTime;
	private String event;
	private int totalAccount;
	private String status;
	private String createtime;
	private String modifytime;
	private Employee employee;
	private Cresult cresult;
	private CVdetail cvdetail;
	private String poName;
	private String department;//报销单创建人所属部门
	private Date createTime1;//按照时间范围查询的时间
	private List<CVdetail> detailList;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNextDealSn() {
		return nextDealSn;
	}
	public void setNextDealSn(String nextDealSn) {
		this.nextDealSn = nextDealSn;
	}
	public String getCreateSn() {
		return createSn;
	}
	public void setCreateSn(String createSn) {
		this.createSn = createSn;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Date getModifyTime() {
		return modifyTime;
	}
	public void setModifyTime(Date modifyTime) {
		this.modifyTime = modifyTime;
	}
	public String getEvent() {
		return event;
	}
	public void setEvent(String event) {
		this.event = event;
	}
	public int getTotalAccount() {
		return totalAccount;
	}
	public void setTotalAccount(int totalAccount) {
		this.totalAccount = totalAccount;
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
	public String getCreatetime() {
		return createtime;
	}
	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}
	public Cresult getCresult() {
		return cresult;
	}
	public void setCresult(Cresult cresult) {
		this.cresult = cresult;
	}
	public CVdetail getCvdetail() {
		return cvdetail;
	}
	public void setCvdetail(CVdetail cvdetail) {
		this.cvdetail = cvdetail;
	}
	public String getPoName() {
		return poName;
	}
	public void setPoName(String poName) {
		this.poName = poName;
	}
	public List<CVdetail> getDetailList() {
		return detailList;
	}
	public void setDetailList(List<CVdetail> detailList) {
		this.detailList = detailList;
	}
	public String getModifytime() {
		return modifytime;
	}
	public void setModifytime(String modifytime) {
		this.modifytime = modifytime;
	}
	public Date getCreateTime1() {
		return createTime1;
	}
	public void setCreateTime1(Date createTime1) {
		this.createTime1 = createTime1;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	
	
	

}
