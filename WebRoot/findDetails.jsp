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
      
      <div style="float: left;">${c.event}(${c.poName})<br /><br />审核意见：</div>
       	<div style="float: left;margin-left: 100px;"><span id=time>${c.cresult.checktime }</span><br /><br /><br /></div>
       	<div style="float: left;margin-left: 100px;">审核：${c.cresult.result }<br /><br /><br /></div>
        <div style="float: left;width:3000px; "><br />----------------------------------------------------------------------------------------------<br /><br /></div>
       	
       	<div style="float: left;width:1000px; ">
       		<form action="findbx.jsp">
       		<input type="submit" value="返回" style="width: 100px;height: 30px;">
       		</form>
       	</div>
       	
       
      </div>
  </body>
</html>