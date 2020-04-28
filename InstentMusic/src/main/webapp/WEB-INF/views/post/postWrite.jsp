<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://10.10.12.230:4000/socket.io/socket.io.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="resources/js/jquery-3.4.1.min.js"></script>
<script src="resources/js/p5.min.js"></script>
<script src="resources/js/p5.sound.min.js"></script>
<script src="resources/js/jquery-ui.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<link rel="stylesheet" href="resources/css/navigation.css">
<link rel="stylesheet" href="resources/css/sideMenuBar.css">
<link rel="stylesheet" href="resources/css/3d_double_roll_btn.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>글쓰기</title>
<script  type="text/javascript">
var username = '${nickname}';
var socket = io.connect('http://10.10.12.230:4000');

$(function(){
	socket.emit('add user', username);
	getmusic();
});
var path, song;
function getmusic(){
	var num = "${mus_number}";
	$.ajax({
		type : 'get'
		,url : 'getmusic'
		,data : {'mus_number':num}
		,success : function(resp){
				var data = resp.mus_title+'<img src="resources/images/sound/play.png" id="musicplay">'
				$("#posttitle").html(data);
				path = resp.fullPath;
				setup();
				$("#musicplay").click(function(){
					if(song.isPlayed){
						song.stop();
					}
					setup();
				})
			}
	})
}
function postnotice(mus_title){
	var followerList = new Array();
	$.each(${followerList},function(index, item) {
	
		followerList[index] = item;
			});
	 
	console.log(followerList);
	 socket.emit('postWrite',followerList,username,mus_title);

	  location.href = "main" 
}
function setup(){
	userStartAudio();
	song = loadSound(path,loaded);
}
function loaded(){
	userStartAudio();
	song.play();
}
var sel_file;
$(function(){
	$("#upload").on("change",handleImgFileSelect);
	$("#tagbtn").click(function(){
		var tag = $("#inputtag").val();
		var data = '<div class="addtag">'+tag+'<button class="deltag">x</button></div>'
		$("#posttag").append(data);
	})
});
	function handleImgFileSelect(e){
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);

	filesArr.forEach(function(f){
		if(!f.type.match("image.*")){
			alert("이미지 파일을 업로드 해주세요.");
			return;
		}
		sel_file=f;
		var reader = new FileReader();
		reader.onload = function(e){
			$("#postimg").attr("src",e.target.result);
		}
		reader.readAsDataURL(f);	
		});
}
</script>
<style>
#postForm{
	width: 800px;
	height: 600px;
	margin : 0 auto;
	margin-top : 40px;
	border : 1px solid black;
	text-align: center;
}
#postcontent{
	margin : 10px 10px 10px 10px;
	width: 700px;
	height : 100px;
}
#postimg{
	margin-top : 20px;
	margin-bottom : 20px;
	width : 160px;
	height : 160px;
}
#upload{
	margin : 0 auto;
}
#posttitle{
	font-size : 20px;
}
#posttag{
	width : 700px;
	height : 100px;
	margin : 0 auto;
	margin-top : 10px;
	background-color: #E6E6E6;
}
#postup{
	margin-top : 10px;
}
.addtag{
	float : left;
	margin : 5px 5px 5px 5px;
}
#musicplay{
	margin-left : 5px;
	width : 30px;
	height : 30px;
	cursor: pointer;
}
</style>
</head>
<body >
	<!-- Top for logo and navibar -->
	 <nav class="navigation">
		<div class="navigation__column">
			<a href="main"><img class="logo" alt="home" src="resources/images/home/im_logo_w.jpg">
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
<div id="wrapper">
<div id="postForm">
<img id="postimg" src="resources/images/home/im_logo_w.jpg">
<form id="form_upload" enctype="multipart/form-data" action="/file/upload" method="post">
<input type="file" id="upload">
</form>
<div id="posttitle"></div>
<textarea id="postcontent" placeholder="Introduce this music."></textarea><br>
Add tag : <input type="text" id="inputtag" placeholder="Add a tag to the music">&nbsp;<button class="w3-btn w3-grey w3-round" id="tagbtn">+</button>
<div id="posttag">
</div>
<button id="postup" class="w3-btn w3-grey w3-round">Sharing Music</button>
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