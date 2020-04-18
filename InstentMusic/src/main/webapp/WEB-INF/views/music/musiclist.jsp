<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/css/temp.css">
<link rel="stylesheet" href="resources/css/navigation.css">
<link rel="stylesheet" href="resources/css/sideMenuBar.css">
<link rel="stylesheet" href="resources/css/musiclist.css">
<script src="resources/js/jquery-3.4.1.min.js"></script>
<script>
/* $(function(){
	$("#makingMusic").click(function(){
		var musicname = prompt("Create a name for the new Music.");
		if (musicname.trim().length < 1) {
			alert("You didn't write anything.");
			return;
		} else if (musicname.length > 10) {
			alert("Too long name!");
		}else {
			var data = {
				'temp_title' : musicname
			};
			 $.ajax({
				method : 'get'
				,url : ''
				})
		}
	})
}) */
</script>
<style type="text/css">
body {
    margin: 0px;
}
.navigation{
	margin-bottom: 0px;
}
</style>
</head>
<body>
<!-- Top for logo and navibar -->
	 <nav class="navigation">
		<div class="navigation__column">
			<a href="home"><img class="logo" alt="home" src="resources/images/home/im_logo_w.jpg">
			</a>
		</div>
		<div class="navigation__column">
			<i class="fa fa-search"></i> <input type="text" placeholder="Search">
		</div>
		<div class="navigation__column">
			<div class="navigations__links">
				<div class="navigation__list-item"><a href="explore.html"
					class="navigation__link"> <i class="fa fa-send-o"></i>
				</a></div>
				<div class="navigation__list-item"><a href="#"
					class="navigation__link"> <i class="fa fa-bell-o"></i>
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
			  <a href="chattingTemp"><i class="fa fa-comments-o"></i>채팅 연습하러 가기</a>
			  <a href="chatBangCreate">채팅방 만들기</a>
			</div>
		</div>
	</nav>
<div class="wrapper">
<img class="imgContainer" alt="produce" src="resources/images/musiclist/produce.png">
	<ul class="stage">
	<li class="icon">
		<div class="boxContainer">
    		<div class="frontImgForBoxContainer">
    			<img alt="manListening" src="resources/images/musiclist/manListening.JPG">
    		</div>
    		<div class="info">
				<header>
					<h1>Added Music List</h1>
						<a href="#"><img alt="addedMusicList" src="resources/images/musiclist/addedMusicList.png"></a>
				</header>
					<p>
					Click the icon for listening to the music list that included what you added music on the list
					</p>
			</div>
		</div>
	</li>
	<li class="icon">
		<div class="boxContainer">
			<div class="frontImgForBoxContainer">
				<img alt="womanListening" src="resources/images/musiclist/womanListening.png">
			</div>
			<div class="info">
				<header>
					<h1>My Music List</h1>
						<a href="#"><img alt="myMusicList" src="resources/images/musiclist/myMusicList.png"></a>
				</header>
					<p>
					Click the icon for listening to the music list that built with what you composed music
					</p>
			</div>
		</div>
    </li>
	<li class="icon">
		<div class="boxContainer">
			<div class="frontImgForBoxContainer">
				<img alt="notesKeyboard" src="resources/images/musiclist/notes_keyboard.JPG">
			</div>
			<div class="info">
				<header>
					<h1>Making Music</h1>
					<a href="makingMusic"><img id="makingMusic" alt="makingMusic" src="resources/images/musiclist/makingMusic.png"></a>
				</header>
				<p>
				Click the icon for composing your new music
				</p>
			</div>
		</div>
	</li>
</ul> 
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