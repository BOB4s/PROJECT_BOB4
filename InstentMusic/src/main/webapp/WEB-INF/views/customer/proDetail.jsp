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
<script src="http://10.10.12.212:4000/socket.io/socket.io.js"></script>
<script>
var start_Page = -1;
var cust_number = '${pd.cust_number}';
var username = '${pd.cust_nickname}';
var socket = io.connect('http://10.10.12.212:4000');
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
$(function() {

		socket.emit('add user', username);
		getPage_data(cust_number);
		
		var follower_number = '${cust_number}';
	 	var follow_number = '${customersData.cust_number}'; 
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
			url : 'myList',
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
	function getPage(resp){
		if(resp==null) {
			alert("글이 없습니다.");
			return ;
		}
		var data = "<section class='profile__photos'>"
			$.each(resp,function(index, item) {
				var rannum =  Math.floor(Math.random() * 3)+0.65;/* 0.65 */

					data += "<div class='profile__photo' style='-webkit-transform: translateY(0px);transform: translateY(0px);-webkit-animation: moveUp "+rannum+"s ease forwards;animation: moveUp "+rannum+"s ease forwards;'>"
						
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
</script>
</head>
<body>
	 <nav class="navigation">
		<div class="navigation__column">
			<a href="main"> <img class="logo" alt="home" src="resources/images/home/im_logo_w.jpg" />
			</a>&nbsp;&nbsp;&nbsp;
			<a href="goModify">
			<img class="pro" style="width: 46px; height: 46px; border-radius: 23px;" src="<spring:url value='/image/${image}'/>"/>
			</a>
		</div>
		<div class="navigation__column">
			<div class="searchingTool">
				<i class="fa fa-search"></i> <input id="searchpf" type="text" placeholder="Search">
			</div>
		</div>
		<div id="myUL1">
			<ul id="myUL"></ul>
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
				<c:if test="${pd.cust_photo_saved == null}">
				<img class="img-responsive center-block" id=m_photo name="m_photo" src="resources/images/profile.png">
				</c:if>
				<c:if test="${pd.cust_photo_saved != null}">
				<img class="pro" src="<spring:url value='/image/${pd.cust_photo_saved}'/>"/>	
				</c:if>
			</div>
			<div class="profile__column">
				<div class="profile__title">
					<h3 class="profile__username">${pd.cust_nickname}</h3>
<!-- 					<a href="edit-profile.html"></a> -->
					<c:if test="${pd.cust_id == id}">
					<i id="profileSetting" class="fa fa-cog fa-lg"></i>
					</c:if>
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
					<span class="profile__full-name">${pd.cust_introduce} </span>
				</p>
			</div>
		</header>
		<main id="profile" class="">	</main>
				<div id="endDan" ></div>
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