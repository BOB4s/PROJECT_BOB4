<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WebSocket chat client</title>
<script src="resources/js/jquery-3.4.1.min.js"></script>
<style type="text/css">
body {
	font: 12px "Lucida Grande", Helvetica, Arial, sans-serif;
}

a {
	color: #00B7FF;
}

.background {
	background-color: black;
	padding: 15px;
	width: 80%;
}

.metest {
	text-align: right;
}

.talk {
	position: relative;
	padding: 15px;
	margin: 1em 0 1em;
	color: black;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	width: auto;
}

.talk.other {
	margin-left: 30px;
	border: 5px solid gainsboro;
	background: gainsboro;
	display: inline-block;
	border-radius: 15px;
	padding: 7px 15px;
	margin-bottom: 5px;
	margin-top: 5px;
}

.talk.me {
	margin-right: 30px;
	border: 5px solid darkgrey;
	background-color: darkgrey;
	display: inline-block;
	border-radius: 15px;
	padding: 7px 15px;
	margin-bottom: 5px;
	margin-top: 5px;
}

.talk:before {
	content: "";
	position: absolute;
	bottom: -20px;
	left: 40px;
	border-width: 20px 20px 0;
	display: block;
	width: 0;
}

.msg {
	display: inline-block;
	height: 34px;
	padding: 6px 12px;
	font-size: 14px;
	line-height: 1.42857;
	color: #555555;
	background-color: #fff;
	background-image: none;
	border: 0px solid #ccc;
	border-top-left-radius: 4px;
	border-bottom-left-radius: 4px;
}

.send {
	background-color: cadetblue;
	display: inline-block;
	margin-bottom: 0;
	font-weight: normal;
	text-align: center;
	vertical-align: middle;
	border: 0px solid transparent;
	height: 46px;
	padding: 6px 12px;
	font-size: 14px;
	line-height: 1.42857;
	border-top-right-radius: 4px;
	border-bottom-right-radius: 4px;
}

.msgbox {
	width: auto;
	height: 350px;
}

#chat-area {
	margin: 20px 0;
	padding: 20px;
	max-height: 400px;
	overflow-y: auto;
	border-radius: 20px;
	border-bottom: 1px solid #aaa;
	border-right: 1px solid #ccc;
}

#video-button {
	width: 100%;
	padding: 6px 10px;
}

#video {
	max-width: 100%;
	margin: 20px 0;
	border: 2px solid #ccc box-shadow: 0px 10px 10px #ccc;
}

.clear {
	clear: both;
}

div.friends_bar {
	margin-top: 5%;
	margin-left: 10%;
	width: 20%;
	float: left;
	box-sizing: border-box;
	background-color: white;
	border-right: 3px solid black;
	background: lightgray;
}

div.chattings {
	margin-top: 5%;
	margin-right: 10%;
	width: 60%;
	float: right;
	box-sizing: border-box;
	background-color: white;
}

div.friends_bar_list {
	margin: 20px 0;
	height: 450px;
	padding: 20px;
	max-height: 450px;
	overflow-y: auto;
}

