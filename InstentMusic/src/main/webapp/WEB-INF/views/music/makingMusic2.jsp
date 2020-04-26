<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" buffer="4096kb" autoFlush="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MusicMake</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/css/navigation.css">
<link rel="stylesheet" href="resources/css/sideMenuBar.css">
<link rel="stylesheet" href="resources/css/makingMusic.css">
<link rel="stylesheet" href="resources/css/3d_double_roll_btn.css">
<script src="resources/js/jquery-3.4.1.min.js"></script>
<script src="resources/js/jquery-ui.min.js"></script>
<script src="resources/js/p5.min.js"></script>
<script src="resources/js/p5.sound.min.js"></script>
<script src="resources/js/sketch.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<style>
body{
margin : 10px 10px 10px 10px;
}
#soundlib, #keyboard{
	margin: 0 auto;
	margin-top : 10px;
	padding: 5px 5px 5px 5px;
	width: 1020px;
	height: 220px;
	border: 1px solid black;
}
.libs, dropdown-menu {
	float:left;
	margin-top:10px;
	width: 200px;
	height: 100px;
	white-space: nowrap;
	overflow-x: hidden;
	text-align: center;
}

#inbox {
	width: 1000px;
	height: 85px;
	white-space: nowrap;
	overflow-x: hidden;
	padding: 5px;
	background-color: #F2F2F2;
	text-align: center;
}

.sounds {
	float: left;
	font-size: 10px;
	text-align: center;
	padding: 5px;
}

.soundimg {
	width: 50px;
	height: 50px;
}

.soundss{
position: relative;
width: 50px;
height: 50px;
margin : 0 auto;
}

input {
	width: 200px;
}

.inputbtn {
	margin-top:5px;
	margin-left:50px;
	float:left;
	font-size: 15px;
	width: 350px;
	height : 40px;
}

.libs button {
	height: 25px;
	width:150px;
	background-color: #FFFFFF;
	color: black;
	font-size: 15px;
	border: 0px;
}
#bags{
float:right;
width: 650px;
height: 120px;
}
#bags input{
width: 180px;
}
.fronts{
float:left;
width: 350px;
height: 120px;
}
canvas {
margin-top: 10px;
margin-left: 10px;
}
#target2{
margin-left: 10px;
font-size : 30px;
text-decoration: underline;
}
.fronts img{
margin-left:5px;
margin-bottom:12px;
width: 30px;
height: 30px;
}
#bags img{
margin-left:60px;
margin-bottom:20px;
width : 65px;
height : 65px;
cursor: pointer;
}
#addModal{
	color: #FFFFFF;
	font-size: 30px;
	text-align: center;
}
#addcom{
	width: 200px;
	height: 30px;
	font-size: 20px;
}

#addbtn, #addModal button, #rcdbtn{
	width: 150px;
	height: 30px;
	background-color: #000000;
	background-color: rgba(255, 255, 255, 0.5);
	font-size: 20px;
	color: black;
	border: 1px;
	border-color: #FFFFFF;
	font-weight: bold;
}

#addfile {
	margin-top:10px;
	width: 100px;
	height: 30px;
	background: 00ff0000;
	border: 0;
	font-size: 20px;
}
/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	padding-top: 100px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.9); /* Black w/ opacity */
}

/* The Close Button */
.close {
	position: absolute;
	top: 15px;
	right: 35px;
	color: #f1f1f1;
	font-size: 40px;
	font-weight: bold;
	transition: 0.3s;
}

