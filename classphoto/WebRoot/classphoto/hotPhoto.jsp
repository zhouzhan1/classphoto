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
    <link rel="stylesheet" href="/classphoto/bootstrap-3.3.7-dist/css/bootstrap-theme.css" type="text/css"></link>
	<link rel="stylesheet" href="/classphoto/bootstrap-3.3.7-dist/css/bootstrap.css" type="text/css"></link>
	<script src="/classphoto/js/jquery-1.12.4.js"></script>
	<script type="text/javascript" src="/classphoto/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    <title>浏览照片</title>
    <style type="text/css">
    	.showphoto{
    	    padding-right: 10px;
    	    padding-top: 10px;
    		width:166px;
    		height:109px;
    		float: left;
    	}
    	.two{
    	width:100%;
    	height:60px;
    	text-align: center;
    	
    	}
    	.two h4{
    	 	border-left: 1px solid #FFFF00;
    	 	border-right: 1px solid #FFFF00;
    	 	border-bottom: 1px solid #FFFF00;
    	 	border-radius:3px;
    		color:#FFD143;
    		width:100px;
    		height:30px;
    		margin:auto;
    	}
    	.two a{
    		color:#FF7A19;
    		text-decoration:none;
    	}
    	.three {
    		width:100%;
    		height:40px;
    		font-size:12px;
    	}
    	.three p{
    		font-size:12px;
   			color:#ABE0FF;
   			font-family:"微软雅黑";
    	}
    	.span1{
    		font-size:14px;
   			color:#92D6FF;
			font-family:"微软雅黑";
    	}
    	.span2{
    		font-size:12px;
   			color:#ABE0FF;
   			font-family:"微软雅黑";
   		
    	}
    	.four{
    		float:left;
    		width：50%；
    		height:40px;
    	}
    	.five{
    		width：50%；
    		height:40px;
    		float:right;
    		font-size:12px;
   			color:#ABE0FF;
   			font-family:"微软雅黑"；
    	}
    	.six{
    		background-color:rgba(135, 102, 96, 0.5);
    		width:166px;
    		height:20px;
    		text-align:center;
    		position:relative;
    		top:-20px;
    		display:none;
    	}
    	.showphoto:hover .six {
            display: block;
        }
        
       
        	.six a{
        		color:yellow;
        		background-color:rgba(135,102,96,0.7);
        	}
        	
        	
    	
    </style>
      
      
      <script>
      $(function () {
          //编写jQuery代码
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
          
         
     
     
      });
    </script>

  </head>
  
  <body>
    <div style="width:100%;text-align:center">
   	<h3>热门图片</h3>
   	</div>
  
   	<hr>
   
   
  	<c:forEach items="${photo }" var = "p">
  			
				  <div style="width:240;height:285px;float:left;" class="col-sm-3 col-md-4">
				    <div class="thumbnail">
				     <a href="${pageContext.request.contextPath }/photo_rankPhoto?pid=${p.pid}" target="_parent"> <img src="/${p.address}"></a>
				      <div class="caption">
				        <h4>综合分:${p.mask }</h4>
				        <p>by：${p.pname }</p>
				        <p><a href="javascript:" class="btn btn-primary btn-sm praise" pid = "${p.pid }"  role="button"><span>[${p.praise}]&nbsp;&nbsp;</span><span class = "glyphicon glyphicon-thumbs-up"></span></a> <a href="javacript:" class="btn btn-default btn-sm trample" pid = "${p.pid }" role="button"><span>[${p.trample}]&nbsp;&nbsp;</span><span class = "glyphicon glyphicon-thumbs-down"></span></a></p>
				      </div>
				    </div>
				  </div>
				
  	
  	</c:forEach>

	<input class = "rank" type="hidden" value="${user.rank }">
 </body>
</html>