.friends_bar_profile_rooms {
	background: white;
	padding: 1px 0px;
	border-width: 2px;
	border-style: inset;
    font-style: italic;
    text-align: center;
}
</style>
</head>
<body>
	<div id="wrapper">
		<div class="friends_bar">


			<div id="friends_bar_profile" class="friends_bar_profile"
				style="font-size: 20pt; font-family: fantasy; color: white;">대화방
				리스트</div>
			<c:forEach var="room" items="${RoomList}">
					alert("!!!!");
				<div class="friends_bar_profile_rooms"
					onclick="init(${room.messangerRoom})" >
					<div  style="text-align: left;"><img alt="여기?" src="resources/${room.oppsProfile}">${room.opponentName} </div>
				 <br> <span
						style="font-size: 10pt; color: red;">${room.howManyChecks}</span>
					${room.recentMessage} <br>
				</div>

			</c:forEach>
			<div class="friends_bar_list"></div>

		</div>
		<div class="chattings" style="font-size: 10pt; font-weight: bolder;">
			<div id="Opps_file">
				<div id="OppsImgs" style="width: 20%">${msList.oppsProfile}</div>
			</div>
			<input type="hidden" value="" id="messangerRoom"> <input
				type="hidden" value="${nickname}" id="cust_nickname">
			<div class="background">
				<div class="msgbox" id="chat-area"></div>
				<form>
					<input type="text" class="msg" id="Mes_content" autocomplete="off"
						placeholder="메시지" style="height: 50px; width: 85%;" />
					<button class="send" style="height: 50px; width: 50px;">Send</button>
				</form>
			</div>
		</div>
	</div>
	<script src="http://10.10.12.124:4000/socket.io/socket.io.js"></script>
	<script src="http://code.jquery.com/jquery-1.11.1.js"></script>
	
	<script type="text/javascript">
		var $window = $(window);
		var username = '${nickname}';
								//Need to change IP address**
		var socket = io.connect('http://10.10.12.124:4000')
		var opponentName = '${opponentName}';
		
	    var chatPage = $('.chattings');
		var buttonSend = document.getElementById("send-button");
		var label = document.getElementById("status-label");
		var chatArea = document.getElementById("chat-area");
		socket.emit('add user', username);

			chatPage.hide();
		if(${messangerRoom}!=0){
			init(${messangerRoom});
		};

		$('form').submit(function() {
			socket.emit('chat message', $('#Mes_content').val());
			sendText();
			$('#Mes_content').val('');
			return false;
		});

		socket.on('chat message', function(data) {
			if(data.username==username){
				/* var li = $('<div class  = "metest"><div class = "talk me">').append(span).append(data.message).append('</div></div>'); */
				var li = '<div class  = "metest"><div class = "talk me" ><span class="nickname">' +data.username + ' :' + data.message+ '</div></div>';

				
				}else{
					var span = $('<span class="nickname">').text(data.username).append(' : ');
					var li = $('<p class = "talk other">').append(span).append(data.message).append('<br>');
					}
				
		
			
			$('#chat-area').append(li);
		});
		Mes_content.onkeypress = function(event) {
			if (event.keyCode == 13) {
				/* 	 $('form').submit(); */
			}
		}
		document.ondrop = function(event) {
			var file = event.dataTransfer.files[0];
			socket.send(file);
			return false;
		}

		/**
		 * Prevent the default behaviour of the dragover event.
		 */
		document.ondragover = function(event) {
			event.preventDefault();
		}
		function sendText() {

			var messangerRoom = document.getElementById("messangerRoom").value;
			var cust_nickname = '${nickname}';
		

			$.ajax({
				//입력한 아이디가 사용가능한지 여부
				type : 'GET',
				url : "socketsend",
				data : {
					"messangerRoom" : messangerRoom,
					"cust_nickname" : cust_nickname,
					"Mes_content" : Mes_content.value
				},
				success : function() {
					chatArea.scrollTop = chatArea.scrollHeight;
				},
				error : function(resp) {
					alert("Error");
				}
			});

		}

		function init(messangerRoom) {
			chatPage.show();
			$.ajax({
				method : 'GET',
				url : 'pastChatGet',
				data : {
					"messangerRoom" : messangerRoom
					
				},
				success : getchated,
				error : function(resp) {
					alert("Error");
				}
			});
			document.getElementById("messangerRoom").value =messangerRoom;
			var UserName ='${nickname}';
			$.ajax({
				method : 'GET',
				url : 'getOppsName',
				data : {
					"messangerRoom" : messangerRoom,
					"UserName" : UserName
				},success :function(msList){
				 	 /* $('#Opps_file').text();  */
				 	
				 	var opData ='<img alt="여기?" src="resources/'+msList.oppsProfile+'"> : '
				 	 opData +=msList.opponentName;
					$('#Opps_file').html(opData)
					},
					error : function(resp) {
						alert("Error");
					}

				});
		}

		function getchated(resp) {
			var data = '';
			
			$.each(resp, function(index, item) {
				var chatcontent = decodeURIComponent(item.Mes_content);

				if(username==item.cust_nickname){
					data += '<div class  = "metest"><div class = "talk me" >' + item.cust_nickname + ' :' + item.mes_content
					+ '</div></div>';
					}else{
						data += '<p class = "talk other">' + item.cust_nickname + ' :' + item.mes_content
						+ '</p><br>';
						}
				
			})
			$("#chat-area").html(data);
			chatArea.scrollTop = chatArea.scrollHeight;
		}
	</script>

</body>
</html>
