<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<title>글쓰기</title>

<script>
$(function(){
$("#checkForm").hide();
});
function getTags() {
	var post_content = document.getElementById("post_content").value;
	  var post_content = $("#post_content").val();
	  $("#result_content").text(post_content);
		  var tags_List = [];
		  post_content = post_content.replace(/#[^#\s,;]+/gm, function(post_content) {
			  tags_List.push(post_content);
		  });
		
				  for(var i in tags_List){
					  var tag_name= tags_List[i];
						$.ajax({
							
							type : "GET"
							,url : "tagsSaved"
							,data : {"tag_name" : tags_List[i]}
							,success :function (resp) {
						
									$("#tagsresult").append(resp);
							}
						     });
					     
			  }
				  
	
				  document.getElementById("post_content").value='';
				  $("#writeForm").hide();
				  $("#checkForm").show();
				  
				
	}


function go(){

	var tagsresult = $("#tagsresult").html();

	 $("#content_here").val($("#result_content").html()); 
	$("#tag_here").val(tagsresult);

	frm.submit(); 
}
</script>	

</head>
<body >
<div id="wrapper">
<%-- <div id = "homereturner">
			<c:url var="home" value="resources/images/homeimg.png"></c:url>
			<c:url var="root" value="/"></c:url>
			<a href="${root}"><img src="${home}" width="30px"></a>
			</div> --%>
<h2 style="text-align: center; color: white;">글 작성</h2><br><br><br>

<div style="width: 60%; text-align: center; margin: auto;">
 <span style="color: white;">제목을 입력해주세요</span>
 <div id="writeForm">
	
		<textarea id="post_content" rows="10" cols="50"placeholder="설명을 작성해주세요"></textarea>
			<br><br>
		
		<input id="subBtn" type="button" value="글 태그 추출" style="float: right; margin-right: 100pt;" onclick="getTags()"/>
	
	</div>
	<div id="checkForm">
	
	
	
	<input type="hidden" name="tagsresult" value="">

		<form id="frm" method="post" action="post_write_save">
	
<%-- 		<input type="hidden" id="mus_number" name="mus_number" value="${mus_number}"><!-- 음악 숫자  --> --%>
			<input type="hidden" id="mus_number" name="mus_number" value=55><!-- 음악 숫자  -->
		<input type="hidden" id="cust_number" name="cust_number" value="${cust_number}"><!-- 회원번호 -->
		
		<input type="text" id="mus_title" name="mus_title" value="${mus_title}" placeholder ="음악제목"><!-- 음악제목 -->
<%-- 		<input type="hidden" id="mus_time" name="mus_time" value="${mus_time}"><!-- 음악 길이 --> --%>
			<input type="hidden" id="mus_time" name="mus_time" value="152"><!-- 음악 길이 -->
		<input type="hidden" id="post_nickname" name="post_nickname" value="${nickname}">
		<input type="hidden" id="post_url" value="???">
		
		 <input type="hidden" id="content_here" name="post_content" value="">
		 <input type="hidden" id="tag_here" name="tagsresult" value="">
		 <br>
		 
			<span id="result_content"></span>
		<br>
				<div id="tagsresult"></div>
	 <br>
	
	</form>
	
	
	
	<input type="button" value="저장" onclick="go()">
	</div>
</div>
</div>
<div class="jumbotron" style="margin-bottom: 0">
</div>
</body>
</html>