package com.dao;

import java.util.List;
import java.util.Map;

import com.entity.CVdetail;
import com.entity.Cvoucher;

public interface bxDao {
	//查询报销单
	public List<Cvoucher> findbx(Map<String, Object> map);
	//计数
	public int count();
	//查询报销单详情
	public Cvoucher findDetails(Cvoucher c);
	//查询报销单item列表项
	public List<CVdetail> finditem(int id);
	//修改报销单
	public int updatebx(Cvoucher c);
	//添加报销单
	public int addbx(Cvoucher c);
	public int findDm(String department);
	//添加报销单item列表项
	public  int addDetail(CVdetail de);
	public int delitem(int main);
	//审核
	public int updateStatus(Cvoucher c);
	

}
