<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Main page after login</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/css/navigation.css">
<script src="resources/js/jquery-3.4.1.min.js"></script>
<script>

</script>
<style type="text/css">
.musicList{
	width: 20px;
}
a:link{
	text-decoration: none;
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
			  <a href="musiclist"><img class="musicList" alt="musicList" src="resources/images/musicList.png">Music List</a>
			  <a href="#">Services</a>
			  <a href="#">Clients</a>
			  <a href="#">Contact</a>
			</div>
		</div>
	</nav>

<!-- navibar -->
<a href="musiclist"><img class="musicList" alt="musicList" src="resources/images/musicList.png">Music List</a>
<a href="follow">Follow</a>
		<a href="profile"><i class="fa fa-user-o">Profile</i></a>
		<a href="chattingTemp">채팅 연습하러 가기</a><!-- connect with 'fa fa-send-o' -->
		<a href="chatBangCreate"> 채팅방만들기</a>
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