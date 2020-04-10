<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>MusicList</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/css/navigation.css">
<link rel="stylesheet" href="resources/css/sideMenuBar.css">
<link rel="stylesheet" href="resources/css/musiclist.css">
<script src="resources/js/jquery-3.4.1.min.js"></script>

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
			  <a href="chattingTemp">채팅 연습하러 가기</a>
			  <a href="chatBangCreate">채팅방 만들기</a>
			</div>
		</div>
	</nav>
	<div class="container">
		<img class="imgContainer" alt="produce" src="resources/images/musiclist/produce.png">
		<div class="addedMusicList">
			<a href="#"><img alt="addedMusicList" src="resources/images/musiclist/addedMusicList.png"></a>
			<br>
			addedMusicList
			</div>
		<div class="myMusicList">
			<a href="#"><img alt="temporaryList" src="resources/images/musiclist/myMusicList.png"></a>
			<br>
			myMusicList
	    </div>
	    <div class="makingMusic">
			<a href="makingMusic"><img alt="makingMusic" src="resources/images/musiclist/makingMusic.png"></a>
			<br>
			makingMusic
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