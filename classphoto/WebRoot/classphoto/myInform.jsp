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
    
    <title>通知</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" href="/classphoto/bootstrap-3.3.7-dist/css/bootstrap-theme.css" type="text/css"></link>
<link rel="stylesheet" href="/classphoto/bootstrap-3.3.7-dist/css/bootstrap.css" type="text/css"></link>
<script src="/classphoto/js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="/classphoto/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
	
	<style type="text/css">
		.show_inform_div{
			
			//height:100px;
			margin-left: 50px;
		}
		body{
			user-select:none;
		}
		.show_inform_div hover:.show_inform_div{
			background-color: rgba(255,255,255,0.5);
		}
		
		.content{
			border:1px solid whith;
			width:550px;
			height:100px;
			margin-left: 10px;
			display: none;
			position:relative;
		}
		.onRead{
		text-decoration: none;
		font-size:10px;
		position:absolute;
		right: 100px;
		
		color:rgba(0,0,0,0.5)
		
		}
		.onRead a{
			text-decoration:none; 
		}
	</style>
	
	<script type="text/javascript">
		
	$(function(){
	
		
		$(".title_span").click(function(){
			var informId = $(this).attr("informId");
			var ele = $(this).parent("p").next();
			var ele1 =ele.siblings(".onRead").find(".read");
			var ele2 = $(this);
			console.log(ele1);
			if(ele.is(":hidden"))
				{
				ele.show("500");
				}else
					{
					ele.hide("500");
					}
			var count = $("#badge",parent.parent.document).text();
			
			if($(this).attr("state") !=2)
				{
					s = count
				$("#badge",parent.parent.document).text(count-1);
						
						{
							$.ajax({
							url:"${pageContext.request.contextPath }/inform_readInform?informId="+informId,
							type:"GET",
							success:function(result){
								
								ele1.text("已阅读");
								ele2.attr("state",2);
								
								
							}
						});
						
						}
					
				}
			
			
			
				});
		
	});
		
	</script>

  </head>
  
  <body>
  <div style="text-align: center;font-size:18px;" ><span>全部通知</span></div>
  <hr>
		<c:forEach items="${isReadAll }" var = "isRead">
			<div class = "show_inform_div">
			 	
				 	<p class = "text-info"><span state = ${isRead.state } informId = "${isRead.inform.informId }" class = "title_span">${isRead.inform.title }</span></p>
					<div class = "content">
						<span class="text-muted" style="font-size:17px;" >${isRead.inform.content}</span>
						
					</div>
					<span style = "font-size:12px;color:rgba(0,0,0,0.5);">发布者:${isRead.inform.uname }&nbsp;&nbsp;发布时间:${isRead.inform.itime}</span>
					
				<div class = "onRead">
					<c:if test="${isRead.inform.uname==user.username }">
						<span>我发布</span>&nbsp;&nbsp;
						<a class="text-danger" href="${pageContext.request.contextPath }/inform_showInform">删除</a>&nbsp;&nbsp;
						<a  href="${pageContext.request.contextPath }/inform_showInform">回收站</a>
					</c:if>
			 	<c:if test="${isRead.inform.uname ne user.username }">
						<c:if test="${isRead.state eq '1' }">
							<span class="read">未阅读</span>&nbsp;&nbsp;
						</c:if>
						<c:if test="${isRead.state eq '2' }">
							<span class="read">已阅读</span>&nbsp;&nbsp;
						</c:if>
			 			<a class="text-danger" href="${pageContext.request.contextPath }/inform_showInform">删除</a>&nbsp;&nbsp;
			 			<a  href="${pageContext.request.contextPath }/inform_showInform">回收站</a>
			 	</c:if>
			 	</div>
				<hr>
			</div>
			
					
		</c:forEach>
		
  </body>
</html>
