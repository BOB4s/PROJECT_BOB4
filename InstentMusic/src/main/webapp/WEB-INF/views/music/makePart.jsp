<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" buffer="4096kb" autoFlush="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MusicMake</title>
<script src="resources/js/jquery-3.4.1.min.js"></script>
<script src="resources/js/jquery-ui.min.js"></script>
<script src="resources/js/sketch.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script src="resources/js/p5.min.js"></script>
<script src="resources/js/p5.sound.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/css/navigation.css">
<link rel="stylesheet" href="resources/css/sideMenuBar.css">
<link rel="stylesheet" href="resources/css/3d_double_roll_btn.css">
<link rel="stylesheet" href="resources/css/background_left_right_for_makePartJsp.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
html{
	margin-left: 2%;
}
body{
 /*margin : 10px 10px 10px 10px; */
overflow-y: hidden;
}
#wrapper{
	top: 16%;
	left: 10%;
	position: absolute;
}
#keyboard{
	margin-left: 40px;
	margin-top : 60px;
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
	top: -40px;
	position: absolute;
	left: 320px;
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
	width: 1300px;
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
	float : right;
	height : 30px;
	width : 30px;
	cursor : pointer;
	margin-left: 10px;
}
.rcdplay{
	float : right;
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
#mods{
	width: 1200px;
	height : 10px;
	text-align: center;
}
#mods button{
	margin-top : 20px;
	margin-left : 10px;
	margin-right : 10px;
	border: 0;
	text-decoration: underline;
	font-size: 20px;
	background-color: #FFFFFF;
}
</style>
<script>
var list = [];
var paths = [];
var saves = ['N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N'];
$(document).ready(function(){
	getparts();
})
function getparts(){
	$.ajax({
		method : 'get'
		,url : 'getparts'
		,data : {'part_number':${sessionScope.part_num}}
		,success : function(resp){
				if(resp!=null){
					$(".phrase1").html('');$(".phrase2").html('');$(".phrase3").html('');$(".phrase4").html('');
					$.each(resp,function(index,item){
						var pts = item.key_board.split("",16);
						for(var j=1; j<17; j++){
						var ids = '#'+item.phrase_number+"-"+j;
						img = '<img src="resources/images/sound/note'+item.phrase_number+'.png" alt="'+ids+'" class="keyp">';
						if(pts[j-1]!='N'){
							$(ids).html(img);
							}
						}
						var datas = {'phrase_number':item.phrase_number,'phrase_saved':item.fullPath};
						paths.push(datas);
					})
				}
			}
	})
	setup();
}
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
					$(idx).val(item.sou_path);
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
var path2 = [];
var s48, s49, s50, s51, s52, s53, s54, s55, s56, s57;
var s65, s66, s67, s68, s69, s70, s71, s72, s73, s74, s75, s76, s77, s78, s79;
var s80, s81, s82, s83, s84, s85, s86, s87, s88, s89, s90;
var s186, s187, s188, s189, s190, s219;
var ps1, ps2, ps3, ps4;
var d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15, d16;
function touchStarted() {
	  getAudioContext().resume()
	}
