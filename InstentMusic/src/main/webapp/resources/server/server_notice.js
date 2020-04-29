var http = require('http');
var express = require('express');
var app = express();

var server = http.createServer(app);
// Pass a http.Server instance to the listen method
var io = require('socket.io').listen(server);

// The server should start listening
var userList = [];
var idList = [];
var id2List = [];


// io는 socket.io 패키지 import 변수, socket은 커넥션이 성공시 커넥션 정보
io.on('connection', function(socket) {
	var addedUser = false; 
	socket.on('disconnect', function(username) {
		if (!addedUser)
			return;
		
		idList[socket.username] = socket.id;
		id2List[socket.username] = username;
		console.log(idList);
		console.log(id2List);
		console.log(socket.username + '접속 종료' );	
		var index = idList.indexOf(socket.username);
		var index2 = id2List.indexOf(username);
		var index3=idList.splice(index, 1);
		idList.splice(index, 1);
		id2List.splice(index2, 1);
		console.log(index);
		console.log(index2);
		console.log(index3);
		idList[socket.username] = socket.id;
		id2List[socket.username] = username;
		console.log(idList);
		console.log(id2List);
	})

	
	socket.on('chat message', function(msg,srcdata) {

		io.emit('chat message', {
			username : socket.username,
			message : msg,
			srcdata:srcdata
		});
		console.log(socket.username + ' ' + msg);

	});

	socket.on('newFollow', function(follow_number,username,follower_number) {
		if (!addedUser)
			return;
		
		io.emit('newFollow message', {
			username : username,
			follow_number:follow_number,
			follower_number:follower_number
		});


	});
	socket.on('replynotice', function(replyWriter_number , postWriter_number,mus_title,post_number) {
		if (!addedUser)
			return;
		
		io.emit('replynotice message', {
			replyWriter_number : replyWriter_number,
			postWriter_number : postWriter_number,
			mus_title : mus_title,
			post_number:post_number
		});


	});
	
	socket.on('postWrite', function(followerList,username,mus_title,mus_number,cust_number) {
		if (!addedUser)
			return;
		
		io.emit('postWrite message', {
			cust_number:cust_number,
			username : username,
			mus_number:mus_number,
			message : mus_title,
			followerList:followerList
		});
		console.log(followerList + ' ' + mus_title);


	});

	socket.on('add user', function(username) {
		if (addedUser)
			return;

		addedUser = true;
		idList[username] = socket.id;
		console.log(idList);
		socket.username = username;
		userList.push(username);
		console.log(username+'is login');

	});

});

server.listen(4000, function() {
	console.log('listening on *:4000');
});
