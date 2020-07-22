package com.Service;


import com.entity.Employee;
import com.entity.Position;

public interface employeeService {
	public Employee findemp(Employee emp);
	public int addemp(Employee emp);
	public Position findpo(Position po);
}
