<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WebSocket chat client</title>
<script src="resources/js/jquery-3.4.1.min.js"></script>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	font-family: "Helvetica Neue", Helvetica, "Segoe UI", Arial, sans-serif;
}

body {
	background: #dcdcdc;
	font-size: 1em;
}

header, article, footer {
	width: 600px;
	margin: 0 auto;
}

h1 {
	font-family: "Helvetica Neue Light", "Segoe UI Light", sans-serif;
	font-size: 3em;
	margin: 50px 0;
	color: #333;
	text-shadow: 1px 1px 1px #fff;
}

#status-label {
	display: block; x ` width : 75%;
	margin: 10px 0;
	font-style: italic;
}

#text-view, #name-view {
	float: left;
	width: 70%;
	padding: 5px 10px;
}

#send-button, #stop-button {
	float: right;
	width: 20%;
	padding: 6px 10px;
}

#chat-area {
	margin: 20px 0;
	padding: 20px;
	max-height: 400px;
	overflow-y: auto;
	border-radius: 20px;
	border-bottom: 1px solid #aaa;
	border-right: 1px solid #ccc;
	box-shadow: 0px 10px 10px #ccc;
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
	margin-top :5%;
	margin-left: 10%; width : 20%;
	float: left;
	box-sizing: border-box;
	background-color: white;
	border-right: 3px solid black;

	}

div.chattings {
	margin-top :5%;
	margin-right: 10%; width : 60%;
	float: right;
	box-sizing: border-box;
	background-color: white;
}
div.friends_bar_list{
    margin: 20px 0;
    height: 450px;
    padding: 20px;
    max-height: 450px;
    overflow-y: auto;
	
	
}
</style>
</head>
<body>
	<div id="wrapper">
		<div class="friends_bar">
			자기 프로필 
				<div class="friends_bar_profile">
				
				
				</div>
			
				<div class="friends_bar_list">
				
				
				
				</div>
			</div>
			<!-- 		<div class="inbox_list_fullscrollable_chatrooms">
			<div class="chatrooms_inner"
				style="height: 78px; overflow: hidden; width: 267px; padding-right: 30px">
				<ul class="chatroomList_lists">
					<li class="inbox__item">
						<div tabindex="0" class="inboxItem_picture"></div> <time class="relativeTime" title="Posted on 27 March 2020 13:42" datetime="sysdate"></time>
					</li>
				</ul>

			</div>

		</div> -->



		</div>
		<div class="chattings">
			Jaysland&nbsp;&nbsp;&nbsp;<input type="button" value="버튼을 넣어요">
			<input type="hidden" value="${opp.Name}"> <input
				type="hidden" value="1" id="messangerRoom"> <input
				type="hidden" value="7777" id="sender_number">

			<ul id="chat-area"></ul>
			<form>
				<input type="text" id="Mes_content" autocomplete="off"
					placeholder="메시지" style="height: 50px; width: 85%;" />
				<button style="height: 50px; width: 50px;">Send</button>
			</form>

		</div>
	</div>
	<script src="http://10.10.12.92:4000/socket.io/socket.io.js"></script>
	<script src="http://code.jquery.com/jquery-1.11.1.js"></script>
	<script type="text/javascript">
		var $window = $(window);

		var username = "tempUser";

		var socket = io.connect('http://10.10.12.92:4000');

		var buttonSend = document.getElementById("send-button");
		var label = document.getElementById("status-label");
		var chatArea = document.getElementById("chat-area");

		socket.emit('add user', username);
		init();

		$('form').submit(function() {
			socket.emit('chat message', $('#Mes_content').val());
			sendText();
			$('#Mes_content').val('');
			return false;
		});

		socket.on('chat message', function(data) {
			var span = $('<span class="nickname">').text(data.username).append(
					' : ');
			var li = $('<li>').append(span).append(data.message);
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
			var sender_number = document.getElementById("sender_number").value;

			$.ajax({
				//입력한 아이디가 사용가능한지 여부
				type : 'GET',
				url : "socketsend",
				data : {
					"messangerRoom" : messangerRoom,
					"sender_number" : sender_number,
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

		function init() {
			/* var messangerRoom = ${messageList.messangerRoom}; */
			var messangerRoom = 1;
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
			})

		}

		function getchated(resp) {
			var data = '';
			$.each(resp, function(index, item) {

				var chatcontent = decodeURIComponent(item.Mes_content);
				data += '<li>' + item.sender_number + ' :' + item.mes_content
						+ '</li>';
			})
			$("#chat-area").html(data);
			chatArea.scrollTop = chatArea.scrollHeight;
		}
	</script>

</body>
</html>
