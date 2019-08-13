<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE body PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>所有相册</title>
<link rel="stylesheet" href="/classphoto/bootstrap-3.3.7-dist/css/bootstrap-theme.css" type="text/css"></link>
<link rel="stylesheet" href="/classphoto/bootstrap-3.3.7-dist/css/bootstrap.css" type="text/css"></link>
<script src="/classphoto/js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="/classphoto/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
      <script type="text/javascript">
      $(function () {
          //编写jQuery代码
          
          
				var num = $(".rank").val();
          
				$(".span_update").click(function()
		                 {
		        			
		        			var aid=$(this).attr("aid");
		        			
		        			 if(num=="成员")
		                 	{
		                 	  alert("你无法执行删除操作，请联系辅导员或班长");
		                 	  
		                 	}else
		                 	{		
		                 		
		                 		location.href="${pageContext.request.contextPath}/album_toAddPage?aid="+aid;
		                        
		                    }
		                      
		        		});
          
        		$(".span4").click(function()
                 {
        			
        			var aid=$(this).attr("aid");
        			
        			 if(num=="成员")
                 	{
                 	  alert("你无法执行删除操作，请联系辅导员或班长");
                 	  
                 	}else
                 	{		
                 		if(confirm("确认删除该相册吗？"))
                        {
                                location.href="${pageContext.request.contextPath}/album_deleteAlbum?aid="+aid;
                        }
                    }
                      
        		});
        		
     
     
      });
      </script>
      
	<style>
	
		.one1{
			width:169px;
    		height:109px;
    		border:2px solid white;
    		position:relative;
    		top:-139px;
    		
		}
		.one2{
			width:169px;
			height:30px;
			padding-top: 1px;
			position:relative;
    		top:-139px;
		
		}
		.one{
		    padding-right: 14px;
    	    padding-top: 1px;
    	    margin-top:10px;
    		width:32%;
    		height:135px;
    		float: left;
			border:1px solid white;
			text-align: center;
			background-color：yellow;
			/*background-size:cover;*/
			overflow:hidden;
			
		}
		
		.two{
    	width:100%;
    	height:70px;
    	text-align: center;
    	position:relative;
    	
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
    	.one2 a {
    		text-decoration:none;
    		position:relative;
    		top:80px;
    	}
    	
    	.one2 span{
    		user-select:none;
    		color:#8d627e;
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
    	
    		.six a{
        		color:yellow;
        		background-color:rgba(135,102,96,0.7);
        	}
    		
    	.one1:hover .six {
            display: block;
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
    	.sp{
    		user-select:none;
    		color:#8d627e;
    	}
    	.desc{
    		
    		position:relative;
    		left:185px;
    		top:4px;
    		width:200px;
    		height: 125px;
    		font-size: 12px;
    	}
    	.alldiv{
    		overflow:auto;
    	}
	</style>
	

</head>
  <body>
  <div class = "two">
  <h4>浏览相册</h4>
   <a href = "${pageContext.request.contextPath }/classphoto/addAlbum.jsp">添加相册</a>
   <br>
   <span class = "sp">${meg }</span>
   <br>
   <br>
   </div>
   <hr>
   <div class = "alldiv">
   <c:forEach items="${listAlbum}" var="album">
   
   		
   		
   		<div class="one">
   			<div class = "desc">
   				<p>创建者：${album.aname }</p>
   				<span>描述：${album.albumDesc }</span>
   			</div>
   			<div class = "one1">
   				<a href="${pageContext.request.contextPath}/photo_showPhoto?aid=${album.aid}"><img class = "img-thumbnail" title='${album.albumDesc }' style="width: 100%;height: 100%" src ='/${album.aPhotoAddress}'/></a>
   				<c:if test="${user.rank ne '成员' }">
   					<div class = "six"><button><span class = "span4" aid="${album.aid }">删除</span></button>&nbsp;<button class="update_album"><span class = "span_update" aid="${album.aid }">修改</span></button></div>
   				</c:if>
   				
   			</div>
   			
     		<div class = "one2">
   			 <span>${album.albumName }</span>
   			</div>
   			
   		 	
   		</div>
   		
   </c:forEach>
   </div>
   <%--
   <div class = "delete">
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
    --%>
	<input class = "rank" type="hidden" value="${user.rank }">
  
  </body>
</html>
