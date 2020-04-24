<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
<!-- <meta http-equiv="X-UA-Compatible" content="ie=edge"> -->
<title>Profile</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/css/styles.css">
<link rel="stylesheet" href="resources/css/sideMenuBar.css"> 
<script src="<c:url value="resources/js/jquery-3.4.1.min.js" />"></script>
<link rel="stylesheet" href="resources/css/main.css">
 <script src="http://192.168.0.84:4000/socket.io/socket.io.js"></script>
<script>
$(function(){
$("#profileSetting").click(function(){
	location.href="goModify"
	})
	$("#searchpf").keyup(function(){
		var data = {'search':$("#searchpf").val()};
		$.ajax({
			method : 'get'
			,url : 'searchpf'
			,data : data
			,success : function(resp){
				var d = '';
					if($("#searchpf").val()==''){
					$("#myUL").html('');
					}else{
					$.each(resp,function(index,item){
// 						d+= '<span class="sepf">'+item.cust_nickname+'</span><br/>'
						d+= '<li>'+'<a href="proDetail?cust_number='+item.cust_number+'">'+'<img class="sp" src="<spring:url value="/image/'
						+item.cust_photo_saved+'"/>"/>'+item.cust_nickname+'</a>'+'</li>';
					})
					$("#myUL").html(d);
					}
				}
		})
	})
})

<script type="text/javascript">
	var username = '${nickname}';
	var socket = io.connect('http://192.168.0.84:4000');
	$(function() {

		socket.emit('add user', username);

		
		var follower_number = '${cust_number}';
	/* 	var follow_number = '${customersData.cust_number}'; */
		var follow_number = 66 ; 
		$.ajax({
			method : 'GET',
			url : 'followchecking',
			data : {
				"follower_number" : follower_number,
				"follow_number" : follow_number
			},
			success : function(resp) {
				if (resp == 'unfollowed')
					$("#following_button").text("follow")
				if (resp == 'followed')
					$("#following_button").text("unfollow")
			}
		})

		$("#following_button").on("click", function() {
			$.ajax({
				method : 'GET',
				url : 'following',
				data : {
					"follower_number" : follower_number,
					"follow_number" : follow_number
				},
				success : function(resp) {
					if (resp == 'unfollowed')
						$("#following_button").text("follow")
					if (resp == 'followed')
						$("#following_button").text("unfollow")
						
					 socket.emit('newFollow',follow_number,username );
					

				}

			})

		});
		$("#followList").on("click", function() {
			$.ajax({
				method : 'GET',
				url : 'getFollowers',
				data : {
					"follow_number" : follow_number
				},
				success :	function followersList(resp) {
					var data = '';
					$.each(resp,function(index, item) {
						data += '<a>'+item+'</a>';				
									})
					

					$("#followlists").html(data);

				}
			})

		});
	
		//끝
	});
</script>
</head>
<body>
	 <nav class="navigation">
		<div class="navigation__column">
			<a href="main"> <img class="logo" alt="home" src="resources/images/home/im_logo_w.jpg" />
			</a>
		</div>
		<div class="navigation__column">
			<i class="fa fa-search"></i> <input id="searchpf" type="text" placeholder="Search">
		<div id="myUL1">
			<ul id="myUL"></ul>
		</div>
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
			  <a href="#">About</a>
			  <a href="#">Services</a>
			  <a href="goModify"><i class="fa fa-id-card-o"></i> Edit profile</a>
			  <a href="logout"><i class="fa fa-power-off"></i> Logout</a>
			</div>
		</div>
	</nav>
	
	<main id="profile">
		<header class="profile__header">
			<div class="profile__column">
				<c:if test="${image == null}">
				<img class="img-responsive center-block" id=m_photo name="m_photo" src="resources/images/profile.png">
				</c:if>
				<c:if test="${image != null}">
				<img class="pro" src="<spring:url value='/image/${image}'/>"/>	
				</c:if>
			</div>
			<div class="profile__column">
				<div class="profile__title">
					<h3 class="profile__username">${customersData.cust_nickname}</h3>
					<a id="following_button" >following</a> <i
						class="fa fa-cog fa-lg"></i>
				</div>
				<ul class="profile__stats">
					<li class="profile__stat"><span class="stat__number">이사람이 글쓴수 가져오기</span>
						posts</li>
					<li class="profile__stat"><span class="stat__number">${followers}</span>
						<a href="followers">followers</a></li>
					<li class="profile__stat"><span class="stat__number">${followings}</span>
						<a href="followings">following</a></li>
				</ul>
				<p class="profile__bio">
					<span class="profile__full-name">${introduce} </span>
				</p>
			</div>
		</header>
		<section class="profile__photos">
			<div class="profile__photo">
				<img src="resources/images/IUfeed.jpg" />
				<div class="profile__photo-overlay">
					<span class="overlay__item"> <i class="fa fa-heart"></i> 좋아유수
					</span> <span class="overlay__item"> <i class="fa fa-comment"></i>
						댓글수/ 재생수
					</span>
				</div>
			</div>
			<div class="profile__photo">
				<img src="resources/images/IUfeed.jpg" />
				<div class="profile__photo-overlay">
					<span class="overlay__item"> <i class="fa fa-heart"></i>  좋아유수
					</span> <span class="overlay__item"> <i class="fa fa-comment"></i>
						댓글수/ 재생수
					</span>
				</div>
			</div>
			<div class="profile__photo">
				<img src="resources/images/IUfeed.jpg" />
				<div class="profile__photo-overlay">
					<span class="overlay__item"> <i class="fa fa-heart"></i>  좋아유수
					</span> <span class="overlay__item"> <i class="fa fa-comment"></i>
						댓글수/ 재생수
					</span>
				</div>
			</div>
			<div class="profile__photo">
				<img src="resources/images/IUfeed.jpg" />
				<div class="profile__photo-overlay">
					<span class="overlay__item"> <i class="fa fa-heart"></i>  좋아유수
					</span> <span class="overlay__item"> <i class="fa fa-comment"></i>
						댓글수/ 재생수
					</span>
				</div>
			</div>
		</section>
	</main>
	<footer class="footer">
		<div class="footer__column">
			<nav class="footer__nav">
				<ul class="footer__list">
					<li class="footer__list-item"><a href="#" class="footer__link">About
							Us</a></li>
					<li class="footer__list-item"><a href="#" class="footer__link">Support</a></li>
					<li class="footer__list-item"><a href="#" class="footer__link">Blog</a></li>
					<li class="footer__list-item"><a href="#" class="footer__link">Press</a></li>
					<li class="footer__list-item"><a href="#" class="footer__link">Api</a></li>
					<li class="footer__list-item"><a href="#" class="footer__link">Jobs</a></li>
					<li class="footer__list-item"><a href="#" class="footer__link">Privacy</a></li>
					<li class="footer__list-item"><a href="#" class="footer__link">Terms</a></li>
					<li class="footer__list-item"><a href="#" class="footer__link">Directory</a></li>
					<li class="footer__list-item"><a href="#" class="footer__link">Language</a></li>
				</ul>
			</nav>
		</div>
		<div class="footer__column">
			<span class="footer__copyright">© 2020 IM!</span>
		</div>
	</footer>
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