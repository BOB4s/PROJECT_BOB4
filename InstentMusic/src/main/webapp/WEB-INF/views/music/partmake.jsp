<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" buffer="4096kb" autoFlush="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MusicMake</title>
<script src="resources/js/jquery-3.4.1.min.js"></script>
<script src="resources/js/jquery-ui.min.js"></script>
<script src="resources/js/p5.min.js"></script>
<script src="resources/js/p5.sound.min.js"></script>
<script src="resources/js/sketch.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/navigation.css">
<link rel="stylesheet" href="resources/css/sideMenuBar.css">
<link rel="stylesheet" href="resources/css/3d_double_roll_btn.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<style>
html{
	margin-left: 2%;
}
body{
margin : 10px 10px 10px 10px;
overflow-y: hidden;
}
#keyboard{
	margin-left: 40px;
	margin-top : 0;
	margin-top : 10px;
	padding: 5px 5px 5px 5px;
	width: 1120px;
	height: 220px;
	border: 1px solid black;
}

.libs{
	float:left;
	margin-top:10px;
	width: 200px;
	height: 100px;
	white-space: nowrap;
	overflow-x: hidden;
	text-align: center;
}

.libs button {
	height: 25px;
	width:150px;
	background-color: #FFFFFF;
	color: black;
	font-size: 15px;
	border: 0px;
	margin-bottom: 2px;
	padding-top: 2px;
}
.del{
	width : 10px;
	height : 10px;
	font-weight: bold;
	cursor: pointer;
	border: 0;
	background: red;
	color: #FFFFFF;
	border-radius: 100%;
	padding: 0;
	font-size: 5px;
}
.delreset{
	position: absolute;
	bottom: 2px;
	left: 2px;
	font-size: 8px;
}
.fronts{
float:left;
width: 350px;
height: 120px;
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
	margin-top: 10px;
}
#phrase1, #phrase2, #phrase3, #phrase4{
	float: left;
	height : 50px;
	width : 1000px;
	margin : 5px 5px 5px 5px;
}
#p2, #p3, #p4{
	position: relative;
	float : left;
	height : 50px;
	width : 150px;
	border: 1px solid black;
	margin : 5px 5px 5px 40px;
	font-size : 8px;
	padding-top: 10px;
	padding-right: 0px;
	padding-bottom: 5px;
	padding-left: 5px;
}
.pnames{
	font-size : 15px;
}
#p1{
	position: relative;
	float : left;
	height : 50px;
	width : 150px;
	border: 1px solid black;
	margin : 11px 5px 5px 40px;
	font-size : 8px;
	padding-top: 10px;
	padding-right: 0px;
	padding-bottom: 5px;
	padding-left: 5px;
}
#phrases{
	margin : 0 auto;
}
.phrase1, .phrase2, .phrase3, .phrase4{
	height : 50px;
	border: 1px solid black;
	width : 60px;
	float : left;
	text-align: center;
	color : red;
	padding-top: 10px;
}
.rcdmusic{
	fload : right;
	height : 30px;
	width : 30px;
	cursor : pointer;
	margin-left: 10px;
}
.rcdplay{
	fload : right;
	height : 30px;
	width : 30px;
	cursor : pointer;
	margin-left: 10px;
}
.keyp{
	width : 30px;
	height : 30px;
}
#KB{
	font-style: italic;
	font-family: "Times New Roman", Times, serif;
}
</style>
<script>
var list = [];
var path1 = 'resources/sound/drum/drum0.wav';
var path2 = 'resources/sound/drum/drum1.wav';
var path3 = 'resources/sound/drum/drum2.wav';
var path4 = 'resources/sound/drum/drum3.wav';
var saves = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
$(function(){
	for(var k=1; k<5; k++){
		var idx = "#Set"+k;
		$(idx).click(function(){
			getkeys("#"+this.value);
		})
	}
})
function getkeys(sets){
	list = [];
	$("#newset").text(sets);
	$('.keysou').text('');
	$('.keys').css('border','1px solid black');
	$('.keys').css('background-color','white');
	$('.keydel').text('');
	$.ajax({
		method : 'get'
		,url : 'getkeys'
		,data : {'key_board' : sets}
		,success : function(resp){
				$.each(resp,function(index,item){
					var datas = {'keyname':item.key_name,'soupath':item.sou_path};
					list.push(datas);
					var idx = "#"+item.key_name;
					var cls = idx+' .keysou';
					var dels = idx+' .keydel';
					$(cls).text(item.sou_name);
					$(document).keydown(function(event){
						if(event.keyCode == item.key_name && $("#newset").text()==item.key_board){
							$(idx).css('background-color', 'red');
						}else{
							$(idx).css('background-color','white');
						}
					})
					$(idx).css('border','1px solid blue');
				})
					$("#newment").text('Press the keys!');
				setup();
			}
	})
}
var mic, recorder, soundFile, soundBlob;
var amp, bpmsong, bpms, bpmprs, bpmCrtl;
var p1pat, p2pat, p3pat, p4pat, bpmpat;
var p1song, p2song, p3song, p4song;
var phrase1, phrase2, phrase3, phrase4, parts;
var masterGain;
var state = 0;
var s48, s49, s50, s51, s52, s53, s54, s55, s56, s57;
var s65, s66, s67, s68, s69, s70, s71, s72, s73, s74, s75, s76, s77, s78, s79;
var s80, s81, s82, s83, s84, s85, s86, s87, s88, s89, s90;
var s186, s187, s188, s189, s190, s219;
function setup() {
	userStartAudio();
	masterGain = new p5.Gain();
	masterGain.connect();
	var g48 = new p5.Gain();var g49 = new p5.Gain();var g50 = new p5.Gain();
	var g51 = new p5.Gain();var g52 = new p5.Gain();var g53 = new p5.Gain();
	var g54 = new p5.Gain();var g55 = new p5.Gain();var g56 = new p5.Gain();
	var g57 = new p5.Gain();var g65 = new p5.Gain();var g66 = new p5.Gain();
	var g67 = new p5.Gain();var g68 = new p5.Gain();var g69 = new p5.Gain();
	var g70 = new p5.Gain();var g71 = new p5.Gain();var g72 = new p5.Gain();
	var g73 = new p5.Gain();var g74 = new p5.Gain();var g75 = new p5.Gain();
	var g76 = new p5.Gain();var g77 = new p5.Gain();var g78 = new p5.Gain();
	var g79 = new p5.Gain();var g80 = new p5.Gain();var g81 = new p5.Gain();
	var g82 = new p5.Gain();var g83 = new p5.Gain();var g84 = new p5.Gain();
	var g85 = new p5.Gain();var g86 = new p5.Gain();var g87 = new p5.Gain();
	var g88 = new p5.Gain();var g89 = new p5.Gain();var g90 = new p5.Gain();
	var g186 = new p5.Gain();var g187 = new p5.Gain();var g188 = new p5.Gain();
	var g189 = new p5.Gain();var g190 = new p5.Gain();var g219 = new p5.Gain();
	
	$.each(list,function(index,item){
		if(item.keyname==48){s48 = loadSound(item.soupath);g48.setInput(s48);
		}else if(item.keyname==49){s49 = loadSound(item.soupath);g49.setInput(s49);
		}else if(item.keyname==50){s50 = loadSound(item.soupath);g50.setInput(s50);
		}else if(item.keyname==51){s51 = loadSound(item.soupath);g51.setInput(s51);
		}else if(item.keyname==52){s52 = loadSound(item.soupath);g52.setInput(s52);
		}else if(item.keyname==53){s53 = loadSound(item.soupath);g53.setInput(s53);
		}else if(item.keyname==54){s54 = loadSound(item.soupath);g54.setInput(s54);
		}else if(item.keyname==55){s55 = loadSound(item.soupath);g55.setInput(s55);
		}else if(item.keyname==56){s56 = loadSound(item.soupath);g56.setInput(s56);
		}else if(item.keyname==57){s57 = loadSound(item.soupath);g57.setInput(s57);
		}else if(item.keyname==65){s65 = loadSound(item.soupath);g65.setInput(s65);
		}else if(item.keyname==66){s66 = loadSound(item.soupath);g66.setInput(s66);
		}else if(item.keyname==67){s67 = loadSound(item.soupath);g67.setInput(s67);
		}else if(item.keyname==68){s68 = loadSound(item.soupath);g68.setInput(s68);
		}else if(item.keyname==69){s69 = loadSound(item.soupath);g69.setInput(s69);
		}else if(item.keyname==70){s70 = loadSound(item.soupath);g70.setInput(s70);
		}else if(item.keyname==71){s71 = loadSound(item.soupath);g71.setInput(s71);
		}else if(item.keyname==72){s72 = loadSound(item.soupath);g72.setInput(s72);
		}else if(item.keyname==73){s73 = loadSound(item.soupath);g73.setInput(s73);
		}else if(item.keyname==74){s74 = loadSound(item.soupath);g74.setInput(s74);
		}else if(item.keyname==75){s75 = loadSound(item.soupath);g75.setInput(s75);
		}else if(item.keyname==76){s76 = loadSound(item.soupath);g76.setInput(s76);
		}else if(item.keyname==77){s77 = loadSound(item.soupath);g77.setInput(s77);
		}else if(item.keyname==78){s78 = loadSound(item.soupath);g78.setInput(s78);
		}else if(item.keyname==79){s79 = loadSound(item.soupath);g79.setInput(s79);
		}else if(item.keyname==80){s80 = loadSound(item.soupath);g80.setInput(s80);
		}else if(item.keyname==81){s81 = loadSound(item.soupath);g81.setInput(s81);
		}else if(item.keyname==82){s82 = loadSound(item.soupath);g82.setInput(s82);
		}else if(item.keyname==83){s83 = loadSound(item.soupath);g83.setInput(s83);
		}else if(item.keyname==84){s84 = loadSound(item.soupath);g84.setInput(s84);
		}else if(item.keyname==85){s85 = loadSound(item.soupath);g85.setInput(s85);
		}else if(item.keyname==86){s86 = loadSound(item.soupath);g86.setInput(s86);
		}else if(item.keyname==87){s87 = loadSound(item.soupath);g87.setInput(s87);
		}else if(item.keyname==88){s88 = loadSound(item.soupath);g88.setInput(s88);
		}else if(item.keyname==89){s89 = loadSound(item.soupath);g89.setInput(s89);
		}else if(item.keyname==90){s90 = loadSound(item.soupath);g90.setInput(s90);
		}else if(item.keyname==186){s186 = loadSound(item.soupath);g186.setInput(s186);
		}else if(item.keyname==187){s187 = loadSound(item.soupath);g187.setInput(s187);
		}else if(item.keyname==188){s188 = loadSound(item.soupath);g188.setInput(s188);
		}else if(item.keyname==189){s189 = loadSound(item.soupath);g189.setInput(s189);
		}else if(item.keyname==190){s190 = loadSound(item.soupath);g190.setInput(s190);
		}else if(item.keyname==219){s219 = loadSound(item.soupath);g219.setInput(s219);
		}
	})
	$(document).keydown(function(event){
		if(event.keyCode == 48){s48.play();}if(event.keyCode == 49){s49.play();}
		if(event.keyCode == 50){s50.play();}if(event.keyCode == 51){s51.play();}
		if(event.keyCode == 52){s52.play();}if(event.keyCode == 53){s53.play();}
		if(event.keyCode == 54){s54.play();}if(event.keyCode == 55){s55.play();}
		if(event.keyCode == 56){s56.play();}if(event.keyCode == 57){s57.play();}
		if(event.keyCode == 65){s65.play();}if(event.keyCode == 66){s66.play();}
		if(event.keyCode == 67){s67.play();}if(event.keyCode == 68){s68.play();}
		if(event.keyCode == 69){s69.play();}if(event.keyCode == 70){s70.play();}
		if(event.keyCode == 71){s71.play();}if(event.keyCode == 72){s72.play();}
		if(event.keyCode == 73){s73.play();}if(event.keyCode == 74){s74.play();}
		if(event.keyCode == 75){s75.play();}if(event.keyCode == 76){s76.play();}
		if(event.keyCode == 77){s77.play();}if(event.keyCode == 78){s78.play();}
		if(event.keyCode == 79){s79.play();}if(event.keyCode == 80){s80.play();}
		if(event.keyCode == 81){s81.play();}if(event.keyCode == 82){s82.play();}
		if(event.keyCode == 83){s83.play();}if(event.keyCode == 84){s84.play();}
		if(event.keyCode == 85){s85.play();}if(event.keyCode == 86){s86.play();}
		if(event.keyCode == 87){s87.play();}if(event.keyCode == 88){s88.play();}
		if(event.keyCode == 89){s89.play();}if(event.keyCode == 90){s90.play();}
		if(event.keyCode == 186){s186.play();}if(event.keyCode == 187){s187.play();}
		if(event.keyCode == 188){s188.play();}if(event.keyCode == 189){s189.play();}
		if(event.keyCode == 190){s190.play();}if(event.keyCode == 219){s219.play();}
	})
	g48.connect(masterGain);g49.connect(masterGain);g50.connect(masterGain);
	g51.connect(masterGain);g52.connect(masterGain);g53.connect(masterGain);
	g54.connect(masterGain);g55.connect(masterGain);g56.connect(masterGain);
	g57.connect(masterGain);g65.connect(masterGain);g66.connect(masterGain);
	g67.connect(masterGain);g68.connect(masterGain);g69.connect(masterGain);
	g70.connect(masterGain);g71.connect(masterGain);g72.connect(masterGain);
	g73.connect(masterGain);g74.connect(masterGain);g75.connect(masterGain);
	g76.connect(masterGain);g77.connect(masterGain);g78.connect(masterGain);
	g79.connect(masterGain);g80.connect(masterGain);g81.connect(masterGain);
	g82.connect(masterGain);g83.connect(masterGain);g84.connect(masterGain);
	g85.connect(masterGain);g86.connect(masterGain);g87.connect(masterGain);
	g88.connect(masterGain);g89.connect(masterGain);g90.connect(masterGain);
	g186.connect(masterGain);g187.connect(masterGain);g188.connect(masterGain);
	g189.connect(masterGain);g190.connect(masterGain);g219.connect(masterGain);
	
	p1song = loadSound(path1,() => {});
	p2song = loadSound(path2,() => {});
	p3song = loadSound(path3,() => {});
	p4song = loadSound(path4,() => {});

	p1pat = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
	p2pat = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
	p3pat = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
	p4pat = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
	bpmpat = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17];
	bpmpat2 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16];

	phrase1 = new p5.Phrase('p1song',playp1, p1pat);
	phrase2 = new p5.Phrase('p2song',playp2, p2pat);
	phrase3 = new p5.Phrase('p3song',playp3, p3pat);
	phrase4 = new p5.Phrase('p4song',playp4, p4pat);

	parts = new p5.Part();
	parts.addPhrase(phrase1);
	parts.addPhrase(phrase2);
	parts.addPhrase(phrase3);
	parts.addPhrase(phrase4);
	parts.addPhrase('seq',sequence,bpmpat);

	bpms = new p5.Part();
	bpms.addPhrase('seq',sequence,bpmpat2);

	p1 = new p5.Part();p2 = new p5.Part();p3 = new p5.Part();p4 = new p5.Part();

	p1.setBPM(${temp_bpm});
	p1.addPhrase(phrase1);
	p1.addPhrase('seq',rcdcss,bpmpat);
	
	p2.setBPM(${temp_bpm});
	p2.addPhrase(phrase2);
	p2.addPhrase('seq',rcdcss,bpmpat);
	
	p3.setBPM(${temp_bpm});
	p3.addPhrase(phrase3);
	p3.addPhrase('seq',rcdcss,bpmpat);
	
	p4.setBPM(${temp_bpm});
	p4.addPhrase(phrase4);
	p4.addPhrase('seq',rcdcss,bpmpat);
	bpms.setBPM(${temp_bpm});
	parts.setBPM(${temp_bpm});
	
	recorder = new p5.SoundRecorder(masterGain);
	soundFile = new p5.SoundFile();

}
function playp1(time, playbackRate) {
	  p1song.rate(playbackRate);
	  p1song.play(time);
	}
