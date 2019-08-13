<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>上传照片</title>
    
  <style>
   	.one{
   		    height: 150px;
            width: 200px;
            margin: auto;
            padding-top: 70px;
            text-align: center;       
   	}
   	
	.input1{
			height:50px;
			background: rgba(255,255,255,0);
	}
	.input2{
			width:100px;
			height:35px;
			color:#FF7A19;
			font-size:15px;
			background: #d6c5ad;
			
	}
	
	h5{
		position:relative;
		top:0px;
	}
	.meg{
		color:red;
		font-size:14px;
	}
	.back{
		text-decoration: none;
		padding-right: 20px;
		color:black;
	
	}
 
  </style>
    
  </head>
  
  <body>
  <div class="one">
  	 <form action="${pageContext.request.contextPath }/photo_addPhoto?aid=${aid}&albumName=${albumName}" method = "post" enctype="multipart/form-data">
  	 <h5>添加照片</h5>
  	 <span class= "meg">${meg }</span>
  	 <table>
            <tr>
                 <td>&nbsp;</td>
            <tr>
  	 		 <tr>
            <td>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</td>
            <td>${user.username }</td>
            </tr> 
            <tr>
                 <td>&nbsp;</td>
            <tr>
            <td>相册名称：</td>
            <td>${albumName }</td>
            </tr> 
            <tr>
                 <td>&nbsp;</td>
            </tr>
      </table>
       
  	<input type="file" name = "upload" class="input1">
  <hr>
  	<a class= "back"  href="${pageContext.request.contextPath }/photo_showPhoto?aid=${aid}">返回</a>
  	<input type="submit" value="添加" class="input2">
  	 	
    </form>
  		
  </div>
   
    
  </body>
</html>
