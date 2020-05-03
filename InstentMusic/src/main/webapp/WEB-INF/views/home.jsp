<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Instent Music</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/css/navigation.css">
<link rel="stylesheet" href="resources/css/sideMenuBar.css">
<script src="resources/js/jquery-3.4.1.min.js"></script>
<script src="resources/js/jquery-ui.min.js"></script>
<script src="resources/js/p5.min.js"></script>
<script src="resources/js/p5.sound.min.js"></script>
<script src="resources/js/sketch.js"></script>
<script>
var path, song, i;
$(function(){
	i = 0 ;
	 
	function fname(){
		   i++;
		   var data = "press A~Z on your keyboard"
				data+= "<br><br>"+i
		   $("#target").html(data);
	  }
	var sounds = new Array();
	for(var j=0; j<26; j++){
		sounds[j] = 'resources/sound/beatbox/bb'+j+'.mp3'
	}
	
	$(document).keydown(function(event){
		for(var k=0; k<26; k++){
			var idx = k+65;
			if(event.keyCode == idx){
				path = sounds[k];
				setup();
			}
		}
	})
	/*1초마다 fname 함수 실행*/
	$(document).keydown(function(event){
		if(event.keyCode=='13'){
			var refreshIntervalId = setInterval(function(){
				fname();
				if(i>30){
				     clearInterval(refreshIntervalId);
				     var data = "Do you want to play more?"
						 data+="<br><br>Please LogIn!"
				     $("#target").html(data);
				}
			},1000);
		}
	});
})
function setup(){
	song = loadSound(path, loaded);
	if(i>30||i==0){
		song.setVolume(0.0);
	}else{
		song.setVolume(1.0);
	}
}
function loaded(){
	song.play();
}
function draw(){
	
}
</script>
<script>
//Login block section
var modal='';
function loginBlock(){
	modal = document.getElementById('id01');
	modal.style.display="block";
}
function blockClose(){
	modal.style.display="none";
}
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
//Login section
function login(){
	var id = $("#cust_id").val();
	if(id.trim().length < 3 || id.trim().length > 10){
		alert("ID should be 3~10 letters");
		return;
	}
	var pwd = $("#cust_password").val();
	if(pwd.trim().length < 3 || pwd.trim().length > 10){
		alert("Password should be 3~10 letters");
		return;
	}
	$("#formForLogin").submit();
}
</script>
<c:if test="${not empty Error}">
	<script>
		alert('${Error}');
	</script>
</c:if>

<style type="text/css">
body, html {
  height: 100%;
  line-height: 1.8;
}
/* Full height image header */
.bgimg-1 {
	position: relative;
	background-position: center;
	background-size: cover;
	background-image: url("resources/images/home/home_background.jpg");
	min-height: 100%;
}
.aboutHeader{
	position: relateive;
	background-position: center;
	background-size: cover;
	background-image: url("resources/images/home/producing.jpg");
	height: 100%;
	height: 400px;
}
.tryIt{
	color: white;
	position: absolute;
	top: 50%;
	left: 42%;
	text-align: center;
} 
.w3-button {
  padding: 16px;
}

/* logo */
.w3-third{
	color: white;
	margin-top: 5%;
	margin-bottom: 5%;
}
/* Login block */
body{
	font-family: Arial, Helvetica, sans-serif;
}
#id01{
	width: auto;
}
.container{
	background-color: #f1f1f1;
}
input[type=text], input[type=password]{
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
}
.loginbtn{
	background-color: gray;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 100%;
}
input:hover{
	opacity: 0.8;
}
.cancelbtn{
	width: auto;
	padding: 10px 18px;
	background-color: black;
	color: white;
}
.imgcontainer{
	text-align: center;
	margin: 24px 0 12px 0;
	position: relative;
}
.container{
	padding: 16px;
}
span.forgotPassword{
	float: right;
	padding-top: 16px;
}
.modal{
	display: none;
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	right: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgb(0,0,0);
	background-color: rgba(0,0,0,0.4);
	padding-top: 60px;
}
.modal-content{
	background-color: #fefefe;
	margin: 5% auto 15% auto;
	border: 1px solid #888;
	width: 80%;
}
.close{
	position: absolute;
	right: 25px;
	top: 0;
	color: #000;
	font-size: 35px;
	font-weight: bold;
}
.close:hover, .close:focus{
	color: red;
	cursor: pointer;
}
.animate{
	-webkit-animation: animatezoom 0.6s;
	animation: animatezoom 0.6s
}
@-webkit-keyframes animatezoom {
	from {-webkit-transform: scale(0)} 
	to {-webkit-transform: scale(1)}
}
  
