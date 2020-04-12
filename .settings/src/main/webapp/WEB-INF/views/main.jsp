<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="http://192.168.0.84:4000/socket.io/socket.io.js"></script>
<script src="resources/js/jquery-3.4.1.min.js"></script>
<script src="resources/js/toastr.min.js"></script>
 <link href="resources/css/toastr.min.css" rel="stylesheet"/>

<script type="text/javascript">

	/* var cust_number= '${cust_number}'; */
	var username = '${nickname}';
	var socket = io.connect('http://192.168.0.84:4000');
	 toastr.options = {
			  "closeButton": true,
			  "debug": false,
			  "newestOnTop": true,
			  "progressBar": false,
			  "positionClass": "toast-bottom-right",
			  "preventDuplicates": false,
			  "showDuration": "300",
			  "hideDuration": "1000",
			  "timeOut": "500000",
			  "extendedTimeOut": "100000",
			  "showEasing": "swing",
			  "hideEasing": "linear",
			  "showMethod": "fadeIn",
			  "hideMethod": "fadeOut",
			  "onclick" : function(event){
			var opponentName = event.currentTarget.children[1].innerText
			var UserName = username;
				
			location.href = "chattingTemp?UserName=" + UserName + "&opponentName="+ opponentName;
				  }
			};

	$(function(){
		socket.emit('add user', username);

	});

	socket.on('chat message', function(data) {
		
		if(data.username==username){
			}else{
			
				var mesMain = data.message;
				var mesHead = data.username;
					}
			
		toastr["info"](mesMain, mesHead);
		
	});

	
	function chatOpen(){
		window.open("popup", "win", "width=450,height=450, left=50,up=50");
	}


	
	</script>
	
	

</head>
<body>
로그인 후 메인 페이지
<a href="musiclist">MyMusic</a>
<a href="follow">follow</a>
		<a href="profile"> 프로필 이예영</a>
		<a href="chattingTemp">채팅연습하러가기</a>
		<input type="button" value="챗방" onclick="chatOpen()">
	<input type="button" id="test1"  value="toast" onclick="toasted()">
		<a href="postWrite"> 글쓰자</a>
</body>
</html>