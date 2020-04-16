<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Profile</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/css/styles.css">
<link rel="stylesheet" href="resources/css/sideMenuBar.css">
<script src="resources/js/jquery-3.4.1.min.js"></script>

</head>

<body>

	 <nav class="navigation">
		<div class="navigation__column">
			<a href="main"> <img src="resources/images/logo.png" />
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
			  <a href="#">About</a>
			  <a href="#">Services</a>
			  <a href="#">Clients</a>
			  <a href="#">Contact</a>
			</div>
		</div>
	</nav>
	
	<main id="profile">
		<header class="profile__header">
			<div class="profile__column">
				<img src="resources/images/IU.jpg" />
			</div>
			<div class="profile__column">
				<div class="profile__title">
					<h3 class="profile__username">${customersData.cust_nickname}</h3>
					<a href="edit-profile.html">Edit profile(수정하러가기)</a> <i
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
					<span class="profile__full-name">${customersData.cust_introduce} </span>
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