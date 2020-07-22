package com.Service;

import java.util.List;
import java.util.Map;

import com.entity.CVdetail;
import com.entity.Cvoucher;

public interface bxService {
	public List<Cvoucher> findbx(Map<String, Object> map);
	public int count();
	public Cvoucher findDetails(Cvoucher c);
	public List<CVdetail> finditem(int id);
	public int updatebx(Cvoucher c);
	public int addbx(Cvoucher c);
	public int findDm(String department);
	public  int addDetail(CVdetail de);
	public int delitem(int main);
	public int updateStatus(Cvoucher c);

}
