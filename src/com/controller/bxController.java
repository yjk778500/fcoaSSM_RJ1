package com.controller;

import java.text.DateFormat;
import java.text.ParseException;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;

import com.Service.bxService;
import com.entity.CVdetail;
import com.entity.Cvoucher;
import com.entity.Employee;

@Controller
@RequestMapping("bx")
public class bxController {
	@Autowired
	private bxService bService;
	
	
	@InitBinder  
    public void initBinder(WebDataBinder binder, WebRequest request) {  
          
        //转换日期  
        DateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd"); 
        dateFormat.setLenient(false);  
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));// CustomDateEditor为自定义日期编辑器  
    }  
	
	@RequestMapping("find")
	@ResponseBody
	public Map<String, Object>  find(int page,int rows,HttpSession session,String status,Date createTime,Date createTime1){
		Map<String, Object> map = new HashMap<String, Object>(); 
		Map<String, Object> map1 = new HashMap<String, Object>(); 
		Employee emp = (Employee) session.getAttribute("emp");
		if (emp.getPositionId()==1) {
			map1.put("createSN", emp.getSn());
		} else if (emp.getPositionId()==2) {
			map1.put("department", emp.getPosition().getNameEn());
		}else if (emp.getPositionId()==3) {
			
		}else if (emp.getPositionId()==4) {
			map1.put("status", "已审批");
		}
		map1.put("page", (page-1)*rows);
		map1.put("rows", rows);
		if(status!=""){
			map1.put("status", status);
		}if(createTime!=null){
			map1.put("createTime", createTime);
		}if(createTime1!=null){
			map1.put("createTime1", createTime1);
		}
		List<Cvoucher> list = bService.findbx(map1);
		int total = bService.count();
		map.put("rows",list);
		map.put("total",total);
		map.put("emp", emp);
		return map;
		
	}
	//查看报销单详情
	@RequestMapping("Details")
	public ModelAndView findDetails(Cvoucher c,int Id) throws ParseException{
		c.setId(Id);	
		ModelAndView mav = new ModelAndView("findDetails");
		c = bService.findDetails(c);
		String dateStr = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(c.getCreateTime());
		c.setCreatetime(dateStr);
		if (c.getModifyTime()==null) {
			c.setModifytime("");
		} else {
			String dateStr1 = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(c.getModifyTime());
			c.setModifytime(dateStr1);
		}
		List<CVdetail> item = bService.finditem(Id);
		mav.addObject("item",item);
		mav.addObject("c",c);
		return mav;
	
	}
	//修改报销单
	@RequestMapping("update")
	public ModelAndView bxUpdate(Cvoucher c,int Id){
		c.setId(Id);	
		ModelAndView mav = new ModelAndView("bxUpdate");
		c = bService.findDetails(c);
		String dateStr = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(c.getCreateTime());
		c.setCreatetime(dateStr);
		List<CVdetail> item = bService.finditem(Id);
		mav.addObject("item",item);
		mav.addObject("c",c);
		
		return mav;
		
	}
	
	@RequestMapping("update1")
	public String updatebx(CVdetail de,Cvoucher c){
		bService.delitem(c.getId());
		for(int i = 0; i<c.getDetailList().size();i++){
			 c.getDetailList().get(i).setMainID(c.getId());
			de.setMainID( c.getDetailList().get(i).getMainID());
			 de.setAccount(c.getDetailList().get(i).getAccount());
			 de.setItem(c.getDetailList().get(i).getItem());
			 de.setDes(c.getDetailList().get(i).getDes());
			 bService.addDetail(de);
		 }
		c.setModifyTime(new Date());
		bService.updatebx(c);
		return "findbx";
		
	}
	
	//添加报销单
	@RequestMapping("add")
	public String addbx(Cvoucher cv,HttpSession session){
		Employee emp = (Employee) session.getAttribute("emp");
		cv.setStatus("新创建");
		int sn = bService.findDm(emp.getPosition().getNameEn());
		String sn1 =""+sn;
		cv.setNextDealSn(sn1);
	
		
		int id =  bService.addbx(cv);
		CVdetail de = new CVdetail();
		 for(int i = 0; i<cv.getDetailList().size();i++){
			 cv.getDetailList().get(i).setMainID(id);
			de.setMainID( cv.getDetailList().get(i).getMainID());
			 de.setAccount(cv.getDetailList().get(i).getAccount());
			 de.setItem(cv.getDetailList().get(i).getItem());
			 de.setDes(cv.getDetailList().get(i).getDes());
			 bService.addDetail(de);
		 }
		return "addOK";
	}
	
	//审批
	@RequestMapping("Audit")
	public ModelAndView bxAudit(Cvoucher c,int Id,HttpSession session) throws ParseException{
		c.setId(Id);	
		ModelAndView mav = new ModelAndView("bxAudit");
		c = bService.findDetails(c);
		String dateStr = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(c.getCreateTime());
		c.setCreatetime(dateStr);
		if (c.getModifyTime()==null) {
			c.setModifytime("");
		} else {
			String dateStr1 = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(c.getModifyTime());
			c.setModifytime(dateStr1);
		}
		Employee emp = (Employee) session.getAttribute("emp");
		List<CVdetail> item = bService.finditem(Id);
		mav.addObject("item",item);
		mav.addObject("c",c);
		mav.addObject("emp",emp);
		return mav;
	}
	@RequestMapping("Audit1")
	public String bxAudit1(Cvoucher c,HttpSession session){
		Employee emp = (Employee) session.getAttribute("emp");
		if (emp.getPositionId()==2) {
			if(c.getStatus().equals("已审批")){
				if(c.getTotalAccount()>5000){c.setNextDealSn("100106");}
					
			}
		} else {
			bService.updateStatus(c);
		}
		return "findbx";
		
	}
	

}
