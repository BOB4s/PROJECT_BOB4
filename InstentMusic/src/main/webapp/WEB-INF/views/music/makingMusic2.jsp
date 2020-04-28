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
<link rel="stylesheet" href="resources/css/background_left_right.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script>
var song, path, stt, mastersong, master;
var partnum = 0;
var paths =[];
var bpmpat, bpmsong, bpms, bpmprs, bpmCrtl;
$(function() {
	$("#slib").click(function(){
		location.href="makingMusic";
	})
	gettemp();
	$("#makingstart").click(function(){
		userStartAudio();
		stt.play();
		getall();
	})
})
function gettemp(){
	$.ajax({
		method : 'get'
		,url : 'gettemp'
		,success : function(resp){
				if(resp==''||resp==null||resp.cust_number=='undefined'){
					var newname = '<input type="text" id="mustitle"><button id="titlebtn" class="w3-btn w3-grey w3-round">save</button>';
					$("#title").html(newname);
					$("#bpmbar").val(80);
					bpms.setBPM('80');
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
					master = resp.fullPath;
					var newname = resp.temp_title+'<img id="editname" src="resources/images/sound/sledit.png">'
					$("#title").html(newname);
					$("#bpmnum").text(resp.temp_bpm);
					$("#bpmbar").val(resp.temp_bpm);
					bpms.setBPM(resp.temp_bpm);
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
				setup();
			}
	})
}
function getall(){
	userStartAudio();
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
					setup();
				}
			}
	})
	var addment = '<div id="parta"><button id="addpart" class="part">+</button></div>'
	$("#parts").html('');
	$("#parts").append(addment);

	$("#addpart").click(function(){
		partnum++;
		addpart(partnum);
	})
}
var s1,s2,s3,s4,s5,s6;
var recorder, soundFile, soundBlob;
var masterGain;
function preload(){
	stt = loadSound("resources/sound/beatbox/bb17.mp3");
}
function setup(){
	userStartAudio();
	
	bpmsong = loadSound('resources/sound/drum/drum7.wav');
	mastersong = loadSound(master);
	bpmpat = [1, 1, 1, 1];
	bpmprs = new p5.Phrase('bpmsong',(time) => {
		bpmsong.play(time);
	}, bpmpat);
	
	bpms = new p5.Part();
	bpms.addPhrase(bpmprs);
	$("#bpmbar").on('input',function(){
		bpms.loop();
		bpmCtrl = $(this).val();
		bpms.setBPM(bpmCtrl);
		$("#bpmnum").text(bpmCtrl);
	})
	masterGain = new p5.Gain();
	masterGain.connect(); 
	var p1 = new p5.Gain(); var p2 = new p5.Gain();var p3 = new p5.Gain();
	$.each(paths,function(index,item){
		if(item.phrase_number==5){
		if(item.part_number==1){s1 = loadSound(item.phrase_saved);p1.setInput(s1);p1.connect(masterGain);}
		if(item.part_number==2){s2 = loadSound(item.phrase_saved);p2.setInput(s2);p2.connect(masterGain);}
		if(item.part_number==3){s3 = loadSound(item.phrase_saved);p3.setInput(s3);p3.connect(masterGain);}
		} 
	})
	recorder = new p5.SoundRecorder();
	recorder.setInput(masterGain);
	soundFile = new p5.SoundFile();
}
$(function(){
	userStartAudio();
	$("#playall").on('click',function(){
		mastersong.play();
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
		bpms.setBPM($("#bpmnum").text());
		bpms.stop();
	})
	$("#savemusic").click(function(){
	$.ajax({
		type : 'post'
		,url : 'savemusic'
		,success : function(resp){
				alert("Save Complete!");
				location.href = "musiclist";
			}
	})
})
})
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
$("#parta").before(divs);
var ids = "#part"+partnums;

$(".delpart").on('click',function(){
	alert($(this).val());
	var delid = "#part"+$(this).val();
	$(delid).remove();
})

$(".playpart").click(function(){
	userStartAudio();
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
$("#mixing").click(function(){
		userStartAudio();
		if(paths==null){
			alert('please recording phrases!');
			return;
		}
		if($("#mixing").val()=='mixing'){
			state=0;
			recordstart();
		}else{
			state=2;
			recordstart();
			$("#mixing").val('mixing');
			$("#mixing").text('Mixing Music');
		}
	})
}
function recordstart(){
	userStartAudio();
    if(state===0){
    	recorder.record(soundFile);
    	s1.play();
		s1.onended(function(){s2.play();});
		s2.onended(function(){s3.play();});
		s3.onended(function(){state=1;recordstart();});
    }else if(state===1){
      recorder.stop();
      $("#mixing").val('play');
		$("#mixing").text('Play Mixed');
    }else if(state===2){
	  soundFile.play();
	  soundFile.onended(function(){
			soundBlob = soundFile.getBlob();
			  sendfile();
			})
    }
}
function sendfile(){
	   var formData = new FormData();
	 
	   formData.append("file", soundBlob);

	   $.ajax({
	    type: "post",
 		 url: "uploadtemp",
  		data: formData,
  		processData: false,
  		contentType: false,
		success : function(resp){
				soundFile = new p5.SoundFile();
				alert("Mixing Complete!");
				location.reload();
			}
	   })
}
</script>
<style>
/* body{
margin : 10px 10px 10px 10px;
} */
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
	margin-left: 16%;
	margin-right: 8%;
	margin-top: 0;
	margin-bottom: 0;
	width:1050px;
}
.part{
	margin : 10px 10px 10px 42px;
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
#makingstart{
	color : red;
	position : absolute;
	left : 35%;
	top : 50%;
	font-size : 30px;
	background-color : #FFFFFF;
	border: 0px;
}
#addpart{
	background-color : #FFFFFF;
	width : 200px;
	height : 150px;
	border: 0px;
	color : skyblue;
	font-size : 70px;
}
</style>
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
	BPM : <span id="bpmnum">80</span>&emsp;<input id="bpmbar" type="range" value="80" min="30" max="200">&emsp;/&emsp;
	<button id="mixing" value="mixing" class="w3-btn w3-grey w3-round">Mixing Music</button>&emsp;/&emsp;
	<button id="playall" value="play" class="w3-btn w3-grey w3-round">Music Play</button>
	</div>
<div id="parts">
<button id="makingstart">Click here to start making music!</button>
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