@keyframes animatezoom {
	from {transform: scale(0)} 
	to {transform: scale(1)}
}
@media screen and (max-width: 300px) {
	span.psw {
		display: block;
		float: none;
  }
	.cancelbtn {
		width: 100%;
  }
}

/* top (logo and sidebar menu)*/
.navigation{
	border-bottom-width: 0px;
	margin-bottom: 0px;
}

</style>
</head>
<body>
	<!-- Navbar (sit on top) -->
<nav class="navigation">
		<div class="navigation__column">
			<a href="home"><img class="logo" alt="home" src="resources/images/home/im_logo_w.jpg">
			</a>
		</div>
			<div class="navigation__list-item">
					<span style="font-size:20px;cursor:pointer" onclick="openNav()">&#9776;</span>
		</div>
			<div id="mySidenav" class="sidenav">
			  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
			  <a href="#about">About</a>
			  <a href="#team">Team</a>
			  <a href="#">Contact</a>
		</div>
	</nav>

<!-- Header with full-height image -->
<header class="bgimg-1 w3-display-container w3-grayscale-min" id="home">
  <div class="w3-display-left w3-text-white" style="padding:48px">
    <span class="w3-jumbo w3-hide-small">You can be a Songwriter</span><br>
    <span class="w3-xlarge w3-hide-large w3-hide-medium">You can be a Songwriter</span><br>
    <span class="w3-xxlarge">Easy producing with IM</span>
    <p><a href="#about" class="fa fa-info-circle w3-button w3-white w3-padding-large w3-large w3-margin-top w3-opacity w3-hover-opacity-off"> About</a></p>
  	<p><a class="w3-button w3-white w3-padding-large w3-large w3-margin-top w3-opacity w3-hover-opacity-off" onclick="loginBlock()">Get Start</a></p>
  	<p><a href="join" class="w3-button w3-white w3-padding-large w3-large w3-margin-top w3-opacity w3-hover-opacity-off">Register</a></p>
  </div> 
  	<div class="tryIt">
  		<span class="w3-xlarge" id="target">Please press Enter!</span>
  	</div>
  <div class="w3-display-bottomleft w3-text-grey w3-large" style="padding:24px 48px">
    <i class="fa fa-facebook-official w3-hover-opacity"></i>
    <i class="fa fa-instagram w3-hover-opacity"></i>
    <i class="fa fa-snapchat w3-hover-opacity"></i>
    <i class="fa fa-pinterest-p w3-hover-opacity"></i>
    <i class="fa fa-twitter w3-hover-opacity"></i>
    <i class="fa fa-linkedin w3-hover-opacity"></i>
  </div>
</header>

<!-- Login block section when click the 'Get Start' -->
<div id="id01" class="modal">
	<form id="formForLogin" class="modal-content animate" action="login" method="POST">
		<div class="imgcontainer">
			<span class="close" title="Close Modal" onclick="blockClose()">&times;</span>
		</div>
		<div class="container">
			<label for="cust_id"><b>ID</b></label>
			<input id="cust_id" name="cust_id" type="text" placeholder="Enter your ID" required>
			<label for="cust_password"><b>Password</b></label>
			<input id="cust_password" name="cust_password" type="password" placeholder="Enter your password" required>
			<input class="loginbtn" type="button" onclick="login()" value="Login">
			<label>
				<input name="rememberMe" type="checkbox" checked="checked"> Remember me
			</label>
		</div>
		<div class="container">
			<input class="cancelbtn" type="button" value="Cancel" onclick="blockClose()">
			<span class="forgotPassword">Forgot <a href="#">password?</a></span>
		</div>
	</form>
</div>

