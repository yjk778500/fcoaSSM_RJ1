package com.entity;

/**
 * Employee entity. @author MyEclipse Persistence Tools
 */

public class Employee implements java.io.Serializable {

	// Fields

	private Integer sn;
	private Integer positionId;
	private Integer departmentId;
	private String name;
	private String password;
	private String status;
	private Position position;
	private Department department;

	// Constructors

	/** default constructor */
	public Employee() {
	}

	/** full constructor */
	

	// Property accessors

	public Integer getSn() {
		return this.sn;
	}

	public Employee(Integer sn, Integer positionId, Integer departmentId,
			String name, String password, String status, Position position) {
		super();
		this.sn = sn;
		this.positionId = positionId;
		this.departmentId = departmentId;
		this.name = name;
		this.password = password;
		this.status = status;
		this.position = position;
	}

	public void setSn(Integer sn) {
		this.sn = sn;
	}

	public Integer getPositionId() {
		return this.positionId;
	}

	public void setPositionId(Integer positionId) {
		this.positionId = positionId;
	}

	public Integer getDepartmentId() {
		return this.departmentId;
	}

	public void setDepartmentId(Integer departmentId) {
		this.departmentId = departmentId;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Position getPosition() {
		return position;
	}

	public void setPosition(Position position) {
		this.position = position;
	}

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}
	
	

}