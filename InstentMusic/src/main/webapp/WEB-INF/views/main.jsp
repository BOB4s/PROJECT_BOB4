<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript">

  
	function chatOpen(){
		window.open("popup", "win", "width=450,height=450, left=50,up=50");
	}
	
	</script>
	
	

</head>
<body>
로그인 후 메인 페이지
<a href="musiclist">MyMusic</a>
<a href="follow">follow</a>
		<a href="profile"> 프로필 이예영</a>
		<a href="chattingTemp">채팅연습하러가기</a>
		<input type="button" value="챗방" onclick="chatOpen()">

</body>
</html>