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
	margin-top: 10px;
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
</style>
<script>
var song, path;
var premusic;
$(function() {
	newbtn();
	gettemp();
})
function newbtn2(){
	var name2 = ''; 
		$.ajax({
			method : 'get',
			url : 'getSoundlib',
			success : function(resp) {	
				if (resp != null) {
					name2+='<ul>'
					$.each(resp,function(index, item) {
						if(item.sou_type=='added'){
							return true;
						}
						name2 += '<li><button class="dropdown-item" value="'+item.sou_type+'">'+ item.sou_type+ '</button></li>'
					})
					name2+='</ul>'
					$("#newbtn2").html(name2);
					$(".dropdown-item").click(function() {
						var soutype = $(this).val();
						$("#target3").text(soutype);
					})
					}
					}
			,error : function(resp){
				alert("err-getSounds2");
				}
		})
 }
function newbtn() {
var name = '';
$.ajax({
	method : 'get',
	url : 'getSoundlib',
	success : function(resp) {
		if (resp != null) {
			$.each(resp,function(index, item) {
				if(item.sou_type=='added'){
					return true;
				}
				name += '<li><button class="userbtn" value="'+item.sou_type+'">'+ item.sou_type+ '</button></li>'
			})
			$("#newbtn").html(name);
			$(".userbtn").click(function() {
			var soutype = $(this).val();
			var libname = soutype;
				libname+= '<img alt="'+soutype+'" src="resources/images/sound/sledit.png" id="editlib">'
				libname+= '<img alt="'+soutype+'" src="resources/images/sound/sldelete.png" id="deletelib">'
				$("#target2").html(libname);
			gets(soutype);
			$("#editlib").click(function(){
				var folname = prompt("Please write a new name for "+this.alt);

				if (folname.trim().length < 1) {
					alert("You didn't write anything.");
					return;
				} else if (folname.length > 10) {
					alert("Too long name!");
				} else {
					var data = {
						'sou_type' : this.alt
						,'new_type' : folname
					};
					$.ajax({
						method : 'post',
						url : 'editlib',
						data : data,
						success : function(resp) {
							if (resp !=0) {
								newbtn();
								var libname = folname;
								libname+= '<img alt="'+folname+'" src="resources/images/sound/sledit.png" id="editlib">'
								libname+= '<img alt="'+folname+'" src="resources/images/sound/sldelete.png" id="deletelib">'
								$("#target2").html(libname);
								gets(folname);
							} else {
								alert("Fail");
							}
						},
						error : function(err) {
							alert("err-insertSound");
						}
					})
				}
				})
			$("#deletelib").click(function(){
				var answer = confirm("If you delete this library, all sound files in it will also be deleted. Do you still want to delete it?")
				if(answer){
					$.ajax({
						method : 'post'
						,url : 'deletelib'
						,data : {'sou_type':this.alt}
						,success : function(resp){
								if(resp!=0){
									alert('deleted!');
									newbtn();
									$("#target2").html('');
									$("#inbox").html('');
								}else{
									alert('delete fail');
								}
							}
						})
				}
			})
			})
		} else {
			alert("no folders");
		}
	},
	error : function(err) {
		alert('err-getSoundlib');
	}
})
}
function gets(soutype){
	loaded2();
	$.ajax({
		method : 'get',
		url : 'getSounds',
		data : {
			'sou_type' : soutype
		},
		success : function(resp) {
			$("#inbox").html('');
			var cound = 0;
			premusic = {};
			$.each(resp,function(index,item){
				var songname = 'song'+index;
				var songpath = item.fullPath;

				premusic[songname] = songpath;
				if(item.sou_name!=null){
				var data = '';
				data += '<div class="sounds">';
				data += '<div class="soundss"><img class="soundimg" draggable="true" ondragstart="drag(event)" id="'+item.fullPath+'" alt="'+item.sou_name+'" src="resources/images/sound/sound.png">';
				data += '<Button class="del" value="'+item.sou_number+'">X</Button></div>'
				data += item.sou_name;
				data += '</div>';

				$("#inbox").append(data);
				cound ++;
				}
			})
			if(cound==0){
				$("#inbox").append('<br>- empty -');
			}
			$('.sounds').click(function() {
				path = $(this).find('img').attr('id');
				setup();
			});
			$('.del').click(function(){
				var answer = confirm("Are you sure you want to delete this sound?")
				loaded2();
				if(answer){
					$.ajax({
						method : 'post'
						,url : 'deletelib'
						,data : {'sou_number':this.value
								,'sou_type':soutype}
						,success : function(resp){
								if(resp!=0){
									loaded2();
									alert('deleted!');
									newbtn();
									gets(soutype);
									loaded2();
								}else{
									alert('delete fail');
								}
							}
						})
				}
				})
		},
		error : function(err) {
			alert("err-getSounds");
		}
	})
}
$(function(){
	$("#searchbtn").click(function(){
		var soundsearch = $("#soundsearch").val();
		$.ajax({
			method : 'get'
			,url : 'searchsound'
			,data : {'search':soundsearch}
			,success : function(resp){
				$("#inbox").html('');
				var cound = 0;
				premusic = {};
				$.each(resp,function(index,item){
					var songname = 'song'+index;
					var songpath = item.fullPath;
					premusic[songname] = songpath;
					if(item.sou_name!=null){
					var data = '';
					data += '<div class="sounds">';
					data += '<div class="soundss"><img class="soundimg" draggable="true" ondragstart="drag(event)" id="'+item.fullPath+'" alt="'+item.sou_name+'" src="resources/images/sound/sound.png">';
					data += '<Button class="adds" value="'+item.sou_number+'">+</Button></div>'
					data += item.sou_name;
					data += '</div>';

					$("#inbox").append(data);
					$("#target2").html(soundsearch);
					cound ++;
					}
				})
				if(cound==0){
					$("#target2").html(soundsearch);
					$("#inbox").append('<br>- empty -');
				}
				$('.sounds').click(function() {
					path = $(this).find('img').attr('id');
					setup();
				});
				$('.adds').click(function(){
					loaded2();
					$.ajax({
						method : 'post'
						,url : 'insertSound'
						,data : {'sou_type' : 'added','sou_name' : this.value}
						,success : function(resp){
								if(resp!=0){
									loaded2();
									alert('added!');
									}
							}
						})
				})
			}
		})
	})
})
$(function() {
	$("#addfolder").click(function() {
		var folname = prompt("Create a name for the new sound's folder.");

		if (folname.trim().length < 1) {
			alert("You didn't write anything.");
			return;
		} else if (folname.length > 10) {
			alert("Too long name!");
		}else {
			var data = {
				'sou_type' : folname
			};
			$.ajax({
				method : 'post',
				url : 'insertSound',
				data : data,
				success : function(resp) {
					if (resp == 1) {
						newbtn();
						var libname = folname;
						libname+= '<img alt="'+folname+'" src="resources/images/sound/sledit.png" id="editlib">'
						libname+= '<img alt="'+folname+'" src="resources/images/sound/sldelete.png" id="deletelib">'
						$("#target2").html(libname);
						gets(folname);
					} else {
						alert("Fail");
					}
				},
				error : function(err) {
					alert("err-insertSound");
				}
			})
		}
	});
	$("#added").click(function(){
		$("#target2").html('Added');
			gets('added');
		})
	$("#beatbox").click(function() {
		$("#target2").text('Beatbox');
		$("#inbox").html('');
		var srcs = ''
			premusic = {};
		for (var i = 0; i < 32; i++) {
			srcs = 'resources/sound/beatbox/bb' +i+ '.mp3';
			var songname = 'bb'+i;
			var songpath = srcs;
			premusic[songname] = songpath;
			var data = '';
			data += '<div class="sounds">';
			data += '<img class="soundimg" draggable="true" ondragstart="drag(event)" id="'+srcs+'" alt="bb'+i+'" src="resources/images/sound/sound.png"><br>';
			data += 'bb' + i;
			data += '</div>';

			$("#inbox").append(data);
		}

		$('.sounds').click(function() {
			path = $(this).find('img').attr('id');
			setup();
		});
	});
	$("#drum").click(function() {
		$("#target2").text('Drum');
		$("#inbox").html('');
		var srcs = ''
			premusic = {};
		for (var i = 0; i < 29; i++) {
			srcs = 'resources/sound/drum/drum' +i+ '.wav';
			var songname = 'drum'+i;
			var songpath = srcs;
			premusic[songname] = songpath;
			var data = '';
			data += '<div class="sounds">';
			data += '<img class="soundimg" draggable="true" ondragstart="drag(event)" id="'+srcs+'" alt="drum'+i+'" src="resources/images/sound/sound.png"><br>';
			data += 'drum' + i;
			data += '</div>';

			$("#inbox").append(data);
		}

		$('.sounds').click(function() {
			path = $(this).find('img').attr('id');
			setup();
		});
	});
	$("#piano").click(function() {
		$("#target2").text('Piano');
		$("#inbox").html('');
		var srcs = ''
		var codes = [{'code' : 'c','num' : 7},
			{'code' : 'db','num' : 7},
			{'code' : 'd','num' : 7},
			{'code' : 'eb','num' : 7},
			{'code' : 'e','num' : 7},
			{'code' : 'f','num' : 7},
			{'code' : 'gb','num' : 6},
			{'code' : 'g','num' : 7},
			{'code' : 'ab','num' : 7},
			{'code' : 'a','num' : 8},
			{'code' : 'bb','num' : 7},
			{'code' : 'b','num' : 7}]
		premusic = {};
		for (var i = 1; i < 9; i++) {
			for (var j = 0; j < 12; j++) {
				if (codes[j].num < i) {
					continue;
				}
				srcs = 'resources/sound/piano/'+ codes[j].code + i + '.mp3';
				var songname = codes[j].code + i;
				var songpath = srcs;
				premusic[songname] = songpath;
				var data = '';
				data += '<div class="sounds">';
				data += '<img class="soundimg" draggable="true" ondragstart="drag(event)" id="'+srcs+'" alt="'+codes[j].code + i+'" src="resources/images/sound/sound.png"><br>';
				data += codes[j].code + i;
				data += '</div>';

				$("#inbox").append(data);
			}
		}

		$('.sounds').click(function() {
			path = $(this).find('img').attr('id');
			setup();
		});
	});
})
$(function(){
	$("#addfile").on("change",showfile);
	$("#addcom").keyup(function(){
		var com = $("#addcom").val();
		if(com.length>10){
			var count = com.substr(0,10);
			$("#addcom").val(count);
			}
		})
	$("#addbtn").click(function(){
		var fileCheck = document.getElementById("addfile").value;
	    if(!fileCheck){
	        alert("Please add Sound's file.");
	        return;
	    }
	})
})
function showfile(sfile){
	var file = this.files[0];
    var fileName = file.name;
    $("#target4").text(fileName);
	var files = sfile.target.files;
	var filesArr = Array.prototype.slice.call(files);
	filesArr.forEach(function(f){
			var reader = new FileReader();
			reader.onload = function(sfile){
				path = sfile.target.result;
				setup();
			}
			reader.readAsDataURL(f);

			$("#addbtn").click(function(){
				if(fileName==null){
					alert("Please add Sound's file.");
					return;
				}
				
				var cum = $("#addcom").val();
				if(cum.trim().length<1){
					alert("Create a name for the new sound.");
					return;
					}
				var library = $("#target3").text();
				if(library.trim().length<1){
					alert("Please select library");
					return;
					}
				
				var formData = new FormData();
				 
				   formData.append("file", $("#addfile")[0].files[0]);
				   formData.append("sou_type",library)
				   formData.append("sou_name", cum);
				   $("#addfile").val('');
				$.ajax({
				    type : "POST",
				    url : 'sendFile',
				    data : formData,
				    processData: false,
				    contentType: false,
				    success : function(resp) {
				        if(resp=='success'){
				            alert("Success!");
				            newbtn();
							var libname = library;
							libname+= '<img alt="'+library+'" src="resources/images/sound/sledit.png" id="editlib">'
							libname+= '<img alt="'+library+'" src="resources/images/sound/sldelete.png" id="deletelib">'
							$("#target2").html(libname);
							$("#addcom").val('');
							$("#target3").text('');
							gets(library);
				        }else{
				            alert("Fail");
				        }
				    },
				    err : function(resp) {
				        alert("err-sendfile");
				    }
				}); 
				$("#target4").text('');
				loaded2();
				var modal = document.getElementById('addModal');
							modal.style.display = "none";
			});
	})
}
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
	var modal = document.getElementById("addModal");
	var img = document.getElementById("addSound");
	var img2 = document.getElementById("addRcd");
	
		img.onclick = function(){
			loaded2();
			$("#addbtn").attr("type","button");
			$("#rcdbtn").attr("type","hidden");
			$("#form_upload").removeAttr("hidden");
			$("#form_upload2").attr("hidden","hidden");
			$("#hid").removeAttr("hidden");
			  modal.style.display = "block";
			  newbtn2();
			  
			  var span = document.getElementsByClassName("close")[0];
				span.onclick = function(){
					$("#target4").text('');
					$("#addcom").val('');
					$("#target3").text('');
					$("#addfile").val('');
					loaded2();
				modal.style.display = "none";
			  };
		};

		img2.onclick = function(){
				loaded2();
				$("#addbtn").attr("type","hidden");
				$("#rcdbtn").attr("type","button");
				$("#form_upload2").removeAttr("hidden");
				$("#form_upload").attr("hidden","hidden");
				$("#hid").attr("hidden","hidden");
				modal.style.display = "block";
				  newbtn2();
				  
				  var span = document.getElementsByClassName("close")[0];
					span.onclick = function(){
						$("#target4").text('');
						$("#addcom").val('');
						$("#target3").text('');
						$("#addfile").val('');
						$("#recordstop").attr("hidden","hidden");
						$("#recordstart").removeAttr("hidden");
						state = 1;
						loaded2();
					modal.style.display = "none";
				  };
			}
});
var btnc=0;
$(function(){
	$("#bpmplay").click(function(){
		var txt = $("#bpmplay").text();
		if(txt=='play'){
			$("#bpmplay").text('stop');
			btnc++;
			loadbpm();
		}else{
			$("#bpmplay").text('play');
			btnc=0;
			loaded2();
		}
	})
})
var mic, recorder, soundFile, soundBlob;
var fft, bpmsong, bpms, bpmprs, bpmCrtl;
var bpmpat, w;
function preload(){
	for(var key in premusic){
		key = loadSound(premusic[key]);
	}
}
function setup() {
	var cps = new p5.Compressor()
		cps.set(0.7, 35, 15, -40, 0.1);
	for(var key in premusic){
		key.play;
	}
	var cvs = createCanvas(256,256);
	cvs.parent('sketch-target');
	colorMode(HSB);
	angleMode(DEGREES);
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
	song = loadSound(path,loaded);
	fft = new p5.FFT(0.8, 128);
	w = width / 64;
	  fft.setInput(song);
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
function draw() {
	  background(0);
	  var spectrum = fft.analyze();
	  noStroke();
	  translate(width/2, height/2);
	 // beginShape();
	  for (var i = 0; i < spectrum.length; i++) {
		var angle = map(i,0,spectrum.length,0,360);
		var amp = spectrum[i];
		var r = map(amp, 0, 256, 20, 100);
		//fill(i, 255, 255);
		var x = r * cos(angle);
		var y = r * sin(angle);
		stroke(i,255,255);
		line(0,0,x,y);
		//vertex(x,y);
		//var y = map(amp, 0, 256, height, 0);
		//rect(i*w, y, w-2, height - y);
	  }
	  //endShape();
	}
function loadbpm(){
	bpmsong.play();
	bpms.loop();
}
function recordstart(){
	userStartAudio();

	  // make sure user enabled the mic
	  if (state === 0 && mic.enabled) {
		  fft.analyze();
	    // record to our p5.SoundFile
	    fft.setInput(mic);
	    recorder.record(soundFile);

	  }
	  else if (state === 1) {

		    // stop recorder and
		    // send result to soundFile
		    recorder.stop();

		  }

		  else if (state === 2) {
		    soundFile.play(); // play the result!
		    fft.setInput(soundFile);
		    state++;
		    soundBlob = soundFile.getBlob();
		  }
}
var vol;
function loaded() {
	vol = fft.analyze();
	song.play();
}
function loaded2(){
	song.stop();
	bpms.stop();
}
$(function(){
	$("#rcdbtn").click(function(){
		if(soundBlob==null){
			alert("please start Record");
			return;
		}
		var cum = $("#addcom").val();
		if(cum.trim().length<1){
			alert("Create a name for the Record.");
			return;
			}
		var library = $("#target3").text();
		if(library.trim().length<1){
			alert("Please select library");
			return;
			}
		
		var formData = new FormData();
		 
		   formData.append("file", soundBlob);
		   formData.append("sou_type",library)
		   formData.append("sou_name", cum);

		$.ajax({
			method : 'post'
			,url : 'sendFile'
			,data : formData,
			processData: false,
		    contentType: false,
		    success : function(resp) {
		        if(resp=='success'){
		            alert("Success!");
		            newbtn();
					var libname = library;
					libname+= '<img alt="'+library+'" src="resources/images/sound/sledit.png" id="editlib">'
					libname+= '<img alt="'+library+'" src="resources/images/sound/sldelete.png" id="deletelib">'
					$("#target2").html(libname);
					$("#addcom").val('');
					$("#target3").text('');
					gets(library);
		        }else{
		            alert("Fail");
		        }
		    }
		})
		   
		   soundFile = new p5.SoundFile();
		$("#target4").text('');
		loaded2();
		var modal = document.getElementById('addModal');
					modal.style.display = "none";
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
function drag(ev) { 
	ev.dataTransfer.setData("fullpath", ev.target.id);
	ev.dataTransfer.setData("name", ev.target.alt);
}
function drop(ev) {
	ev.preventDefault(); 
	var c = ev.dataTransfer.getData("fullpath"); 
	var d = ev.dataTransfer.getData("name");
	var tagid = '#'+ev.target.id;
	var tagcls = tagid+' .keydel';
	$(tagid).css('background-color','white');

	var sets = $("#newset").text();
	if($(tagcls).html()==''){
	var data = {
				'key_board' : sets
				,'sou_path' : c
				,'sou_name' : d
				,'key_name' : ev.target.id
			}
	$.ajax({
		method : 'post'
		,url : 'insertkey'
		,data : data
		,success : function(resp){
				getkeys(sets);
			}
	})
	}else{
		var btn = tagcls+' .keydels';
		var vals = $(btn).val();
		var data = {
				'sou_path' : c
				,'sou_name' : d
				,'key_number' : vals
		}
		$.ajax({
			method : 'post'
			,url : 'updatekey'
			,data : data
			,success : function(resp){
					getkeys(sets);
				}
		})
	}
}
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
			var cound = 0;
				premusic = {};
				$.each(resp,function(index,item){
					var songname = 'song'+index;
					var songpath = item.sou_path;
	
					premusic[songname] = songpath;
					var idx = "#"+item.key_name;
					var cls = idx+' .keysou';
					var dels = idx+' .keydel';
					var datadel = '<Button class="keydels" value="'+item.key_number+'">X</Button>'
					$(cls).text(item.sou_name);
					$(idx).css('border','1px solid blue');
					$(dels).html(datadel);
					cound++;
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
				if(cound==0){
					$("#newment").text('Drag and drop a sound to the keyboard on the right!');
				}else{
					$("#newment").text('Press the keys!')
				}
			}
	})
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
$(function(){
	var idx = 0;
	$("#addpart").click(function(){
		idx++;
		var divs = '<div class="part" id="part'+idx+'">'
			divs+= '<div class="phrase1"></div>'
			divs+= '<div class="phrase2"></div>'
			divs+= '<div class="phrase3">No Phrase</div>'
			divs+= '<div class="phrase4"></div>'
			divs+= '<div class="partbtn"><button class="delpart" value="'+idx+'">X</button><button class="gotomake" value="'+idx+'">Make Music</button>'
			divs+= '<button class="playpart" value="'+idx+'">▷</button></div>'
			divs+= '</div>'
		$("#parts").append(divs);
		var ids = "#part"+idx;

		$(".delpart").on('click',function(){
			alert($(this).val());
			var delid = "#part"+$(this).val();
			$(delid).remove();
		})

		$(".playpart").on('click',function(){
			alert($(this).val());
		})

		$(".gotomake").click(function(){
			location.href="partmake?part_number="+$(this).val()+"&&temp_bpm="+$('#bpmnum').text();
		})
	})
})
</script>
</head>
<body>
<!-- Top for logo and navibar -->
	 <nav class="navigation">
		<div class="navigation__column">
			<a href="home"><img class="logo" alt="home" src="resources/images/home/im_logo_w.jpg">
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
		<div id="slib" class="button_base btn_3d_double_roll" data-toggle="collapse" data-target="#setmus">
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
		<br><br>
		<div id="musinfo">
	Music Title : <span id="title"></span>&emsp;/&emsp;
	BPM : <span id="bpmnum">80</span>&emsp;<input id="bpmbar" type="range" value="80" min="30" max="200">&nbsp;<button id="bpmplay">play</button>&emsp;/&emsp;
	<button id="mixing">All in One Mixing</button>
	</div>
		<div id="setmus" class="collapse">
		<div id="soundlib">
		<div class="fronts">
			<span style="font-size: 50px;">Sound Library</span>
			<br>
			<img alt="soundlibrary" src="resources/images/sound/soundlibrary.png">
			<span id="target2"></span>
		</div>
			<div id="bags">
				<div class="libs">
				<ul>
					<li><button id="added" value="added">Added</button></li>
					<li><button id="beatbox" value="Beatbox">Beatbox</button></li>
					<li><button id="piano" value="Piano">Piano</button></li>
					<li><button id="drum" value="Drum">Drum</button></li>
					<span id="newbtn"></span>
				</ul>
				</div>
				<div class="inputbtn">Sound Search : <input type="text" id="soundsearch">
				<button id="searchbtn">Search</button></div>
				<div id="icons">
				<img id="addfolder" alt="libadd" src="resources/images/sound/libadd.png">
				<img id="addSound" alt="soundadd" src="resources/images/sound/soundadd.png">
				<img id="addRcd" alt="mic" src="resources/images/sound/mic.png">
				</div>
			</div>
			<div id="inbox">
				<br>- Empty -
			</div>
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
</div>
<div id="parts">
</div>
	<div id="addModal" class="modal">
			<span class="close">&times;</span>
			<span id="sketch-target"></span><br>
			<form id="form_upload" enctype="multipart/form-data" action="/file/upload" method="post">
				<input type="file" id="addfile" accept="audio/*">
			</form>
			<div id="form_upload2">
				<img id="recordstart" alt="record" src="resources/images/sound/rcd.png">
				<img id="recordstop" alt="stop" src="resources/images/sound/stop.png" hidden="hidden">
				<img id="recordplay" alt="play" src="resources/images/sound/play.png">
			</div>
						<span id="hid"> file : <span id="target4"></span></span>
				<div id = "hid2" class="dropdown dropright">
    <button type="button" class="dropdown-toggle" data-toggle="dropdown">Library</button>
    <span id="target3"></span>
    <div class="dropdown-menu">
    	<span id="newbtn2"></span>
    </div>
    </div>
    Sound Name : <input type="text" id="addcom">&nbsp;
		<input id="addbtn" type="button" value="Add Sound">
		<input id="rcdbtn" type="hidden" value="Add Record">
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