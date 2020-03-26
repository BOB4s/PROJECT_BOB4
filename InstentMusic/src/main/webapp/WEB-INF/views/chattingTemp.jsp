<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>WebSocket chat client</title>
<script type="text/javascript">
	/**
	 * Executed when the page has finished loading.
	 */
	window.onload = function() {

		// Create a reference for the required DOM elements.
		var textView = document.getElementById("text-view");
		var buttonSend = document.getElementById("send-button");
		var buttonStop = document.getElementById("stop-button");
		var label = document.getElementById("status-label");
		var chatArea = document.getElementById("chat-area");

		// Connect to the WebSocket server!
		var socket = new WebSocket("wss://echo.websocket.org/");

		/**
		 * WebSocket onopen event.
		 */
		socket.onopen = function(event) {
			label.innerHTML = "Connection open";
		}

		/**
		 * WebSocket onmessage event.
		 */
		socket.onmessage = function(event) {
			if (typeof event.data === "string") {
				// Display message.
				chatArea.innerHTML = chatArea.innerHTML + "<p>" + event.data
						+ "</p>";

				// Scroll to bottom.
				chatArea.scrollTop = chatArea.scrollHeight;
			}
		}

		/**
		 * WebSocket onclose event.
		 */
		socket.onclose = function(event) {
			var code = event.code;
			var reason = event.reason;
			var wasClean = event.wasClean;

			if (wasClean) {
				label.innerHTML = "Connection closed normally.";
			} else {
				label.innerHTML = "Connection closed with message: " + reason
						+ " (Code: " + code + ")";
			}
		}

		/**
		 * WebSocket onerror event.
		 */
		socket.onerror = function(event) {
			label.innerHTML = "Error: " + event;
		}

		/**
		 * Disconnect and close the connection.
		 */
		buttonStop.onclick = function(event) {
			if (socket.readyState == WebSocket.OPEN) {
				socket.close();
			}
		}

		/**
		 * Send the message and empty the text field.
		 */
		buttonSend.onclick = function(event) {
			if (socket.readyState == WebSocket.OPEN) {
				socket.send(textView.value);
				textView.value = "";
			}
		}

		/**
		 * Send the message and empty the text field.
		 */
		textView.onkeypress = function(event) {
			if (event.keyCode == 13) {
				if (socket.readyState == WebSocket.OPEN) {
					socket.send(textView.value);
					textView.value = "";
				}
			}
		}
	}
</script>
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
	display: block;
	float: left;
	width: 75%;
	margin: 10px 0;
	font-style: italic;
}

#text-view {
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

.clear {
	clear: both;
}
</style>
</head>
<body>
	<header>
		<h1>HTML5 WebSocket chat</h1>
	</header>
	<article>
		<label id="status-label">Status...</label> <input type="text"
			id="text-view" placeholder="Type your message..." /> <input
			type="button" id="send-button" value="Send!" />
		<div class="clear"></div>
		<div id="chat-area"></div>
		<input type="button" id="stop-button" value="Disconnect" />
	</article>
	<footer></footer>
</body>
</html>
