<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=basePath%>js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>js/easyui/themes/icon.css">
<script type="text/javascript" src="<%=basePath%>js/jquery-2.0.3.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/easyui/locale/easyui-lang-zh_CN.js"></script>
<script>
	$.ajaxSetup({
	  global: true,
	  cache: false,
	  async: false
	});


	$(function(){
		$('#dg').datagrid({   
		    url:'findAll', 
		    fitColumns:true,
		    toolbar: '#tb',
		    pageSize:20,
		    striped:true,
		    title:'学生管理',
		    pagination:true,
		    columns:[[   
		        {field:'stid',checkbox:'checkbox',title:'编号',width:100},   
		        {field:'stname',title:'学生姓名',width:100},   
		        {field:'stsex',title:'性别',width:100,formatter: function(value,row,index){
					if (value){
						return '女';
					} else {
						return '男';
					}
				}
				},
		        {field:'score',title:'成绩',width:100,styler: function(value,row,index){
					if (value < 60){
						return 'color:red;';
					}
				}
				},
		        {field:'operate',title:'操作',width:100,formatter: function(value,row,index){
		        	var btns = "<a id=\"btn\" href=\"javascript:deleteItem("+row.stid+")\" class=\"easyui-linkbutton\" data-options=\"iconCls:'icon-remove'\">删除</a>";
		        	btns += "<a id=\"btn\" href=\"javascript:findById("+row.stid+")\" class=\"easyui-linkbutton\" data-options=\"iconCls:'icon-edit'\">修改</a>"; 
					return btns;
				}
				}
		    ]],
		    onLoadSuccess: function(index,field,value){
				$('.easyui-linkbutton').linkbutton({   
				});  
			}  
		}); 
	})
	
	function deleteItem(stid){
		$.messager.confirm('Confirm','Are you sure you want to delete record?',function(r){   
		    if (r){   
		    	$.getJSON("delete",{stid:stid},function(json){
		    		$.messager.show({
		    			title:'My Title',
		    			msg:json.msg,
		    			timeout:5000,
		    			showType:'slide'
		    		});
					$('#dg').datagrid('reload');    // reload the current page data  
				});
		    }   
		});  
		
	}
	
	function deleteBatch(){
		var stidstring = "";
		var selections = $('#dg').datagrid('getSelections');  // fix the 'name' column size
		for(var i=0;i<selections.length;i++)
		{
			stidstring += selections[i].stid;
			if(i<selections.length-1)
				stidstring +=",";
		}
		
		$.getJSON("deleteBatch",{stidstring:stidstring},function(json){
			$.messager.show({
    			title:'My Title',
    			msg:json.msg,
    			timeout:5000,
    			showType:'slide'
    		});
			$('#dg').datagrid('reload');    // reload the current page data  
		});
	}
	
	function findById(stid){
		$('#ff').form('clear');	// 从URL加载 		
		$('#win').window('open');  // open a window 
			$.getJSON("findById",{stid:stid},function(json){
				$('#ff').form('load',json);	// 从URL加载
				var sex = json.stsex?1:0;
				$("input[name='stsex'][value="+sex+"]").prop('checked','true');
			});
		
	}
	
	function openForm(){
		$('#ff').form('clear');	// 从URL加载 
		$('#win').window('open');  // open a window 
		$("input[name='stsex'][value=0]").prop('checked','true');
	}
	
	function dosave(){
		var stid = $("#stid").val();
		var path = "save";
		if(stid!=null&&stid!=""&&stid!=undefined){
			path = "update";
		}
		$('#ff').form('submit', {   
		    url:path,   
		    onSubmit: function(){   
		        // do some check   
		        // return false to prevent submit;   
		    },   
		    success:function(data){   
		       	var json = eval("("+data+")");
		       	$.messager.show({
	    			title:'My Title',
	    			msg:json.msg,
	    			timeout:5000,
	    			showType:'slide'
	    		});
		       	$('#win').window('close');  // open a window 
				$('#dg').datagrid('reload');    // reload the current page data  
		    }   
		}); 
	}
</script>
</head>
<body>
<table id="dg"></table> 


<div id="tb">
<a href="javascript:deleteBatch()" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">批量删除</a>
<a href="javascript:openForm()" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true">增加</a>
</div>

<div id="win" class="easyui-window" title="My Window" style="width:600px;height:400px"  
        data-options="iconCls:'icon-save',modal:true,closed:true">  
    	用户管理
    	<form id="ff" method="post">  
    	<input type="hidden" name="stid" id="stid">
	    <div>  
	        <label for="name">stname:</label>  
	        <input class="easyui-validatebox" type="text" name="stname" data-options="required:true" />  
	    </div>  
	    <div>  
	        <label for="stsex">stsex:</label>  
	        <input type="radio" name="stsex" value="0">男<input type="radio" name="stsex" value="1">女
	    </div>  
	    <div>  
	        <label for="score">score:</label>  
	        <input class="easyui-numberbox" type="text" name="score" data-options="required:true" />  
	    </div>   
	    <div>  
	            <input type="button" onclick="dosave()" value="保存" />  
	    </div> 
	</form>  
    	   
</div>  


</body>
</html>