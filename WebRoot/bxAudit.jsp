<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>详情</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="js/js/js/jquery-1.8.3.js"></script>
	<script type="text/javascript">
		function button(){
			  var positionId =${emp.positionId};
			  if(positionId==4){
			 	$("#button4").show();
			 	 $("#button1").hide();	
			 	  $("#button2").hide();	
			 	   $("#button3").hide();
				}else{
				 $("#button4").hide();	
				}
			}
	
	</script>
	
	
  </head>
  
 <body onload="button()" style="background-image:url('images/背景.jpg');" >
      <div id = "dd" style="margin: 100px;">
      <h3>基本信息</h3><br />
      <div style="float: left;">编号：${c.id}<br /><br />总金额：${c.totalAccount}</div>
      <div style="float: left;margin-left: 80px;">填写人：${c.createSn}<br /><br />填报时间：<span id=time>${c.createtime }</span></div>
      <div style="float: left;margin-left: 80px;">部门：${c.employee.name}<br /><br />状态：${c.status }</div>
      <div style="float: left;margin-left: 80px;">职位：${c.employee.password}<br /><br />待处理人：${c.nextDealSn}</div>
      <div style="float: left;width:1000px; "><br />----------------------------------------------------------------------------------------------<br /><br /></div>
      <div style="float: left;width:1000px; ">
      	 <table width="800" border="0" cellspacing="0" cellpadding="0">
		  	<tr>
		  			<td style="width: 150px;">项目类别</td>
		  			<td style="width: 150px;">项目金额</td>
		  			<td style="width: 150px;">费用说明</td>
		  	</tr>
		  	
    <c:forEach items="${item}" var="de" varStatus="vs">  
           	  <tr>  
                 <td>${de.item}</td>  
                 <td>${de.account}</td>  
                 <td>${de.des}</td>  
             </tr>  
    </c:forEach>
		  	
		  	
  		</table>
      </div>
      <div style="float: left;width:3000px; "><br />----------------------------------------------------------------------------------------------<br /><br /></div>
    <div style="float: left;width:1000px; ">
    	审批意见：<textarea name="reason" style="width:633px;height: 100px;"></textarea><br /><br />
    	</div>
        <div style="float: left;width:1000px; "><br />----------------------------------------------------------------------------------------------<br /><br /></div>
       	
       	<div style="float: left;width:1000px; " id="button">
       		<button type="button" id="button1" style="width: 100px;height: 30px;" onclick="javascript:window.location.href='bx/Audit1?status=已审批&&id=${c.id}&&totalAccount=${c.totalAccount}';">审批通过</button>
       		<button type="button" id="button2" style="width: 100px;height: 30px;" onclick="javascript:window.location.href='bx/Audit1?status=已拒绝&&id=${c.id}&&totalAccount=${c.totalAccount}';">审批拒绝</button>
       		<button type="button" id="button3" style="width: 100px;height: 30px;" onclick="javascript:window.location.href='bx/Audit1?status=已打回&&id=${c.id}&&totalAccount=${c.totalAccount}';">打回</button>
       		<button type="button" id="button4" style="width: 100px;height: 30px;" onclick="javascript:window.location.href='bx/Audit1?status=已付款&&id=${c.id}&&totalAccount=${c.totalAccount}';">付款</button>
       	</div>
       	<div style="float: left;width:1000px; ">
       	<br /><br />
       	<button type="button" style="width: 100px;height: 30px;" onclick="javascript:window.location.href='findbx.jsp';">返回</button>
       </div>
      </div>
  </body>
</html>