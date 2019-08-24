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
		    title:'商品品牌管理',
		    pagination:true,
		    columns:[[   
		        {field:'bid',checkbox:'checkbox',title:'品牌id',width:100},   
		        {field:'bname',title:'品牌名',width:100},   
		        {field:'state',title:'状态',width:100,formatter: function(value,row,index){
					if (value==1){
						return '已上架';
					} else {
						return '已下架';
					}
				}
				},
		       /*  {field:'score',title:'成绩',width:100,styler: function(value,row,index){
					if (value < 60){
						return 'color:red;';
					}
				},}, */
				{field:'note',title:'备注',width:100},
				
		        {field:'operate',title:'操作',width:100,formatter: function(value,row,index){
		        	var btns = "<a id=\"btn\" href=\"javascript:deleteItem("+row.bid+")\" class=\"easyui-linkbutton\" data-options=\"iconCls:'icon-remove'\">删除</a>";
		        	btns += "<a id=\"btn\" href=\"javascript:findById("+row.bid+")\" class=\"easyui-linkbutton\" data-options=\"iconCls:'icon-edit'\">修改</a>"; 
					return btns;
				}
				}
		    ]],
		    onLoadSuccess: function(index,field,value){
				$('.easyui-linkbutton').linkbutton({   
				});  
			}  
		});
		var vm = new Vue({
	        el:'#app',
	        data:{
	            json:'',
	            bname:''
	   	    },
	        methods:{
	        	findByBrand:function(event){
	            	this.$http({
	                	method:'post',
	                	url:'findByBrand',
	                	emulateJSON:true, 
	                	params:{
	                		bname:this.bname
	                	},	
	                }).then(function(res){
	                	 this.json=res.body;
	                	 if(event.code!='Backspace')
		                	 if(this.json.length==1){
		                		 this.bname=this.json[0].bname;
		                		 this.json ='';
		                	 }
	                },function(){
	                    console.log('请求失败处理');
	                });
	            },
	            select:function(brand){
	            	this.bname=bname;
	            	this.json='';
	            }
	        }
	    }); 
	})
	
	function deleteItem(bid){
		$.messager.confirm('Confirm','Are you sure you want to delete record?',function(r){   
		    if (r){   
		    	$.getJSON("delete",{bid:bid},function(json){
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
			stidstring += selections[i].bid;
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
	
	function findById(bid){
		$('#ff').form('clear');	// 从URL加载 		
		$('#win').window('open');  // open a window 
			$.getJSON("findById",{bid:bid},function(json){
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
		var tid = $("#bid").val();
		var path = "save";
		if(bid!=null&&bid!=""&&bid!=undefined){
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

/* 	$(function(){
	    var vm = new Vue({
	        el:'#app',
	        data:{
	            json:'',
	            bname:''
	   	    },
	        methods:{
	        	findByBrand:function(event){
	            	this.$http({
	                	method:'post',
	                	url:'findByBrand',
	                	emulateJSON:true, 
	                	params:{
	                		bname:this.bname
	                	},	
	                }).then(function(res){
	                	 this.json=res.body;
	                	 if(event.code!='Backspace')
		                	 if(this.json.length==1){
		                		 this.bname=this.json[0].bname;
		                		 this.json ='';
		                	 }
	                },function(){
	                    console.log('请求失败处理');
	                });
	            },
	            select:function(brand){
	            	this.bname=bname;
	            	this.json='';
	            }
	        }
	    });
	}) */
	
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
    	商品品牌管理
    <form id="ff" method="post">  
    	<input type="hidden" name="bid" id="bid">
	    <div>  
	        <label for="bname">bname:</label>  
	        <input class="easyui-validatebox" type="text" name="bname" data-options="required:true" />  
	    </div>
	    <div>  
	        <label for="state">state:</label>  
	        <input type="radio" name="state" value="0">已下架<input type="radio" name="state" value="1">已上架
	    </div> 
	    <div>  
	        <label for="note">note:</label>  
	        <input class="easyui-validatebox" type="text" name="note" data-options="required:true" />  
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

<div id="app">
	<INPUT TYPE="text" NAME="brand" v-model="brand" @keyup="findByBrand($event)"  style="width:175px">
	
	<TABLE bgColor="#FFFFCC" width="175px">
		<TR v-for="n in json" bgcolor="#FFFFFF">
			<TD @click="select(n.bname)">{{n.bname}}</TD>
		</TR>
	</TABLE>
</div>

</body>
</html>