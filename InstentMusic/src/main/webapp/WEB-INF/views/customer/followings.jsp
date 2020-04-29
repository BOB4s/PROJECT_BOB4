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
for(var i in ${followingList}){
	var followings = ${followingList}[i]; 
		$.ajax({
		type:'GET',
		data:{
			'followings':followings
			},
		url:"followings",
		success:function(resp){
				$("#list").append('<li>'+'<a href="proDetail?cust_number='+resp.cust_number+'">'+'<img class="sp" src="<spring:url value="/image/'
						+resp.cust_photo_saved+'"/>"/>'+resp.cust_nickname+'</a>'+'</li>');
				
			}
		})	
	})
}
</script>
<title>Follwings</title>
</head>
<body>
<div id="list"></div>
</body>
</html>