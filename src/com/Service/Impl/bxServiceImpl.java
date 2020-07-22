package com.Service.Impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Service.bxService;
import com.dao.bxDao;
import com.entity.CVdetail;
import com.entity.Cvoucher;
@Service("bService")
public class bxServiceImpl implements bxService {
	@Autowired
	private bxDao bDao;
	public List<Cvoucher> findbx(Map<String, Object> map) {
		
		return bDao.findbx(map);
	}
	
	public int count() {
		
		return bDao.count();
	}

	@Override
	public Cvoucher findDetails(Cvoucher c) {
		
		return bDao.findDetails(c);
	}

	@Override
	public int updatebx( Cvoucher c) {
		
		return bDao.updatebx(c);
	}

	@Override
	public int addbx(Cvoucher c) {
		c.setCreateTime(new Date());
		bDao.addbx(c);
		int id = c.getId();
		return id;
	}

	@Override
	public int addDetail(CVdetail de) {
		
		return bDao.addDetail(de);
	}

	@Override
	public List<CVdetail> finditem(int id) {
		
		return bDao.finditem(id);
	}

	@Override
	public int delitem(int main) {
		
		return bDao.delitem(main);
	}

	@Override
	public int updateStatus(Cvoucher c) {
		
		return bDao.updateStatus(c);
	}

	@Override
	public int findDm(String department) {
		
		return bDao.findDm(department);
	}

}
