<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Instent Music</title>
<script src="resources/js/jquery-3.4.1.min.js"></script>
<script src="resources/js/jquery-ui.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/howler/2.1.3/howler.min.js"></script>
<script>
$(function(){
	var i = 0 ;
	 
	function fname(){
		   i++;
		   var data = "press A~Z in your keyboard"
				data+= "<br><br>"+i
		   $("#target").html(data);
	  }

	var sounds = new Array();
	for(var j=0; j<26; j++){
		sounds[j] = new Howl({
			src: ['resources/sound/beatbox/bb'+j+'.mp3']
		});
	}
	
	$(document).keydown(function(event){
		for(var k=0; k<26; k++){
			var idx = k+65;
			if(event.keyCode == idx){
				sounds[k].play();
			}
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
		<a href="profile"> 프로필 이예영</a>

		<br><br>
		<span id="target">Please press Enter!</span>
	</div>
</body>
</html>