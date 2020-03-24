<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>InstentMusic</title>
<script src="resources/js/jquery-3.4.1.min.js"></script>
<script src="resources/js/jquery-ui.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/howler/2.1.3/howler.min.js"></script>
<script>
$(function(){
	var i = 0 ;
	 
	function fname(){

		   i++;
		   var data = "touch A,S,D,F,J,K,L,; in your keyboard"
				data+= "<br><br>"+i
		   $("#target").html(data);
	  }

	var sound1 = new Howl({
	      src: ['resources/sound/beatbox/bb31.mp3']
	    });
	var sound2 = new Howl({
	      src: ['resources/sound/beatbox/bb29.mp3']
	    });
	var sound3 = new Howl({
	      src: ['resources/sound/beatbox/bb27.mp3']
	    });
	var sound4 = new Howl({
	      src: ['resources/sound/beatbox/bb25.mp3']
	    });
	var sound5 = new Howl({
	      src: ['resources/sound/beatbox/bb30.mp3']
	    });
	var sound6 = new Howl({
	      src: ['resources/sound/beatbox/bb28.mp3']
	    });
	var sound7 = new Howl({
	      src: ['resources/sound/beatbox/bb26.mp3']
	    });
	var sound8 = new Howl({
	      src: ['resources/sound/beatbox/bb24.mp3']
	    });

	$(document).keydown(function(event){
		if (event.keyCode == '65') {
		    sound1.play();
		}
		if (event.keyCode == '83') {
		    sound2.play();
		}
		if (event.keyCode == '68') {
		    sound3.play();
		}
		if (event.keyCode == '70') {
		    sound4.play();
		}
		if (event.keyCode == '74') {
		    sound5.play();
		}
		if (event.keyCode == '75') {
		    sound6.play();
		}
		if (event.keyCode == '76') {
		    sound7.play();
		}
		if (event.keyCode == '186') {
		    sound8.play();
		}
		if(i>30||i==0){
			Howler.volume(0.0);
		}else{
			Howler.volume(1.0);
			}
	})
	/*1초마다 fname 함수 실행*/
	$(document).keydown(function(event){
		if(event.keyCode=='13'){
			var refreshIntervalId = setInterval(function(){
				fname();
				if(i>30){
				     clearInterval(refreshIntervalId);
				     var data = "Do you want more play?"
						 data+="<br><br>Please LogIn!"
				     $("#target").html(data);
				}
			},1000);
		}
	});
})
</script>
</head>
<body>
	<div id="wrapper">
		<h1>첫페이지데스</h1>
		<a href="login">로그인</a>
		<a href="join">회원가입</a>
		<br><br>
		<span id="target">please touch Enter!</span>
	</div>
</body>
</html>