.close:hover, .close:focus {
	color: #bbb;
	text-decoration: none;
	cursor: pointer;
}
#target4, #target3{
font-size : 20px;
}
#editlib, #deletelib, #editname{
width: 20px;
height: 20px;
cursor: pointer;
}
.del{
	position: absolute;
	bottom: 0px;
	right: 0px;
	font-size: 10px;
	width : 15px;
	height : 15px;
	font-weight: bold;
	cursor: pointer;
	border: 0;
	background: red;
	color: #FFFFFF;
	border-radius: 100%;
	padding: 0;
}
.keydels {
	float:right;
	font-size: 8px;
	width : 12px;
	height : 12px;
	font-weight: bold;
	cursor: pointer;
	border: 0;
	background: red;
	color: #FFFFFF;
	border-radius: 100%;
	padding: 0;
}
.adds {
	position: absolute;
	bottom: 0px;
	right: 0px;
	font-size: 10px;
	width : 15px;
	height : 15px;
	font-weight: bold;
	cursor: pointer;
	border: 0;
	background: green;
	color: #FFFFFF;
	border-radius: 100%;
	padding: 0;
}
#form_upload2 img{
	cursor: pointer;
}
.keys{
	float : left;
	height : 50px;
	width : 50px;
	margin : 1px 1px 1px 1px;
	border: 1px solid black;
	padding: 1px 1px 1px 3px;
}
#keys{
	float: right;
	font-size: 10px;
	font-weight: bold;
	width : 650px;
	height : 220px;
}
#key1{
	float : right;
	margin-right: 0px;
}
#key2{
	float : right;
	margin-right: 30px;
}
#key3{
	float : right;
	margin-right: 60px;
}
#key4{
	float : right;
	margin-right: 90px;
}
#newset{
	font-size: 30px;
	text-decoration: underline;
}
#newment{
	font-size: 15px;
	color: red;
}
.keysou{
	padding:0px;
	font-size : 9px;
	text-align: center;
	color : blue;
	white-space: normal;
	line-height: 1.2;
}
#musinfo{
	text-align: center;
	margin : 0 auto;
	width: 1100px;
	height : 30px;
	margin-top: 10px;
	text-align : center;
	width: 1200px;
}
#parts{
	margin: 0 auto;
	width:1100px;
}
.part{
	margin : 10px 10px 10px 10px;
	float: left;
	width: 200px;
	height: 150px;
	border: 1px solid black;
}
.phrase1, .phrase2, .phrase3, .phrase4, .partbtn{
	width : 200px;
	height : 30px;
	text-align: center;
}
.gotomake{
	float : left;
	height : 28px;
	width : 140px;
	background-color: #8181F7;
	border : 0px;
	color : white;
	font-weight : bold;
}
.delpart{
	float : left;
	height : 28px;
	width : 29px;
	background-color: red;
	border : 0px;
	color : white;
	font-weight: bold;
}
.playpart{
float : left;
	height : 28px;
	width : 29px;
	background-color: green;
	border : 0px;
	color : white;
	font-weight: bold;
}
#slib, #addpart, #resettemp, #savemusic{
	width : 170px;
}
</style>
<script>
var song, path;
var partnum = 0;
var btnc=0;
var paths =[];
$(function() {
	$("#slib").click(function(){
		location.href="makingMusic";
	})
	gettemp();
	getall();
})
function getall(){
	$.ajax({
		method : 'get'
		,url : 'getall'
		,success : function(resp){
				if(resp!=null){
					$.each(resp,function(index,item){
						var datas = {'phrase_number':item.phrase_number,'phrase_saved':item.fullPath
									,'part_number':item.part_number,'key_board':item.key_board};
						paths.push(datas);
						if(partnum<item.part_number){
							partnum = item.part_number;
							addpart(partnum);
						}
					})
				}
			}
	})
	setup();
}
var bpmpat, bpmsong, bpms, bpmprs, bpmCrtl;
var s1,s2,s3,s4,s5,s6;
var recorder, soundFile, soundBlob;
var masterGain;
function setup(){
	userStartAudio();
	masterGain = new p5.Gain();
	masterGain.connect();
	var p1 = new p5.Gain();var p2 = new p5.Gain();var p3 = new p5.Gain();
	var p4 = new p5.Gain();var p5 = new p5.Gain();var p6 = new p5.Gain();
	$.each(paths,function(index,item){
		if(item.phrase_number==5){
		if(item.part_number==1){s1 = loadSound(item.phrase_saved);p1.setInput(s1);p1.connect(masterGain);}
		if(item.part_number==2){s2 = loadSound(item.phrase_saved);p2.setInput(s2);p2.connect(masterGain);}
		if(item.part_number==3){s3 = loadSound(item.phrase_saved);p3.setInput(s3);p3.connect(masterGain);}
		if(item.part_number==4){s4 = loadSound(item.phrase_saved);p4.setInput(s4);p4.connect(masterGain);}
		if(item.part_number==5){s5 = loadSound(item.phrase_saved);p5.setInput(s5);p5.connect(masterGain);}
		if(item.part_number==6){s6 = loadSound(item.phrase_saved);p6.setInput(s6);p6.connect(masterGain);}
		}
	})
	bpmsong = loadSound('resources/sound/drum/drum7.wav',() => {
		if(btnc==0){
			bpms.stop();
			bpmsong.stop();
		}else{
			bpms.loop();
		}
	});
	bpmpat = [1, 1, 1, 1];
	bpmprs = new p5.Phrase('bpmsong',(time) => {
		bpmsong.play(time);
	}, bpmpat);
	
	bpms = new p5.Part();
	bpms.addPhrase(bpmprs);
	bpms.setBPM('80');
	$("#bpmbar").on('input',function(){
		bpmCtrl = $(this).val();
		bpms.setBPM(bpmCtrl);
		$("#bpmnum").text(bpmCtrl);
	})
}
$(function(){
	$("#bpmplay").click(function(){
		var txt = $("#bpmplay").text();
		if(txt=='test'){
			$("#bpmplay").text('stop');
			btnc++;
			loadbpm();
		}else{
			$("#bpmplay").text('test');
			btnc=0;
			loaded2();
		}
	})
})
function loadbpm(){
	bpmsong.play();
	bpms.loop();
}
function loaded2(){
	bpms.stop();
}
$(function(){
	$("#resettemp").click(function(){
		var answer = confirm("Everything you've done so far will disappear. Are you sure you want to reset?")
		if(answer){
			$.ajax({
				method : 'post'
				,url : 'deltemp'
				,success : gettemp
			})
		}
	})
	$("#bpmbar").change(function(){
		var data = {'temp_title' : $("#title").text()
				,'temp_bpm' : $("#bpmnum").text()}
		$.ajax({
			method : 'post'
			,url : 'updatetemp'
			,data : data
			,success : gettemp
		})
	})
})
function gettemp(){
	$.ajax({
		method : 'get'
		,url : 'gettemp'
		,success : function(resp){
				if(resp==''||resp==null||resp.cust_number=='undefined'){
					var newname = '<input type="text" id="mustitle"><button id="titlebtn">save</button>';
					$("#title").html(newname);
					$("#bpmbar").val(80);
					bpms.setBPM(80);
					$("#titlebtn").click(function(){
						var data = {'temp_title' : $("#mustitle").val()
								,'temp_bpm' : $("#bpmnum").text()}
						$.ajax({
							method : 'post'
							,url : 'inserttemp'
							,data : data
							,success : gettemp
						})
					})
				}else{
					var newname = resp.temp_title+'<img id="editname" src="resources/images/sound/sledit.png">'
					$("#title").html(newname);
					$("#bpmnum").text(resp.temp_bpm);
					$("#bpmbar").val(resp.temp_bpm);

					$("#editname").click(function(){
						var editname = '<input type="text" id="mustitle"><button id="titleedit">save</button>';
						$("#title").html(editname);
						$("#titleedit").click(function(){
							var data = {'temp_title' : $("#mustitle").val()
									,'temp_bpm' : $("#bpmnum").text()}
							$.ajax({
								method : 'post'
								,url : 'updatetemp'
								,data : data
								,success : gettemp
							})
						})
					})
				}
			}
	})
}
function addpart(partnums){
	var divs = '<div class="part" id="part'+partnums+'">'
	divs+= '<div class="phrase1"></div>'
	divs+= '<div class="phrase2"></div>'
	divs+= '<div class="phrase3">No Phrase</div>'
	divs+= '<div class="phrase4"></div>'
	divs+= '<div class="partbtn"><button class="delpart" value="'+partnums+'">X</button><button class="gotomake" value="'+partnums+'">Make Music</button>'
	divs+= '<button class="playpart" value="'+partnums+'">▷</button></div>'
	divs+= '</div>'
$("#parts").append(divs);
var ids = "#part"+partnums;

$(".delpart").on('click',function(){
	alert($(this).val());
	var delid = "#part"+$(this).val();
	$(delid).remove();
})

$(".playpart").on('click',function(){
	if($(this).val()==1){s1.play();}
})

$(".gotomake").click(function(){
	$.ajax({
		type : 'get'
		,url : 'saveinfo'
		,data : {'part_num':$(this).val(),'temp_bpm':$("#bpmnum").text()}
		,success : function(resp){
				location.href='partmake'
			}
	})
})
}
$(function(){
	$("#addpart").click(function(){
		partnum++;
		addpart(partnum);
	})
})
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
		<div id="addpart" class="button_base btn_3d_double_roll">
			<div>Add Part</div>
			<div>Add Part</div>
			<div>Add Part</div>
			<div>Add Part</div>
		</div>
		<div id="resettemp" class="button_base btn_3d_double_roll">
			<div>Reset</div>
			<div>Reset</div>
			<div>Reset</div>
			<div>Reset</div>
		</div>
		<div id="savemusic" class="button_base btn_3d_double_roll">
			<div>Save Music</div>
			<div>Save Music</div>
			<div>Save Music</div>
			<div>Save Music</div>
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
	<div id="musinfo">
	Music Title : <span id="title"></span>&emsp;/&emsp;
	BPM : <span id="bpmnum">80</span>&emsp;<input id="bpmbar" type="range" value="80" min="30" max="200">&nbsp;<button id="bpmplay">test</button>
	</div>
<div id="parts">
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