<%--
  Created by IntelliJ IDEA.
  User: 你微笑时很肥
  Date: 2018/10/12
  Time: 18:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>welcome</title>
    <style>
        #error{
            padding-top: 200px;
            margin: auto;
            text-align: center;
        }
        
        #error a{
        	text-decoration:none;
        }
        
    </style>
</head>
<body>
        <div id="error">

            <font size="5" color="green">未知错误，请选择&nbsp;<a href="${pageContext.request.contextPath }/classphoto/index.jsp" target="_parent">&nbsp;返回&nbsp;</a>或<a href="${pageContext.request.contextPath }/user_exit.action" target="_parent">&nbsp;退出&nbsp;</a></font>
        </div>
</body>
</html>
