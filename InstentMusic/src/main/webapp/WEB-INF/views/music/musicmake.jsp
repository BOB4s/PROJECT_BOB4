<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
#soundlib{
margin: 5px 5px 5px 5px;
padding: 7px 7px 7px 7px;
width:1020px;
height:200px;
border: 1px solid black;
}
#libtitle{
font-size: 30px;
}
#libs{
width:1000px;
height : 60px;
white-space: nowrap;
overflow-x:hidden;
}
#inbox{
width: 1000px;
height: 80px;
white-space: nowrap;
overflow-x:hidden;
padding: 5px;
background-color: #FAFAFA;
text-align: center;
}
.sounds{
float: left;
font-size : 10px;
text-align: center;
padding: 5px;
}
.sounds img{
width: 50px;
}
input{
width: 150px;
}
#searchbtn{
font-size: 15px;
margin-top: 15px;
margin-left: 20px;
}
#libs button {
margin-right:10px;
margin-top: 15px;
height : 30px;
background-color: #FFFFFF;
color: black;
box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2), 0 3px 10px 0 rgba(0,0,0,0.19);
}
#editmenu, #editsound{
float : right;
margin-right:10px;
margin-top: 10px;
font-size: 15px;
}
</style>
<script>
var path, song;
$(function(){
	newbtn();
})
function newbtn(){
	var name ='';
	$.ajax({
		method : 'get'
		,url : 'getSoundlib'
		,success : function(resp){
				if(resp!=null){
					$.each(resp,function(index,item){
						name += '<button class="newbtn">'+item.sou_type+'</button>'
					})
					$("#newbtn").html(name);
				}else{
					alert("no folders");
				}
			}
		,error : function(err){
				alert('err-getSounds-type');
			}
	})
}
$(function(){
	$("#editmenu").click(function(){
		
	})
})
$(function(){
	$("#addfolder").click(function(){
		var folname = prompt("Create a name for the new sound's folder.");

		if (folname.trim().length<1) {
		  alert("You didn't write anything.");
		  return;
		}else if(folname.length>13){
			alert("Too long name!");
		}else {
		  var data = {'sou_type':folname};
		  $.ajax({
				method : 'post'
				,url : 'insertSound'
				,data : data
				,success : function(resp){
						if(resp==1){
							newbtn();
						}else{
							alert("Fail");
						}
					}
				,error : function(err){
						alert("err-insertSound");
					}
			})
		}
	});
	$("#beatbox").click(function(){
		$("#inbox").html('');
		var srcs = ''
		for(var i=0; i<32; i++){
			srcs = 'resources/sound/beatbox/bb'+i+'.mp3';
			var data='';
			data+='<div class="sounds">';
			data+='<img alt="'+srcs+'" src="resources/images/sound.png"><br>';
			data+='bb'+i;
			data+='</div>';
	
			$("#inbox").append(data);
		}
	
		$('.sounds').click(function(){
			path = $(this).find('img').attr('alt');
			setup();
		});
	});
})
var amp;
function setup(){
	var cnv = createCanvas(200,200);
	cnv.parent('sketch-target');
	song = loadSound(path, loaded);
	amp = new p5.Amplitude();
}
function loaded(){
	song.play();
}
function draw(){
	background(0);
	var vol = amp.getLevel();
	ellipse(100,100,200,vol * 200);
}
</script>
</head>
<body>
<div id="wrapper">
음악 제목 : <span id="target">임시 제목</span>
<br>
<button id="slib" data-toggle="collapse" data-target="#soundlib">Sound Library</button>
<button data-toggle="collapse" data-target="#keyboard">Keyboard Set</button>
<button>트랩 추가</button>
<button>임시 저장</button>
<button>불러오기</button>
<button>음악 저장</button>
<br>
<div id="soundlib" class="collapse">
<div id="libtitle">
Sound Library <span id="searchbtn">sound search : <input type="text" id="soundsearch">
<button>search</button></span>
<button id="editmenu" data-toggle="modal" data-target="#menuModel">edit menu</button>
<button id="editsound">edit sound</button>
</div>
<div id="libs">
<button id="beatbox">Beatbox</button>
<button id="piano">Piano</button>
<span id="newbtn"></span>
<button id="addfolder">+</button>
</div>
<div id="inbox"><br>- empty- </div>
</div>
</div>
<div id="keyboard" class="collapse">
자판
</div>
<br>
<div id="sketch-target"></div>
<!-- The Modal -->
  <div class="modal" id="menuModal">
    <div class="modal-dialog modal-dialog-scrollable">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h1 class="modal-title">Modal Heading</h1>
          <button type="button" class="close" data-dismiss="modal">×</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          <h3>Some text to enable scrolling..</h3>
          <p>Some text to enable scrolling.. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
          <p>Some text to enable scrolling.. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>

          <p>Some text to enable scrolling.. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
</body>
</html>