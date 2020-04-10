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
<div class="wrapper">
<img class="imgContainer" alt="produce" src="resources/images/musiclist/produce.png">
  <ul class="stage">
	<li class="icon">
		<div class="boxContainer">
    		<div class="poster"><img alt="manListening" src="resources/images/musiclist/manListening.JPG"></div>
    		<div class="info">
      <header>
        <h1>Added Music List</h1>
        <span class="year">1946</span>
        <span class="rating">PG</span>
        <span class="duration">130 minutes</span>
      </header>
      <p>
        In Bedford Falls, New York on Christmas Eve, George Bailey is deeply troubled. Prayers for his well-being from friends and family reach Heaven. Clarence Odbody, Angel Second Class, is assigned to visit Earth to save George, thereby earning his wings. Franklin and Joseph, the head angels, review George's life with Clarence.
      </p>
    </div>
  </div>
    </li>
    <li class="icon">
    <div class="boxContainer">
    		<div class="poster"><img alt="womanListening" src="resources/images/musiclist/womanListening.png"></div>
    		<div class="info">
      <header>
        <h1>My Music List</h1>
        <span class="year">1946</span>
        <span class="rating">PG</span>
        <span class="duration">130 minutes</span>
      </header>
      <p>
        In Bedford Falls, New York on Christmas Eve, George Bailey is deeply troubled. Prayers for his well-being from friends and family reach Heaven. Clarence Odbody, Angel Second Class, is assigned to visit Earth to save George, thereby earning his wings. Franklin and Joseph, the head angels, review George's life with Clarence.
      </p>
    </div>
  	</div>
    </li>
    <li class="icon">
    <div class="boxContainer">
    		<div class="poster"></div>
    		<div class="info">
      <header>
        <h1>Making Music</h1>
        <span class="year">1946</span>
        <span class="rating">PG</span>
        <span class="duration">130 minutes</span>
      </header>
      <p>
        In Bedford Falls, New York on Christmas Eve, George Bailey is deeply troubled. Prayers for his well-being from friends and family reach Heaven. Clarence Odbody, Angel Second Class, is assigned to visit Earth to save George, thereby earning his wings. Franklin and Joseph, the head angels, review George's life with Clarence.
      </p>
    </div>
  	</div>
    </li>
  </ul> 
</div>
</body>
</html>