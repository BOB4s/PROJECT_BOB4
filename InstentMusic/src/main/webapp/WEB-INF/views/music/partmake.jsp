<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" buffer="4096kb" autoFlush="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MusicMake</title>
<script src="resources/js/jquery-3.4.1.min.js"></script>
<script src="resources/js/jquery-ui.min.js"></script>
<script src="resources/js/p5.min.js"></script>
<script src="resources/js/p5.sound.min.js"></script>
<script src="resources/js/sketch.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<style>
body{
margin : 10px 10px 10px 10px;
overflow-y: hidden;
}
#keyboard{
	margin : 0 auto;
	margin-top : 10px;
	padding: 5px 5px 5px 5px;
	width: 1020px;
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
	padding : 5px;
	padding-top: 10px;
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
	padding : 5px;
	padding-top: 10px;
}
#phrases{
	margin : 0 auto;
}
.phrase1, .phrase2, .phrase3, .phrase4{
	height : 50px;
	border: 1px solid black;
	width : 60px;
	float : left;
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
</style>
<script>
var song, path;
$(function() {
})
var state = 3;
$(function(){
	$("#recordstart").click(function(){
		$("#recordstart").attr("hidden","hidden");
		$("#recordstop").removeAttr("hidden");
		state = 0;
		recordstart();
	})
	$("#recordstop").click(function(){
		$("#recordstop").attr("hidden","hidden");
		$("#recordstart").removeAttr("hidden");
		state = 1;
		recordstart();
	})
	$("#recordplay").click(function(){
		state = 2;
		recordstart();
	})
})
$(function(){
	for(var k=1; k<5; k++){
		var idx = "#Set"+k;
		$(idx).click(function(){
			getkeys("#"+this.value);
		})
	}
})
var premusic;
function getkeys(sets){
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
				premusic = {};
				$.each(resp,function(index,item){
					var songname = 'song'+index;
					var songpath = item.sou_path;

					premusic[songname] = songpath;
					
					var idx = "#"+item.key_name;
					var cls = idx+' .keysou';
					var dels = idx+' .keydel';
					$(cls).text(item.sou_name);
					$(idx).css('border','1px solid blue');
					$(document).keydown(function(event){
						if(event.keyCode == item.key_name && $("#newset").text()==item.key_board){
							$(idx).css('background-color', 'red');
							path = item.sou_path;
							setup();
						}else{
							$(idx).css('background-color','white');
						}
					})
				})
					$("#newment").text('Press the keys!');
			}
	})
}
var path1 = 'resources/sound/drum/drum0.wav';
var path2 = 'resources/sound/drum/drum1.wav';
var path3 = 'resources/sound/drum/drum2.wav';
var path4 = 'resources/sound/drum/drum3.wav';
var mic, recorder, soundFile, soundBlob;
var amp, bpmsong, bpms, bpmprs, bpmCrtl;
var p1pat, p2pat, p3pat, p4pat, bpmpat;
var p1song, p2song, p3song, p4song;
var phrase1, phrase2, phrase3, phrase4, parts;
var beat = 0;
function preload(){
	for(var key in premusic){
		key = loadSound(premusic[key]);
	}
}
function setup() {
	//var cps = new p5.Compressor()
	//cps.set(0.2, 30, 13, -15, 0);
	for(var key in premusic){
		key.play;
	}
	
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

	p1 = new p5.Part();
	p2 = new p5.Part();
	p3 = new p5.Part();
	p4 = new p5.Part();

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

	song = loadSound(path,loaded);
	amp = new p5.Amplitude();
	amp.setInput(song);
	 // create an audio in
	  mic = new p5.AudioIn();

	  // prompts user to enable their browser mic
	  mic.start();

	  // create a sound recorder
	  recorder = new p5.SoundRecorder();

	  // connect the mic to the recorder
	  recorder.setInput(mic);

	  // this sound file will be used to
	  // playback & save the recording
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
	var c1 = '.phrase1';
	var c2 = '.phrase2';
	var c3 = '.phrase3';
	var c4 = '.phrase4';

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
			p4.stop();
			p1.stop();
			p2.stop();
			p3.stop();
			bpms.stop();

		}else{
			$("#musicall").text('Music Start');
			parts.stop();
			drawmatrix();
			parts.metro.metroTicks = 0;
		}
	})
	$(".rcdmusic").click(function(){
		targetm = $(this).parent().attr('id');
		var ment1 = ['Press','the','space','bar','to','start','recording'];
		if(targetp == 'p1'){
			for(var i=0; i<7; i++){
				var cls = '1-'+(i+1);
				$(cls).text(ment1[i]);			
			}
		}
	})
	$(".rcdplay").click(function(){
		userStartAudio();
		targetp = $(this).parent().attr('id');
		if(targetp == 'p1'){
			if(!p1.isPlaying){
				$(this).attr('src','resources/images/sound/stop.png');
				p1.start();
				p2.stop();
				p3.stop();
				p4.stop();
				bpms.stop();
				parts.stop();
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
				p3.stop();
				p4.stop();
				p1.stop();
				bpms.stop();
				parts.stop();
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
				p1.stop();
				p2.stop();
				p4.stop();
				bpms.stop();
				parts.stop();
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
				p1.stop();
				p2.stop();
				p3.stop();
				bpms.stop();
				parts.stop();
			}else{
				$(this).attr('src','resources/images/sound/play.png');
				p4.stop();
				drawmatrix();
				p4.metro.metroTicks = 0;
			}
		}
	})
})
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
function rcdcss(time, beatIndex){
	if(beatIndex==17){
		$(".rcdplay").attr('src','resources/images/sound/play.png');
	}
	drawmatrix();
	var target;
	if(targetp == 'p1'){
		target = '#1-'+beatIndex;
	}
	if(targetp == 'p2'){
		target = '#2-'+beatIndex;
	}
	if(targetp == 'p3'){
		target = '#3-'+beatIndex;
	}
	if(targetp == 'p4'){
		target = '#4-'+beatIndex;
	}
	$(target).css('border','1px solid red');
	$(target).css('background-color','#F5BCA9')
}
function recordstart(){
	userStartAudio();

	  // make sure user enabled the mic
	  if (state === 0 && mic.enabled) {
		  amp.getLevel(0);
	    // record to our p5.SoundFile
	    amp.setInput(mic);
	    recorder.record(soundFile);

	  }
	  else if (state === 1) {

		    // stop recorder and
		    // send result to soundFile
		    recorder.stop();

		  }

		  else if (state === 2) {
		    soundFile.play(); // play the result!
		    amp.setInput(soundFile);
		    state++;
		    soundBlob = soundFile.getBlob();
		  }
}
var vol;
function loaded() {
	vol = amp.getLevel();
	song.play();
}
function loaded2(){
	song.stop();
	bpms.stop();
}
$(function(){
		/* var formData = new FormData();
		 
		   formData.append("file", soundBlob);

		$.ajax({
			method : 'post'
			,url : 'sendFile'
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
		   soundFile = new p5.SoundFile(); */
})
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
</script>
</head>
<body>
	<div id="wrapper">
	<a href="makingMusic"><button id="backto">Return Back</button></a>
		<button id="resetpart">Reset</button>
		<button id="savepart">Save Part</button><br>
		<div id="musinfo">
	Part Number : <span id="partnumber">${part_number}</span>&emsp;/&emsp;
	BPM : <span id="bpmnum">${temp_bpm}</span>&emsp;/&emsp;
	<button id="mixing">BPM Start</button>&emsp;/&emsp;
	<button id="musicall">Music Start</button>
	</div>
	<div id="keyboard">
	<div class="fronts">
		<span style="font-size: 50px;">Key Board</span>
		<br>
		<div class="libs" style="height:130px;">
			<ul>
				<li><button id="Set1" value="Set1">Set1</button></li>
				<li><button id="Set2" value="Set2">Set2</button></li>
				<li><button id="Set3" value="Set3">Set3</button></li>
				<li><button id="Set4" value="Set4">Set4</button></li>			
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
</html>