<!-- About Section -->
<div class="w3-container" style="padding:128px 0px" id="about">
	<h3 class="w3-center">What is the IM?</h3>
	<p class="w3-center w3-large">Key features</p>
	<header class="aboutHeader w3-row-padding w3-center" style="margin-top:60px">
	<div class="w3-third">
		<i class="fa fa-music w3-margin-bottom w3-jumbo w3-center"></i>
		<p class="w3-large">Easy Composition</p>
		<p>You don't need to learn how to play musical instrument for composition.</p>
		<p> Choose or record a sound, and place it where you want on a keyboard.</p>
		</div>
	<div class="w3-third">
      <i class="fa fa-share-alt-square w3-margin-bottom w3-jumbo"></i>
      <p class="w3-large">Sharing</p>
      <p>You can share what you have composed it yourself.</p>
      <p>Don't be shy artist.</p>
    </div>
    <div class="w3-third">
      <i class="fa fa-users w3-margin-bottom w3-jumbo"></i>
      <p class="w3-large">Social Networking Service</p>
      <p>You can Social Networking with another artists through IM's community.</p>
      <p>Such as Posting, Texting and Chatting.</p>
    </div>
    </header>
</div>

<!-- Team Section -->
<div class="w3-container" style="padding:128px 16px" id="team">
  <h3 class="w3-center">THE TEAM</h3>
  <p class="w3-center w3-large">BoB4</p>
  <div class="w3-row-padding" style="margin-top:64px">
    <div class="w3-col l3 m6 w3-margin-bottom">
      <div class="w3-card">
        <img src="resources/images/home/kim.jpg" alt="Kim" style="width:50%">
        <div class="w3-container">
          <h3>Jihyun Kim</h3>
          <h4>김지현</h4>
          <h4>キムジヒョン</h4>
          <p class="w3-opacity">Team leader</p>
          <p>wlgus318@gmail.com</p>
        </div>
      </div>
    </div>
    <div class="w3-col l3 m6 w3-margin-bottom">
      <div class="w3-card">
        <img src="resources/images/home/park.jpg" alt="Park" style="width:50%">
        <div class="w3-container">
          <h3>Sejun Park</h3>
          <h4>박세준</h4>
          <h4>パクセジュン</h4>
          <p class="w3-opacity">Team member</p>
          <p>fgfg1202@gmail.com</p>
        </div>
      </div>
    </div>
    <div class="w3-col l3 m6 w3-margin-bottom">
      <div class="w3-card">
        <img src="resources/images/home/won.jpg" alt="Won" style="width:50%">
        <div class="w3-container">
          <h3>Taehyoung Won</h3>
          <h4>원태형</h4>
          <h4>ウォンテヒョン</h4>
          <p class="w3-opacity">Team member</p>
          <p>dnjsxogud@gmail.com</p>
        </div>
      </div>
    </div>
    <div class="w3-col l3 m6 w3-margin-bottom">
      <div class="w3-card">
        <img src="resources/images/home/lee.jpg" alt="Lee" style="width:50%">
        <div class="w3-container">
          <h3>Jaeyoung Lee</h3>
          <h4>이재영</h4>
          <h4>イジェヨン</h4>
          <p class="w3-opacity">Team member</p>
          <p>jaeyounglee91@gmail.com</p>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Footer -->
<footer class="w3-center w3-black w3-padding-64">
  <a href="#home" class="w3-button w3-light-grey"><i class="fa fa-arrow-up w3-margin-right"></i>To the top</a>
  <div class="w3-xlarge w3-section">
    <i class="fa fa-facebook-official w3-hover-opacity"></i>
    <i class="fa fa-instagram w3-hover-opacity"></i>
    <i class="fa fa-snapchat w3-hover-opacity"></i>
    <i class="fa fa-pinterest-p w3-hover-opacity"></i>
    <i class="fa fa-twitter w3-hover-opacity"></i>
    <i class="fa fa-linkedin w3-hover-opacity"></i>
  </div>
</footer>

<script>
// Modal Image Gallery
function onClick(element) {
  document.getElementById("img01").src = element.src;
  document.getElementById("modal01").style.display = "block";
  var captionText = document.getElementById("caption");
  captionText.innerHTML = element.alt;
}

function openNav() {
	  document.getElementById("mySidenav").style.width = "250px";
	}

function closeNav() {
	  document.getElementById("mySidenav").style.width = "0";
	}

// Toggle between showing and hiding the sidebar when clicking the menu icon
/* var mySidebar = document.getElementById("mySidebar");

function w3_open() {
  if (mySidebar.style.display === 'block') {
    mySidebar.style.display = 'none';
  } else {
    mySidebar.style.display = 'block';
  }
}

// Close the sidebar with the close button
function w3_close() {
    mySidebar.style.display = "none";
} */

</script>
</body>
</html>