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
<link rel="stylesheet" href="../bootstrap-3.3.7-dist/css/bootstrap-theme.css" type="text/css"></link>
<link rel="stylesheet" href="../bootstrap-3.3.7-dist/css/bootstrap.css" type="text/css"></link>
<script src="/classphoto/js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="../bootstrap-3.3.7-dist/js/bootstrap.js"></script>

    <title>主页</title>
    <style>
        #all{

            width: 100%;
            height: 100%;
            margin: auto;
          /*  background:url("${pageContext.request.contextPath}/img/4.png");*/
          	background-color:#ffffff;
           	user-select:none;
        }
        #left{
            width: 15%;
            height: 100%;
            float: left;
        }
        #left_top{
           border: 1px solid black;
            height: 22px;
            width: 131px;
            text-align: center;
            
          

        }
        #left_down{
            padding-top: 30px;
            text-align: left;
            padding-left: 0px;
            font-size:17px;
            line-height: 50px;
            
        }
        .span1{
         color:black;
        
        }
        
         .span2{
         color:black;
         font-size:18px;
         
        
        }

        #right{

            width: 83%;
            height:100%;
            float: right;
        }
        #top{

            width: 100%;
            height: 55px;

        }
        #top_left{

            height: 55px;
            width: 60%;
            float: left;
        }
        #top_right{

            height: 50px;
            width: 40%;
            padding-top: 10px;
            text-align: center;
            float: right;
        }
        #down{
           
            width: 100%;
            height: 92%;
        }
        .top{

            height: 50px;
            width: 50%;
            float: left;
            padding-top: 10px;

            text-align: center;
        }
         .find{

            height: 50px;
          
            float: left;
            padding-top: 10px;

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
            min-width: 75px;
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
			background-color:rgba(100,100,255,0.5);
			width:50px;
			height:30px;		
			border:1px;
			border-radius:3px;
			color:white;
			position:relative;
			left:150px;
			top:-65px;
			
		}
		
		.hr1{
			position:relative;
			right:-85px;
			top:-46px;
		}
		
		.menu a{
			text-decoration:none; 
			color:rgba(0,0,0,0.5)
		}
		.menu>li{
			list-style:none;
			
			border-bottom: 1px solid #64ffff;
			
		}
		#li3{
			
		}
		
		.show{
			display: block;
		}
			.modal-backdrop {
  			opacity: 0 !important;
  			filter: alpha(opacity=0) !important;
		}
	</st

    </style><%--
       <script src="https://code.jquery.com/jquery-1.12.4.js"
                  integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU="
                  crossorigin="anonymous">
      </script>
      --%>
     
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
		

		
			function show(f,s,sp){
				
				if(s.is(":hidden"))
				{
					s.show("500");
					
					var $ele = f.parent("li").siblings().children("ul");
					$ele.hide(500);
					var $ele1 = f.parent("li").siblings().children("span");
					$ele1.removeClass(" glyphicon-menu-down");
					$ele1.addClass("glyphicon-menu-right");
					if(sp!=null)
						{
						sp.removeClass("glyphicon-menu-right");
						sp.addClass("glyphicon-menu-down");
						}
					
				}else
					{
					s.hide("500");
					if(sp!=null){
						sp.removeClass(" glyphicon-menu-down");
						sp.addClass("glyphicon-menu-right");
					}
					}
			}
			
			$("#li2").click(function(){
				
				show($("#li2"),$("#ul2-1"),$("#s2"));	
					
			});
		
			$("#li3").click(function(){
					
				show($("#li3"),$("#ul3-1"),$("#s3"));
				
				updateInform();
				
					
			});
			
			function updateInform(){
				$.ajax({
					url:"${pageContext.request.contextPath}/user_updateInform",
					type:"GET",
					success:function(){
						
					}
				});
			}
			
			$("#li3-1").click(function(){
						
				show($("#li3-1"),$("#ul3-2"),null);
				
			});
			
			$("#li4").click(function(){
			
				show($("#li4"),$("#ul4-1"),$("#s4"));	
				updateInform();	
			});
			
			$("#li4-1").click(function(){
				
				show($("#li4-1"),$("#ul4-2"),null);	
					
			});
			
			$("#li5").click(function(){
				
				show($("#li5"),$("#ul5-1"),$("#s5"));
			});
		
			
			$("#li3-2").click(function(){
				$("#deleteModle").modal();
					
			});
			
			$("#deleteAlbum-btn").click(function(){
				var aid = $("#selectAlbum").val();
				
				$.ajax({
					url:"${pageContext.request.contextPath}/album_deleteAlbum?aid="+aid,
					type:"GET",
					success:function(){
						alert("删除成功");
						updateInform();
						window.location.reload();
					}
					
				
				});
				
							
				
			});
			
			$("#li3-3").click(function(){
				$("#updateModal").modal();
			});
			$("#updateAlbum-btn").click(function(){
				var aid = $("#select_updateAlbum").val();
				
				$("#updateModal").modal("hide");
				window.open("${pageContext.request.contextPath}/album_toAddPage?aid="+aid,"one","");
			});
			
			$("#li4-2").click(function(){
				$("#addPhotoModal").modal();
			});
			
			
			
			//添加张照片
			
			$("#addPhoto-btn").click(function(){
				var aid = $("#select_addPhotoInAlbum").val();
				var id = aid.split("_")[0];
				var albumName = aid.split("_")[1];
				
				
				$("#addPhotoModal").modal("hide");
				window.open("${pageContext.request.contextPath }/photo_forAddPhoto?albumName="+albumName+"&aid="+id,"one","");
			});
			
			
			
			$("#li4-3").click(function(){
				$("#showPhotoModal").modal();
				
			});
			//查看照片
			$("#showAlbum-btn").click(function(){
				var aid = $("#select_showPhotoInAlbum").val();
				window.open("${pageContext.request.contextPath}/photo_showPhoto?aid="+aid,"one","");
				$("#showPhotoModal").modal("hide");
			});
			
			
			$("#li2-1").click(function(){
				$("#addInform").modal({
					
				});
				
			});
			
			$("#addInform-btn").click(function(){
				
				var informTitle = $("#InformTitle").val();
				var informContent = $("#infornContent").val();
				
				
				if(informTitle != "")
					{
						if(informContent !="")
						{
							alert("发布消息成功");
							$("#a_addInform").attr("href","${pageContext.request.contextPath }/inform_addInform?title="+informTitle+"&content="+informContent);
							$(".span3").trigger("click");
							$("#InformTitle").text("");
							$("#infornContent").text("");
							$("#addInform").modal("hide");
							
						}else
							{
							alert("请输入消息内容");
							}
					
					}else{
						
						alert("请输入消息标题");
					}
				
				
				
				//location.href="${pageContext.request.contextPath }/inform_addInform?title="+informTitle+"&content="+informContent;
				
			});
			var count = "${noReadCount}";
			
			$("#badge").text(count);
          
      });
      </script>
