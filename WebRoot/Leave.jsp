<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Leave.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script src="js/jquery-1.8.3.js" type="text/javascript"></script>
	<script type="text/javascript">
	
	function setRuleContent(){
			var options=$("#select2 option:selected").text();
			document.getElementById("type").value=options;
			var options1=$("#select3 option:selected").text();
			document.getElementById("next").value=options1;
			
	}
	function day(){
		 var s1 =document.getElementById("date_1").value;
		 s1 = new Date(s1.replace(/-/g, "/")); 
		 var s2 =document.getElementById("date_2").value;
		 s2 = new Date(s2.replace(/-/g, "/"));
		 if(s1>s2){
		 	alert("开始时间不能大于结束时间");
		 	$("#date_1").val("");
		 	$("#date_2").val("");
		 }else{
			 var days = s2.getTime() - s1.getTime(); 
			 var time = parseInt(days / (1000 * 60 * 60 * 24));
			 document.getElementById("leaaveday").value=time;
			 var ld = document.getElementById("leaaveday").value
		 };
		 
		  
	}
		
	
	</script>

  </head>
  
  <body style="background-image:url('images/背景.jpg');">
   <div style="text-align: center;margin: 80px;">
   		<form action="leave/add" style="height: 800px;">
	   		<div style="float: left;margin-left: 50px;">
	   			姓名：<input type="text" name="name" value="${emp.name}" style="width:240px;height: 30px;"><br /><br />
	   			开始时间：<input type="date" id="date_1" name="startTime" style="width:240px;height: 30px;"><br /><br />
	   			请假天数：<input type="text" id="leaaveday" name="leaveDay"  style="width:240px;height: 30px;"><br /><br />
	   		</div>
   			<div style="float: left;margin-left: 100px;">
   				 部门： <select id="select1" style="width:245px;height: 36px;"> 
								<option value="1">请选择....</option>
								<option value="2">财务部</option>
								<option value="3">研发部</option>
								<option value="4">信息部</option>
							</select>
					<input type="hidden" name="" value=""><br /><br />
   				结束时间：<input type="date" id="date_2" name="endTime"  style="width:240px;height: 30px;" onchange="day();"><br /><br />
   				休假类型：<select id="select2" name="leaveType" style="width:245px;height: 36px;" onchange="setRuleContent();"> 
								<option value="1">请选择....</option>
								<option value="2">年假</option>
								<option value="3">事假</option>
								<option value="4">差假</option>
							</select>
							<input type="hidden" name="leaveType" id="type" value="">
							<br /><br />   	
   			</div> 
   			
   			<div style="float: left;margin-left: 50px;">
   			请假事由：
			
			<textarea name="reason" style="width:633px;height: 100px;"></textarea><br /><br />
   			</div>
   			<div style="float: left;width: 500px;height: 130px;"></div>		
			
			<div style="float: left;margin-left: 50px;">
				下一审批人：
   						<select id="select3" name="nextDealSn" style="width:240px;height: 30px;" onchange="setRuleContent();"> 
								<option value="1">请选择....</option>
								<option value="2">虞姬</option>
								<option value="3">宫本</option>
								<option value="4">锴</option>
							</select>
						<input type="hidden" name="nextDealSn" id="next" value="">	
							<br /><br />
			<button type="submit"  style="width: 100px;height: 30px;">提交流程</button>
			
			</div>
   			
			
   			
   		<!-- 	<input type="submit" value="取消" style="width: 100px;height: 30px;"> -->
   			
   	</form>
   
   </div>
  </body>
</html>
