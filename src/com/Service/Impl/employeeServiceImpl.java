package com.Service.Impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Service.employeeService;
import com.dao.employeeDao;
import com.entity.Employee;
import com.entity.Position;

@Service("empService")
public class employeeServiceImpl implements employeeService {
	@Autowired
	private employeeDao eDao;
	
	public Employee findemp(Employee emp) {
		
		return eDao.findemp(emp);
	}

	
	public int addemp(Employee emp) {
		 eDao.addemp(emp);
		
		return emp.getSn();
	}


	
	public Position findpo(Position po) {
		
		return eDao.findpo(po);
	}

	

}
