<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!--  <meta http-equiv="X-UA-Compatible" content="ie=edge">  -->
<title>Main page after login</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/css/navigation.css">
<link rel="stylesheet" href="resources/css/sideMenuBar.css">
<link rel="stylesheet" href="resources/css/main.css">
<script src="http://172.30.1.32:4000/socket.io/socket.io.js"></script>
<link rel="stylesheet" href="resources/css/styles.css">
<script src="resources/js/jquery-3.4.1.min.js"></script>
<script src="resources/js/toastr.min.js"></script>
 <link href="resources/css/toastr.min.css" rel="stylesheet"/>
<style type="text/css">
a:link{
	text-decoration: none;
}
@-webkit-keyframes moveUp {
	0% {}

	100% {
		-webkit-transform: translateY(0);
		opacity: 1
	}
}

@keyframes moveUp {
	0% {}

	100% {
	-webkit-transform: translateY(0);
		transform: translateY(0);
		opacity: 1;
		
	}
}
#endDan{
position: relative;
left: 43%;
top: 90%;
font-size: 30pt;
-webkit-transform: translateY(200px);
transform: translateY(200px);
-webkit-animation: moveUp 3.65s ease forwards;
animation: moveUp 3.65s ease forwards;
}
</style>
<!-- 192.168.0.84 -->
<script type="text/javascript">
	var start_Page = -1;
	var cust_number = '${cust_number}';
	var username = '${nickname}';
	var socket = io.connect('http://172.30.1.32:4000');
	 toastr.options = {
			  "closeButton": true,
			  "debug": false,
			  "newestOnTop": true,
			  "progressBar": false,
			  "positionClass": "toast-bottom-right",
			  "preventDuplicates": true,
			  "showDuration": "300",
			  "hideDuration": "1000",
			  "timeOut": "5000",
			  "extendedTimeOut": "1000",
			  "showEasing": "swing",
			  "hideEasing": "linear",
			  "showMethod": "fadeIn",
			  "hideMethod": "fadeOut",
			  "onclick" : function(event){
				  console.log(event);
			var toastr_kind = event.currentTarget.children[1].children[0].value;
			alert(toastr_kind);
			if(toastr_kind == 'CHAT'){
				  
			var opponentName = event.currentTarget.children[1].innerText
			var UserName = username;
		
		 location.href = "chattingTemp?UserName=" + UserName + "&opponentName="+ opponentName; 
				  }
			  }	
			};

	$(function(){
	
		socket.emit('add user', username);
		getPage_data(cust_number);
		
			
		$(window).scroll(function() {
		    var scrolltop = $(document).scrollTop();
		    var height = $(document).height();
		    var height_win = $(window).height();
		 if (Math.round( $(window).scrollTop()) == $(document).height() - $(window).height()-1) {
			if($("#profile")[0].className!='stop'){
					 getPage_data(cust_number);
						if(start_Page%3==0){
							
							$("#profile")[0].className='stop';
							$('#endDan').html('<a onclick="getPage_data('+${cust_number}+')"><<더보기>></a>');
							}
						}
				}
			});

		
	});


	socket.on('chat message', function(data) {
		
		if(data.username==username){
			}else{
			
				var mesMain = data.message;
				var mesHead = "<input type='hidden'  name='toastr_kind' value='CHAT' >"+data.username;
					}
			
		toastr["info"](mesMain, mesHead);
		
	});
	socket.on('postWrite message', function(data) {
			$.each(data.followerList,function(index, item) {
				if(item==cust_number){
				var mesMain = data.username+"님이 올린 새글"+ data.message;
				var mesHead = "<input type='hidden'  name='toastr_kind' value='POST' > 알림" ;

				toastr["info"](mesMain, mesHead);
					}
			});
	
	});
	socket.on('newFollow message', function(data) {
			if(data.follow_number==cust_number){
				var mesMain = data.username+"님이 회원님을  팔로우하기 시작하였습니다.";
				var mesHead = "<input type='hidden'  name='toastr_kind' value='Follow' > 알림" ;
			
			toastr["info"](mesMain, mesHead);
			
			} 
	
	});


	socket.on('replynotice message', function(data) {
		if(data.postWriter_number==cust_number){
		var mesMain = data.replyWriter_number+"님이 "+data.mus_title+"글에 댓글을 달았습니다.";
		var mesHead = "<input type='hidden'  name='toastr_kind' value='Reply' > 알림" ;
	
	toastr["info"](mesMain, mesHead);
		}


});
	function getPage_data(cust_number){
		if($("#profile")[0].className=='stop'){
			$("#profile")[0].className='';
			$('#endDan').html('');
			}
 		if(start_Page==0){
			start_Page++;
			} 
		start_Page++;

		console.log(start_Page);
		$.ajax({
			method : 'GET',
			url : 'postLists',
			data : {
				"start_Page" : start_Page
				,"cust_number":cust_number
			},
			success : getPage,
			error : function(resp) {
				alert("Error");
			}
		})

		}
	function chatOpen(){
		window.open("popup", "win", "width=450,height=450, left=50,up=50");
	}
	
	function getPage(resp){
		if(resp==null) {
			alert("글이 없습니다.");
			return ;
		}
		var data = "<section class='profile__photos'>"
			$.each(resp,function(index, item) {
				var rannum =  Math.floor(Math.random() * 3)+0.65;/* 0.65 */

					data += "<div class='profile__photo' style='-webkit-transform: translateY(200px);transform: translateY(200px);-webkit-animation: moveUp "+rannum+"s ease forwards;animation: moveUp "+rannum+"s ease forwards;'>"
						
				 	data += "<img src='resources/images/IUfeed.jpg' />"
				 		
				 	data += "<div class='profile__photo-overlay' onclick='postDetail(event)'>"
				 	data += "<input type='hidden' id='post_number'  name='post_number' value='"+item.post_number+"' >"
				 	 data += "<span class='overlay__item'> <i class='fa fa-heart'>"+item.mus_title+"</i></span> ";
				 	 data += "<span class='overlay__item'> <i class='fa fa-comment'>"+item.post_nickname+"</i></span> ";

				 	 data += "</div></div>"

					

					});

		data +="</section>";
		$("#profile").append(data);
	
	
	}
	function postDetail(event){
		if(event.target.children[0]==undefined){
			return;
			}
		var post_number = event.target.children[0].value
		console.log(post_number);
		location.href = "postGetOne?post_number=" + post_number;

		}
	$(function(){
		$("#searchPost").keyup(function(){
			var data = {'search_word':$("#searchPost").val()};
			$.ajax({
				method : 'get'
				,url : 'searchpost'
				,data : data
				,success : function(resp){
					var d = '';
						if($("#searchPost").val()==''){
						$("#myUL2").html('');
						}else{
						$.each(resp,function(index,item){
							d+= '<li>'+'<a class="name">'+item.search_word+'</a>'+'</li>';
// 							d+= '<li>'+item.search_word+'</li>';
						})
						$("#myUL2").html(d);
						$(document).on("click",".name",function(){
							var v = $(this).text();
							$("#searchPost").val(v);
							$("#myUL2").html('');
							});
						}
					}
			})
		})
	})
	$(function(){
		$("#searchp").click(function(){
			var data = {'search_word':$("#searchPost").val()};
			$.ajax({
				method : 'get'
				,url : 'postList'
				,data : data
				,success : function(resp){
					var a = '';
					$.each(resp,function(index,item){
						a+='<a>'+item.post_nickname+'</a>';
					})
					$("#wrapper2").append(a);
				}
				})
			})
		
		})
	
