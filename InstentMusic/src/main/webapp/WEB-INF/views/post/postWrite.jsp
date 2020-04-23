<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<script src="http://192.168.0.84:4000/socket.io/socket.io.js"></script>
<title>글쓰기</title>



<script  type="text/javascript">

var username = '${nickname}';
var socket = io.connect('http://192.168.0.84:4000');


$(function(){
	socket.emit('add user', username);

});
function getTags() {
	
	
		
		  var mus_number = document.getElementById("mus_number").value;
		  var cust_number = document.getElementById("cust_number").value;
		  var mus_title = document.getElementById("mus_title").value;
		  var mus_time = document.getElementById("mus_time").value;
		  var post_nickname = document.getElementById("post_nickname").value;
		  var post_content = document.getElementById("post_content").value;
		  var post_url = document.getElementById("post_url").value;
		  mus_number= 43;
						$.ajax({
							type : "POST"
							,url : "post_write_save"
							,data : {
								"mus_number":mus_number
								,"cust_number":cust_number
								,"mus_title":mus_title				
								,"mus_time":mus_time
								,"post_content":post_content
								,"post_nickname":post_nickname
								,"post_url":post_url
							}
							,success : function(resp){
							var post_content = document.getElementById("post_content").value;
							  var post_content = $("#post_content").val();
								 $("#result_content").text(post_content);
							  var tags_List = [];
									  post_content = post_content.replace(/#[^#\s,;]+/gm, function(post_content) {
										  tags_List.push(post_content);
									  });
									if(tags_List.length==0){
										postnotice(mus_title);
										}
							for(var i in tags_List){	
								$.ajax({
									type : "GET"
									,url : "tag_write_save"
									,data : {
										"resp" :resp
									 	,"text" : tags_List[i] 
								,success : function(resp){
									
								if(i==(tags_List.length-1)){


									postnotice(mus_title);
									
									}
									}
									}
								});
								
							}
							
							
						}
					})

						
					};

	function postnotice(mus_title){
		var followerList = new Array();
		$.each(${followerList},function(index, item) {
		
			followerList[index] = item;
				});
		
		 
		console.log(followerList);
		 socket.emit('postWrite',followerList,username,mus_title);

		  location.href = "main" 
		}
						</script>




</head>
<body>
	<div id="wrapper">

		<h2 style="text-align: center; color: white;">글 작성</h2>
		<br>
	
		<div style="width: 60%; text-align: center; margin: auto;">
			<span style="color: white;">제목을 입력해주세요</span>
			<br><br>
			<div id="writeForm">

				<form id="frm" method="post" action="post_write_save">

					<%-- 		<input type="hidden" id="mus_number" name="mus_number" value="${mus_number}"><!-- 음악 숫자  --> --%>
					<input type="hidden" id="mus_number" name="mus_number" value=989>
					<!-- 음악 숫자  -->
					<input type="hidden" id="cust_number" name="cust_number"
						value="${cust_number}">
					<!-- 회원번호 -->

					<input type="text" id="mus_title" name="mus_title"
						value="${mus_title}" placeholder="음악제목">
					<!-- 음악제목 --><br>
					<%-- 		<input type="hidden" id="mus_time" name="mus_time" value="${mus_time}"><!-- 음악 길이 --> --%>
					<input type="hidden" id="mus_time" name="mus_time" value="152">
					<!-- 음악 길이 -->
					<input type="hidden" id="post_nickname" name="post_nickname"
						value="${nickname}"> <input type="hidden" id="post_url"
						value="???">
					<textarea id="post_content" name="post_content" rows="10" cols="50"placeholder="설명을 작성해주세요"></textarea>
					<br>
					<br> <input id="subBtn" type="button" value="글 태그 추출"style="float: right; margin-right: 100pt;" onclick="getTags()" />
					<!--  <input type="hidden" id="content_here" name="post_content" value=""> -->
				
					<br>

				</form>



			</div>

			
		</div>
	</div>
	<div class="jumbotron" style="margin-bottom: 0"></div>
</body>
</html>