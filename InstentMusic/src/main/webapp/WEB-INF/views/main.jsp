<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- <meta http-equiv="X-UA-Compatible" content="ie=edge"> -->
<title>Main page after login</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/css/navigation.css">
<link rel="stylesheet" href="resources/css/sideMenuBar.css">
<link rel="stylesheet" href="resources/css/main.css">
<script src="http://172.30.1.20:4000/socket.io/socket.io.js"></script>
<script src="resources/js/jquery-3.4.1.min.js"></script>
<script src="resources/js/toastr.min.js"></script>
 <link href="resources/css/toastr.min.css" rel="stylesheet"/>
<style type="text/css">
a:link{
	text-decoration: none;
}
</style>
<script type="text/javascript">

	/* var cust_number= '${cust_number}'; */
	var username = '${nickname}';
	var socket = io.connect('http://172.30.1.20:4000');
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
			  <a href="chattingTemp"><i class="fa fa-comments-o"></i> 채팅 연습하러 가기</a>
			  <a href="chatBangCreate"><i class="fa fa-comment-o"></i>채팅방 만들기</a>
			</div>
		</div>
	</nav>

<!-- grid for main page -->
<div class="grid-container">
	<div class="mainGrid">Board
	<br>
	Hot tracks
	<br>
	New launched sound effects
	</div>
	<div class="rightGrid">New tracks from followers
	</div>
</div>

		<input type="button" value="챗방" onclick="chatOpen()">
	<input type="button" id="test1"  value="toast" onclick="toasted()">
		<a href="postWrite"> 글쓰자</a>
		<a href="logout">로그아웃</a>
		<a href="deleteView">탈주닌자</a>
		<a href="goModify">정보수정수정</a>
		<a href="protest">실험해보자</a>
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