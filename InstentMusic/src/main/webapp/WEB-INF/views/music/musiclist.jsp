<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<script src="resources/js/jquery-3.4.1.min.js"></script>
<script src="resources/js/p5.min.js"></script>
<script src="resources/js/p5.sound.min.js"></script>
<script src="resources/js/jquery-ui.min.js"></script>
<script src="resources/js/sketch.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/css/navigation.css">
<link rel="stylesheet" href="resources/css/sideMenuBar.css">
<link rel="stylesheet" href="resources/css/makingMusic.css">
<link rel="stylesheet" href="resources/css/3d_double_roll_btn.css">
<style>
#list{
	float : left;
	margin-left : 50px;
	margin-top : 30px;
	width: 690px;
	height : 600px;
	background-color : #D8D8D8;
}
#visualizer{
	padding-top : 50px;
	margin-left : 40px;
	margin-top : 30px;
	float : left;
	width : 690px;
	height : 600px;
	background-color : #D8D8D8;
	text-align: center;
}
#startment{
	width : 690px;
	height : 20px;
	margin-top : 270px;
	text-align : center;
	font-size : 50px;
	font-family: "Times New Roman", Times, serif;
}
#startments{
	width : 690px;
	height : 20px;
	margin-top : 30px;
	font-size : 50px;
	font-family: "Times New Roman", Times, serif;
}
.musiclist{
	width : 600px;
	height : 30px;
	margin : 0 auto;
	margin-top : 10px;
	text-align : center;
}
#listname{
	margin-top : 20px;
	text-align : center;
	font-size : 30px;
	font-style: italic;
	font-family: "Times New Roman", Times, serif;
}
#lists{
	width : 650px;
	height : 520px;
	margin-left : 20px;
	white-space: nowrap;
	overflow-x: hidden;
}
.playsong{
	witdh : 25px;
	height : 25px;
	cursor: pointer;
}
.writesong{
	margin-left : 5px;
	witdh : 28px;
	height : 28px;
	cursor: pointer;
}
.indexlist{
	width : 30px;
}
.titlelist{
	width: 370px;
}
</style>
<script>
var path;
$(function(){
	getmusics();
	$("#slib").click(function(){
		location.href="makingMusic";
	})
	$("#makingmusic").click(function(){
		location.href="makingmusic2";
	})
})
function getmusics(){
	$.ajax({
		type : 'get'
		,url : 'getmusics'
		,success : function(resp){
			if(resp!=null){
				$("#startment").remove();
				var data = '<table class="musiclist" border="1">';
				$.each(resp,function(index,item){
					data+='<tr>';
					data+='<td class="indexlist">'+index+'</td>';
					data+='<td class="titlelist">'+item.mus_title+'</td>'
					data+='<td class="datelist">'+item.mus_date+'</td>'
					data+='<td class="images"><img class="playsong" alt="'+item.fullPath+'" src="resources/images/sound/playlist.png">'
					data+='<img class="writesong" alt="'+item.mus_saved+'" src="resources/images/sound/writelist.png"></td>'
					data+='</tr>';
				})
				data+='</table>'
				$("#lists").append(data);

				setup();
				
				$(".playsong").click(function(){
					path = $(this).attr('alt');
					song.play();
				})
			}
		}
	})
}
function setup() {
	var cvs = createCanvas(400,400);
	cvs.parent('sketch-target');
	colorMode(HSB);
	angleMode(DEGREES);
	song = loadSound(path);
	fft = new p5.FFT(0.8, 128);
	w = width / 64;
	fft.setInput(song);
}
function draw() {
	  background(0);
	  var spectrum = fft.analyze();
	  noStroke();
	  translate(width/2, height/2);
	  for (var i = 0; i < spectrum.length; i++) {
		var angle = map(i,0,spectrum.length,0,360);
		var amp = spectrum[i];
		var r = map(amp, 0, 256, 20, 100);
		var x = r * cos(angle);
		var y = r * sin(angle);
		stroke(i,255,255);
		line(0,0,x,y);
	  }
}
</script>
</head>
<body>
<!-- Top for logo and navibar -->
	 <nav class="navigation">
		<div class="navigation__column">
			<a href="main"><img class="logo" alt="home" src="resources/images/home/im_logo_w.jpg">
			</a>
		</div>
		<div class="navigation__column">
			<div id="slib" class="button_base btn_3d_double_roll">
			<div>Setting Music</div>
			<div>Setting Music</div>
			<div>Setting Music</div>
			<div>Setting Music</div>
		</div>
		<div id="makingmusic" class="button_base btn_3d_double_roll">
			<div>Go to making Music</div>
			<div>Go to making Music</div>
			<div>Go to making Music</div>
			<div>Go to making Music</div>
		</div>
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
	<div id="list">
	<div id="listname">${sessionScope.nickname}'s Music List</div>
	<div id="lists">
	
<!-- <div class="marquee">
	<table class="musiclist" border="1">
		<tr>
			<td class="indexlist">1</td>
			<td class="titlelist">Music title</td>
			<td class="datelist">
					<div class="marquee__inner" aria-hidden="true">
						<span>mus_date</span>
						<span>mus_date</span>
						<span>mus_date</span>
						<span>mus_date</span>
					</div>
			</td>
			<td class="images"><img class="playsonge" alt="item.fullPath" src="resources/images/sound/playlist.png">
			<img class="writesong" alt="item.mus_saved" src="resources/images/sound/writelist.png"></td>
		</tr>
	</table>	
</div> -->
	
	<div id="startment">No composed Music :(</div>
	</div>
	</div>
	<div id="visualizer">
	<span id="sketch-target"></span>
	<div id="startments">Select one Music :)</div>
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