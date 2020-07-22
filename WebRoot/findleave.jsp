<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'findleave.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="js/js/js/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="js/js/js/themes/icon.css">
	<script type="text/javascript" src="js/js/js/jquery-1.8.3.js"></script>
	<script type="text/javascript" src="js/js/js/jquery.easyui.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$("#dd").datagrid({
				url:'leave/find',
				pagination:true,
				pageSize:2,
				pageList:[2,4,6,8],
				fit:true,
				fitcolumns:true,
				striped:true,
				//rownumbers: true,
				loadMsg:"数据加载中，请稍后....",
				singleSelect:true,
				columns:[[
							{field:'id',title:'名称',width:160,align:'center'},
						    {field:'empSN',title:'名称',width:160,align:'center'},
						    {field:'startTime',title:'发起时间',width:160,align:'center',
						    			formatter:function(value,row,index){
						    			var startTime = new Date(value);  
                        				 return startTime.toLocaleString();  
						    			}},
						    {field:'endTime',title:'审批时间',width:160,align:'center',
						    			formatter:function(value,row,index){
						    			var endTime = new Date(value); 
                        				 return endTime.toLocaleString();  
						    			}},
						    {field:'reason',title:'审批意见',width:160,align:'center'},
						    {field:'status',title:'审批状态',width:160,align:'center'},
						    {field:'order',title:'操作',width:90,align:'center',
						    			formatter:function(value,row,index){
						    					var positionId =${emp.positionId};
						    					var see = "<a href='leave/Details?Id="+row.id+"'>查看</a>";
						    					var fun = "<a href='#?Id="+row.id+"'>修改</a>";
						    					var fun1 = "<a href='#?Id="+row.id+"'>审核</a>";
						    				if(positionId==1){
						    					return see+"&nbsp&nbsp"+fun;
						    				}else{
						    					return see+"&nbsp&nbsp"+fun1;
						    				}
						    			}
						    }
						]]
			})
		})
	
	</script>

  </head>
  
  <body>
      <div id = "dd"></div>
  </body>
</html>
