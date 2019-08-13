<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'comment.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	 <script src="/classphoto/js/jquery-1.12.4.js"></script>
	 
	 <script type="text/javascript">
	 	$(function(){
	 		$(".button").click(function(){
	 			var text = $(".text").val();
	
	 				if(text.length != 0){
	 				location.href="${pageContext.request.contextPath}/photo_addComment?content="+text+"&pid=${photo.pid}";
	 				}
	 			else{
	 				alert("请填写内容");
	 			}
	 			
	 		});
	 		
	 		$(".delete").click(function(){
	 			var cid = $(this).parents(".onecomment").attr("cid");
	 		
	 					if(confirm("确定删除此评论吗")){
	 						location.href="${pageContext.request.contextPath}/photo_deleteComment?cid="+cid+"&pid=${photo.pid}";
	 					}
	 				
	 		});
	 		var con = $(".onecomment").length;
	 		if(con == 0)
	 			{
	 				$(".comment").append("暂无评论");
	 			}else{
	 				$(".c").append("(  "+con+"  )");
	 			}
	 		
	 		
	 	});
	 </script>
	
	<style>
	body{
		
	}
		.two{
			width:30%;
			height:30%;
			
		}
		.comment{
			background-color: rgba(100,255,255,0.5);
			border: 1px solid #ffffff;
			width:59%;
			height:350px;
			position:absolute;
			left:10px;
			top:290px;
			overflow: auto;
			user-select:none;
		}
		.text{
			border:none;
			border-radius:3px;
			width:350px;
			height:100px;
			position:absolute;
			
			right:100px;
			top:397px;
			background-color: rgba(100,255,255,0.5);
		}
		.button{
			border:none;
			border-radius:3px;
			width:81px;
			height:30px;
			position:absolute;
			
			right:100px;
			top:500px;
		}
		
		.delete{
			position:absolute;
			right: 20px;
			display: none;
			margin-top: -10px;
			 
		}
		.onecomment:hover .delete{
			display: block;
		}
		.a{
			border:none;
			border-radius:3px;
			width:81px;
			height:30px;
			position:absolute;
			
			right:180px;
			top:505px;
			
			text-decoration: none;
			color:black;
			fone-size:15px;
			
			}
		
	</style>

  </head>
  
  <body>
 	 <div class = "two">
   		<img  style = "height:100%;width:100%"src='/${photo.address }'> 
   	 </div>
   	 <span style="font-size:10px">上传者:${photo.pname }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;上传时间:${photo.ptime }</span>
   	 <br>
   	
   	<hr>
 	<span style="font-size:18px">评论:&nbsp;<span style="font-size:10px;" class = "c"></span></span>
 	<div class = "comment">
 	
 	<c:forEach items="${photo.comment}" var="comment">
	<div class = "onecomment" cid="${comment.cid }">
 	<p style="font-size:12px;font-family:'微软雅黑'">${comment.uname}:</p>
 	&nbsp;<span style="font-size:14px;font-family:'宋体'">${comment.content }</span>&nbsp;&nbsp;&nbsp;
 	&nbsp;<span style="font-size:5px">${comment.ctime }</span>
 	
 	<c:if test="${user.rank eq '成员' }">
 	<c:if test="${user.username==comment.uname }">
 	<span class = "delete" style = "font-size:10px" cid="${comment.cid }">删除</span>
 	</c:if>
 	
 	
 	</c:if>
 	
 	<c:if test="${user.rank ne '成员' }">
 	
 	<span class = "delete" style = "font-size:10px" cid="${comment.cid }">删除</span>
 	
 	</c:if>
 	
 	<%--<c:if test="${user.username==comment.uname }">
 	<span class = "delete" style = "font-size:10px" cid="${comment.cid }">删除</span>
 	</c:if>
 	--%><br>
 	<hr>
 	</div>
 	</c:forEach>
 	</div>
 	<textarea class="text" placeholder="填写 评论"></textarea><button class = "button">提交评论</button>
 	<a class = "a" href="classphoto/index.jsp" target="_parent">返回首页</a>
  </body>
</html>
