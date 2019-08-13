<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>综合排行</title>
    
	 <link rel="stylesheet" href="/classphoto/bootstrap-3.3.7-dist/css/bootstrap-theme.css" type="text/css"></link>
	<link rel="stylesheet" href="/classphoto/bootstrap-3.3.7-dist/css/bootstrap.css" type="text/css"></link>
	<script src="/classphoto/js/jquery-1.12.4.js"></script>
	<script type="text/javascript" src="/classphoto/bootstrap-3.3.7-dist/js/bootstrap.js"></script>

	<script type="text/javascript">
		$(function(){
			
			 $(".praise").click(function(){
	        	  var pid = $(this).attr("pid");
	        	 $.ajax({
	        		 url:"${pageContext.request.contextPath }/photo_givePraise?pid="+pid,
	        		type:"GET",
	        		success:function(){
	        			window.location.reload();
	        		}
	        	 });
	        	  
	          });
	          
	          $(".trample").click(function(){
	        	  var pid = $(this).attr("pid");
	        	 $.ajax({
	        		 url:"${pageContext.request.contextPath }/photo_trample?pid="+pid,
	        		type:"GET",
	        		success:function(){
	        			window.location.reload();
	        		}
	        	 });
	        	  
	          });
			
			
			
			var ele= $(".h2");
			for(var i = 0;i<ele.length;i++){
				ele[i].append(i+1);
			}
			
			
			
		});
	</script>
	<style type="text/css">
	
		body{
			user-select:none;
		}
			
		.h2{
			color:rgba(0,0,0,0.5);
		}
		.span1{
			color:rgba(0,0,0,0.5);
			
		}
		.items:hover{
			color:red;
		}
		.span{
			color: rgba(0,0,0,0.5);
		}
		.items:hover .span
		{
			color: rgba(0,0,0,0.8);
		}
	</style>
  </head>
  
  <body>
  	<div style="width:100%;text-align:center">
   	<h3>点赞排行</h3>
   	</div>
  	<hr>
  	
			<c:forEach items="${photo }" var = "p">
			 
			 <div pid = "${p.pid }" class = "items" style="width:100%;height:130px; position:relative;">
			 
			 <div  style="float:left; width:50px;height:100px;text-align:center;margin-top:27px;"><h2 class = "h2 span"></h2></div>

			  <div class = "thumbnail" style="width:200px;height:130px;float:left; margin-right: 20px;" >
			  
			     <a href="${pageContext.request.contextPath}/photo_rankPhoto?pid=${p.pid}" target="_parent"> <img src="/${p.address}" ></a>
 					
			  </div>
			 <div  style="width:200px;height:100px;float:left; margin-top: 30px;"  class="caption">
		        <br><br>
		        <span class = "span1 span" style="font-size:13px;">&nbsp;<span class = "glyphicon glyphicon-user"></span>&nbsp;&nbsp;${p.pname }<br>&nbsp;<span class="glyphicon glyphicon-dashboard"><span>&nbsp;${p.ptime }</span></span></span>
		        <br>
<p><a href="javascript:" class="btn btn-xs praise" pid = "${p.pid }"  role="button"><span>[${p.praise}]&nbsp;</span><span class = "glyphicon glyphicon-thumbs-up"></span></a> <a href="javacript:" class="btn btn-xs trample" pid = "${p.pid }" role="button"><span>[${p.trample}]&nbsp;</span><span class = "glyphicon glyphicon-thumbs-down"></span></a></p>
		     </div>
			    <div  style="position:absolute;right:100px;top:30px;text-align:center;width:100px;" class = "span">
						<span ><h3>${p.praise }</h3></span>
						<p><h6>赞数</h6></p>
				</div>
			 </div>
			<hr>
			
			</c:forEach>  
  </body>
</html>
