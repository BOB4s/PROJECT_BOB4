<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" buffer="4096kb" autoFlush="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MusicMake</title>
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
body{
margin : 10px 10px 10px 10px;
}
#musinfo{
	text-align: center;
	margin : 0 auto;
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
#editname{
	width: 25px;
	height: 25px;
	cursor: pointer;
	margin-bottom: 10px;
}
#addment{
	color : red;
	position : absolute;
	left : 600px;
	top : 400px;
	font-size : 30px;
}
</style>
<script>
var song, path;
var partnum = 0;
var paths =[];
$(function() {
	$("#slib").click(function(){
		location.href="makingMusic";
	})
	gettemp();
	getall();
})
function getall(){
	var addment = '<span id="addment">Please add some Parts</span>'
	$("#parts").html(addment);
	partnum = 0;
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
	
	bpmsong = loadSound('resources/sound/drum/drum7.wav');
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

	recorder = new p5.SoundRecorder();
	recorder.setInput(masterGain);
	soundFile = new p5.SoundFile();
}
$(function(){
	userStartAudio();
	$("#bpmplay").on('click',function(){
		var txt = $("#bpmplay").text();
		if(txt=='test'){
			$("#bpmplay").text('stop');
			bpms.loop();
		}else{
			$("#bpmplay").text('test');
			bpms.stop();
		}
	})
})
$(function(){
	$("#resettemp").click(function(){
		var answer = confirm("Everything you've done so far will disappear. Are you sure you want to reset?")
		if(answer){
			$.ajax({
				method : 'post'
				,url : 'deltemp'
				,success : function(resp){
						gettemp();
						getall();
					}
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
					$("#titlebtn").on('click',function(){
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
	userStartAudio();
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
	if($(this).val()==2){s2.play();}
	if($(this).val()==3){s3.play();}
	if($(this).val()==4){s4.play();}
	if($(this).val()==5){s5.play();}
	if($(this).val()==6){s6.play();}
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