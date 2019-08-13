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
        	
        	
    	
    </style>

      
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
        			
        				
                 		if(confirm("确认删除该照片吗？"))
                 			{
                 			location.href=href;
                 			}
                   		
                      
        		});
        		
     var ele = $(".six")[1];
     console.log(ele);
     
      });
    </script>

  </head>
  
  <body>
    <div class = "two">
   	<h4>浏览照片</h4>
   	<a href = "${pageContext.request.contextPath }/photo_forAddPhoto?albumName=${album.albumName }&aid=${album.aid}">添加照片</a>
   	<br><br>
   	<span style="color:red">${meg }</span>
   	
   	</div>
   	<div  class = "three">
   		<span style="color:black;" class = "span1">相册详情：</span>
   		
   		<p>
   			<div  class = "four"><span style="color:black;" class = "span2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${album.albumDesc }</span></div>
   			<div style="color:black;" class = "five">创建时间：${album.atime }&nbsp;&nbsp;创建者：${album.aname }</div>
   			
   		</p>
   		
   	</div>
   	<hr>
  	<c:forEach items="${album.photo }" var = "p">
  			<div class = "showphoto">
  				<a href="${pageContext.request.contextPath }/photo_onePhoto?pid=${p.pid}"/><img title = "查看" style="width: 100%;height: 100%" src ='/${p.address}'/></a>
  			
  				<c:if test="${user.rank eq '成员' }">
  					<c:if test="${user.username==p.pname }">
  				 		<div class = "six"> <button><span class = "span4" aid="${album.aid }" pid="${p.pid }">删除</span></button></div>
  					</c:if>
  				 	
  				</c:if>
  				
  				<c:if test="${user.rank ne '成员' }">
  				
  				 		<div class = "six"> <button><span class = "span4" aid="${album.aid }" pid="${p.pid }">删除</span></button></div>
  					
  				 	
  				</c:if>
  				
  			</div>
  	
  	</c:forEach>

	<input class = "rank" type="hidden" value="${user.rank }">
 </body>
</html>
