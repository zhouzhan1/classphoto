<%--
  Created by IntelliJ IDEA.
  User: 你微笑时很肥
  Date: 2018/10/11
  Time: 13:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登陆</title>

    <style>
        #one{
            border: 1px solid red;
            height:400px;
            width: 350px;
            margin: auto;
            text-align: center;
            background-color:rgba(255,195,96,0.7);
             
            position:absolute;
            top:180px;
           	right:50px;
        }
        /*#span1{*/
            /*height: auto;*/
            /*width: auto;*/
            /*text-align: center;*/
        /*}*/

    #two{
        margin: 30px auto;
        text-align: center;
          
          
       
    }
        a{
            text-decoration: none;
        }
        .all{
        	width:100%;
        	height:100%;
        	background:url('${pageContext.request.contextPath}/img/tt.jpeg') no-repeat;
        	

        	
        }
        .login{
        	border-radius:5px;
        	width:60px;
    		height:30px;
    		background-color:#7A88FF;
    		position:relative;
    		left:60px;
    		top:30px;  
    		
    		}
    		.span{
    			position:relative;
    			left:70px;
    			top:30px;
    		}
    		.all h1{
    			color:yellow;
    			text-align:center;
    			position:relative;
    			top:10px;
    		}

    </style>
</head>
<body>
	<div class = "all">
	<h1>欢迎使用班级相册管理软件</h1>
    <div id="one" >
        <h4>用户登陆</h4>


        <div id="two">
            <form action="${pageContext.request.contextPath }/user-login.action" method="post" target="_parent">
            <font color="red"> ${meg}</font></br></br>
        <tr>
            <td>用户名：</td>
            <td><input type="text" name="username"></td>
        </tr>
        </br></br></br>

        <tr>
            <td>密&nbsp;&nbsp;&nbsp;码：</td>
            <td><input type="password" name="password"></td>
        </tr></br> </br></br>
       
            <tr>
                <td>&nbsp;</td>
                <td><input class = "login" type="submit" value="登陆"></td>

            </tr>
                <span class="span"><a href="${pageContext.request.contextPath }/classphoto/regist.jsp">没有账号?</a> </span>
            </form>

        </div>

    </div>
</div>
</body>
</html>
