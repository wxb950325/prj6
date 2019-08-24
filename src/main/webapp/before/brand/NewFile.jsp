<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://cdn.staticfile.org/vue-resource/1.5.1/vue-resource.min.js"></script>

<div id="app">
	<INPUT TYPE="text" NAME="nation" v-model="nation" @keyup="findByNation($event)"  style="width:175px">
	
	<TABLE bgColor="#FFFFCC" width="175px">
		<TR v-for="n in json" bgcolor="#FFFFFF">
			<TD @click="select(n.nation)">{{n.nation}}</TD>
		</TR>
	</TABLE>
</div>


<script>
	window.onload = function(){
	    var vm = new Vue({
	        el:'#app',
	        data:{
	            json:'',
	            nation:''
	   	    },
	        methods:{
	        	findByNation:function(event){
	            	this.$http({
	                	method:'post',
	                	url:'findByNation',
	                	emulateJSON:true, 
	                	params:{
	                		nation:this.nation
	                	},	
	                }).then(function(res){
	                	 this.json=res.body;
	                	 if(event.code!='Backspace')
		                	 if(this.json.length==1){
		                		 this.nation=this.json[0].nation;
		                		 this.json ='';
		                	 }
	                },function(){
	                    console.log('请求失败处理');
	                });
	            },
	            select:function(nation){
	            	this.nation=nation;
	            	this.json='';
	            }
	        }
	    });
	}
	
	
</script>
    
