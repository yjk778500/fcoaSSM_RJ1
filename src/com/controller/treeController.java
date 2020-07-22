package com.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.Service.treeService;
import com.entity.Employee;
import com.entity.Tree;

@Controller
@RequestMapping("tree")
public class treeController {
	@Autowired
	private treeService treeService;
	@RequestMapping("gettree")
	@ResponseBody
	public List<Tree> gettree(HttpSession session){
		List<Tree> lt = treeService.findTree();
		List<Tree> children1 = new ArrayList<Tree>();
		List<Tree> children2 = new ArrayList<Tree>();
		List<Tree> child1 = new ArrayList<Tree>();
		List<Tree> child = new ArrayList<Tree>();
		for(Tree t:lt){
			if(t.getLv()==5){
				children1.add(new Tree(t.getId(),t.getText(), t.getUrl()));
			}else if(t.getLv()==7){
				children2.add(new Tree(t.getId(),t.getText(), t.getUrl()));
			}else if(t.getLv()==2){
				child1.add(new Tree(t.getId(),t.getText(), children1));	
			}else if(t.getLv()==3){
				child1.add(new Tree(t.getId(),t.getText(), children2));	
			}else if(t.getLv()==1){
				child.add(new Tree(t.getId(),t.getText(), child1));
			}		
		}
		Employee emp = (Employee) session.getAttribute("emp");
		if (emp.getPositionId()!=null && emp.getPositionId()==1||emp.getPositionId()==2) {
			for(Tree t:lt){
				if(t.getLv()==4){
					children1.add(new Tree(t.getId(),t.getText(), t.getUrl()));
				}else if(t.getLv()==6){
					children2.add(new Tree(t.getId(),t.getText(), t.getUrl()));
				}
			}
		} 

		return child;
		
	}
	
	

}
