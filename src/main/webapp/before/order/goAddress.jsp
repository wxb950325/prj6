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
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://cdn.staticfile.org/vue-resource/1.5.1/vue-resource.min.js"></script>
</head>
<body>
<script>
	$.ajaxSetup({
	  global: true,
	  cache: false,
	  async: false
	});

	$(function(){
		$('#dg').datagrid({   
		    url:'/before/order/goInput', 
		    fitColumns:true,
		    toolbar: '#tb',
		    pageSize:10,
		    striped:true,
		    pagination:true,
		    columns:[[   
		        {field:'aid',checkbox:'checkbox',title:'收货人',width:100},
		        {field:'comsignee',title:'收货人',width:100},
		        {field:'phonenum',title:'手机号',width:100},   
		        {field:'address',title:'收货地址',width:100	},
				{field:'note',title:'备注',width:100},
				{field:'isdelete',title:'是否使用',width:100,formatter: function(value,row,index){
					if (value==0){
						return '正在使用';
					} else {
						return '已弃用';
					}
				}
				},
				
		        {field:'operate',title:'操作',width:100,formatter: function(value,row,index){
		        	var btns = "<a id=\"btn\" href=\"javascript:deleteItem("+row.aid+")\" class=\"easyui-linkbutton\" data-options=\"iconCls:'icon-remove'\">删除</a>";
		        	btns += "<a id=\"btn\" href=\"javascript:findById("+row.aid+")\" class=\"easyui-linkbutton\" data-options=\"iconCls:'icon-edit'\">修改</a>";
		        	btns += "<a id=\"btn\" href=\"javascript:goOrder("+row.aid+")\" class=\"easyui-linkbutton\" data-options=\"iconCls:'icon-edit'\">选择该地址</a>";  
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
	
	function deleteItem(aid){
		$.messager.confirm('Confirm','Are you sure you want to delete record?',function(r){   
		    if (r){   
		    	$.getJSON("delete",{aid:aid},function(json){
		    		$.messager.show({
		    			title:'My Title',
		    			msg:json.msg,
		    			timeout:4000,
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
			stidstring += selections[i].aid;
			if(i<selections.length-1)
				stidstring +=",";
		}
		
		$.getJSON("deleteBatch",{stidstring:stidstring},function(json){
			$.messager.show({
    			title:'My Title',
    			msg:json.msg,
    			timeout:4000,
    			showType:'slide'
    		});
			$('#dg').datagrid('reload');    // reload the current page data  
		});
	}

	function goOrder(aid){
		$.getJSON("goOrder",{aid:aid},function(){});
	}
	
	function findById(aid){
		$('#ff').form('clear');	// 从URL加载 		
		$('#win').window('open');  // open a window 
			$.getJSON("findById",{aid:aid},function(json){
				$('#ff').form('load',json);	// 从URL加载
				/* var isdelete = json.isdelete?1:0;
				$("input[name='isdelete'][value="+isdelete+"]").prop('checked','1'); */
			});
		
	}
	
	function openForm(){
		$('#ff').form('clear');	// 从URL加载 
		$('#win').window('open');  // open a window 
		/* $("input[name='state'][value=0]").prop('checked','1'); */
	}
	
	function dosave(){
		var tid = $("#aid").val();
		var path = "save";
		if(aid!=null&&aid!=""&&aid!=undefined){
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
	    			timeout:4000,
	    			showType:'slide'
	    		});
		       	$('#win').window('close');  // open a window 
				$('#dg').datagrid('reload');    // reload the current page data  
		    }   
		}); 
	}

</script>

<table id="dg"></table> 

<div id="tb">
<a href="javascript:deleteBatch()" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">批量删除</a>
<a href="javascript:openForm()" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true">增加</a>
</div>

<div id="win" class="easyui-window" title="My Window" style="width:600px;height:400px"  
        data-options="iconCls:'icon-save',modal:true,closed:true">  
    	用户地址管理
    <form id="ff" method="post">  
    	<input type="hidden" name="aid" id="aid">
	    <div>  
	        <label for="comsignee">comsignee:</label>  
	        <input class="easyui-validatebox" type="text" name="comsignee" data-options="required:true" />  
	    </div>
	    <div>  
	        <label for="phonenum">phonenum:</label>  
	        <input class="easyui-validatebox" type="text" name="phonenum" data-options="required:true" />  
	    </div>
	    <div>  
	        <label for="address">address:</label>  
	        <input class="easyui-validatebox" type="text" name="address" data-options="required:true" />  
	    </div>
	    <div>  
	        <label for="note">note:</label>  
	        <input class="easyui-validatebox" type="text" name="note" data-options="required:true" />  
	    </div>
	    
	    <div>  
	        <label for="isdelete">isdelete:</label>  
	        <input type="radio" name="state" value="0">正在使用<input type="radio" name="state" value="1">已弃用
	    </div>
	     
	    <div>  
	    	<input type="button" onclick="dosave()" value="保存" />  
	    </div> 
	</form>  
    	   
</div>


</body>
</html>