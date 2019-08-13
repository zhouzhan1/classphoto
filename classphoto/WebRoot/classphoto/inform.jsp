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
		.modal-backdrop {
  			opacity: 0 !important;
  			filter: alpha(opacity=0) !important;
		}
	</style>
	
	<script type="text/javascript">
		
	$(function(){
		
		
		
		
		
		//加入回收站
		$(".addBackInform").click(function(){
			var rid = $(this).attr("rid");
			var state = $(this).attr("state");
		//	var count = $("#badge",parent.parent.document).text();
			var ele = $(this).parents(".show_inform_div");
			
			
			
			
				
				if(state==1){
					$("#badge",parent.parent.document).text(ele_badge.text()-1);
					ele_noread.text(ele_badge.text());
				}
				
				$.ajax({
					
					url:"${pageContext.request.contextPath }/inform_addBackInform?rid="+rid,
					type:"GET",
					success:function(result){
					
						ele.hide(500);
						
					}
				});
			
		
		});
		
		//var count = $("#badge",parent.parent.document).text();
		var ele_badge = $("#badge",parent.parent.document);
		var ele_noread = $("#noReadBadge",parent.parent.document);
		//阅读
		$(".title_span").click(function(){
			var rid = $(this).attr("rid");
			var ele = $(this).parent("p").next();
			var ele1 =ele.siblings(".onRead").find(".read");
			var ele2 = $(this);
			var ele3 = $(this).parents(".show_inform_div").find(".addBackInform");
			var ele4 = $(this).parents(".show_inform_div").find(".deleteInform_back");
		
			if(ele.is(":hidden"))
				{
				ele.show("500");
				}else
					{
					ele.hide("500");
					}
			
			
			if($(this).attr("state") == 1)
				{
			
				ele_badge.text(ele_badge.text()-1);
				ele_noread.text(ele_badge.text());
						
						{
							$.ajax({
							url:"${pageContext.request.contextPath }/inform_readInform?rid="+rid,
							type:"GET",
							success:function(result){
								
								ele1.text("已阅读");
								ele2.attr("state",2);	
								ele3.attr("state",2);
								ele4.attr("state",2);
							}
						});
						
						}
					
				}
			});
		
		//删除
		$(".deleteInform_back").click(function(){
			var informId = $(this).attr("informId");
			var informUname = $(this).attr("informUname");
			var rid = $(this).attr("rid");
			var rank = "${user.rank}";
			var username = "${user.username}";
			var state = $(this).attr("state");
			var $ele = $(this).parents(".show_inform_div");
		
			
			if(rank != "辅导员")
				{
					if(informUname != username){
						if(confirm("确定永久删除此通知吗？")){
							if(state == 1){
								ele_badge.text(ele_badge.text()-1);
								ele_noread.text(ele_badge.text());
							}
							delete_inform_other(rid);
						}
					}else{
						$("#oType").text("删除：删除您的通知记录,    "+
								"彻底删除：将彻底删除此通知");
						$("#myModal").modal();
						$("#delete_inform_other").click(function(){
							if(state == 1){
								ele_badge.text(ele_badge.text()-1);
								ele_noread.text(ele_badge.text());
							}
							delete_inform_other(rid);
							$("#myModal").modal("hide");
						});
						
						$("#delete_inform_me").click(function(){
							if(state == 1){
								ele_badge.text(ele_badge.text()-1);
								ele_noread.text(ele_badge.text());
							}
							delete_inform_me(informId);
							$("#myModal").modal("hide");
						});
						
					}
				
				}else{
					$("#oType").text("删除：删除您的通知记录,    "+
					"彻底删除：将彻底删除此通知");
					$("#myModal").modal();
					$("#delete_inform_other").click(function(){
						if(state == 1){
							ele_badge.text(ele_badge.text()-1);
							ele_noread.text(ele_badge.text());
						}
						delete_inform_other(rid);
						$("#myModal").modal("hide");
					});
					
					$("#delete_inform_me").click(function(){
						if(state == 1){
							ele_badge.text(ele_badge.text()-1);
							ele_noread.text(ele_badge.text());
						}
						delete_inform_me(informId);
						$("#myModal").modal("hide");
					});
					
				}
			
			function delete_inform_me(informId){
				$.ajax({
					url:"${pageContext.request.contextPath }/inform_deleteInform_me?informId="+informId,
					type:"GET",
					success:function(result){
					
						$ele.hide(500);
					}
				});
			}
			
			function delete_inform_other(rid){
				$.ajax({
					url:"${pageContext.request.contextPath }/inform_deleteInform_other?rid="+rid,
					type:"GET",
					success:function(result){
					
						$ele.hide(500);
					}
				});
			}
		
		
		});
		
		var l = $(".show_inform_div").length;
		if(l==0){
			$(".l").text("此栏暂无消息");
		}
		});
		

		
	</script>

  </head>
  
  <body>
  <div style="text-align: center;font-size:18px;" >
  	<c:if test="${whatInform eq 1 }">
  <span>全部通知</span>
  </c:if>
  <c:if test="${whatInform eq 2 }">
  <span>未读通知</span>
  </c:if>
    <c:if test="${whatInform eq 3 }">
  <span>辅导员通知</span>
  </c:if>
  
   <c:if test="${whatInform eq 4 }">
  <span>我的通知</span>
  </c:if>
  
  </div>
  <hr>
  	<span style="margin-left:50px;font-size:20px;" class = "l"></span>
		<c:forEach items="${isReadAll }" var = "isRead">
			<div class = "show_inform_div">
			 	
				 	<p class = "text-info"><span state = ${isRead.state } rid = "${isRead.rid }" class = "title_span">${isRead.inform.title }</span></p>
					<div class = "content">
						<span class="text-muted" style="font-size:17px;" >${isRead.inform.content}</span>
						
					</div>
					<span style = "font-size:12px;color:rgba(0,0,0,0.5);">发布者:${isRead.inform.uname }&nbsp;&nbsp;发布时间:${isRead.inform.itime}</span>
					
				<div class = "onRead">
					<c:if test="${isRead.inform.uname==user.username }">
						<span>我发布</span>&nbsp;&nbsp;
						<a class = "deleteInform_back" class="text-danger" informId=${isRead.inform.informId } state=${isRead.state } informUname=${isRead.inform.uname } rid = ${isRead.rid } href="javascript:">删除</a>&nbsp;&nbsp;
						<a class = "addBackInform" state = ${isRead.state }  rid = ${isRead.rid } href="javascript:">回收站</a>
					</c:if>
			 	<c:if test="${isRead.inform.uname ne user.username }">
						<c:if test="${isRead.state eq '1' }">
							<span class="read">未阅读</span>&nbsp;&nbsp;
						</c:if>
						<c:if test="${isRead.state eq '2' }">
							<span class="read">已阅读</span>&nbsp;&nbsp;
						</c:if>
			 			<a class = "deleteInform_back" class="text-danger" informId=${isRead.inform.informId } state=${isRead.state } informUname=${isRead.inform.uname } rid = ${isRead.rid } href="javascript:">删除</a>&nbsp;&nbsp;
			 			<a class = "addBackInform" state = ${isRead.state }  rid = ${isRead.rid } href="javaScript:">回收站</a>
			 	</c:if>
			 	</div>
				<hr>
			</div>
			
					
		</c:forEach>
		
		<div id = "myModal" class="modal fade" tabindex="-1" role="dialog">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h4 class="modal-title">系统提示</h4>
			      </div>
			      <div class="modal-body">
			        <p id ="oType">
			        	
			        </p>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
			        <button id = "delete_inform_other" type="button" class="btn btn-primary">删除</button>
			        <button id = "delete_inform_me" type="button" class="btn btn-primary">彻底删除</button>
			      </div>
			    </div><!-- /.modal-content -->
			  </div><!-- /.modal-dialog -->
			</div>
			
			</body>
</html>
