package com.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.Service.employeeService;
import com.entity.Employee;

@Controller
@RequestMapping("emp")
public class employeeController {
	@Autowired
	private employeeService empService;
	@RequestMapping("login")
	public String login(@ModelAttribute("e") Employee emp,HttpSession session) throws UnsupportedEncodingException{
		//emp.setName(new String(emp.getName().getBytes("ISO-8859-1"),"utf-8"));
		emp = empService.findemp(emp);
		if (emp!=null) {
			session.setAttribute("emp", emp);
			return "index";
		} else {
			return "login";
		}
	}
	@RequestMapping("Remove")
	public String removeSession(HttpSession session){
		session.invalidate();
		return "login";
	}
	
	@RequestMapping("register")
	public String register(@ModelAttribute("emp") Employee emp,HttpSession session) throws UnsupportedEncodingException{
		emp.setName(new String(emp.getName().getBytes("ISO-8859-1"),"utf-8"));
		int i = empService.addemp(emp);
		session.setAttribute("sn", i);
		return "rgError";	
		
	}

}
