<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>办公自动化</title>
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
		  		$("#tree").tree({
		  			 url:'tree/gettree',
		  			 onClick:function(node){
		  			 	addTab(node.attributes.url,node.text);
		  			 }
		  			 
		  		});	
	  		});
	  		
	  	function addTab(url,text){
	  		var content = "<iframe style='width:100%;height:100%;' frameborder='0' src=" +url+ "></iframe>";
	  		if($('#tt').tabs('exists',text)){
	  			$('#tt').tabs('select',text);
	  			
	  		}else{
	  			$('#tt').tabs('add',{
				title: text,
				closable:true,
				content: content
				});
	  		}
		  	
	  	}
	  	
	</script>
  </head>
  
  <body class="easyui-layout">
	    <div data-options="region:'north',split:true" style="height:100px;background-image:url('images/背景.jpg');">
	    	<!-- 上 -->
	    	
		  <div style="float: right;font-size: 20px;padding-top: 60px;">
		  		当前用户：<span style="color: red;">${emp.name}</span>
		  		登录角色：<span style="color: red;">${emp.position.nameEn}  ${emp.position.nameCn}</span>
		  	
		  </div>
		  	<form action="emp/Remove" style="float: right;font-size: 20px;padding-top: 60px;margin-bottom: 0px;">
	  			<input type="submit" value="退出登录" style="background-color: red;color:white;">
	  		</form>
	    	
	    </div>
	    <div data-options="region:'west',title:'》》菜单《《',split:true" style="width:200px;background-image:url('images/背景.jpg');">
	    	<!-- 左 -->
	    	<div id ="tree"></div>
	    	
	    </div>
	    <div data-options="region:'center'" style="padding:5px;background:#eee;background-image:url('images/背景.jpg');">
	    	<!-- 中 -->
	    	 <div id="tt" class="easyui-tabs" fit="true" border="0" data-options="closable:true">
			    <div title="首页" style="padding:20px;background-image:url('images/背景.jpg');">
					<h1 style="color: blue; text-align: center;font-size: 50px;">${emp.name},欢迎使用fcoa办公自动化系统</h1>
			    </div>
	    	</div>
	</div>
	    </div>
	    <div data-options="region:'south',split:true" style="height:40px;text-align: center;font-size: 14;color: #888888;background-image:url('images/背景.jpg');">
	    	<!-- 下 -->
	    	Copyright © 2016 - 2018    fcoa自动办公网, 豫ICP备******号, All Rights Reserved.<br />
	    				地址：召唤师峡谷男爵附近的小河蟹家(地图) | 邮编：450***
	    </div>
	</body>
</html>
