<%--
  Created by IntelliJ IDEA.
  User: 你微笑时很肥
  Date: 2018/10/11
  Time: 17:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>主页</title>
    <style>
        #all{

            width: 100%;
            height: 100%;
            margin: auto;
            background:url("${pageContext.request.contextPath}/img/4.png");
           	user-select:none;
        }
        #left{
            width: 17%;
            height: 100%;
            float: left;
        }
        #left_top{
           border: 2px solid black;
            height: 22px;
            width: 131px;
            text-shadow: 5px 5px 3px;
            text-align: center;
          

        }
        #left_down{
            padding-top: 60px;
            text-align: center;
            
        }
        .span1{
         color:#92D6FF;
        
        }
        
         .span2{
         color:#FFD143;
         
        
        }

        #right{

            width: 83%;
            height:100%;
            float: right;
        }
        #top{

            width: 100%;
            height: 80px;

        }
        #top_left{

            height: 80px;
            width: 60%;
            float: left;
        }
        #top_right{

            height: 50px;
            width: 40%;
            padding-top: 30px;
            text-align: center;
            float: right;
        }
        #down{
            border:1px solid white;
            width: 99%;
            height: 86%;
        }
        .top{

            height: 50px;
            width: 30%;
            float: left;
            padding-top: 30px;

            text-align: center;
        }
         .find{

            height: 50px;
          
            float: left;
            padding-top: 30px;

            text-align: center;
        }

    a{
        text-decoration: none;
        color:#92D6FF;
    }
    
     #xiala{
            position: relative;
            display: inline-block;
            width:83px;
            height:21px;
        }

        #xl {
            display: none;
            position: absolute;
            background-color:rgba(255, 196, 110, 0.1);
            min-width: 50px;
            box-shadow: 10px 20px 16px 0px rgba(0,0,0,0.2);
            padding: 12px 16px;
            z-index: 1;
        }

        #xiala:hover #xl {
            display: block;
        }
        
        #xl a {
  			 color: black;
   			 padding: 6px 8px;
    		 text-decoration: none;
   			 display: block;
		}
		
		#xl a:hover {background-color: #FFC46E;}
		
		.span3{
			font-size:14px;
		}
		
		.but{
			background-color:rgba(255,255,255,0.1);
			width:50px;
			height:30px;		
			border:1px;
			border-radius:3px;
			color:white;
			position:relative;
			left:150px;
			top:-91px;
			
		}
		
		.hr1{
			position:relative;
			right:-85px;
			top:-46px;
		}
		
		.findText{
		border:none;
			width:160px;
			height:25px;
			border-radius: 3px;
		}
		.findSelect
		{
		border:none;
		width:60px;
			height:25px;
			border-radius: 3px;
		}
		.findBtn{
		border:none;
			width:50px;
			height:25px;
			border-radius: 3px;
			background-color:#52c652;
			color:white;
		}
    </style><%--
       <script src="https://code.jquery.com/jquery-1.12.4.js"
                  integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU="
                  crossorigin="anonymous">
      </script>
      --%>
      <script src="/classphoto/js/jquery-1.12.4.js"></script>
      <script type="text/javascript">
      $(function () {
		$(".but").click(function(){
			$(".exit").trigger("click");
		})
		
		$(".span2").click(function(){
			
			
			$(".set").trigger("click");
		});
		
		var sle1 = $(".findselect").val();
			if(sle1=="相片"){
			$(".findText").attr("placeholder","请输入上传者搜索");
		}else{
			$(".findText").attr("placeholder","请输入相册名搜索");
		}
		
		$(".findselect").change(function(){
			var sle2 = $(".findselect").val();
			if(sle2=="相片"){
				$(".findText").attr("placeholder","请输入上传者搜索");
			}else{
				$(".findText").attr("placeholder","请输入相册名搜索");
			}
		  });
		
		$(".findBtn").click(function(){
			var sle3 = $(".findselect").val();
			var name = $(".findText").val();
			
			if(sle3=="相片")
				{
				
				$(".findA").attr("href","${pageContext.request.contextPath }/photo_selectPhoto?uname="+name);
				$(".findA span").trigger("click");
				
				}else
				{
					//location.href="${pageContext.request.contextPath }/album_selectAlbum?albumName="+name;
					$(".findA").attr("href","${pageContext.request.contextPath }/album_selectAlbum?albumName="+name);
					$(".findA span").trigger("click");
				}
		});
			
			
		
          
      });
      </script>
</head>
<body>
    <div id="all">
        <div id="left">
            <div id="left_top"><font color="#adff2f">班级相册管理系统</font></div>

            <div id="left_down">
            <h4 style="color:#FFD143;">个人信息</h4>
            <hr>
            </br>
            	<span class = "span1">学校:&nbsp;&nbsp;</span><span class = "span2">${user.school }</span>
            </br>
            </br>
         	  	<span class = "span1">班级:&nbsp;&nbsp;</span><span class = "span2">${user.clzz }</span>
            </br>
            </br>
            	<span class = "span1">你是:&nbsp;&nbsp;</span><span class = "span2">${user.rank }</span>
        </div>
        </div>



        <div id="right">
            <div id="top">
                <div id="top_left" class = "topAll">
                    <div class="top"><a href="${pageContext.request.contextPath }/album_showAlbum.action" target=one>所有相册</a> </div>
                    
                    <div class = "top">
                   	 	<div class="xiala" id="xiala"><a>相册分类</a>
                    		<div id = "xl">
                    			<a href="${pageContext.request.contextPath }/album_sortAlbum?albumSort=校园风景" target=one><span class = "span3">校园风景</span></a>
                    			<a href="${pageContext.request.contextPath }/album_sortAlbum?albumSort=旅行游玩" target=one><span class = "span3">旅行游玩</span></a>
                    			<a href="${pageContext.request.contextPath }/album_sortAlbum?albumSort=集体活动" target=one><span class = "span3">集体活动</span></a>
                    			<a href="${pageContext.request.contextPath }/album_sortAlbum?albumSort=热心公益" target=one><span class = "span3">热心公益</span></a>
                    		</div>
                    	</div>
                    </div>
                    
                    
                    <div class="find">
                    	<input class="findText" type="text" name="name">  
                    	<select class="findSelect">
                    		<option><button>相册</button></option>
                    		<option><button>相片</button></option>
                    	</select>
                    	<button class="findBtn" >搜索</button>
                    	<a class="findA" target=one><span></span></a>
                    </div>
                </div>
                <div id="top_right">

                   <span class = "span1">欢迎：</span><span class="span2" title = "个人中心">${user.username}</span>
                   
                   <a href="${pageContext.request.contextPath }/user_set.action"><span class ="set"></span></a>
                   
                   <hr class = "hr1" size=50 width=0.1px height=10px color="white">
                   <button class="but">退出</button>
                   <a href = "${pageContext.request.contextPath}/user-exit"><span class = "exit"></span></a>
                </div>
            </div>
            <div id="down">
                <iframe name="one" src="${pageContext.request.contextPath}/classphoto/welcome.jsp" width="100%" height="100%"></iframe>

            </div>
        </div>


    </div>

</body>
</html>
