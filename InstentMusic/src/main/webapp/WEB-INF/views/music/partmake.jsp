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
	float : left;
	height : 50px;
	width : 100px;
	border: 1px solid black;
	margin : 5px 5px 5px 40px;
	font-size : 15px;
}
#p1{
	float : left;
	height : 50px;
	width : 100px;
	border: 1px solid black;
	margin : 11px 5px 5px 40px;
	font-size : 15px;
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
var path1 = 'resources/sound/drum/drum7.wav';
var path2 = 'resources/sound/drum/drum4.wav';
var path3 = 'resources/sound/drum/drum3.wav';
var path4 = 'resources/sound/drum/drum1.wav';
var mic, recorder, soundFile, soundBlob;
var amp, bpmsong, bpms, bpmprs, bpmCrtl;
var p1pat, p2pat, p3pat, p4pat, bpmpat;
var p1song, p2song, p3song, p4song;
var phrase1, phrase2, phrase3, phrase4, parts;
function setup() {
	p1song = loadSound(path1,() => {});
	p2song = loadSound(path2,() => {});
	p3song = loadSound(path3,() => {});
	p4song = loadSound(path4,() => {});

	p1pat = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
	p2pat = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
	p3pat = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
	p4pat = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
	bpmpat = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16];

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
}
function sequence(time, beatIndex){
	drawmatrix();
	
	var one = '#1-'+beatIndex;
	var two = '#2-'+beatIndex;
	var three = '#3-'+beatIndex;
	var four = '#4-'+beatIndex;
	
	$(one).css('border','1px solid red');
	$(two).css('border','1px solid red');
	$(three).css('border','1px solid red');
	$(four).css('border','1px solid red');
}
$(function(){
	$("#mixing").click(function(){
		userStartAudio();
		if(!parts.isPlaying){
			$("#mixing").text('Music Stop');
			parts.loop();
		}else{
			$("#mixing").text('Music Start');
			parts.stop();
			parts.metro.metroTicks = 0;
		}
	})
})
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
	for(var k=1; k<5; k++){
		var idx = "#Set"+k;
		$(idx).click(function(){
			getkeys("#"+this.value);
		})
	}
})
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
				$.each(resp,function(index,item){
					var idx = "#"+item.key_name;
					var cls = idx+' .keysou';
					var dels = idx+' .keydel';
					var datadel = '<Button class="keydels" value="'+item.key_number+'">X</Button>'
					$(cls).text(item.sou_name);
					$(idx).css('border','1px solid blue');
					$(dels).html(datadel);
					$(document).keydown(function(event){
						if(event.keyCode == item.key_name && $("#newset").text()==item.key_board){
							$(idx).css('background-color', 'red');
							path = item.sou_path;
							setup();
						}else{
							$(idx).css('background-color','white');
						}
					})
					$('.keydels').click(function(){
						$.ajax({
							method : 'post'
							,url : 'delkey'
							,data : {'key_number':this.value}
							,success : function(resp){
								getkeys(sets);
								}
						})
					})
				})
					$("#newment").text('Press the keys!');
			}
	})
}
$(function(){
	for(var i=1; i<5; i++){
		var prs = "#phrase"+i;
		var data = '';
		for(var j=1; j<17; j++){
			var ids = i+"-"+j;
			data += '<div class="phrase'+i+'"id="'+ids+'" style=""></div>'
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
	<button id="mixing">Music Start</button>
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
<div id="p1">Phrase1</div><div id="phrase1"></div>
<div id="p2">Phrase2</div><div id="phrase2"></div>
<div id="p3">Phrase3</div><div id="phrase3"></div>
<div id="p4">Phrase4</div><div id="phrase4"></div>
</div>
</div> 
</body>
</html>