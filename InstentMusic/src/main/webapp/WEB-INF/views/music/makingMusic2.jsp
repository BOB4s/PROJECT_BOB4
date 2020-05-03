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
					getphs();
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
var s1,s2,s3,s4,s5,s6,s7,s8;
var h1,h2,h3,h4,h5,h6,h7,h8,h9,h10,h11,h12,h13,h14,h15,h16;
var h17,h18,h19,h20,h21,h22,h23,h24,h25,h26,h27,h28,h29,h30,h31,h32;
var recorder, soundFile, soundBlob;
var masterGain;
function setup(){
	masterGain = new p5.Gain();
	userStartAudio();
	stt = loadSound("resources/sound/beatbox/bb17.mp3");
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
	masterGain.connect(); 
	var pp1 = new p5.Gain(); var pp2 = new p5.Gain();var pp3 = new p5.Gain();
	var pp4 = new p5.Gain(); var pp5 = new p5.Gain();var pp6 = new p5.Gain();
	var pp7 = new p5.Gain(); var pp8 = new p5.Gain();
	$.each(paths,function(index,item){
		if(item.phrase_number==5){
		if(item.part_number==1){s1 = loadSound(item.phrase_saved);pp1.setInput(s1);pp1.connect(masterGain);}
		if(item.part_number==2){s2 = loadSound(item.phrase_saved);pp2.setInput(s2);pp2.connect(masterGain);}
		if(item.part_number==3){s3 = loadSound(item.phrase_saved);pp3.setInput(s3);pp3.connect(masterGain);}
		if(item.part_number==4){s4 = loadSound(item.phrase_saved);pp4.setInput(s4);pp4.connect(masterGain);}
		if(item.part_number==5){s5 = loadSound(item.phrase_saved);pp5.setInput(s5);pp5.connect(masterGain);}
		if(item.part_number==6){s6 = loadSound(item.phrase_saved);pp6.setInput(s6);pp6.connect(masterGain);}
		if(item.part_number==7){s7 = loadSound(item.phrase_saved);pp7.setInput(s7);pp7.connect(masterGain);}
		if(item.part_number==8){s8 = loadSound(item.phrase_saved);pp8.setInput(s8);pp8.connect(masterGain);}
		} else{
			if(item.part_number==1&&item.phrase_number==1){h1 = loadSound(item.phrase_saved);}
			if(item.part_number==1&&item.phrase_number==2){h2 = loadSound(item.phrase_saved);}
			if(item.part_number==1&&item.phrase_number==3){h3 = loadSound(item.phrase_saved);}
			if(item.part_number==1&&item.phrase_number==4){h4 = loadSound(item.phrase_saved);}
			if(item.part_number==2&&item.phrase_number==1){h5 = loadSound(item.phrase_saved);}
			if(item.part_number==2&&item.phrase_number==2){h6 = loadSound(item.phrase_saved);}
			if(item.part_number==2&&item.phrase_number==3){h7 = loadSound(item.phrase_saved);}
			if(item.part_number==2&&item.phrase_number==4){h8 = loadSound(item.phrase_saved);}
			if(item.part_number==3&&item.phrase_number==1){h9 = loadSound(item.phrase_saved);}
			if(item.part_number==3&&item.phrase_number==2){h10 = loadSound(item.phrase_saved);}
			if(item.part_number==3&&item.phrase_number==3){h11 = loadSound(item.phrase_saved);}
			if(item.part_number==3&&item.phrase_number==4){h12 = loadSound(item.phrase_saved);}
			if(item.part_number==4&&item.phrase_number==1){h13 = loadSound(item.phrase_saved);}
			if(item.part_number==4&&item.phrase_number==2){h14 = loadSound(item.phrase_saved);}
			if(item.part_number==4&&item.phrase_number==3){h15 = loadSound(item.phrase_saved);}
			if(item.part_number==4&&item.phrase_number==4){h16 = loadSound(item.phrase_saved);}
			if(item.part_number==5&&item.phrase_number==1){h17 = loadSound(item.phrase_saved);}
			if(item.part_number==5&&item.phrase_number==2){h18 = loadSound(item.phrase_saved);}
			if(item.part_number==5&&item.phrase_number==3){h19 = loadSound(item.phrase_saved);}
			if(item.part_number==5&&item.phrase_number==4){h20 = loadSound(item.phrase_saved);}
			if(item.part_number==6&&item.phrase_number==1){h21 = loadSound(item.phrase_saved);}
			if(item.part_number==6&&item.phrase_number==2){h22 = loadSound(item.phrase_saved);}
			if(item.part_number==6&&item.phrase_number==3){h23 = loadSound(item.phrase_saved);}
			if(item.part_number==6&&item.phrase_number==4){h24 = loadSound(item.phrase_saved);}
			if(item.part_number==7&&item.phrase_number==1){h25 = loadSound(item.phrase_saved);}
			if(item.part_number==7&&item.phrase_number==2){h26 = loadSound(item.phrase_saved);}
			if(item.part_number==7&&item.phrase_number==3){h27 = loadSound(item.phrase_saved);}
			if(item.part_number==7&&item.phrase_number==4){h28 = loadSound(item.phrase_saved);}
			if(item.part_number==8&&item.phrase_number==1){h29 = loadSound(item.phrase_saved);}
			if(item.part_number==8&&item.phrase_number==2){h30 = loadSound(item.phrase_saved);}
			if(item.part_number==8&&item.phrase_number==3){h31 = loadSound(item.phrase_saved);}
			if(item.part_number==8&&item.phrase_number==4){h32 = loadSound(item.phrase_saved);}
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
	divs+= '<div class="phrase1" id="'+partnums+'-1" ondragleave="leavedrag(event)" ondrop="drop(event)" ondragover="allowDrop(event)"></div>'
	divs+= '<div class="phrase2" id="'+partnums+'-2" ondragleave="leavedrag(event)" ondrop="drop(event)" ondragover="allowDrop(event)"></div>'
	divs+= '<div class="phrase3" id="'+partnums+'-3" ondragleave="leavedrag(event)" ondrop="drop(event)" ondragover="allowDrop(event)"></div>'
	divs+= '<div class="phrase4" id="'+partnums+'-4" ondragleave="leavedrag(event)" ondrop="drop(event)" ondragover="allowDrop(event)"></div>'
	divs+= '<div class="partbtn"><button class="delpart" value="'+partnums+'">X</button><button class="gotomake" value="'+partnums+'">Make Music</button>'
	divs+= '<button class="playpart" value="'+partnums+'">▷</button></div>'
	divs+= '</div>'
	$("#parta").before(divs);
	var ids = "#part"+partnums;
	
	$(".delpart").on('click',function(){
		var delid = "#part"+$(this).val();
		$(delid).remove();
	})
	
	$(".playpart").click(function(){
		userStartAudio();
		if($(this).val()==1){s1.play();}if($(this).val()==2){s2.play();}
		if($(this).val()==3){s3.play();}if($(this).val()==4){s4.play();}
		if($(this).val()==5){s5.play();}if($(this).val()==6){s6.play();}
		if($(this).val()==7){s7.play();}if($(this).val()==8){s8.play();}
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
function getphs(){
	$.each(paths,function(index, item){
		var ids = '#part'+item.part_number+' .phrase'+item.phrase_number;
		var idx = item.part_number+'-'+item.phrase_number;
		var sav = item.phrase_saved;
		var sav2 = sav.substr(21,sav.length);
		var vals = item.key_board+sav2;
		var data = '<button class="ps" ondragstart="drag(event)" draggable="true" id="'+idx+'" value="'+vals+'">Phrase'+item.phrase_number+'</button>';
		$(ids).html(data);
	})

	$('.ps').click(function(){
		var ids = $(this).attr('id');
		if(ids=="1-1"){h1.play();}if(ids=="1-2"){h2.play();}if(ids=="1-3"){h3.play();}
		if(ids=="1-4"){h4.play();}if(ids=="2-1"){h5.play();}if(ids=="2-2"){h6.play();}
		if(ids=="2-3"){h7.play();}if(ids=="2-4"){h8.play();}if(ids=="3-1"){h9.play();}
		if(ids=="3-2"){h10.play();}if(ids=="3-3"){h11.play();}if(ids=="3-4"){h12.play();}
		if(ids=="4-1"){h13.play();}if(ids=="4-2"){h14.play();}if(ids=="4-3"){h15.play();}
		if(ids=="4-4"){h16.play();}if(ids=="5-1"){h17.play();}if(ids=="5-2"){h18.play();}
		if(ids=="5-3"){h19.play();}if(ids=="5-4"){h20.play();}if(ids=="6-1"){h21.play();}
		if(ids=="6-2"){h22.play();}if(ids=="6-3"){h23.play();}if(ids=="6-4"){h24.play();}
		if(ids=="7-1"){h25.play();}if(ids=="7-2"){h26.play();}if(ids=="7-3"){h27.play();}
		if(ids=="7-4"){h28.play();}if(ids=="8-1"){h39.play();}if(ids=="8-2"){h30.play();}
		if(ids=="8-3"){h31.play();}if(ids=="8-4"){h32.play();}
	})
}
function recordstart(){
	userStartAudio();
    if(state===0){
    	recorder.record(soundFile);
    	s1.play();
		s1.onended(function(){if(partnum==1){state=1;recordstart();}else{s2.play();}});
		s2.onended(function(){if(partnum==2){state=1;recordstart();}else{s3.play();}});
		s3.onended(function(){if(partnum==3){state=1;recordstart();}else{s4.play();}});
		s4.onended(function(){if(partnum==4){state=1;recordstart();}else{s5.play();}});
		s5.onended(function(){if(partnum==5){state=1;recordstart();}else{s6.play();}});
		s6.onended(function(){if(partnum==6){state=1;recordstart();}else{s7.play();}});
		s7.onended(function(){if(partnum==7){state=1;recordstart();}else{s8.play();}});
		s8.onended(function(){state=1;recordstart();});
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
function drag(ev) { 
	ev.dataTransfer.setData("ids", ev.target.id);
	ev.dataTransfer.setData("vals", ev.target.value);
}
function drop(ev) {
	ev.preventDefault(); 
	var tagid = '#'+ev.target.id;
	$(tagid).css('background-color','white');
	var ids = ev.dataTransfer.getData("ids");
	var vals = ev.dataTransfer.getData("vals");
	var ph = tagid.substr(3,3);
	var pt = tagid.substr(1,1);
	var keys = vals.substr(0,16);
	var sav = vals.substr(16,vals.length);
	var data = '<button class="ps" ondragstart="drag(event)" draggable="true" id="'+ids+'" value="'+vals+'">Phrase'+ph+'</button>';
	$(tagid).html(data);

	var loops = {'part_number' : pt
				,'phrase_number' : ph
				,'key_board' : keys
				,'phrase_saved' : sav}

	$.ajax({
		type : 'post'
		,url : 'insertloop'
		,data : loops
		,success : function(resp){
				getall();
			}
	})
}
function allowDrop(ev){
	ev.preventDefault();
	var tagid = '#'+ev.target.id;
	$(tagid).css('background-color','yellow');
}
function leavedrag(ev){
	var tagid = '#'+ev.target.id;
	$(tagid).css('background-color','white');
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
	margin-top: 5px;
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
.partbtn{
	width : 200px;
	height : 30px;
	text-align: center;
	border : 1px solid black;
}
.phrase1, .phrase2, .phrase3, .phrase4{
	width : 200px;
	height : 30px;
	text-align: center;
	border : 1px solid black;
}
.gotomake{
	float : left;
	height : 27px;
	width : 140px;
	background-color: #8181F7;
	border : 0px;
	color : white;
	font-weight : bold;
}
.delpart{
	float : left;
	height : 27px;
	width : 29px;
	background-color: red;
	border : 0px;
	color : white;
	font-weight: bold;
}
.playpart{
	float : left;
	height : 27px;
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
.ps{
	border : 0px;
	background-color : #FFFFFF;
	width : 195px;
	height : 28px;
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
	
	<div id="backgroundLeft">
		<img alt="BL" src="resources/images/makingMusic/backgroundLeft2.png">
	</div>
	<div id="backgroundRight">
		<img alt="BR" src="resources/images/makingMusic/backgroundRight2.png">
	</div>
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