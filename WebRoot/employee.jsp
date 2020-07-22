<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>员工</title>
    
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
				url:'emp/all',
				pagination:true,
				pageSize:2,
				pageList:[2,4,6,8],
				fit:true,
				fitcolumns:true,
				striped:true,
				rownumbers: true,
				loadMsg:"数据加载中，请稍后....",
				singleSelect:true,
				columns:[[
							{field:'id',hidden:true},
						    {field:'name',title:'员工名称',width:160,align:'center'},
						    {field:'password',title:'密码',width:160,align:'center'},
						    {field:'status',title:'状态',width:160,align:'center'},
						    {field:'order',title:'操作',width:100,align:'center',
						    			formatter:function(value,row,index){
						    				
						    				/* return "<a href='emp/update?Id="+row.id+"&Name="+row.name+"&Price="+row.password"'>修改</a>"; */
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
