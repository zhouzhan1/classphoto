<%--
  Created by IntelliJ IDEA.
  User: 你微笑时很肥
  Date: 2018/10/21
  Time: 11:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加相册</title>
    <style>
        #two{
            height: 100%;
            width: 100%;
            margin: auto;
        }


        #one{

            height: 350px;
            width: 600px;
            margin: auto;
            padding-top: 50px;
            text-align: center;
        }
		
		.meg{
			font-size:14px;
			color:red;
		}
		.input1{
			height:20px;
			background: rgba(255,255,255,0);
	}
		.back{
			color:black;
		}
    </style>
</head>
<body>
    <div id="two">
    <div id="one">
        <form action="${pageContext.request.contextPath }/album_addAlbum" method="post" method = "post" enctype="multipart/form-data">
            <h5>添加相册</h5>
        
        			<span class="meg">${meg }</span>
        
        </br></br>
            <table>
                <tr>
                    <td>所在学校：</td>
                    <td>${user.school}</td>
                </tr>

                <tr>
                    <td>&nbsp;</td>
                </tr>

                <tr>
                    <td>所在班级：</td>
                    <td>${user.clzz}</td>
                </tr>

                <tr>
                    <td>&nbsp;</td>
                </tr>

                <tr>
                    <td>相册名称：</td>
                    <td><input type="text" name="albumName" style="background-color:#A7B8A2"></td>
                   
                </tr>

                <tr>
                    <td>&nbsp;</td>
                </tr>

                <tr>
                    <td>相册分类：</td>
                    <td>
                        <select name="albumSort" style="background-color:#A7B8A2">
                            <option name="as" value = "校园风景">校园风景</option>
                            <option name="as" value = "旅行游玩">旅行游玩</option>
                            <option name="as" value = "集体活动">集体活动</option>
                            <option name="as" value = "热心公益">热心公益</option>
                        </select>
                    </td>
                </tr>

                <tr>
                    <td>&nbsp;</td>
                </tr>

                <tr>
                    <td>相册描述：</td>
                    <td><textarea name="albumDesc" id="" cols="50" rows="1" style="background-color:#A7B8A2"></textarea></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                   <tr>
                    <td>选择封面：</td>
                    <td><input type ="file" name="upload" id="upload" class="input1"></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                	<td><a class = "back" style="text-decoration: none" href="${pageContext.request.contextPath }/album_showAlbum.action" target=one>返回</a></td>
                    <td> <input type="submit" value="添加" style="background-color:#A7B8A2"></td>

                </tr>
            </table>
        </form>
    </div>
    </div>
</body>
</html>
