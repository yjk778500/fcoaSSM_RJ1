package com.dao;

import com.entity.Employee;
import com.entity.Position;

public interface employeeDao {
	//此接口中定义的方法名一定要和Mapper文件中 增删改查 操作标签的ID保持一致 否则无法省掉实现类
	public Employee findemp(Employee emp);
	public int addemp(Employee emp);
	public Position findpo(Position po);
}
