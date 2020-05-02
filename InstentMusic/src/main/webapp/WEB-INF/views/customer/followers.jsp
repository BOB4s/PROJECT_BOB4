<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="resources/js/jquery-3.4.1.min.js"></script>
<script>
$(function(){
for(var i in ${followersList}){
	var followers = ${followersList}[i]; 
		$.ajax({
		type:'GET',
		data:{
			'followers':followers
			},
		url:"followers",
		success:function(resp){
				$("#list").append("<a>"+<img src="<spring:url value='/image/resp.cust_photo_saved'/>"/>+" /"+resp.cust_nickname+"</a><br>");
				
			}
		})	
	})
}
</script>
<title>Follwers</title>
</head>
<body>
<div id="list"></div>
</body>
</html>