</head>
<body>
    <div id="all">
        <div id="left">
            <div id="left_top"><font color="#adff2f">班级相册管理系统</font></div>

            <div id="left_down">
            	<p style="margin-left: 10px;font-size:12px;">角色:${user.rank }</p>
	            <hr>
	          
	           
	           <ul class= "menu">
	           	<li id = "li1"><a class = "btn" href="${pageContext.request.contextPath }/user_goIndex.action">首页</a><span id="s1" class="glyphicon glyphicon-menu-right" style="margin-left: 110px;font-size: 12px;"></span></li>
	           	<li ><a class = "btn" id = "li2" href="#" >消息 <span id = "badge" class="badge"></span></a><span id="s2" class="glyphicon glyphicon-menu-right" style="margin-left: 86px;font-size: 12px;"></span>
	           		<ul id="ul2-1" style="line-height: 30px;font-size:16px; display: none">
	           			<li id = "li2-1"><a href="javaScript:" target=one>发布消息</a></li>
	           			<li id = "li2-1"><a href="${pageContext.request.contextPath }/inform_noReadInform" target=one>未读消息&nbsp;<span id = "noReadBadge" class="badge">${noReadCount}</span></a></li>
	           			<li><a href="${pageContext.request.contextPath }/inform_showInform" target=one>全部消息</a></li>
	           			<c:if test="${user.rank ne'辅导员' }">
	           			<li id = "li2-1"><a href="${pageContext.request.contextPath }/inform_teacherInform" target=one>辅导员消息</a></li>
	           			</c:if>
	           			<li><a href="${pageContext.request.contextPath }/inform_myInform" target=one>我发布的消息</a></li>
	           			<li id = "li2-1"><a href="${pageContext.request.contextPath }/inform_backInform" target=one>回收站</a></li>
	           			
	           		</ul>
	           	</li>
	           	<li><a class = "btn" id = "li3" href="JavaScript:">相册</a><span id="s3" class="glyphicon glyphicon-menu-right" style="margin-left: 110px;font-size: 12px;"></span>
	           		<ul id="ul3-1"  style="line-height: 30px;font-size:16px; display: none">
	           		<li><a target=one href="${pageContext.request.contextPath }/classphoto/addAlbum.jsp">添加相册</a></li>
	           			<li><a target=one href="${pageContext.request.contextPath }/album_showAlbum.action">所有相册</a></li>
	           			<li ><a id="li3-1" href="JavaScript:">相册分类</a>
	           				<ul id="ul3-2" style="font-size:14px;display: none;">
	           					<li><a target=one href="${pageContext.request.contextPath }/album_sortAlbum?albumSort=校园风景">校园风景</a></li>
	           					<li><a target=one href="${pageContext.request.contextPath }/album_sortAlbum?albumSort=旅行游玩">旅行游玩</a></li>
	           					<li><a target=one href="${pageContext.request.contextPath }/album_sortAlbum?albumSort=集体活动">集体活动</a></li>
	           					<li><a target=one href="${pageContext.request.contextPath }/album_sortAlbum?albumSort=热心公益">热心公益</a></li>
	           				</ul>
	           			</li>
	           			<c:if test="${user.rank ne '成员' }">
	           			<li id = "li3-2"><a target=one href="javaScript:">删除相册</a></li>
	           		
	           			<li id = "li3-3"><a target=one href="javaScript:">修改相册</a></li>
	           			</c:if>
	           		</ul>
	           	
	           	</li>
	     
	     		
	           	
	           
	           	<li ><a class = "btn" id = "li4" href="#">相片</a><span id="s4" class="glyphicon glyphicon-menu-right" style="margin-left: 110px;font-size: 12px;"></span>
	           		<ul id="ul4-1"  style="line-height: 30px;font-size:16px; display: none;">
	           			<li id = "li4-2"><a target=one href="javaScript:">添加图片</a></li>
	           			<li id = "li4-3"><a target=one href="javaScript:">查看图片</a></li>
	           			<li id = "li4-4"><a target=one href="${pageContext.request.contextPath}/photo_hotPhoto?aid=1">热门图片</a></li>
	           			<li ><a id="li4-1" href="javaScript:">图片排行</a>
	           				<ul id="ul4-2" style="font-size:14px;display: none;">
	           					<li><a target=one href="${pageContext.request.contextPath}/photo_zhRankInPhoto">综合排行</a></li>
	           					<li><a target=one href="${pageContext.request.contextPath}/photo_praisePhoto">点赞排行</a></li>
	           				</ul>
	           			</li>
	           			
	           			
	           		</ul>
	           	
	           	</li>
	           	<li ><a class = "btn"  id = "li5" href="${pageContext.request.contextPath }/user_set.action">个人中心</a><span id="s5" class="glyphicon glyphicon-menu-right" style="margin-left: 83px;font-size: 12px;"></span>
	           		<%--<ul id="ul5-1" style="line-height: 30px;font-size:16px; display: none;">
	           			<li><a href="#">个人信息</a></li>
	           			<li><a href="#">班级信息</a></li>
	           			<li><a href="#">班级成员</a></li>
	           			<li><a href="#">修改信息</a></li>
	           		</ul>
	           	
	           	--%></li>
	           	<li><a class = "btn" href="${pageContext.request.contextPath}/user_exit">退出</a><span class="glyphicon glyphicon-menu-right" style="margin-left: 110px;font-size: 12px;"></span></li>
	           
	           </ul>
	           
	           </div>
        </div>

		<!-- 删除模态框 -->
			<div id = "deleteModle" class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
			  <div class="modal-dialog modal-sm" role="document">
			    <div style="text-align: center" class="modal-content">
			      <h4>选择要删除的相册</h4>
			      <select id="selectAlbum" class="form-control">
					<c:forEach items="${albumAll }" var = "a">
  						<option value= "${a.aid }">${a.albumName}</option>
  					</c:forEach>
				</select>
			      
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
			        <button id="deleteAlbum-btn" type="button" class="btn btn-primary">删除</button>
			      </div>
			    </div>
			  </div>
			</div>
				
				<!-- 修改模态框 -->
			<div id = "updateModal" class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
			  <div class="modal-dialog modal-sm" role="document">
			    <div style="text-align: center" class="modal-content">
			      <h4>选择要修改的相册</h4>
			      <select id="select_updateAlbum" class="form-control">
					 <c:forEach items="${albumAll }" var = "a">
  						<option value= "${a.aid }">${a.albumName}</option>
  					</c:forEach>
				</select>
			      
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
			        <button id="updateAlbum-btn" type="button" class="btn btn-primary">确定</button>
			      </div>
			    </div>
			  </div>
			</div>	
			<!-- 添加照片模态框 -->
			<div id = "addPhotoModal" class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
			  <div class="modal-dialog modal-sm" role="document">
			    <div style="text-align: center" class="modal-content">
			      <h4>选择相册进行添加</h4>
			      <select id="select_addPhotoInAlbum" class="form-control">
					 <c:forEach items="${albumAll }" var = "a">
  						<option value= "${a.aid }_${a.albumName}">${a.albumName}</option>
  					</c:forEach>
				</select>
			      
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
			        <button id="addPhoto-btn" type="button" class="btn btn-primary">确定</button>
			      </div>
			    </div>
			  </div>
			</div>	
			
			<!-- 查看照片模态框 -->
			<div id = "showPhotoModal" class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
			  <div class="modal-dialog modal-sm" role="document">
			    <div style="text-align: center" class="modal-content">
			      <h4>选择相册查看</h4>
			      <select id="select_showPhotoInAlbum" class="form-control">
					 <c:forEach items="${albumAll }" var = "a">
  						<option  value= "${a.aid }">${a.albumName}</option>
  					</c:forEach>
				</select>
			      
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
			        <button id="showAlbum-btn" type="button" class="btn btn-primary">确定</button>
			      </div>
			    </div>
			  </div>
			</div>
			
			
			<!-- 发布通知的模态框 -->
			<div id = "addInform" class="modal fade" tabindex="-1" role="dialog">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h4 class="modal-title">发布通知</h4>
			      </div>
			      <div class="modal-body">
			        
					  <form class="form-horizontal">
						  <div class="form-group">
						    <label for="InformTitle" class="col-sm-2 control-label">标题</label>
						    <div class="col-sm-10">
						      <input type="text" class="form-control" id="InformTitle" placeholder="请输入标题">
						    </div>
						  </div>
						  <textarea id="infornContent" class="form-control" rows="7" placeholder="请输入通知内容"></textarea>
						</form>
					  
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			        <button id = "addInform-btn" type="button" class="btn btn-primary">发布</button>
			      </div>
			    </div><!-- /.modal-content -->
			  </div><!-- /.modal-dialog -->
			</div><!-- /.modal -->
			
			
			
			

        <div id="right">
            <div id="top">
                <div id="top_left" class = "topAll">
                    <a id = "a_addInform" target=one><span class = "span3"></span></a>
                    <div class="find form-inline">
                    	<input class="findText form-control" type="text" name="name">  
                    	<select class="findSelect form-control">
                    		<option><button>相册</button></option>
                    		<option><button>相片</button></option>
                    	</select>
                    	<button class="findBtn btn btn-default" >搜索</button>
                    	<a class="findA" target=one><span></span></a>
                    </div>
                </div>
                <div id="top_right">

                   <span class = "span1">欢迎：</span><span class="span2" title = "个人中心">${user.username}</span>
                   
                   <a href="${pageContext.request.contextPath }/user_set.action"><span class ="set"></span></a>
                   
                   <hr class = "hr1" size=50 width=0.1px height=10px color="white">
        
                   <a href = "${pageContext.request.contextPath}/user_exit"><span class = "exit"></span></a>
                </div>
            </div>
            <div id="down">
                <iframe name="one" src="${pageContext.request.contextPath}/classphoto/welcome.jsp" width="100%" height="100%"></iframe>

            </div>
        </div>


    </div>

</body>
</html>
