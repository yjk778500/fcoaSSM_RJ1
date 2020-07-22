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
				url:'bx/find',	
				pagination:true,
				pageSize:2,
				pageList:[2,4,6,8],
				fit:false,//是否铺满屏幕
				fitcolumns:true,
				striped:true,//隔行变色
				rownumbers: true,
				loadMsg:"数据加载中，请稍后....",
				singleSelect:true,//只允许选中一行
				queryParams:from("selectform"),
				columns:[[
							{field:'id',hidden:true},
						    {field:'createTime',title:'填报日期',width:160,align:'center',
						    			formatter:function(value,row,index){
						    			var createTime = new Date(value);  
                        				 return createTime.toLocaleString();  
						    			}
						    },
						    {field:'createSn',title:'填报人',width:160,align:'center'},
						    {field:'totalAccount',title:'总金额',width:160,align:'center'},
						    {field:'status',title:'状态',width:160,align:'center'},
						    {field:'nextDealSn',title:'待处理人',width:160,align:'center'},
						    {field:'order',title:'操作',width:160,align:'center',
						    			formatter:function(value,row,index){
						    					var positionId =${emp.positionId};
						    					var see = "<a href='bx/Details?Id="+row.id+"'>查看</a>";
						    					var fun = "<a href='bx/update?Id="+row.id+"'>修改</a>";
						    					var fun1 = "<a href='bx/Audit?Id="+row.id+"'>审核</a>";
						    				if(positionId==1){
						    					return see+"&nbsp&nbsp"+fun;
						    				}else{
						    					return see+"&nbsp&nbsp"+fun1;
						    				}
						    			}
						    }
						]]
			});
				//datagrid多条件查询
			 $("#select").click(function () {
                $("#dd").datagrid({ queryParams: from("selectform")});  
            });
			
		})
			//转JSON
         function from(id){
         	 var arr = $("#" + id).serializeArray();
             var json = "";
             json += '{';
	            for (var i = 0; i < arr.length; i++) {
	                json += '"' + arr[i].name + '":"' + arr[i].value + '",';
	            }
            json = json.substring(0, (json.length - 1));
            json += '}';
 
            return JSON.parse(json);
         }
         
          function select(){
		        var positionId =${emp.positionId};
         	if(positionId==4){
         			$("#select2").attr('disabled', 'disabled');
		            $("#select2").attr('style','background-color: #EEEEEE');
         	
         		}
		    }
     
         
	</script>

  </head>
  
  <body onload="select()">
  	  <div style="margin-top: 10px;margin-left: 30px;margin-bottom: 10px;"> 
  	  <form action="" style="margin: 0px;" id="selectform">
  	  		报销单状态<select id="select2" name="status" style="width:80px;height: 25px;"> 
								<option value="">全部</option>
								<option value="待审批">待审批</option>
								<option value="新创建">新创建</option>
								<option value="已提交">已提交</option>
								<option value="已打回">已打回</option>
								<option value="已审批">已审批</option>
								<option value="已付款">已付款</option>
								<option value="已终止">已终止</option>
							</select>
		开始时间<input type="date" id="date_1" name="createTime" style="width:240px;height: 25px;">
		结束时间<input type="date" id="date_2" name="createTime1" style="width:240px;height: 25px;">
		&nbsp&nbsp&nbsp&nbsp
		<input type="button" id="select" value="查询" style="width: 100px;height: 25px;">
		</form></div>
      <div id = "dd"></div>
  </body>
</html>
