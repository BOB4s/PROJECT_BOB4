<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Main page after login</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/css/navigation.css">
<link rel="stylesheet" href="resources/css/sideMenuBar.css">
<link rel="stylesheet" href="resources/css/main.css">
<script src="http://10.10.12.230:4000/socket.io/socket.io.js"></script>
<script src="resources/js/jquery-3.4.1.min.js"></script>
<script src="resources/js/toastr.min.js"></script>
 <link href="resources/css/toastr.min.css" rel="stylesheet"/>
<style type="text/css">
body {
    margin: 0px;
}
</style>
<script type="text/javascript">

	/* var cust_number= '${cust_number}'; */
	var username = '${nickname}';
	var socket = io.connect('http://10.10.12.230:4000');
	 toastr.options = {
			  "closeButton": true,
			  "debug": false,
			  "newestOnTop": true,
			  "progressBar": false,
			  "positionClass": "toast-bottom-right",
			  "preventDuplicates": false,
			  "showDuration": "300",
			  "hideDuration": "1000",
			  "timeOut": "500000",
			  "extendedTimeOut": "100000",
			  "showEasing": "swing",
			  "hideEasing": "linear",
			  "showMethod": "fadeIn",
			  "hideMethod": "fadeOut",
			  "onclick" : function(event){
			var opponentName = event.currentTarget.children[1].innerText
			var UserName = username;
				
			location.href = "chattingTemp?UserName=" + UserName + "&opponentName="+ opponentName;
				  }
			};

	$(function(){
		socket.emit('add user', username);

	});

	socket.on('chat message', function(data) {
		
		if(data.username==username){
			}else{
			
				var mesMain = data.message;
				var mesHead = data.username;
					}
			
		toastr["info"](mesMain, mesHead);
		
	});

	
	function chatOpen(){
		window.open("popup", "win", "width=450,height=450, left=50,up=50");
	}


	
</script>
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

<div class="wrapper">
<img class="imgContainer" alt="produce" src="resources/images/musiclist/produce.png">
	<ul class="stage">
	<li class="icon">
		<div class="boxContainer">
    		<div class="frontImgForBoxContainer">
    			<img alt="posting" src="resources/images/main/posting.png">
    		</div>
    		<div class="info">
				<header>
					<h1>Posting</h1>
						<a href="postWrite"><img alt="posting" src="resources/images/main/posting_icon.png"></a>
				</header>
					<p>
					Click the icon for posting or sharing what you made it!
					</p>
			</div>
		</div>
	</li>
	<li class="icon">
		<div class="boxContainer">
			<div class="frontImgForBoxContainer">
				<img alt="manListening" src="resources/images/main/manListening.JPG">
			</div>
			<div class="info">
				<header>
					<h1>My Music List</h1>
						<a href="myMusicList"><img alt="myMusicList" src="resources/images/main/headphone1.png"></a>
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
					<h1>Producing</h1>
					<a href="makingMusic"><img alt="producing" src="resources/images/main/producing_icon.png"></a>
				</header>
				<p>
				Click the icon for composing and producing your new music
				</p>
			</div>
		</div>
	</li>
	<li class="icon">
		<div class="boxContainer">
			<div class="frontImgForBoxContainer">
				<img alt="womanListening" src="resources/images/main/womanListening.png">
			</div>
			<div class="info">
				<header>
					<h1>Music Board</h1>
					<a href="#musicBoard"><img alt="musicBoard" src="resources/images/main/allList.png"></a>
				</header>
				<p>
				Click the icon to see your friends' music and what's the trend
				</p>
			</div>
		</div>
	</li>
</ul>
</div>
<div id="musicBoard">
	<h1>Music Board</h1>
</div>

	<input type="button" id="test1"  value="toast" onclick="toasted()">
		<a href="deleteView">탈주닌자</a>
		<a href="goModify">정보수정수정</a>
		<a href="protest">실험해보자</a>

<!-- grid for main page (holding) -->
<!-- <div class="grid-container">
	<div class="mainGrid">
	
	</div>
	<div class="rightGrid">New tracks from followers
	</div>
</div> -->

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