<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>WebSocket chat client</title>
        <link rel="stylesheet" type="text/css" href="style.css" />
        <script type="text/javascript">
        /**
        * Executed when the page has finished loading.
        */
        window.onload = function () {

            // Create a reference for the required DOM elements.
            var nameView = document.getElementById("name-view");
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
            socket.onopen = function (event) {
                label.innerHTML = "Connection open";
            }

            /**
            * WebSocket onmessage event.
            */
            socket.onmessage = function (event) {
                if (typeof event.data === "string") {
                    
                    // Create a JSON object.
                    var jsonObject = JSON.parse(event.data);

                    // Extract the values for each key.
                    var userName = jsonObject.name;
                    var userMessage = jsonObject.message;

                    // Display message.
                    chatArea.innerHTML = chatArea.innerHTML + "<p>" + userName + " : <strong>" + userMessage + "</strong>" + "</p>";

                    // Scroll to bottom.
                    chatArea.scrollTop = chatArea.scrollHeight;
                }
                else if (event.data instanceof Blob) {

                    // Get the raw data and create an image element.
                    var blob = event.data;

                    window.URL = window.URL || window.webkitURL;
                    var source = window.URL.createObjectURL(blob);

                    var image = document.createElement("img");
                    image.src = source;
                    image.alt = "Image generated from blob";

                    document.body.appendChild(image);
                }
            }

            /**
            * WebSocket onclose event.
            */
            socket.onclose = function (event) {
                var code = event.code;
                var reason = event.reason;
                var wasClean = event.wasClean;

                if (wasClean) {
                    label.innerHTML = "Connection closed normally.";
                }
                else {
                    label.innerHTML = "Connection closed with message: " + reason + " (Code: " + code + ")";
                }
            }

            /**
            * WebSocket onerror event.
            */
            socket.onerror = function (event) {
                label.innerHTML = "Error: " + event;
            }

            /**
            * Disconnect and close the connection.
            */
            buttonStop.onclick = function (event) {
                if (socket.readyState == WebSocket.OPEN) {
                    socket.close();
                }
            }

            /**
            * Send the message and empty the text field.
            */
            buttonSend.onclick = function (event) {
                sendText();
            }

            /**
            * Send the message and empty the text field.
            */
            textView.onkeypress = function (event) {
                if (event.keyCode == 13) {
                    sendText();
                }
            }

            /**
            * Handle the drop event.
            */
            document.ondrop = function (event) {
                var file = event.dataTransfer.files[0];
                socket.send(file);

                return false;
            }

            /**
            * Prevent the default behaviour of the dragover event.
            */
            document.ondragover = function (event) {
                event.preventDefault();
            }

            /**
            * Send a text message using WebSocket.
            */
            function sendText() {
                if (socket.readyState == WebSocket.OPEN) {
                    var json = '{ "name" : "' + nameView.value + '", "message" : "' + textView.value + '" }';
                    socket.send(json);

                    textView.value = "";
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
	border: 2px solid #ccc
    box-shadow: 0px 10px 10px #ccc;
}

.clear {
    clear: both;
}</style>
    </head>
    <body>
        <header>
            <h1>HTML5 WebSocket chat</h1>
        </header>
        <article>
            <label id="status-label">Status...</label>
            <input type="text" id="name-view" placeholder="닉네임" />
            <input type="text" id="text-view" placeholder="메시지" />
            <input type="button" id="send-button" value="Send!" />
            <div class="clear"></div>
            <div id="chat-area"></div>
            <input type="button" id="stop-button" value="Disconnect" />
        </article>
        <footer></footer>
    </body>
</html>
