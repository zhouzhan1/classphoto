<%--
  Created by IntelliJ IDEA.
  User: 你微笑时很肥
  Date: 2018/10/11
  Time: 13:04
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>注册</title>

    <style>
        #two{
            border: 1px solid red;
            height:500px;
            width: 350px;
            margin: auto;
            position:absolute;
            top:100px;
           	right:50px;
            text-align: center;
            background-color:rgba(255,195,96,0.7);
       
        }
        #one{

            width: 300px;
            height: 300px;
            margin: 50px auto ;
            text-align: center;
        }
        #tbl tr td{
            width: 130px;
           
            
        }
        table{
        	 border-collapse:separate;
        	 border-spacing:0px 10px;
        }
       a{
           text-decoration: none;
       }
       
       .all{
       		
       		width:100%;
       		height:100%;
       		background:url("${pageContext.request.contextPath}/img/tt.jpeg");
       }
       .all h1{
       	color:yellow;
       	text-align:center;
       }
     
       .regist input{
       		border-radius:5px;
        	width:60px;
    		height:30px;
    		background-color:white;
    		position:relative;
    		left:80px;
    		top:40px;
       }
       .forLogin{
       		position:relative;
    		left:85px;
    		top:40px;
       }
       .meg{
       		width:50px;
       		
       		color:red;
       		position:relative;
       		top:10px;
       }
       .but1{
    		width:60px;
    		height:30px;
    		background-color:#7A88FF;    		
    		position:relative;
    		border-radius: 5px;
    		top:40px;
    		left:-53px;
    		
    	}

    </style>
        </style>
        <script src="../js/jquery-1.12.4.js"></script>
       <%--<script src="https://code.jquery.com/jquery-1.12.4.js"
                  integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU="
                  crossorigin="anonymous">
      </script>
    
--%></head>
<body>

<div class = "all">
<h1>欢迎使用班级相册管理软件</h1>
<div id="two">

    <div id="one">

        <h4>用户注册</h4>


        <form action="${pageContext.request.contextPath}/user-regist" method="post">
            <table id="tbl">
        <tr>
            <td>真实姓名：</td>
            <td><input type="text" name="username" value="${u.username }"></td>
			
        </tr>

        <tr>
            <td>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
            <td><input type="password" name="password"></td>
            

        </tr>

                <hr>
        <tr>
            <td>确认密码：</td>
            <td><input type="password" name="password1"></td>
        </tr>
        
            <tr>
            <td>手机号码：</td>
            <td>  <input type="text" name="phone" value="${u.phone }"></td>

        </tr>

        <tr>
            <td>所在学校：</td>
            <td>  <input type="text" name="school" value="${u.school }"></td>

        </tr>

        <tr>
            <td>所在班级：</td>
            <td><input type="text" name="clzz" value="${u.clzz }"></td>

        </tr>

                <tr>
                    <td>你&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;是：</td>
                    <td>
                        <select name="rank" style="width: 130px">
                            <option name="o" value="成员" <c:if test="${u.rank=='成员' }">selected='selected'</c:if>>成员</option>
                            <option name="o" value="班长" <c:if test="${u.rank=='班长' }">selected='selected'</c:if>>班长</option>
                            <option name="o" value="辅导员" <c:if test="${u.rank=='辅导员' }">selected='selected'</c:if>>辅导员</option>

                        </select>
                        <input type="hidden" value="${u.rank }" class="rank">
                    </td>

                </tr>

            

       

         </table>
         <span class="meg">${meg }</span>
         <div class = "regist">
            <span class = "forLogin"><a href="${pageContext.request.contextPath}/classphoto/login.jsp">已有账号</a> </span>
            <button class = "but1" type="submit">注册</button>
         </div>
         </form>

    </div>
	
    </div>
   </div>
</body>
</html>
