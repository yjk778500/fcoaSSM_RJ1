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
	
	</script>
	
	
  </head>
  
 <body style="background-image:url('images/背景.jpg');">
      <div id = "dd" style="margin: 100px;">
      <h3>基本信息</h3><br />
      <div style="float: left;">姓名：${l.employee.name}<br /><br />开始时间：${l.starttime}</div>
      <div style="float: left;margin-left: 80px;">部门：${l.employee.password}<br /><br />结束时间：${l.endtime }</div>
      <div style="float: left;margin-left: 80px;">请假天数：${l.leaveDay}<br /><br />休假类型：${l.leaveType}</div>
      <div style="float: left;margin-left: 80px;">请假事由：${l.reason}<br /><br />审批状态：${l.status}</div>
      <div style="float: left;width:1000px; "><br />----------------------------------------------------------------------------------------------<br /><br /></div>
      <div style="float: left;width:1000px; ">
       <div style="float: left;width:1000px; ">
    	审批意见：<textarea name="reason" style="width:633px;height: 100px;"></textarea><br /><br />
    	</div>
      	<div style="float: left;width:1000px; ">
       		<form action="findleave.jsp">
       		<input type="submit" value="返回" style="width: 100px;height: 30px;">
       		</form>
       	</div>
      </div>
      </div>
  </body>
</html>