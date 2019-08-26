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
		    pageSize:10,
		    striped:true,
		    title:'商品类型管理',
		    pagination:true,
		    columns:[[   
		        {field:'tid',checkbox:'checkbox',title:'商品类型id',width:100},   
		        {field:'tname',title:'商品名称姓名',width:100},   
		        {field:'isdelete',title:'软删除',width:100,formatter: function(value,row,index){
					if (value==1){
						return '已保留';
					} else {
						return '已删除';
					}
				}
				},
		       /*  {field:'score',title:'成绩',width:100,styler: function(value,row,index){
					if (value < 60){
						return 'color:red;';
					}
				},}, */
				{field:'parentTid',title:'父级父类id',width:100},
				{field:'typePhoto',title:'父类图片路径',width:100},
				{field:'note',title:'备注',width:100},
				
		        {field:'operate',title:'操作',width:100,formatter: function(value,row,index){
		        	var btns = "<a id=\"btn\" href=\"javascript:deleteItem("+row.tid+")\" class=\"easyui-linkbutton\" data-options=\"iconCls:'icon-remove'\">删除</a>";
		        	btns += "<a id=\"btn\" href=\"javascript:findById("+row.tid+")\" class=\"easyui-linkbutton\" data-options=\"iconCls:'icon-edit'\">修改</a>"; 
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
	
	function deleteItem(tid){
		$.messager.confirm('Confirm','Are you sure you want to delete record?',function(r){   
		    if (r){   
		    	$.getJSON("delete",{tid:tid},function(json){
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
			stidstring += selections[i].tid;
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
	
	function findById(tid){
		$('#ff').form('clear');	// 从URL加载 		
		$('#win').window('open');  // open a window 
			$.getJSON("findById",{tid:tid},function(json){
				$('#ff').form('load',json);	// 从URL加载
				/* var isdelete = json.isdelete?1:0;
				$("input[name='isdelete'][value="+isdelete+"]").prop('checked','1'); */
			});
		
	}
	
	function openForm(){
		$('#ff').form('clear');	// 从URL加载 
		$('#win').window('open');  // open a window 
		$("input[name='isdelete'][value=0]").prop('checked','1');
	}
	
	function dosave(){
		var tid = $("#tid").val();
		var path = "save";
		if(tid!=null&&tid!=""&&tid!=undefined){
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
</head>
<body>
<table id="dg"></table> 


<div id="tb">
<a href="javascript:deleteBatch()" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">批量删除</a>
<a href="javascript:openForm()" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true">增加</a>
</div>

<div id="win" class="easyui-window" title="My Window" style="width:600px;height:400px"  
        data-options="iconCls:'icon-save',modal:true,closed:true">  
    	商品类型管理
    <form id="ff" method="post">  
    	<input type="hidden" name="tid" id="tid">
	    <div>  
	        <label for="tname">tname:</label>  
	        <input class="easyui-validatebox" type="text" name="tname" data-options="required:true" />  
	    </div>
	    <div>  
	        <label for="parentTid">parentTid:</label>  
	        <input class="easyui-validatebox" type="text" name="parentTid" data-options="required:true" />  
	    </div>
	    <div>  
	        <label for="typePhoto">typePhoto:</label>  
	        <input class="easyui-validatebox" type="text" name="typePhoto" data-options="required:true" />  
	    </div>
	    <div>  
	        <label for="note">note:</label>  
	        <input class="easyui-validatebox" type="text" name="note" data-options="required:true" />  
	    </div>  
	    <div>  
	        <label for="isdelete">isdelete:</label>  
	        <input type="radio" name="isdelete" value="0">已删除<input type="radio" name="isdelete" value="1">已保留
	    </div>  
	    <!-- <div>  
	        <label for="score">score:</label>  
	        <input class="easyui-numberbox" type="text" name="score" data-options="required:true" />  
	    </div>  -->  
	    <div>  
	    	<input type="button" onclick="dosave()" value="保存" />  
	    </div> 
	</form>  
    	   
</div>  

</body>
</html>