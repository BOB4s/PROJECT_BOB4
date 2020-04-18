<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
img {
		width : 20px;
	}
	a{
	text-decoration: none;
	color: black;
	}
	wrapper {
		text-align : center;
	}
	table{
		text-align : center;
	}
</style>
</head>
<body>
<div id="wrapper">
	<h2>[ 잘 되고 있는가 ]</h2>
<!-- 	<form id="search" action="post" method="get"> -->
<!-- 	<select name = "searchItem"> -->
<%-- 		<option value = "title" ${searchItem == 'title'?'selected' :''}>제목</option>	 --%>
<%-- 		<option value = "writer" ${searchItem == 'writer'?'selected' :''}>닉네임</option> --%>
<%-- 		<option value = "content" ${searchItem == 'content'?'selected' :''}>글내용</option> --%>
<!-- 	</select> -->
<%-- 	<input type = "text" name = "searchWord" value="${searchWord}"/> --%>
<!-- 	<input type = "submit" value = "검색"> -->
<!-- 	</form> -->
	<!-- 게시글 목록 출력 -->
	<table border="1">
		<tr>
			<th>번호</th>
			<th>내용</th>
			<th>닉네임</th>
		</tr>
		<c:forEach var="post" items="${postList}" varStatus="stat">
		<tr>
			<td>${post.post_number}</td>
			<td>${post.post_content}</td>
			<td>${post.post_nickname}</td>
		</tr>
		</c:forEach>
	</table>
	</div>
</body>
</html>