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
        	
        	<%--
        
    	 .seven{
    		display:none;
    		border:1px solid white;
    		background-color:rgba(255,255,255,0.7);
    		width:350px;
    		height:120px;
    		 border-radius: 10px;
    		text-align: center;
    		position:absolute;
    		top:100px;
    		right:350px    		    		
    	}
    	.seven span{
    		font-size:14px;
    		position:relative;
    		top:20px;
    		
    	}
    	.seven p{
    		font-size:12px;
    		position:relative;
    		top:10px;
    	}
    	.but1{
    		width:60px;
    		height:30px;
    		background-color:#7A88FF;    		
    		position:relative;
    		border-radius: 5px;
    		top:0px;
    		border:none
    		
    	}
    
    	
    	.delete{
    		display:none;
    		background-color:rgba(255,255,255,0.7);
    		width:350;
    		height:120;
    		text-align:center;
    		border-radius: 10px;
    		position:absolute;
    		top:100px;
    		right:350px 
    		
    	}
    	.but2{
    		background-color:7A88FF;
    		border-radius: 5px;
    		position:relative;
    		left:75px;
    		width:60px;
    		height:30px;
    		
    		border:none
    	}
    		.but3{
    		background-color:gay;
    		border-radius: 5px;
    		position:relative;
    		left:85px;
    		
    		width:60px;
    		height:30px;
    		border:none
    	}
    	.delete span{
    		font-size:14px;
    		position:relative;
    		top:20px;
    	}
    	.delete p{
    		font-size:12px;
    		position:relative;
    		top:10px;
    	}--%>
    	
    </style>
 <%--<script src="https://code.jquery.com/jquery-1.12.4.js"
                  integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU="
                  crossorigin="anonymous">
      </script>
      --%>
      
      <script src="/classphoto/js/jquery-1.12.4.js"></script>
      <script>
      $(function () {
          //编写jQuery代码
          
          
				var num = $(".rank").val();
                
        		$(".span4").click(function()
                 {
        			
        			var pid=$(this).attr("pid");
        			var aid=$(this).attr("aid");
        			var href="${pageContext.request.contextPath }/photo_deletePhoto?pid="+pid+"&aid="+aid;
        			
        			 if(num=="成员")
                 	{
                 	  alert("你无法执行删除操作，请联系辅导员或班长");
                 	  
                 	}else
                 	{	
                 		if(confirm("确认删除该照片吗？"))
                 			{
                 			location.href=href;
                 			}
                    }
                      
        		});
        		
     
     
      });
    </script>

  </head>
  
  <body>
    <div class = "two">
   	<h4>浏览照片</h4>
   	
   	<br><br>
   	<span style="color:yellow">${meg }</span>
   	
   	</div>
   	
   	<hr>
  	<c:forEach items="${photo }" var = "p">
  			<div class = "showphoto">
  				<a href="${pageContext.request.contextPath }/photo_rankPhoto?pid=${p.pid}"/><img title = "查看" style="width: 100%;height: 100%" src ='/${p.address}'/></a>
  				
  				
  				 <%--<div class = "six"> <button><span class = "span4" aid="${p.album.aid }" pid="${p.pid }">删除</span></button></div>
  			--%></div>
  	
  	</c:forEach>
  	<%--<div class = "delete">
   		<span>系统提示：</span>
   		<p>你确认删除吗？</p>
   		</br>
   		<button class = "but2">确认</button>
   		<button class = "but3">取消</button>
   </div>
   <div class = "seven">
    <span>系统提示：</span>
    <p>无限权执行此操作，请联系班长或辅导员</p>
    <br>
    <button class = "but1">确定</button>
    </div>
	<input class = "rank" type="hidden" value="${rank }">
  --%></body>
</html>
