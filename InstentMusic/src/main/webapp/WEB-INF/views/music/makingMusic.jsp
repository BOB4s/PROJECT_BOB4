<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
			$.each(resp,function(index,item) {
				if(item.sou_name!=null){
				var data = '';
				data += '<div class="sounds">';
				data += '<div class="soundss"><img class="soundimg" alt="'+item.fullPath+'" src="resources/images/sound/sound.png">';
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
				path = $(this).find('img').attr('alt');
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
				$.each(resp,function(index,item) {
					if(item.sou_name!=null){
					var data = '';
					data += '<div class="sounds">';
					data += '<div class="soundss"><img class="soundimg" alt="'+item.fullPath+'" src="resources/images/sound/sound.png">';
					data += '<Button class="adds" value="'+item.sou_number+'">+</Button></div>'
					data += item.sou_name;
					data += '</div>';

					$("#inbox").append(data);
					$("#target2").html(soundsearch);
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
				$('.adds').click(function(){
					
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
	$("#beatbox").click(function() {
		$("#target2").text('Beatbox');
		$("#inbox").html('');
		var srcs = ''
		for (var i = 0; i < 32; i++) {
			srcs = 'resources/sound/beatbox/bb' + i
					+ '.mp3';
			var data = '';
			data += '<div class="sounds">';
			data += '<img class="soundimg" alt="'+srcs+'" src="resources/images/sound/sound.png"><br>';
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
				data += '<img class="soundimg" alt="'+srcs+'" src="resources/images/sound/sound.png"><br>';
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
		Title of Music : <span id="target">Temporary title</span> <br>
		
		<!-- <button id="slib" data-toggle="collapse" data-target="#soundlib">Sound Library</button> -->
		<div id="slib" class="button_base btn_3d_double_roll" data-toggle="collapse" data-target="#soundlib">
			<div>Sound Library</div>
			<div>Sound Library</div>
			<div>Sound Library</div>
			<div>Sound Library</div>
		</div>
		<!-- <button data-toggle="collapse" data-target="#keyboard">Keyboard Set</button> -->
		<div class="button_base btn_3d_double_roll" data-toggle="collapse" data-target="#keyboard">
			<div>Keyboard Set</div>
			<div>Keyboard Set</div>
			<div>Keyboard Set</div>
			<div>Keyboard Set</div>
		</div>
		<!-- <button>트랩 추가</button> -->
		<div class="button_base btn_3d_double_roll">
			<div>Add Track</div>
			<div>Add Track</div>
			<div>Add Track</div>
			<div>Add Track</div>
		</div>
		<!-- <button>임시 저장</button> -->
		<div class="button_base btn_3d_double_roll">
			<div>Save temporary</div>
			<div>Save temporary</div>
			<div>Save temporary</div>
			<div>Save temporary</div>
		</div>
		<!-- <button>불러오기</button> -->
		<div class="button_base btn_3d_double_roll">
			<div>Load</div>
			<div>Load</div>
			<div>Load</div>
			<div>Load</div>
		</div>
		<!-- <button>음악 저장</button> -->
		<div class="button_base btn_3d_double_roll">
			<div>Save Music</div>
			<div>Save Music</div>
			<div>Save Music</div>
			<div>Save Music</div>
		</div>
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
					<li><button id="added" value="added">Added</button></li>
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
			loaded2();
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
});
function openNav() {
	  document.getElementById("mySidenav").style.width = "250px";
	}

function closeNav() {
	  document.getElementById("mySidenav").style.width = "0";
	}
</script>
</html>