</script>
</head>
<body>
	<!-- Top for logo and navibar -->
	 <nav class="navigation">
		<div class="navigation__column">
			<a href="home"><img class="logo" alt="home" src="resources/images/home/im_logo_w.jpg">
			</a>&nbsp;&nbsp;&nbsp;
			<a href="profile">
			<img class="pro" style="width: 46px; height: 46px; border-radius: 23px;" src="<spring:url value='/image/${image}'/>"/>
			</a>
		</div>
		<div class="navigation__column">
		<div class="searchingTool">
			<a id="searchp"><i class="fa fa-search"></i></a><input id="searchPost" type="text" placeholder="Search">
		</div>
		</div>
		<div id="myUL3">
			<ul id="myUL2"></ul>
		</div>	
		<div class="navigation__column">
			<div class="navigations__links">
				<div class="navigation__list-item"><a href="#"
					class="navigation__link" onclick="chatOpen()"><i class="fa fa-send-o"></i>
				</a></div>
				<div class="navigation__list-item"><a href="#"
					class="navigation__link"><i class="fa fa-bell-o"></i>
				</a></div>
				<div class="navigation__list-item"  >
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
		<a href="postWrite"> 글쓰자</a>
		<a href="logout">로그아웃</a>
	<input type="button" id="test1"  value="toast" onclick="toasted()">
		<a href="deleteView">탈주닌자</a>
		<a href="goModify">정보수정수정</a>
		<a href="popup">popup</a>
		<input type="button" value="popup" onclick="chatOpen()">
		<a href="infinity"> infinity</a>
		
<br>
	<main id="profile" class="">	</main>
				<div id="endDan" ></div>
				<div id="wrapper2">
				</div>
			
<!-- grid for main page (holding) -->
<!-- <div class="grid-container">
	<div class="mainGrid">
	
	</div>
	<div class="rightGrid">New tracks from followers
	</div>
<<<<<<< HEAD
</div>

		<input type="button" value="챗방" onclick="chatOpen()">
	<input type="button" id="test1"  value="toast" onclick="toasted()">
		<a href="postWrite"> 글쓰자</a>
		<a href="logout">로그아웃</a>
		<a href="test1">프로필실험</a>
=======
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