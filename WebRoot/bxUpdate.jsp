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
		$(document).ready(function(){ 
			$(".newone").click(function(){
				 
				   var options=$("#select option:selected").text();
			       var value = document.getElementById('account').value;
			       var value1 = document.getElementById('des').value;
			       var list =num.rows.length-1;
				   var $newPro ='';
				    $newPro =   '<tr>'
								+'<td style="width: 150px;">'
								+'<input name="detailList['+list+'].item" type="hidden" value="'+options+'">'
								+options
								+'</td>'
								+'<td style="width: 150px;">'
								+'<input name="detailList['+list+'].account" type="hidden" value=" '+value+'">'
								+value
								+'</td>'
								+'<td style="width: 150px;">'
								+'<input name="detailList['+list+'].des" type="hidden" value="'+value1+'">'
								+value1
								+'</td>'
								+'<td style="width: 150px;">'
								+'<img class=\'del\' src="images/del.png" onclick="rep(this)"/>'
								+'</td>'
								+'</tr>';
					$("table").append($newPro);
					var totalAccount=0;
					var old = document.getElementById("account2").value;
					totalAccount = parseFloat(totalAccount) + parseFloat(old) + parseFloat(value) ;
					 document.getElementById("account2").value=totalAccount;
					  $("#account").val("");
					 $("#des").val("");
					  $("#select").val("1");
				});
				$(".del").live('click',function(){
					//获取当前元素（this）所在tr之后的所有tr元素内的name开头是detail的input元素，并对input元素的name中的数字减1
					 $(this).closest("tr").nextAll("tr").find("input[name^=detail]").attr("name",function(i,v){
					        return v.replace(/\d+/g,function (s) {
					            return parseInt(s, 10)-1;
					        });
					    })
					$(this).closest('tr').remove();
					
					var value = $(this).parents('tr').children("td:nth-child(2)").text();
					var old = document.getElementById("account2").value
					var news =old-parseFloat(value);
					document.getElementById("account2").value=news;
				});
				
	});
			
	</script>
	
	
  </head>
  
 <body style="background-image:url('images/背景.jpg');">
      <div id = "dd" style=";margin: 100px;">
      <h3>基本信息</h3><br />
      <form action="bx/update1">
      <div style="float: left;">编号：<input name="id" type="hidden" value="${c.id}">${c.id}<br /><br />总金额：<input type="text"  id="account2" name="totalAccount" value=" ${c.totalAccount}" placeholder=" 0"  style="height: 16px;"></div>
      <div style="float: left;margin-left: 80px;">填写人：${c.createSn}<br /><br />填报时间：<span id=time>${c.createtime }</span></div>
      <div style="float: left;margin-left: 80px;">部门：${c.employee.name}<br /><br />状态：${c.status }</div>
      <div style="float: left;margin-left: 80px;">职位：${c.employee.password}<br /><br />待处理人：${c.nextDealSn}</div>
      <div style="float: left;width:1000px;"><br />----------------------------------------------------------------------------------------------<br /><br /></div>
      <div style="float: left;width:1000px;">
      	 <table width="800" border="0" cellspacing="0" cellpadding="0" id="num">
		  	<tr>
		  			<td style="width: 150px;">项目类别</td>
		  			<td style="width: 150px;">项目金额</td>
		  			<td style="width: 150px;">费用说明</td>
		  			<td style="width: 150px;">操作</td>
		  	</tr>
		  	<c:forEach items="${item}" var="de" varStatus="id"> 
		            <tr>
		                 <td>${de.item}<input name="detailList[${id.index}].item" type="hidden" value="${de.item}" /></td>  
		                 <td>${de.account}<input name="detailList[${id.index}].account" type="hidden" value="${de.account}" /></td>  
		                 <td>${de.des}<input name="detailList[${id.index}].des" type="hidden" value="${de.des}" /></td>  
		                 <td><img class="del"src="images/del.png" onclick="rep(this)"/></td>
		             </tr>  
   			 </c:forEach>  
		  	
		  	
  		</table>
  		<div style="width: 150px; float: left;">
  		<select id="select"> 
								<option value="1">请选择....</option>
								<option value="2">城际交通费</option>
								<option value="3">交际餐费</option>
								<option value="4">办公费</option>
							</select>
  		</div>
  		<div style="width: 150px; float: left;margin-left: 48px;">
  		<input type="text" id ="account" name="account"></input>
  		</div>
  		<div style="width: 150px; float: left;margin-left: 48px;">
  		<input type="text" id ="des" name="des"></input>
  		</div>
  		<div style="width: 150px; float: left;margin-left: 48px;">
  		<input class=" newone" type = "button"  id="add" value="+" style="width:26px ;height: 25px; margin-left: 6px;" />
  		</div>
  		
   		
      </div>
      
    	<div style="float: left;width:1000px; "><br />----------------------------------------------------------------------------------------------<br /><br /></div>
    	<div style="float: left;width:1000px; ">
    	*事由：<textarea name="reason" style="width:633px;height: 100px;"></textarea><br /><br />
    	</div>
    	
        <div style="float: left;width:1000px; "><br />----------------------------------------------------------------------------------------------<br /><br /></div>
       	<div style="float: left;width:1000px; ">
       	<button type="submit"  style="width: 100px;height: 30px;">提交</button>
       	<button type="button" style="width: 100px;height: 30px;">保存</button>
     	<button type="button" style="width: 100px;height: 30px;" onclick="javascript:window.location.href='findbx.jsp';">返回</button>
       	</div>
       	
       </form>
      </div>
  </body>
</html>