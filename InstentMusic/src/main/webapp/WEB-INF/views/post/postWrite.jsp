<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://172.30.1.58:4000/socket.io/socket.io.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<link rel="stylesheet" href="resources/css/navigation.css">
<link rel="stylesheet" href="resources/css/sideMenuBar.css">
<link rel="stylesheet" href="resources/css/3d_double_roll_btn.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>글쓰기</title>
<style>
#postForm{
	width: 600px;
	height: 600px;
	margin : 0 auto;
	margin-top : 40px;
	border : 1px solid black;
	text-align: center;
}
#postcontent{
	margin : 10px 10px 10px 10px;
	width: 500px;
	height : 100px;
}
#postimg{
	margin-top : 20px;
	margin-bottom : 20px;
	width : 160px;
	height : 160px;
}
#upload{
	margin : 0 auto;
}
#posttitle{
	font-size : 20px;
}
#posttag{
	width : 500px;
	height : 100px;
	margin : 0 auto;
	margin-top : 10px;
	background-color: #E6E6E6;
}
#postup{
	margin-top : 10px;
}
</style>
<script  type="text/javascript">
var username = '${nickname}';
var socket = io.connect('http://172.30.1.58:4000');

$(function(){
	socket.emit('add user', username);
	getmusic();
});
function getmusic(){
	var num = "${mus_number}";
	$.ajax({
		type : 'get'
		,url : 'getmusic'
		,data : {'mus_number':num}
		,success : function(resp){
				alert('success!');
			}
	})
}
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
<body >
	<!-- Top for logo and navibar -->
	 <nav class="navigation">
		<div class="navigation__column">
			<a href="main"><img class="logo" alt="home" src="resources/images/home/im_logo_w.jpg">
			</a>
		</div>
		<div class="navigation__column">
			<i class="fa fa-search"></i> <input type="text" placeholder="Search">
		</div>
		<div class="navigation__column">
			<div class="navigations__links">
				<div class="navigation__list-item"><a href="#"
					class="navigation__link" onclick="chatOpen()"><i class="fa fa-send-o"></i>
				</a></div>
				<div class="navigation__list-item"><a href="#"
					class="navigation__link"><i class="fa fa-bell-o"></i>
				</a></div>
				<div class="navigation__list-item">
					<span style="font-size:20px;cursor:pointer" onclick="openNav()">&#9776;</span>
				</div>
			</div>
			<div id="mySidenav" class="sidenav">
			  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
			  <a href="musiclist"><i class="fa fa-music"></i> Music List</a>
			  <a href="profile"><i class="fa fa-user-o"> Profile</i></a>
			  <a href="follow"><i class="fa fa-user-plus"></i> Follow</a>
			  <a href="chattingTemp"><i class="fa fa-comments-o"></i> Texting</a>
			  <a href="logout"><i class="fa fa-power-off"></i> Logout</a>
			</div>
		</div>
	</nav>
<div id="wrapper">
<div id="postForm">
<img id="postimg" src="resources/images/home/im_logo_w.jpg">
<input type="file" id="upload">
<div id="posttitle">${mus_number}</div>
<textarea id="postcontent" placeholder="Introduce this music."></textarea><br>
Add tag : <input type="text" id="inputtag" placeholder="Add a tag to the music">&nbsp;<button class="w3-btn w3-grey w3-round" id="tagbtn">+</button>
<div id="posttag">
<div id="tags"></div>
</div>
<button id="postup" class="w3-btn w3-grey w3-round">Sharing Music</button>
</div>
</div>
</body>
<script>
function openNav() {
	  document.getElementById("mySidenav").style.width = "250px";
	}

function closeNav() {
	  document.getElementById("mySidenav").style.width = "0";
	}
</script>
</html>