function setup() {
	userStartAudio();
	masterGain = new p5.Gain();
	masterGain.connect();
	var dd1 = new p5.Gain();var dd2 = new p5.Gain();var dd3 = new p5.Gain();
	var dd4 = new p5.Gain();var dd5 = new p5.Gain();var dd6 = new p5.Gain();
	var dd7 = new p5.Gain();var dd8 = new p5.Gain();var dd9 = new p5.Gain();
	var dd10 = new p5.Gain();var dd11 = new p5.Gain();var dd12 = new p5.Gain();
	var dd13 = new p5.Gain();var dd14 = new p5.Gain();var dd15 = new p5.Gain();
	var dd16 = new p5.Gain();
	var pg1 = new p5.Gain();var pg2 = new p5.Gain();var pg3 = new p5.Gain();var pg4 = new p5.Gain();
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
	$.each(paths,function(index,item){
		if(item.phrase_number==1){ps1 = loadSound(item.phrase_saved);pg1.setInput(ps1);pg1.connect(masterGain);}
		if(item.phrase_number==2){ps2 = loadSound(item.phrase_saved);pg2.setInput(ps2);pg2.connect(masterGain);}
		if(item.phrase_number==3){ps3 = loadSound(item.phrase_saved);pg3.setInput(ps3);pg3.connect(masterGain);}
		if(item.phrase_number==4){ps4 = loadSound(item.phrase_saved);pg4.setInput(ps4);pg4.connect(masterGain);}
	})
	if($("#dmode").val()=='modeon'){
		$.each(saves,function(index,item){
			if(index==0){d1 = loadSound(item);dd1.setInput(d1);dd1.connect(masterGain);}
			if(index==1){d2 = loadSound(item);dd2.setInput(d2);dd2.connect(masterGain);}
			if(index==2){d3 = loadSound(item);dd3.setInput(d3);dd3.connect(masterGain);}
			if(index==3){d4 = loadSound(item);dd4.setInput(d4);dd4.connect(masterGain);}
			if(index==4){d5 = loadSound(item);dd5.setInput(d5);dd5.connect(masterGain);}
			if(index==5){d6 = loadSound(item);dd6.setInput(d6);dd6.connect(masterGain);}
			if(index==6){d7 = loadSound(item);dd7.setInput(d7);dd7.connect(masterGain);}
			if(index==7){d8 = loadSound(item);dd8.setInput(d8);dd8.connect(masterGain);}
			if(index==8){d9 = loadSound(item);dd9.setInput(d9);dd9.connect(masterGain);}
			if(index==9){d10 = loadSound(item);dd10.setInput(d10);dd10.connect(masterGain);}
			if(index==10){d11 = loadSound(item);dd11.setInput(d11);dd11.connect(masterGain);}
			if(index==11){d12 = loadSound(item);dd12.setInput(d12);dd12.connect(masterGain);}
			if(index==12){d13 = loadSound(item);dd13.setInput(d13);dd13.connect(masterGain);}
			if(index==13){d14 = loadSound(item);dd14.setInput(d14);dd14.connect(masterGain);}
			if(index==14){d15 = loadSound(item);dd15.setInput(d15);dd15.connect(masterGain);}
			if(index==15){d16 = loadSound(item);dd16.setInput(d16);dd16.connect(masterGain);}
		})
	}
	$.each(list,function(index,item){
		if(item.keyname==48){s48 = loadSound(item.soupath);g48.setInput(s48);g48.connect(masterGain);
		}else if(item.keyname==49){s49 = loadSound(item.soupath);g49.setInput(s48);g49.connect(masterGain);
		}else if(item.keyname==50){s50 = loadSound(item.soupath);g50.setInput(s50);g50.connect(masterGain);
		}else if(item.keyname==51){s51 = loadSound(item.soupath);g51.setInput(s51);g51.connect(masterGain);
		}else if(item.keyname==52){s52 = loadSound(item.soupath);g52.setInput(s52);g52.connect(masterGain);
		}else if(item.keyname==53){s53 = loadSound(item.soupath);g53.setInput(s53);g53.connect(masterGain);
		}else if(item.keyname==54){s54 = loadSound(item.soupath);g54.setInput(s54);g54.connect(masterGain);
		}else if(item.keyname==55){s55 = loadSound(item.soupath);g55.setInput(s55);g55.connect(masterGain);
		}else if(item.keyname==56){s56 = loadSound(item.soupath);g56.setInput(s56);g56.connect(masterGain);
		}else if(item.keyname==57){s57 = loadSound(item.soupath);g57.setInput(s57);g57.connect(masterGain);
		}else if(item.keyname==65){s65 = loadSound(item.soupath);g65.setInput(s65);g65.connect(masterGain);
		}else if(item.keyname==66){s66 = loadSound(item.soupath);g66.setInput(s66);g66.connect(masterGain);
		}else if(item.keyname==67){s67 = loadSound(item.soupath);g67.setInput(s67);g67.connect(masterGain);
		}else if(item.keyname==68){s68 = loadSound(item.soupath);g68.setInput(s68);g68.connect(masterGain);
		}else if(item.keyname==69){s69 = loadSound(item.soupath);g69.setInput(s69);g69.connect(masterGain);
		}else if(item.keyname==70){s70 = loadSound(item.soupath);g70.setInput(s70);g70.connect(masterGain);
		}else if(item.keyname==71){s71 = loadSound(item.soupath);g71.setInput(s71);g71.connect(masterGain);
		}else if(item.keyname==72){s72 = loadSound(item.soupath);g72.setInput(s72);g72.connect(masterGain);
		}else if(item.keyname==73){s73 = loadSound(item.soupath);g73.setInput(s73);g73.connect(masterGain);
		}else if(item.keyname==74){s74 = loadSound(item.soupath);g74.setInput(s74);g74.connect(masterGain);
		}else if(item.keyname==75){s75 = loadSound(item.soupath);g75.setInput(s75);g75.connect(masterGain);
		}else if(item.keyname==76){s76 = loadSound(item.soupath);g76.setInput(s76);g76.connect(masterGain);
		}else if(item.keyname==77){s77 = loadSound(item.soupath);g77.setInput(s77);g77.connect(masterGain);
		}else if(item.keyname==78){s78 = loadSound(item.soupath);g78.setInput(s78);g78.connect(masterGain);
		}else if(item.keyname==79){s79 = loadSound(item.soupath);g79.setInput(s79);g79.connect(masterGain);
		}else if(item.keyname==80){s80 = loadSound(item.soupath);g80.setInput(s80);g80.connect(masterGain);
		}else if(item.keyname==81){s81 = loadSound(item.soupath);g81.setInput(s81);g81.connect(masterGain);
		}else if(item.keyname==82){s82 = loadSound(item.soupath);g82.setInput(s82);g82.connect(masterGain);
		}else if(item.keyname==83){s83 = loadSound(item.soupath);g83.setInput(s83);g83.connect(masterGain);
		}else if(item.keyname==84){s84 = loadSound(item.soupath);g84.setInput(s84);g84.connect(masterGain);
		}else if(item.keyname==85){s85 = loadSound(item.soupath);g85.setInput(s85);g85.connect(masterGain);
		}else if(item.keyname==86){s86 = loadSound(item.soupath);g86.setInput(s86);g86.connect(masterGain);
		}else if(item.keyname==87){s87 = loadSound(item.soupath);g87.setInput(s87);g87.connect(masterGain);
		}else if(item.keyname==88){s88 = loadSound(item.soupath);g88.setInput(s88);g88.connect(masterGain);
		}else if(item.keyname==89){s89 = loadSound(item.soupath);g89.setInput(s89);g89.connect(masterGain);
		}else if(item.keyname==90){s90 = loadSound(item.soupath);g90.setInput(s90);g90.connect(masterGain);
		}else if(item.keyname==186){s186 = loadSound(item.soupath);g186.setInput(s186);g186.connect(masterGain);
		}else if(item.keyname==187){s187 = loadSound(item.soupath);g187.setInput(s187);g187.connect(masterGain);
		}else if(item.keyname==188){s188 = loadSound(item.soupath);g188.setInput(s188);g188.connect(masterGain);
		}else if(item.keyname==189){s189 = loadSound(item.soupath);g189.setInput(s189);g189.connect(masterGain);
		}else if(item.keyname==190){s190 = loadSound(item.soupath);g190.setInput(s190);g190.connect(masterGain);
		}else if(item.keyname==219){s219 = loadSound(item.soupath);g219.setInput(s219);g219.connect(masterGain);
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
	
	bpmpat = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17];
	bpmpat2 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16];

	ps = new p5.Part();
	ps.setBPM(${temp_bpm});
	ps.addPhrase('seq',rcdcss,bpmpat);

	parts = new p5.Part();
	parts.setBPM(${temp_bpm});
	parts.addPhrase('seq',sequence,bpmpat);

	bpms = new p5.Part();
	bpms.setBPM(${temp_bpm});
	bpms.addPhrase('seq',sequence,bpmpat2);

	recorder = new p5.SoundRecorder();
	recorder.setInput(masterGain);
	soundFile = new p5.SoundFile();

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
			parts.stop();ps.stop();
		}else{
			$("#mixing").text('BPM Start');
			bpms.stop();
			drawmatrix();
			bpms.metro.metroTicks = 0;
		}
	})
	$("#musicall").click(function(){
		userStartAudio();
		if(paths==null){
			alert('please recording phrases!');
			return;
		}
		if($("#musicall").val()=='mixing'){
			state=0;
			parts.start();
			ps.stop();bpms.stop();
			recordstart2();
		}else{
			parts.start();
			state=2;
			recordstart2();
			$("#musicall").val('mixing');
			$("#musicall").text('Mixing Music');
		}
	})
	$(".rcdmusic").on("click", function(){
		if($("#newset").text()==''){
			alert('select keyboard set');
			return;
        }
		targetp = $(this).parent().attr('id');
		if($("#tmode").val()=='modeon'){
			var ment1 = ['','Press','','the','','space','bar','','to','','start','','record','ing'];
			var a = targetp.substr(1,1);
			var aa = '.phrase'+a;
			$(aa).html('');
			for(var i=0; i<ment1.length; i++){
				var cls = '#'+a+'-'+(i+1);
				$(cls).text(ment1[i]);		
			}
			$(document).keydown(function(event){
				if(event.keyCode == 32){
					$(aa).text('');
					ps.start();
					state = 0;
					recordstart();
				}
			})
		}else{
			ps.start();
			state = 0;
			recordstart();
		}
	})
	
	$(".rcdplay").click(function(){
		userStartAudio();
		targetp = $(this).parent().attr('id');
		var a = targetp.substr(1,1);
		var aa = '.phrase'+a;
		if($("#dmode").val()=='modeon'){
			if(state===1){
				state=2;
				ps.start();
				recordstart();
			}else if(targetp=='p1'){ps1.play();ps.start();}
			else if(targetp=='p2'){ps2.play();ps.start();}
			else if(targetp=='p3'){ps3.play();ps.start();}
			else if(targetp=='p4'){ps4.play();ps.start();}
			if($(this).attr('alt')=='play'){
				$(this).attr('src','resources/images/sound/stop.png');
				$(this).attr('alt','stop');
				bpms.stop();parts.stop();
			}else{
				$(this).attr('src','resources/images/sound/play.png');
				$(this).attr('alt','play');
				ps.stop();
				drawmatrix();
				ps.metro.metroTicks = 0;
			}
		}else {
			if(state===1){
				state=2;
				ps.start();
				recordstart();
			}else if(targetp=='p1'){ps1.play();ps.start();}
			else if(targetp=='p2'){ps2.play();ps.start();}
			else if(targetp=='p3'){ps3.play();ps.start();}
			else if(targetp=='p4'){ps4.play();ps.start();}
			if($(this).attr('alt')=='play'){
				$(this).attr('src','resources/images/sound/stop.png');
				$(this).attr('alt','stop');
				bpms.stop();parts.stop();
			}else{
				$(this).attr('src','resources/images/sound/play.png');
				$(this).attr('alt','play');
				ps.stop();
				drawmatrix();
				ps.metro.metroTicks = 0;
			}
		}
	})
})
function recordstart(){
	userStartAudio();
    if(state===0){
    	recorder.record(soundFile);
    	if($("#tmode").val()=='modeon'){
    	$(document).keydown(function(event){
    		count = 1;
    		pressimg();
    	})
    	}
    }else if(state===1){
      recorder.stop();
      changes();
    }else if(state===2){
		soundFile.play();
		soundFile.onended(function(){
			soundBlob = soundFile.getBlob();
			  sendfile();
			})
    }
}
function recordstart2(){
	userStartAudio();
    if(state===0){
    	recorder.record(soundFile);
    	ps1.play();ps2.play();ps3.play();ps4.play();
    }else if(state===1){
      recorder.stop();
      $("#musicall").val('play');
		$("#musicall").text('Play Mixed');
    }else if(state===2){
	  soundFile.play();
	  soundFile.onended(function(){
			soundBlob = soundFile.getBlob();
			  sendfile2();
			})
    }
}
function changes(){
	$('.rcdplay').attr('src','resources/images/sound/play.png');
}
function sequence(time, beatIndex){
	if(beatIndex==17){
		state = 1;
		recordstart2();
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
		$(".rcdplay").attr('alt','play');
		state = 1;
		recordstart();
	}
	drawmatrix();
	var a = targetp.substr(1,1);
	target = '#'+a+'-'+beatIndex;
	$(target).css('border','1px solid red');
	$(target).css('background-color','#F5BCA9')

	if($("#dmode").val()=='modeon'){
		var a = targetp.substr(1,1);
		target = '#'+a+'-'+beatIndex+' img';
		if(saves[beatIndex-1]!='N'){
			if(beatIndex==1){d1.play();}
			if(beatIndex==2){d2.play();}
			if(beatIndex==3){d3.play();}
			if(beatIndex==4){d4.play();}
			if(beatIndex==5){d5.play();}
			if(beatIndex==6){d6.play();}
			if(beatIndex==7){d7.play();}
			if(beatIndex==8){d8.play();}
			if(beatIndex==9){d9.play();}
			if(beatIndex==10){d10.play();}
			if(beatIndex==11){d11.play();}
			if(beatIndex==12){d12.play();}
			if(beatIndex==13){d13.play();}
			if(beatIndex==14){d14.play();}
			if(beatIndex==15){d15.play();}
			if(beatIndex==16){d16.play();}
		}
	}
}
function pressimg(){
	if(count==1){
		var a = target.substr(1,1);
		var b = target.substr(3,3)-1;
		img = '<img src="resources/images/sound/note'+a+'.png" alt="'+target+'" class="keyp">';
		$(target).html(img);
		saves[b] = 'Y';
	}
}
function sendfile(){
		   var targetps = targetp.substr(1,1);
		   var data = '';
		   for(var i=0; i<saves.length; i++){
			   if(saves[i].length>1){
					saves[i] = 'Y';
				}
				data+=saves[i];
			   }
		   var formData = new FormData();
		 
		   formData.append("file", soundBlob);
		   formData.append("key_board", data);
		   formData.append("part_number", ${sessionScope.part_num});
		   formData.append("phrase_number", targetps);
		   console.log(formData);

		   $.ajax({
		    type: "post",
	        url: "sendPart",
	        data: formData,
	        processData: false,
	        contentType: false,
			success : function(resp){
					soundFile = new p5.SoundFile();
					alert("Recording Complete!");
					location.reload();
				}
		   })
}
function sendfile2(){
	   var data = '';
	   for(var i=0; i<paths.length; i++){
		   	data += paths[i].phrase_number + ','
		   }
	   var formData = new FormData();
	 
	   formData.append("file", soundBlob);
	   formData.append("key_board", data);
	   formData.append("part_number", ${sessionScope.part_num});
	   formData.append("phrase_number", 5);
	   console.log(formData);

	   $.ajax({
	    type: "post",
     url: "sendPart",
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

	$("#backto").click(function(){
		location.href="makingmusic2";
	})
})
$(function(){
	$(".del").click(function(){
		var phrase = $(this).val();
		var p = phrase.substr(1,1);
		var pp = '.phrase'+p;
		var part = $("#partnumber").text();
		var answer = confirm("Are you sure you want to reset this phrase?");
		if(answer){
			$.ajax({
				type : 'post'
				,url : 'delphrase'
				,data : {'part_number' : part, 'phrase_number' : p}
				,success : function(resp){
						$(pp).html('');
						getparts();
					}
			})
		}
	})
})
$(function(){
	$("#tmode").css('color','white');
	$("#tmode").css('background-color','black');
	
	$("#tmode").click(function(){
		$("#tmode").css('color','white');
		$("#tmode").css('background-color','black');
		$("#dmode").css('color','black');
		$("#dmode").css('background-color','white');
		$("#tmode").val('modeon');
		$("#dmode").val('');

		getparts();

		$(".keys").attr('draggable','false');
	})

	$("#dmode").click(function(){
		$("#dmode").css('color','white');
		$("#dmode").css('background-color','black');
		$("#tmode").css('color','black');
		$("#tmode").css('background-color','white');
		$("#dmode").val('modeon');
		$("#tmode").val('');
		getparts();

		$(".keys").attr('draggable','true');
		$(".keys").attr('ondragstart','drag(event)');
		$(".phrase1").attr('ondragleave','leavedrag(event)');
		$(".phrase1").attr('ondrop','drop(event)');
		$(".phrase1").attr('ondragover','allowDrop(event)');
		$(".phrase2").attr('ondragleave','leavedrag(event)');
		$(".phrase2").attr('ondrop','drop(event)');
		$(".phrase2").attr('ondragover','allowDrop(event)');
		$(".phrase3").attr('ondragleave','leavedrag(event)');
		$(".phrase3").attr('ondrop','drop(event)');
		$(".phrase3").attr('ondragover','allowDrop(event)');
		$(".phrase4").attr('ondragleave','leavedrag(event)');
		$(".phrase4").attr('ondrop','drop(event)');
		$(".phrase4").attr('ondragover','allowDrop(event)');
	})
})
function drag(ev) { 
	ev.dataTransfer.setData("fullpath", ev.target.value);
}
function drop(ev) {
	ev.preventDefault(); 
	var c = ev.dataTransfer.getData("fullpath"); 
	var tagid = '#'+ev.target.id;
	var p = tagid.substr(1,1);
	var pp = tagid.substr(3,3)-1;
	$(tagid).css('background-color','white');
	var img = '<img class="keyp" src="resources/images/sound/note'+p+'.png">';
	$(tagid).html(img);

	saves[pp]=c;
	setup();
}
function allowDrop(ev){
	ev.preventDefault();
	var tagid = '#'+ev.target.id;
	$(tagid).css('background-color','red');
}
function leavedrag(ev){
	var tagid = '#'+ev.target.id;
	$(tagid).css('background-color','white');
}
$(function(){
	$("#resetpart").click(function(){
		var answer = confirm("Are you sure you want to reset this Part?");
		if(answer){
			$.ajax({
				type : 'post'
				,url : 'delpartone'
				,data : {'part_number': $("#partnumber").text()}
				,success : function(resp){
					getparts();
				}
			})
		}
	})
})
</script>
</head>
<body>
<nav class="navigation">
		<div class="navigation__column">
			<a href="main"><img class="logo" alt="home" src="resources/images/home/im_logo_w.jpg">
			</a>
		</div>
		<div class="navigation__column">
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
	
	<!-- left, right backgroung image -->
	<div id="backgroundLeft">
		<img alt="BL" src="resources/images/makingMusic/backgroundLeft-1.png">
	</div>
	<div id="backgroundRight">
		<img alt="BR" src="resources/images/makingMusic/backgroundRight-1.png">
	</div>
	
	<div id="wrapper">
		<div id="musinfo">
	Part Number : <span id="partnumber">${sessionScope.part_num}</span>&emsp;/&emsp;
	BPM : <span id="bpmnum">${sessionScope.temp_bpm}</span>&emsp;/&emsp;
	<button id="mixing" type="button" class="btn btn-secondary">BPM Start</button>&emsp;/&emsp;
	<button id="musicall" type="button" class="btn btn-secondary" value="mixing">Mixing Music</button>
	</div>
	<div id="mods">
	<button id="tmode" value="modeon">Typing Mode</button><button id="dmode">Drag Mode</button></div>
	<div id="keyboard">
	<div class="fronts">
		<span id="KB" style="font-size: 50px;">Key Board</span>
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
<div class="keys" id="49">1<span class="keydel"></span><div class="keysou"></div></div>
<div class="keys" id="50">2<span class="keydel"></span><div class="keysou"></div></div>
<div class="keys" id="51">3<span class="keydel"></span><div class="keysou"></div></div>
<div class="keys" id="52">4<span class="keydel"></span><div class="keysou"></div></div>
<div class="keys" id="53">5<span class="keydel"></span><div class="keysou"></div></div>
<div class="keys" id="54">6<span class="keydel"></span><div class="keysou"></div></div>
<div class="keys" id="55">7<span class="keydel"></span><div class="keysou"></div></div>
<div class="keys" id="56">8<span class="keydel"></span><div class="keysou"></div></div>
<div class="keys" id="57">9<span class="keydel"></span><div class="keysou"></div></div>
<div class="keys" id="48">0<span class="keydel"></span><div class="keysou"></div></div>
<div class="keys" id="189">-<span class="keydel"></span><div class="keysou"></div></div>
<div class="keys" id="187">=<span class="keydel"></span><div class="keysou"></div></div>
</div>
<div id="key2">
<div class="keys" id="81">Q<span class="keydel"></span><div class="keysou"></div></div>
<div class="keys" id="87">W<span class="keydel"></span><div class="keysou"></div></div>
<div class="keys" id="69">E<span class="keydel"></span><div class="keysou"></div></div>
<div class="keys" id="82">R<span class="keydel"></span><div class="keysou"></div></div>
<div class="keys" id="84">T<span class="keydel"></span><div class="keysou"></div></div>
<div class="keys" id="89">Y<span class="keydel"></span><div class="keysou"></div></div>
<div class="keys" id="85">U<span class="keydel"></span><div class="keysou"></div></div>
<div class="keys" id="73">I<span class="keydel"></span><div class="keysou"></div></div>
<div class="keys" id="79">O<span class="keydel"></span><div class="keysou"></div></div>
<div class="keys" id="80">P<span class="keydel"></span><div class="keysou"></div></div>
<div class="keys" id="219">[<span class="keydel"></span><div class="keysou"></div></div>
</div>
<div id="key3">
<div class="keys" id="65">A<span class="keydel"></span><div class="keysou"></div></div>
<div class="keys" id="83">S<span class="keydel"></span><div class="keysou"></div></div>
<div class="keys" id="68">D<span class="keydel"></span><div class="keysou"></div></div>
<div class="keys" id="70">F<span class="keydel"></span><div class="keysou"></div></div>
<div class="keys" id="71">G<span class="keydel"></span><div class="keysou"></div></div>
<div class="keys" id="72">H<span class="keydel"></span><div class="keysou"></div></div>
<div class="keys" id="74">J<span class="keydel"></span><div class="keysou"></div></div>
<div class="keys" id="75">K<span class="keydel"></span><div class="keysou"></div></div>
<div class="keys" id="76">L<span class="keydel"></span><div class="keysou"></div></div>
<div class="keys" id="186">;<span class="keydel"></span><div class="keysou"></div></div>
</div>
<div id="key4">
<div class="keys" id="90">Z<span class="keydel"></span><div class="keysou"></div></div>
<div class="keys" id="88">X<span class="keydel"></span><div class="keysou"></div></div>
<div class="keys" id="67">C<span class="keydel"></span><div class="keysou"></div></div>
<div class="keys" id="86">V<span class="keydel"></span><div class="keysou"></div></div>
<div class="keys" id="66">B<span class="keydel"></span><div class="keysou"></div></div>
<div class="keys" id="78">N<span class="keydel"></span><div class="keysou"></div></div>
<div class="keys" id="77">M<span class="keydel"></span><div class="keysou"></div></div>
<div class="keys" id="188">,<span class="keydel"></span><div class="keysou"></div></div>
<div class="keys" id="190">.<span class="keydel"></span><div class="keysou"></div></div>
</div>
</div>
</div><!-- end #keyboard -->
	<div id="phrases">
	<div class="phraseBlock">
		<div id="p1">
			<span class="pnames">Phrase1</span>
				<img class="rcdmusic" src="resources/images/sound/rcd.png">
				<img class="rcdplay" alt="play" src="resources/images/sound/play.png">
					<span class = "delreset">
						<Button class="del" value="p1">X</Button>reset</span>
		</div>
		<div id="phrase1"></div>
	</div>
	<br>
	<div class="phraseBlock">
		<div id="p2"><span class="pnames">Phrase2</span><img class="rcdmusic" src="resources/images/sound/rcd.png"><img class="rcdplay" alt="play" src="resources/images/sound/play.png"><span class = "delreset"><Button class="del" value="p2">X</Button>reset</span></div><div id="phrase2"></div>
	</div>
	<br>
	<div class="phraseBlock">
	<div id="p3"><span class="pnames">Phrase3</span><img class="rcdmusic" src="resources/images/sound/rcd.png"><img class="rcdplay" alt="play" src="resources/images/sound/play.png"><span class = "delreset"><Button class="del" value="p3">X</Button>reset</span></div><div id="phrase3"></div>
	</div>
	<br>
	<div class="phraseBlock">
	<div id="p4"><span class="pnames">Phrase4</span><img class="rcdmusic" src="resources/images/sound/rcd.png"><img class="rcdplay" alt="play" src="resources/images/sound/play.png"><span class = "delreset"><Button class="del" value="p4">X</Button>reset</span></div><div id="phrase4"></div>
	</div>
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