<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>makingMusic</title>
<script src="resources/js/jquery-3.4.1.min.js"></script>
<script src="resources/js/jquery-ui.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/howler/2.1.3/howler.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
#beatbox, #piano{
width: 1000px;
height: 80px;
white-space: nowrap;
overflow-x:hidden;
padding: 5px;
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
</style>
<script>
$( function() {
    $( "#tabs" ).tabs();
  } );
$(function(){
	var srcs = ''
	for(var i=0; i<32; i++){
		srcs = 'resources/sound/beatbox/bb'+i+'.mp3';
		var data='';
		data+='<div class="sounds">';
		data+='<img alt="'+srcs+'" src="resources/images/sound.png"><br>';
		data+='bb'+i;
		data+='</div>';

		$("#beatbox").append(data);
	}

	$('.sounds').click(function(){
		var img = $(this).find('img').attr('alt');
		sound = new Howl({
			src: [img]
		});
		sound.play();
	});
})
</script>
</head>
<body>
음악 제목 : <span id="target">임시 제목</span>
<br>
<button data-toggle="collapse" data-target="#keyboard">키패드 설정</button>
<button>트랩 추가</button>
<button>임시 저장</button>
<button>불러오기</button>
<button>음악 저장</button>
<div id="keyboard" class="collapse" style="width: 1000px">
<div id="tabs">
	<ul>
		<li><a href="#new+">create</a></li>
		<li><a href="#beatbox">beatbox</a></li>
		<li><a href="#piano">piano</a></li>
		<li><a href="#search">search</a>
	</ul>
<div id="new+">
new menu : <input type="text" id="newmenu">
<button>create</button>
</div>
<div id="beatbox">
</div>
<div id="piano">
피아노
</div>
<div id="search">sound search : <input type="text" id="soundsearch">
<button>search</button></div>
</div>
</div>
</body>
</html>