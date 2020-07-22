package com.Service;

import java.util.List;
import java.util.Map;

import com.entity.Leave;
import com.entity.LeaveItem;

public interface leaveService {
	public int addLeave(Leave le);
	public int addLeaveitem(LeaveItem it);
	public List<Leave> findleave(Map<String, Object> map);
	public int count();
	public Leave findLeDetail(Leave l);
}
