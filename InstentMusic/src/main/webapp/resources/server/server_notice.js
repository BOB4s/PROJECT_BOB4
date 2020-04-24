var http = require('http');
var express = require('express');
var app = express();

var server = http.createServer(app);
// Pass a http.Server instance to the listen method
var io = require('socket.io').listen(server);

// The server should start listening
var userList = [];
var idList = [];



// io는 socket.io 패키지 import 변수, socket은 커넥션이 성공시 커넥션 정보
io.on('connection', function(socket) {
	var addedUser = false; // 클라이언트와 연결이 완료시

	socket.on('chat message', function(msg) {

		io.emit('chat message', {
			username : socket.username,
			message : msg
		});
		console.log(socket.username + ' ' + msg);

	});

	socket.on('newFollow', function(follow_number,username) {
		if (!addedUser)
			return;
		
		io.emit('newFollow message', {
			username : username,
			follow_number:follow_number
		});


	});
	socket.on('replynotice', function(replyWriter_number , postWriter_number,mus_title) {
		if (!addedUser)
			return;
		
		io.emit('replynotice message', {
			replyWriter_number : replyWriter_number,
			postWriter_number : postWriter_number,
			mus_title : mus_title
		});


	});
	
	socket.on('postWrite', function(followerList,username,mus_title) {
		if (!addedUser)
			return;
		
	
		io.emit('postWrite message', {
			username : username,
			message : mus_title,
			followerList:followerList
		});
		console.log(username + ' ' + mus_title);
/*		socket.broadcast.emit('user logout', {
			username : socket.username,
			userlist : userList
		});*/

	});// ++ 퇴장시 유저목록에서 삭제시켜야함

	socket.on('add user', function(username) {
		if (addedUser)
			return;

		addedUser = true;
		idList[username] = socket.id;
		console.log(idList);
		socket.username = username;
		userList.push(username);
	/*	var from = "admin";*/
		console.log(username+'is login');
	/*	io.to(idList[username]).emit('chat message', {
			username : from

		})*/
/*
		socket.broadcast.emit('user joined', {
			username : socket.username,
			userlist : userList
		}); // 신규자가 왔을때 신규자 페이지를 위한 부분
*/
	});

});

server.listen(4000, function() {
	console.log('listening on *:4000');
});
