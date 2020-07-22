package com.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;

import com.Service.leaveService;
import com.entity.Employee;
import com.entity.Leave;
import com.entity.LeaveItem;

@Controller
@RequestMapping("leave")
public class leaveController {
	@Autowired
	private leaveService leService;
	
	@InitBinder  
    public void initBinder(WebDataBinder binder, WebRequest request) {  
          
        //转换日期  
        DateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd"); 
        dateFormat.setLenient(false);  
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));// CustomDateEditor为自定义日期编辑器  
    }  
	@RequestMapping("add")
	public String addLeave(@ModelAttribute("l") Leave le,HttpSession session){
		
		Employee emp = (Employee) session.getAttribute("emp");
		le.setEmpSN("" + emp.getSn());
		
		leService.addLeave(le);
		LeaveItem it = new LeaveItem();
		it.setLeaveId(""+le.getId());
		it.setCreatTime(new Date());
		it.setLeaveName(emp.getName()+"请假"+le.getLeaveDay()+"天");
		leService.addLeaveitem(it);
		return "findleave";
	}
	@RequestMapping("find")
	@ResponseBody
	public Map<String, Object> findleave(int page,int rows){
		Map<String, Object> map = new HashMap<String, Object>(); 
		Map<String, Object> map1 = new HashMap<String, Object>(); 
		map1.put("page", (page-1)*rows);
		map1.put("rows", rows);
		List<Leave> le = leService.findleave(map1);
		int total = leService.count();
		map.put("rows",le);
		map.put("total",total);
		return map;
	}
	@RequestMapping("Details")
	public ModelAndView findledetail(int Id){
		Leave l = new Leave();
		l.setId(Id);
		ModelAndView mav = new ModelAndView("leaveDetail");
		l = leService.findLeDetail(l);
		String dateStr = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(l.getStartTime());
		l.setStarttime(dateStr);
		String dateStr1 = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(l.getEndTime());
		l.setEndtime(dateStr1);
		mav.addObject("l",l);
		return mav;
		
	}
	

}
