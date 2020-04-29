<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="resources/js/jquery-3.4.1.min.js"></script>
<style>
.sp{
	width: 60px;
	height: 60px;
	border-radius:30px;
}
.table{
	font-size: xx-large;
    margin-left: 41%;
}
.line{
	font-style: italic;
    font-family: "Times New Roman", Times, serif;
	margin-left: 43%;
    font-size: xx-large;
    margin-top: 4%;
}
.nick{
	padding-bottom: 7px;
	font-style: italic;
}
</style>
<script>
/* /* function getfollwedList(){ */ 
$(function(){
var data ='<div class="line">followerList</div><table class="table table-dark" div="wrapper"><thead><tr><th class="proimg"></th><th class="nick"></th></tr></thead><tbody><br>';
	$.each(${followed_Profiles_List},function(index, item) {
		data += '<tr><td><a href="proDetail?cust_number='+item.cust_number+'">'+'<span class="proset"><img class="sp" src="<spring:url value="/image/'
		+item.cust_photo_saved+'"/>"/></td>'+'&nbsp'+'<td class="nick" style="padding-left:65px;">'+item.cust_nickname + '</span></td></tr>';
			});
	data +="</tbody></table>";
	$('#followerList_Profiles').html(data);
	});
</script>
<title>Follwers</title>
</head>
<body>
<div id="followerList_Profiles"> </div>
</body>
</html>