function playp2(time, playbackRate) {
	  p2song.rate(playbackRate);
	  p2song.play(time);
	}
function playp3(time, playbackRate) {
	  p3song.rate(playbackRate);
	  p3song.play(time);
	}
function playp4(time, playbackRate) {
	  p4song.rate(playbackRate);
	  p4song.play(time);
	}
function drawmatrix(){
	var c1 = '.phrase1';var c2 = '.phrase2';var c3 = '.phrase3';var c4 = '.phrase4';

	$(c1).css('border','1px solid black');
	$(c2).css('border','1px solid black');
	$(c3).css('border','1px solid black');
	$(c4).css('border','1px solid black');
	$(c1).css('background-color','white');
	$(c2).css('background-color','white');
	$(c3).css('background-color','white');
	$(c4).css('background-color','white');
}
var targetp;
$(function(){
	$("#mixing").click(function(){
		userStartAudio();
		if(!bpms.isPlaying){
			$("#mixing").text('BPM Stop');
			bpms.loop();
			parts.stop();
		}else{
			$("#mixing").text('BPM Start');
			bpms.stop();
			drawmatrix();
			bpms.metro.metroTicks = 0;
		}
	})
	$("#musicall").click(function(){
		userStartAudio();
		if(!parts.isPlaying){
			$("#musicall").text('Music Stop');
			parts.start();
			p4.stop();p1.stop();p2.stop();p3.stop();bpms.stop();

		}else{
			$("#musicall").text('Music Start');
			parts.stop();
			drawmatrix();
			parts.metro.metroTicks = 0;
		}
	})
	$(".rcdmusic").on("click", function(){
		if($("#newset").text()==''){
			alert('select keyboard set');
			return;
        }
		targetp = $(this).parent().attr('id');
		var ment1 = ['','Press','','the','','space','bar','','to','','start','','record','ing'];
		if(targetp == 'p1'){
			$('.phrase1').html('');
			for(var i=0; i<ment1.length; i++){
				var cls = '#1-'+(i+1);
				$(cls).text(ment1[i]);		
			}
			$(document).keydown(function(event){
				if(event.keyCode == 32){
					$('.phrase1').text('');
					p1.start();
					state = 0;
					recordstart();
				}
			})
		}
		if(targetp == 'p2'){
			for(var i=0; i<ment1.length; i++){
				var cls = '#2-'+(i+1);
				$(cls).text(ment1[i]);			
			}
			$(document).keydown(function(event){
				if(event.keyCode == 32){
					$('.phrase2').text('');
					p2.start();
					state = 0;
					recordstart();
				}
			})
		}
		if(targetp == 'p3'){
			for(var i=0; i<ment1.length; i++){
				var cls = '#3-'+(i+1);
				$(cls).text(ment1[i]);			
			}
			$(document).keydown(function(event){
				if(event.keyCode == 32){
					$('.phrase3').text('');
					p3.start();
					state = 0;
					recordstart();
				}
			})
		}
		if(targetp == 'p4'){
			for(var i=0; i<ment1.length; i++){
				var cls = '#4-'+(i+1);
				$(cls).text(ment1[i]);			
			}
			$(document).keydown(function(event){
				if(event.keyCode == 32){
					$('.phrase4').text('');
					p4.start();
					state = 0;
					recordstart();
				}
			})
		}
	})
	
	$(".rcdplay").click(function(){
		userStartAudio();
		targetp = $(this).parent().attr('id');
		if(targetp == 'p1'){
			if(!p1.isPlaying){
				$(this).attr('src','resources/images/sound/stop.png');
				//p1.start();
				state = 2;
				recordstart();
				p2.stop();p3.stop();p4.stop();bpms.stop();parts.stop();
			}else{
				$(this).attr('src','resources/images/sound/play.png');
				p1.stop();
				drawmatrix();
				p1.metro.metroTicks = 0;
			}
		}
		if(targetp == 'p2'){
			if(!p2.isPlaying){
				$(this).attr('src','resources/images/sound/stop.png');
				p2.start();
				state = 2;
				recordstart();
				p3.stop();p4.stop();p1.stop();bpms.stop();parts.stop();
			}else{
				$(this).attr('src','resources/images/sound/play.png');
				p2.stop();
				drawmatrix();
				p2.metro.metroTicks = 0;
			}
		}
		if(targetp == 'p3'){
			if(!p3.isPlaying){
				$(this).attr('src','resources/images/sound/stop.png');
				p3.start();
				state = 2;
				recordstart();
				p1.stop();p2.stop();p4.stop();bpms.stop();parts.stop();
			}else{
				$(this).attr('src','resources/images/sound/play.png');
				p3.stop();
				drawmatrix();
				p3.metro.metroTicks = 0;
			}
		}
		if(targetp == 'p4'){
			if(!p4.isPlaying){
				$(this).attr('src','resources/images/sound/stop.png');
				p4.start();
				state = 2;
				recordstart();
				p1.stop();p2.stop();p3.stop();bpms.stop();parts.stop();
			}else{
				$(this).attr('src','resources/images/sound/play.png');
				p4.stop();
				drawmatrix();
				p4.metro.metroTicks = 0;
			}
		}
	})
})
function recordstart(){
	userStartAudio();
        if(state===0){
        	recorder.record(soundFile);
        	$(document).keydown(function(event){
        		count = 1;
        		pressimg();
        	})
        }else if(state===1){
          recorder.stop();
        }else if(state===2){
        	soundFile.play();
        	soundFile.onended(changes);
        	soundBlob = soundFile.getBlob();
            sendfile();
        }
}
function changes(){
	$('.rcdplay').attr('src','resources/images/sound/play.png');
}
function sequence(time, beatIndex){
	if(beatIndex==17){
		$("#musicall").text('Music Start');
	}
	drawmatrix();
	
	var one = '#1-'+beatIndex;
	var two = '#2-'+beatIndex;
	var three = '#3-'+beatIndex;
	var four = '#4-'+beatIndex;
	
	$(one).css('border','1px solid red');
	$(two).css('border','1px solid red');
	$(three).css('border','1px solid red');
	$(four).css('border','1px solid red');
	$(one).css('background-color','#F5BCA9')
	$(two).css('background-color','#F5BCA9')
	$(three).css('background-color','#F5BCA9')
	$(four).css('background-color','#F5BCA9')
}
var target;
function rcdcss(time, beatIndex){
	count = 0;
	if(beatIndex==17){
		$(".rcdplay").attr('src','resources/images/sound/play.png');
		state = 1;
		recordstart();
	}
	drawmatrix();
	if(targetp == 'p1'){
		target = '#1-'+beatIndex;
	}else if(targetp == 'p2'){
		target = '#2-'+beatIndex;
	}else if(targetp == 'p3'){
		target = '#3-'+beatIndex;
	}else if(targetp == 'p4'){
		target = '#4-'+beatIndex;
	}
	$(target).css('border','1px solid red');
	$(target).css('background-color','#F5BCA9')
}
function pressimg(){
	if(count==1){
		var a = target.substr(1,1);
		var b = target.substr(3,3)-1;
		img = '<img src="resources/images/sound/note'+a+'.png" alt="'+target+'" class="keyp">';
		$(target).html(img);
		saves[b] = 1;
	}
}
function loaded(index) {
	if(('s'+index)=='s83'){
		s83.play();
	}
	if(('s'+index)=='s84'){
		s84.play();
	}
}
function loaded2(){
	song.stop();
	bpms.stop();
}
function sendfile(){
		var formData = new FormData();
		 
		   formData.append("file", soundBlob);
		   formData.append("key_board", saves);
		   formData.append("part_number", ${part_number});
		   formData.append("phrase_number", targetp);

		$.ajax({
			method : 'post'
			,url : 'sendpart'
			,data : formData,
			processData: false,
		    contentType: false,
		    success : function(resp) {
		        if(resp=='success'){
		            alert("Success!");
		        }else{
		            alert("Fail");
		        }
		    }
		})
		   soundFile = new p5.SoundFile();
}
$(function(){
	for(var i=1; i<5; i++){
		var prs = "#phrase"+i;
		var data = '';
		for(var j=1; j<17; j++){
			var ids = i+"-"+j;
			data += '<div class="phrase'+i+'"id="'+ids+'"></div>'
		}

		$(prs).html(data);
	}
})
function makingmusic2(){
	location.href="makingmusic2";
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
		<div class="">
			<div id="backto" class="button_base btn_3d_double_roll" onclick="makingmusic2()">
				<div>Return Back</div>
				<div>Return Back</div>
				<div>Return Back</div>
				<div>Return Back</div>
			</div>
			<div id="resetpart" class="button_base btn_3d_double_roll">
				<div>Reset</div>
				<div>Reset</div>
				<div>Reset</div>
				<div>Reset</div>
			</div>
			<div id="savepart" class="button_base btn_3d_double_roll">
				<div>Save Part</div>
				<div>Save Part</div>
				<div>Save Part</div>
				<div>Save Part</div>
			</div>
			<br>
		</div>
	
		<div class="navigation__column">
			<div class="navigations__links">
				<div class="navigation__list-item"><a href="#"
					class="navigation__link" onclick="chatOpen()"><i class="fa fa-send-o"></i>
				</a></div>
				<div class="navigation__list-item"><a href="#"
					class="navigation__link"><i class="fa fa-bell-o"></i>
				</a></div>
				<div class="navigation__list-item"  >
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
	<!-- <a href="makingmusic2"><button id="backto">Return Back</button></a>
		<button id="resetpart">Reset</button>
		<button id="savepart">Save Part</button><br> -->
		<div id="musinfo">
	Part Number : <span id="partnumber">${part_number}</span>&emsp;/&emsp;
	BPM : <span id="bpmnum">${temp_bpm}</span>&emsp;/&emsp;
	<button id="mixing" type="button" class="btn btn-secondary">BPM Start</button>&emsp;/&emsp;
	<button id="musicall" type="button" class="btn btn-secondary">Music Start</button>
	</div>
	<div id="keyboard">
	<div class="fronts">
		<span id="KB" style="font-size: 60px;">Key Board</span>
		<br>
		<div class="libs" style="height:130px;">
			<ul>
				<li><button id="Set1" class="w3-btn w3-grey w3-round" value="Set1">Set1</button></li>
				<li><button id="Set2" class="w3-btn w3-grey w3-round" value="Set2">Set2</button></li>
				<li><button id="Set3" class="w3-btn w3-grey w3-round" value="Set3">Set3</button></li>
				<li><button id="Set4" class="w3-btn w3-grey w3-round" value="Set4">Set4</button></li>			
			</ul>
		</div>
		<span id="newset"></span><br>
	<span id="newment">Select one of the Sets</span>
	</div>
	<div id="keys">
	<div id="key1">
<div class="keys" id="49" ondragleave="leavedrag(event)" ondrop="drop(event)" ondragover="allowDrop(event)">1<span class="keydel"></span><div class="keysou"></div></div>
<div class="keys" id="50" ondragleave="leavedrag(event)" ondrop="drop(event)" ondragover="allowDrop(event)">2<span class="keydel"></span><div class="keysou"></div></div>
<div class="keys" id="51" ondragleave="leavedrag(event)" ondrop="drop(event)" ondragover="allowDrop(event)">3<span class="keydel"></span><div class="keysou"></div></div>
<div class="keys" id="52" ondragleave="leavedrag(event)" ondrop="drop(event)" ondragover="allowDrop(event)">4<span class="keydel"></span><div class="keysou"></div></div>
<div class="keys" id="53" ondragleave="leavedrag(event)" ondrop="drop(event)" ondragover="allowDrop(event)">5<span class="keydel"></span><div class="keysou"></div></div>
<div class="keys" id="54" ondragleave="leavedrag(event)" ondrop="drop(event)" ondragover="allowDrop(event)">6<span class="keydel"></span><div class="keysou"></div></div>
<div class="keys" id="55" ondragleave="leavedrag(event)" ondrop="drop(event)" ondragover="allowDrop(event)">7<span class="keydel"></span><div class="keysou"></div></div>
<div class="keys" id="56" ondragleave="leavedrag(event)" ondrop="drop(event)" ondragover="allowDrop(event)">8<span class="keydel"></span><div class="keysou"></div></div>
<div class="keys" id="57" ondragleave="leavedrag(event)" ondrop="drop(event)" ondragover="allowDrop(event)">9<span class="keydel"></span><div class="keysou"></div></div>
<div class="keys" id="48" ondragleave="leavedrag(event)" ondrop="drop(event)" ondragover="allowDrop(event)">0<span class="keydel"></span><div class="keysou"></div></div>
<div class="keys" id="189" ondragleave="leavedrag(event)" ondrop="drop(event)" ondragover="allowDrop(event)">-<span class="keydel"></span><div class="keysou"></div></div>
<div class="keys" id="187" ondragleave="leavedrag(event)" ondrop="drop(event)" ondragover="allowDrop(event)">=<span class="keydel"></span><div class="keysou"></div></div>
</div>
<div id="key2">
<div class="keys" id="81" ondragleave="leavedrag(event)" ondrop="drop(event)" ondragover="allowDrop(event)">Q<span class="keydel"></span><div class="keysou"></div></div>
<div class="keys" id="87" ondragleave="leavedrag(event)" ondrop="drop(event)" ondragover="allowDrop(event)">W<span class="keydel"></span><div class="keysou"></div></div>
<div class="keys" id="69" ondragleave="leavedrag(event)" ondrop="drop(event)" ondragover="allowDrop(event)">E<span class="keydel"></span><div class="keysou"></div></div>
<div class="keys" id="82" ondragleave="leavedrag(event)" ondrop="drop(event)" ondragover="allowDrop(event)">R<span class="keydel"></span><div class="keysou"></div></div>
<div class="keys" id="84" ondragleave="leavedrag(event)" ondrop="drop(event)" ondragover="allowDrop(event)">T<span class="keydel"></span><div class="keysou"></div></div>
<div class="keys" id="89" ondragleave="leavedrag(event)" ondrop="drop(event)" ondragover="allowDrop(event)">Y<span class="keydel"></span><div class="keysou"></div></div>
<div class="keys" id="85" ondragleave="leavedrag(event)" ondrop="drop(event)" ondragover="allowDrop(event)">U<span class="keydel"></span><div class="keysou"></div></div>
<div class="keys" id="73" ondragleave="leavedrag(event)" ondrop="drop(event)" ondragover="allowDrop(event)">I<span class="keydel"></span><div class="keysou"></div></div>
<div class="keys" id="79" ondragleave="leavedrag(event)" ondrop="drop(event)" ondragover="allowDrop(event)">O<span class="keydel"></span><div class="keysou"></div></div>
<div class="keys" id="80" ondragleave="leavedrag(event)" ondrop="drop(event)" ondragover="allowDrop(event)">P<span class="keydel"></span><div class="keysou"></div></div>
<div class="keys" id="219" ondragleave="leavedrag(event)" ondrop="drop(event)" ondragover="allowDrop(event)">[<span class="keydel"></span><div class="keysou"></div></div>
</div>
<div id="key3">
<div class="keys" id="65" ondragleave="leavedrag(event)" ondrop="drop(event)" ondragover="allowDrop(event)">A<span class="keydel"></span><div class="keysou"></div></div>
<div class="keys" id="83" ondragleave="leavedrag(event)" ondrop="drop(event)" ondragover="allowDrop(event)">S<span class="keydel"></span><div class="keysou"></div></div>
<div class="keys" id="68" ondragleave="leavedrag(event)" ondrop="drop(event)" ondragover="allowDrop(event)">D<span class="keydel"></span><div class="keysou"></div></div>
<div class="keys" id="70" ondragleave="leavedrag(event)" ondrop="drop(event)" ondragover="allowDrop(event)">F<span class="keydel"></span><div class="keysou"></div></div>
<div class="keys" id="71" ondragleave="leavedrag(event)" ondrop="drop(event)" ondragover="allowDrop(event)">G<span class="keydel"></span><div class="keysou"></div></div>
<div class="keys" id="72" ondragleave="leavedrag(event)" ondrop="drop(event)" ondragover="allowDrop(event)">H<span class="keydel"></span><div class="keysou"></div></div>
<div class="keys" id="74" ondragleave="leavedrag(event)" ondrop="drop(event)" ondragover="allowDrop(event)">J<span class="keydel"></span><div class="keysou"></div></div>
<div class="keys" id="75" ondragleave="leavedrag(event)" ondrop="drop(event)" ondragover="allowDrop(event)">K<span class="keydel"></span><div class="keysou"></div></div>
<div class="keys" id="76" ondragleave="leavedrag(event)" ondrop="drop(event)" ondragover="allowDrop(event)">L<span class="keydel"></span><div class="keysou"></div></div>
<div class="keys" id="186" ondragleave="leavedrag(event)" ondrop="drop(event)" ondragover="allowDrop(event)">;<span class="keydel"></span><div class="keysou"></div></div>
</div>
<div id="key4">
<div class="keys" id="90" ondragleave="leavedrag(event)" ondrop="drop(event)" ondragover="allowDrop(event)">Z<span class="keydel"></span><div class="keysou"></div></div>
<div class="keys" id="88" ondragleave="leavedrag(event)" ondrop="drop(event)" ondragover="allowDrop(event)">X<span class="keydel"></span><div class="keysou"></div></div>
<div class="keys" id="67" ondragleave="leavedrag(event)" ondrop="drop(event)" ondragover="allowDrop(event)">C<span class="keydel"></span><div class="keysou"></div></div>
<div class="keys" id="86" ondragleave="leavedrag(event)" ondrop="drop(event)" ondragover="allowDrop(event)">V<span class="keydel"></span><div class="keysou"></div></div>
<div class="keys" id="66" ondragleave="leavedrag(event)" ondrop="drop(event)" ondragover="allowDrop(event)">B<span class="keydel"></span><div class="keysou"></div></div>
<div class="keys" id="78" ondragleave="leavedrag(event)" ondrop="drop(event)" ondragover="allowDrop(event)">N<span class="keydel"></span><div class="keysou"></div></div>
<div class="keys" id="77" ondragleave="leavedrag(event)" ondrop="drop(event)" ondragover="allowDrop(event)">M<span class="keydel"></span><div class="keysou"></div></div>
<div class="keys" id="188" ondragleave="leavedrag(event)" ondrop="drop(event)" ondragover="allowDrop(event)">,<span class="keydel"></span><div class="keysou"></div></div>
<div class="keys" id="190" ondragleave="leavedrag(event)" ondrop="drop(event)" ondragover="allowDrop(event)">.<span class="keydel"></span><div class="keysou"></div></div>
</div>
</div>
</div><!-- end #keyboard -->
<div id="phrases">
<div id="p1"><span class="pnames">Phrase1</span><img class="rcdmusic" src="resources/images/sound/rcd.png"><img class="rcdplay" src="resources/images/sound/play.png"><span class = "delreset"><Button class="del" value="p1'">X</Button>reset</span></div><div id="phrase1"></div>
<div id="p2"><span class="pnames">Phrase2</span><img class="rcdmusic" src="resources/images/sound/rcd.png"><img class="rcdplay" src="resources/images/sound/play.png"><span class = "delreset"><Button class="del" value="p2'">X</Button>reset</span></div><div id="phrase2"></div>
<div id="p3"><span class="pnames">Phrase3</span><img class="rcdmusic" src="resources/images/sound/rcd.png"><img class="rcdplay" src="resources/images/sound/play.png"><span class = "delreset"><Button class="del" value="p3'">X</Button>reset</span></div><div id="phrase3"></div>
<div id="p4"><span class="pnames">Phrase4</span><img class="rcdmusic" src="resources/images/sound/rcd.png"><img class="rcdplay" src="resources/images/sound/play.png"><span class = "delreset"><Button class="del" value="p4'">X</Button>reset</span></div><div id="phrase4"></div>
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