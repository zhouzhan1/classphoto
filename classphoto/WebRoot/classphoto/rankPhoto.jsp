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
    <title>照片</title><%--
    <script src="https://code.jquery.com/jquery-1.12.4.js"
                  integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU="
                  crossorigin="anonymous">
      </script>
      --%>
      <script src="/classphoto/js/jquery-1.12.4.js"></script>
      <style type="text/css">
   		.one{
   			
   			width:100%;
   			height:100%;
   		}
   		.two{
   			
   			margin: auto;
   			width:90%;
   			height:80%;
   			
   		}
   		
   		.left{
   			background: url("${pageContext.request.contextPath}/img/7.png") no-repeat 0 0;
   			width:4%;
   			height:100px;
   			float:left;
   			 position:relative;
   			 top:240px;
   			 opacity: 0.5;
   		}
   		.left:hover{
   			opacity:1;
   		
   		}
   		
   		.right{
   			background: url("${pageContext.request.contextPath}/img/6.png") no-repeat 0 0;
   			width:4%;
   			height:100px;
   			float:right;
   			position:relative;
   			top:240px;
   			opacity: 0.5;
   		}
   		.right:hover{
   			opacity:1;
   		}
   		.three{
   			width:100% ;
   			height:70px;
   		}
   		.three p{
   			font-size:12px;
   			color:#ABE0FF;
   			font-family:"微软雅黑";
   		}
   		.three span{
   			font-size:14px;
   			color:#92D6FF;
			font-family:"微软雅黑";
   		}
   		.down{
   			width:100%;
   			height:40px;
   			text-align: center;
   			
   		}
   		.down a{
   			text-decoration:none;
   			
   			margin-right:50px;
   			color:#A25F29;
   			font-size: 17px;
   			
   		}
   		.four{
   			width:50px;
   			height:23px;
   			border-radius: 5px;
   			text-align:center;
   			background-color:rgba(255,255,255,0.5);
   			position:relative;
    		top:-30px;  
    		left:912px;  		
    		user-select:none;
    		display: none;
   		}
   		.two:hover .four{
   			display: block;
   		}
   		.seven{
    		display:none;
    		border:1px solid white;
    		background-color:rgba(120,220,220,0.7);
    		width:350px;
    		height:120px;
    		 border-radius: 10px;
    		text-align: center;
    		position:absolute;
    		top:100px;
    		right:405px    		    		
    	}
    	.seven span{
    		font-size:14px;
    		position:relative;
    		top:20px;
    		left:-20px;
    		
    	}
    	.seven select{
    		border: none;
    		width: 160px;
   			height: 25px;
    		border-radius: 3px;
    		position:relative;
    		top:20px;
    		left:20px;
    	}
    	.but1{
    		border:none;
    		width:60px;
    		height:30px;
    		background-color:#7A88FF;    		
    		position:relative;
    		border-radius: 3px;
    		top:50px;
    		
    	}
    	.btnback{
    		border:none;
    		width:60px;
    		height:30px;
    		background-color:#ffffff;    		
    		position:relative;
    		border-radius: 3px;
    		top:50px;
    	}
   		
   </style>

  <script>
  
  $(function () {
      //编写jQuery代码
        	$(".left").click(function(){
  			$(".span1").trigger("click");
  			
  	});
        	$(".right").click(function(){
      			$(".span2").trigger("click");
      			
      	});
        	
        		
        //删除权限
        	var num = $(".rank").val();
        	var meg = $(".meg").val();
        	
    		$(".four,.span6").click(function()
             {
    			 if(num=="成员")
             	{
             	 // $(".seven").fadeIn(500);
             	 alert("你无法执行删除操作，请联系辅导员或班长");
             	 
             	}else
             	{
             		if(confirm("确认删除该相片吗？"))
                    {
                      //location.href="${pageContext.request.contextPath}/album_deleteAlbum?albumName="+albumName;
             			$(".span3").trigger("click");  
                    }
                	            
                }
                  
    		});
    		
    		$(".remove").click(function(){
    			if(num=="成员")
             	{
             	 // $(".seven").fadeIn(500);
             	 alert("你无法执行删除操作，请联系辅导员或班长");
             	 
             	}else
             		{
             		$(".seven").show();
             		}
    			
    			
    		});
    		$(".btnback").click(function(){
    			$(".seven").hide();
    		});
    		
    		$(".but1").click(function(){
    			var pid = $(this).attr("pid");
    			var aid = $(".seven select").val();
    			
    			location.href="${pageContext.request.contextPath}/photo_removePhoto?aid="+aid+"&pid="+pid;
    			
    		})
      
      if(meg=="移动成功")
    	  {
    	  	alert(meg);
    	  }
  });
  
  		
  </script>
  
  
  </head>
  
  <body>
  
  	<div class = "one">
  	
  
  	<div class = "three">
  	<span>&nbsp; 照片详情:</span>
  	<p>&nbsp; 上传时间：${photo.ptime }&nbsp;上传者：${photo.pname }</p>
  	</div>
    <div class = "two">
   	<img  style = "height:100%;width:100%"src='/${photo.address }'> 

   	</div>
   	<div class ="down">
  
   	<a href="${pageContext.request.contextPath }/photo_bigPhoto?address=${photo.address}&pid=${photo.pid}&aid=${photo.album.aid}">原图</a>
   	<a href="${pageContext.request.contextPath }/photo_toCommentPage?pid=${photo.pid}"><span>查看评论</span></a>
   	</div>
  	</div>
  	
  	<div class = "seven">
    
    <span>移动至:</span>
    <select>
 
    	<c:forEach items="${albumAll }" var = "a">
  			<option value= "${a.aid }">${a.albumName}</option>
  	
  		</c:forEach>
    </select>
    <br>
     <button class = "btnback">取消</button>
    <button class = "but1" pid = "${photo.pid }">确定</button>
    </div>
  	<input class = "rank" type="hidden" value="${user.rank }">
	<input class = "meg" type="hidden" value="${meg }">
  </body>
</html>
