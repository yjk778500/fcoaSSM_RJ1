package com.Service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Service.treeService;
import com.dao.treeDao;
import com.entity.Tree;

@Service("treeService")
public class treeServicrImpl implements treeService {
	@Autowired
	private treeDao tDao;
	public List<Tree> findTree() {
		
		return tDao.findTree();
	}

}
