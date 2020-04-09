<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
#soundlib {
	margin: 10px 5px 5px 5px;
	padding: 5px 5px 5px 5px;
	width: 1020px;
	height: 220px;
	border: 1px solid black;
}

#libs, dropdown-menu {
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

.sounds img {
	width: 50px;
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

#libs button {
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
width: 150px;
}
#fronts{
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
#fronts img{
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
#addModal {
	color: #FFFFFF;
	font-size: 30px;
	text-align: center;
}
#addcom {
	width: 200px;
	height: 30px;
	font-size: 20px;
}

#addbtn, #addModal button {
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
</style>
<script>
var path, song;
$(function() {
	newbtn();
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
				name += '<li><button class="userbtn" value="'+item.sou_type+'">'+ item.sou_type+ '</button></li>'
			})
			$("#newbtn").html(name);
			$(".userbtn").click(function() {
			var soutype = $(this).val();
			$("#target2").text(soutype);
			$.ajax({
				method : 'get',
				url : 'getSounds',
				data : {
					'sou_type' : soutype
				},
				success : function(resp) {
					$("#inbox").html('');
					var cound = 0;
					$.each(resp,function(index,item) {
						if(item.sou_name!=null){
						var data = '';
						data += '<div class="sounds">';
						data += '<img alt="'+item.fullPath+'" src="resources/images/sound/sound.png"><br>';
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
						path = $(this).find('img').attr('alt');
						setup();
					});
				},
				error : function(err) {
					alert("err-getSounds");
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
$(function() {
	$("#addfolder").click(function() {
		var folname = prompt("Create a name for the new sound's folder.");

		if (folname.trim().length < 1) {
			alert("You didn't write anything.");
			return;
		} else if (folname.length > 13) {
			alert("Too long name!");
		} else {
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
	$("#beatbox").click(function() {
		$("#target2").text('Beatbox');
		$("#inbox").html('');
		var srcs = ''
		for (var i = 0; i < 32; i++) {
			srcs = 'resources/sound/beatbox/bb' + i
					+ '.mp3';
			var data = '';
			data += '<div class="sounds">';
			data += '<img alt="'+srcs+'" src="resources/images/sound/sound.png"><br>';
			data += 'bb' + i;
			data += '</div>';

			$("#inbox").append(data);
		}

		$('.sounds').click(function() {
			path = $(this).find('img').attr('alt');
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
		for (var i = 1; i < 9; i++) {
			for (var j = 0; j < 12; j++) {
				if (codes[j].num < i) {
					continue;
				}
				srcs = 'resources/sound/piano/'+ codes[j].code + i + '.mp3';
				var data = '';
				data += '<div class="sounds">';
				data += '<img alt="'+srcs+'" src="resources/images/sound/sound.png"><br>';
				data += codes[j].code + i;
				data += '</div>';

				$("#inbox").append(data);
			}
		}

		$('.sounds').click(function() {
			path = $(this).find('img').attr('alt');
			setup();
		});
	});
})
$(function(){
	$("#addfile").on("change",showfile);
	$("#addcom").keyup(function(){
		var com = $("#addcom").val();
		if(com.length>15){
			var count = com.substr(0,15);
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
var amp;
function setup() {
	var cnv = createCanvas(200, 200);
	cnv.parent('sketch-target');
	song = loadSound(path, loaded);
	amp = new p5.Amplitude();
}
function loaded() {
	song.play();
}
function loaded2(){
	song.stop();
}
function draw() {
	background(0);
	var vol = amp.getLevel();
	ellipse(100, 100, 200, vol * 200);
}
</script>
</head>
<body>
	<div id="wrapper">
		음악 제목 : <span id="target">임시 제목</span> <br>
		<button id="slib" data-toggle="collapse" data-target="#soundlib">Sound Library</button>
		<button data-toggle="collapse" data-target="#keyboard">Keyboard Set</button>
		<button>트랩 추가</button>
		<button>임시 저장</button>
		<button>불러오기</button>
		<button>음악 저장</button>
		<br>
		<div id="soundlib" class="collapse">
		<div id="fronts">
			<span style="font-size: 50px;">Sound Library</span>
			<br>
			<img alt="soundlibrary" src="resources/images/sound/soundlibrary.png">
			<span id="target2"></span>
		</div>
			<div id="bags">
				<div id="libs">
				<ul>
					<li><button id="beatbox" value="Beatbox">Beatbox</button></li>
					<li><button id="piano" value="Piano">Piano</button></li>
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
	</div>
	<div id="keyboard" class="collapse">자판</div>
	<br>
	
	<div id="addModal" class="modal">
			<span class="close">&times;</span>
			<span id="sketch-target"></span><br>
			<form id="form_upload" enctype="multipart/form-data" action="/file/upload" method="post">
				<input type="file" id="addfile" accept="audio/*">
			</form>
							file : <span id="target4"></span>
				<div class="dropdown dropright">
    <button type="button" class="dropdown-toggle" data-toggle="dropdown">Library</button>
    <span id="target3"></span>
    <div class="dropdown-menu">
    	<span id="newbtn2"></span>
    </div>
    </div>
    Sound Name : <input type="text" id="addcom">&nbsp;
			<input id="addbtn" type="button" value="Add Sound">
		</div>
</body>
<script>
$(function(){
	var modal = document.getElementById("addModal");
	var img = document.getElementById("addSound");
	
		img.onclick = function(){
			  modal.style.display = "block";
			  newbtn2();
			  
			  var span = document.getElementsByClassName("close")[0];
				span.onclick = function(){
					$("#target4").text('');
					loaded2();
				modal.style.display = "none";
			  };
		};
});
</script>
</html>