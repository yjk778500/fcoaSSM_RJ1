package com.entity;

import java.util.Date;

public class LeaveItem {
	
		private int Id;
		private String leaveId;
		private String leaveName;
		private Date creatTime;
		private Date auditTime;
		private String auditOpinion;
		
		
		public int getId() {
			return Id;
		}
		public void setId(int id) {
			Id = id;
		}
		public String getLeaveId() {
			return leaveId;
		}
		public void setLeaveId(String leaveId) {
			this.leaveId = leaveId;
		}
		public String getLeaveName() {
			return leaveName;
		}
		public void setLeaveName(String leaveName) {
			this.leaveName = leaveName;
		}
		public Date getCreatTime() {
			return creatTime;
		}
		public void setCreatTime(Date creatTime) {
			this.creatTime = creatTime;
		}
		public Date getAuditTime() {
			return auditTime;
		}
		public void setAuditTime(Date auditTime) {
			this.auditTime = auditTime;
		}
		public String getAuditOpinion() {
			return auditOpinion;
		}
		public void setAuditOpinion(String auditOpinion) {
			this.auditOpinion = auditOpinion;
		}
		
		
 		
 
}
