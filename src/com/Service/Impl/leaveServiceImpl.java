package com.Service.Impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Service.leaveService;
import com.dao.leaveDao;
import com.entity.Leave;
import com.entity.LeaveItem;
@Service("leService")

public class leaveServiceImpl implements leaveService {
	@Autowired
	private leaveDao lDao;

	
	public int addLeave(Leave le) {
		
		return lDao.addLeave(le);
	}


	@Override
	public List<Leave> findleave(Map<String, Object> map) {
		
		return lDao.findleave(map);
	}


	@Override
	public int count() {
		
		return lDao.count();
	}


	@Override
	public int addLeaveitem(LeaveItem it) {
		
		return lDao.addLeaveitem(it);
	}


	@Override
	public Leave findLeDetail(Leave l) {
		
		return lDao.findLeDetail(l);
	}

}
