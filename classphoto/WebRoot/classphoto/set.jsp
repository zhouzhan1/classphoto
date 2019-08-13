<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
		<link rel="stylesheet" href="/classphoto/bootstrap-3.3.7-dist/css/bootstrap-theme.css" type="text/css"></link>
		<link rel="stylesheet" href="/classphoto/bootstrap-3.3.7-dist/css/bootstrap.css" type="text/css"></link>
		<script src="/classphoto/js/jquery-1.12.4.js"></script>
		<script type="text/javascript" src="/classphoto/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
	<style>
		.all{
			width:100%;
			height:100%;
			background-color:blue;
			opacity:0.5;
			user-select:none;	
		}
		.one{
			width:20%;
			height:100%;
			text-align:center;
			background-color:white;
			position:absolute;
			border: 2px solid black;
	
		}
		
		.one li{
			list-style: none;
			position:relative;
			left:-15px;
			padding-top:30px;
			padding-bottom:30px;;
		}
		
		#two{
			width:80%;
			height:100%;
			background-color:white;
			border: 2px solid black;
			float:right;
			text-align:center;
			
			
			
		}
		.span1{
			color:blue;
			position:absolute;
			
		}
		#two p{
			padding-top:30px;
		}
		
		#three{
			width:80%;
			height:100%;
			background-color:white;
			border: 2px solid black;
			float:right;
			text-align:center;
			display: none;
			
		}
		
		#five{
			width:80%;
			height:100%;
			background-color:white;
			border: 2px solid black;
			float:right;
			text-align:center;
			display: none;
			
			
		}
		
		#three p{
			padding-top:30px;
		}
		
		#four{
			width:80%;
			height:100%;
			background-color:white;
			border: 2px solid black;
			float:right;
			text-align:center;
			display: none;
			
		}
		#four p{
			padding-top:30px;
		}
		
		.col{
			background:rgba(100,255,255,1);
		}
		.disp{
			
			display:block;
		}
		
		.but1{
			width:100px;
			height:30px;
			background-color:#AAD1FF;
			
			position:relative;
			top:20px;
		}
		
		.meg{
			font-size:14px;
			color:red;
			position:relative;
			top:70px;
			left:-238px;
		}
		.set{
			display:none;
			border-radius:5px;
			border:1px solid red;
			width:350px;
			height:150px;
		
			position:relative;
			top:100px;
			left:400px;
			background-color:rgba(100,255,255,0.5);
		}
		#setPassword{
			display:none;
		}
		#setClzz{
			display:none;
		}
		#setschool{
			display:none;
		}
		#logout{
			display:none;
		}
		.megShow{
			font-size: 14px;
			color:red;
			position:relative;
			top:60px;
		}
		.e{
			font-size: 14px;
			color:red;
			position:relative;
			top:0px;
		}
		
		.x{
		
			width:23px;
			height:21px;
			position:relative;
			
			right:-324px;
			border-radius:2px;
			 background:url("${pageContext.request.contextPath}/img/12.png");
		}
		.six{
			text-align:center;
			margin:auto;
			width:70%;
			height:80%;
			overflow: auto;
			
		}
		
		.tab{
			
			width:100%;
			height:30px;
			text-align:center;
			border:1px solid green;
		}
		
		.tab th{
			background-color:#b2ffff;
			height:35px;
		}
		.tab td{
			height:33px;
			border-top:1px solid green;
			font-size:14px;
		}
		.tab td a{
			 text-decoration: none;
		}
		
		.delete{
    		display:none;
    		background:rgba(178,255,255,1);
    		width:350;
    		height:120;
    		text-align:center;
    		border-radius: 10px;
    		position:absolute;
    		top:200px;
    		right:450px 
    		
    	}
    	.but2{
    		border:1px solid green;
    		background-color:#ff7e7e;
    		border-radius: 5px;
    		position:relative;
    		left:75px;
    		width:60px;
    		height:30px;
    		
    		border:none
    	}
    		.but3{
    		
    		background-color:#00ffff;
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
    	}
    	
    	.seven{
    		display:none;
    		border:1px solid white;
    		background-color:rgba(178,255,255,1);
    		width:350px;
    		height:120px;
    		 border-radius: 10px;
    		text-align: center;
    		position:absolute;
    		top:200px;
    		right:420px    		    		
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
    	
    	.but4{
    		
    		background-color:#00ffff;
    		border-radius: 5px;
    		position:relative;
    		left:85px;
    		
    		width:60px;
    		height:30px;
    		border:none
    	}
    	
    	table tr:nth-child(even){ 
			background: rgba(100,255,255,0.5);
			}
		
	</style>
	   <script src="/classphoto/js/jquery-1.12.4.js"></script>
	
      
       <%--<script src="https://code.jquery.com/jquery-1.12.4.js"
                  integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU="
                  crossorigin="anonymous">
      </script>
      --%><script type="text/javascript">
      $(function () {
		$("#li1").click(function(){
			$(this).addClass("col");
			$("#li2").removeClass("col");
			$("#li3").removeClass("col");
			$("#li4").removeClass("col");
			$("#li5").removeClass("col");
			
			$("#two").css("display","block");
			$("#four").css("display","none");
			$("#three").css("display","none");
			$("#five").css("display","none");
			
		});
		
		$("#li2").click(function(){
			$(this).addClass("col");
			$("#li1").removeClass("col");
			$("#li3").removeClass("col");
			$("#li4").removeClass("col");
			$("#li5").removeClass("col");
			
			$("#three").css("display","block");
			$("#four").css("display","none");
			$("#two").css("display","none");
			$("#five").css("display","none");
		});
		
		$("#li3").click(function(){
			$(this).addClass("col");
			$("#li1").removeClass("col");
			$("#li2").removeClass("col");
			$("#li4").removeClass("col");
			$("#li5").removeClass("col");
			
			$("#five").css("display","block");
			$("#three").css("display","none");
			$("#two").css("display","none");
			$("#four").css("display","none");
			
		});
		
		$("#li4").click(function(){
			$(this).addClass("col");
			$("#li1").removeClass("col");
			$("#li2").removeClass("col");
			$("#li3").removeClass("col");
			$("#li5").removeClass("col");
			
			$("#four").css("display","block");
			$("#three").css("display","none");
			$("#two").css("display","none");
			$("#five").css("display","none");
			
		});
		
		$("#li5").click(function(){
			$(this).addClass("col");
			$("#li2").removeClass("col");
			$("#li3").removeClass("col");
			$("#li1").removeClass("col");
			$("#li4").removeClass("col");
			
			$(".goIndex").trigger("click");
			
		});
		//修改密码
		$(".but1").eq(0).click(function(){
			 $("#setPassword").fadeIn(700);
			 $("#setClzz").fadeOut(0);
			 $("#setSchool").fadeOut(0);
			 $("#logout").fadeOut(0);
			 $("#setPhone").fadeOut(0);
		});
		$(".x").click(function(){
			$("#setPassword").fadeOut(700);
			
		})
		//修改班级
			$(".but1").eq(1).click(function(){
			 $("#setClzz").fadeIn(700);
			 $("#setPassword").fadeOut(0);
			 $("#setSchool").fadeOut(0);
			$("#logout").fadeOut(0);
			$("#setPhone").fadeOut(0);
		});
		$(".x").click(function(){
			$("#setClzz").fadeOut(700);
		})
		//修改学校
			$(".but1").eq(2).click(function(){
			 $("#setSchool").fadeIn(700);
			 $("#setPassword").fadeOut(0);
			 $("#setClzz").fadeOut(0);
			$("#logout").fadeOut(0);
			$("#setPhone").fadeOut(0);
		});
		$(".x").click(function(){
			$("#setSchool").fadeOut(700);
		})
		
		//修改手机
			$(".but1").eq(3).click(function(){
			 $("#setPhone").fadeIn(700);
			 $("#setPassword").fadeOut(0);
			 $("#setClzz").fadeOut(0);
			$("#logout").fadeOut(0);
			$("#setSchool").fadeOut(0);
		});
		$(".x").click(function(){
			$("#setPhone").fadeOut(700);
		})
		
		//注销用户
		$(".but1").eq(4).click(function(){
		$("#logout").fadeIn(700);
		 $("#setPassword").fadeOut(0);
		 $("#setSchool").fadeOut(0);
		$("#setClzz").fadeOut(0);
		$("#setPhone").fadeOut(0);
		});
		$(".x").click(function(){
			$("#logout").fadeOut(700);
		})
		
		//判断是否提交过 
		var meg= $(".meg").val();
		if(meg)
		{
			$("#li4").trigger("click");
		}
		var erroremg= $(".e").val();
		if(erroremg)
		{
			$("#li3").trigger("click");
		}
		
		
		//移除班级成员，班主任可移除
	var rank = $(".rank").val();

		
		$(".removeSpan").click(function(){
			if(rank !="辅导员")
				{
					alert("无限权执行此操作，请联系辅导员");
				}else
					{
					if(confirm("确认移除此学生吗？"))
						{
						var uid = $(this).attr("uid");
						location.href="${pageContext.request.contextPath }/user_removeUser.action?uid="+uid;
						}
					
					}
		});
		
		var $shu = $(".shu");
        for(var i = 0;i<$shu.length;i++)
        	{
        		
        		$shu[i].append(i+1);
        	}
      });
      
      
      </script>

</head>
  
  <body>
    <div class = "all">
    	<div class = "one">
    	   <h4>个人中心</h4>	
    	   <hr>	
    	   <ul class = "u">
    	   		<li id = "li1" class = "col">个人信息</li>
    	   		<li id = "li2">班级信息</li>
    	   		<li id = "li3">班级成员</li>
    	   		<li id = "li4">设置</li>
    	   		<li id = "li5">返回</li>
    	   </ul>
    	   
    	   <a href = "${pageContext.request.contextPath }/user_goIndex.action"><span class = "goIndex"></span></a>
    	   
    	</div>
    	
    	<div id = "two" class = "disp">
    		<h3>个人信息</h3></br>
    		<hr>
    		<p>学校名称：${user.school }</p><span></span>
    		<p>所在班级：${user.clzz }</p><span></span>
    		<p>手机号码：${user.phone }</p>
    		<p>创建的相册：${countAlbum } 个</p><span></span>
    		<p>上传的照片：${countPhoto } 张</p><span></span>
    	</div>
    	
    	<div id = "three" class = "three">
    		<h3>班级信息</h3>
    		<br>
    		<hr>
    		<p>学校名称：${user.school }</p><span></span>
    		<p>班级名称：${user.clzz }</p><span></span>
    		<p>班级人数：${allUserCount } 人</p><span></span>
    		<p>班级相册总数：${allAlbum } 个</p><span></span>
    		<p>上传的照片总数：${allPhoto } 张</p><span></span>
    	</div>
    	
     	<div id = "four" class = "four">
    		<h3>设置</h3>
    		<br>
    		<hr>
    		<button class = "but1">设置密码</button>
    		<button class = "but1">设置班级</button>
    		<button class = "but1">修改学校</button>
    		<button class = "but1">修改手机</button>
    		<button class = "but1">注销用户</button>
    		<br>
    		<span class = "megShow">${meg}</span>
    		
    		<div id = "setPassword" class = "set">
    		<div class = "x"></div>
    		<form action="${pageContext.request.contextPath }/user_setPassword.action" method="post">
    			<span>旧密码:&nbsp;</span><input type="password" name = "oldPassword">
    			</br>
    			</br>
    			<span>新密码:&nbsp;</span><input type="password" name = "password">
    			</br>
    			</br>
    			<input type="submit" class = "sub" value="确定">
    			</form>
    		</div>
    		
    		<div id = "setClzz" class = "set">
    		<div class = "x"></div>
    		<form action="${pageContext.request.contextPath }/user_setClzz.action" method="post">
    			<span>新班级:&nbsp;</span><input type="text" name = "clzz">
    			</br>
    			</br>
    			<span>密&nbsp;&nbsp;&nbsp;码:&nbsp;</span><input type="password" name = "password">
    			</br>
    			</br>
    			<input type="submit" class = "sub" value="确定">
    			</form>
    		</div>
    		
    		<div id = "setSchool" class = "set">
    			<div class = "x"></div>
    			<form action="${pageContext.request.contextPath }/user_setSchool.action" method="post">
    			<span>新学校:&nbsp;</span><input type="text" name = "school">
    			</br>
    			</br>
    			<span>密&nbsp;&nbsp;&nbsp;码:&nbsp;</span><input type="password" name = "password">
    			</br>
    			</br>
    			<input type="submit" class = "sub" value="确定">
    			</form>
    		</div>
    		
    		<div id = "setPhone" class = "set">
    		<div class = "x"></div>
    		<form action="${pageContext.request.contextPath }/user_setPhone.action" method="post">
    			<span>新号码:&nbsp;</span><input type="text" name = "phone">
    			</br>
    			</br>
    			<span>密&nbsp;&nbsp;&nbsp;码:&nbsp;</span><input type="password" name = "password">
    			</br>
    			</br>
    			<input type="submit" class = "sub" value="确定">
    			</form>
    		</div>
    		
    		<div id = "logout" class = "set">
    		<div class = "x"></div>
    		<form action="${pageContext.request.contextPath }/user_logout.action" method="post">
    			<span>确定注销该账号？</span>
    			</br>
    			</br>
    			<span>请输入密码:&nbsp;</span><input type="password" name = "password">
    			</br>
    			</br>
    			<button class="yes">确定</button>&nbsp;
    		</form>
    		</div>
    		<input type="hidden" value="${meg }" class = "meg">
    		<input type="hidden" value="${e}" class="e">
    		<input type="hidden" value="${user.rank }" class = "rank">
    	
    	</div>
    	
    	<div id="five">
    	<h3>班级成员</h3>
    		
    		<span class = "e">${e}</span>
    		<br>
    		<hr>
    		<div  class = "six">
    		<table id="tab1" class = "table">
    			<tr>
    				<th>#</th>
    				<th>姓名</th>
    				<th>属性</th>
    				<th>手机</th>
    				<c:if test="${user.rank eq '辅导员' }">
    				<th>操作</th>
    				</c:if>
    			</tr>
    			<c:forEach items="${allUser}" var="u">
    			<tr>
    				<td class = "shu"></td>
    				<td>${u.username }</td>
    				<td>${u.rank }</td>
    				<td>${u.phone }</td>
    				<c:if test="${user.rank eq '辅导员' }">
    				<td><a class = "remove" href="javascript:;"><span class= "removeSpan" uid="${u.uid}">移除</span></a>
    				</c:if>
    			</tr>
    			</c:forEach>
    			
    		</table>
    	
    		</div>
    	</div>
    	
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
    <button class = "but4">确定</button>
    </div>
    	
    --%></div>
  </body>
</html>
