<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WebSocket chat client</title>
<script src="resources/js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="resources/css/styles.css">
<link rel="stylesheet"href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/css/navigation.css">
<link rel="stylesheet" href="resources/css/sideMenuBar.css">
<link rel="stylesheet" href="resources/css/main.css">
<script src="resources/js/toastr.min.js"></script>
 <link href="resources/css/toastr.min.css" rel="stylesheet"/>
<style type="text/css">
html{

    margin-left: 11%;
    margin-right: 11%;
    background: beige;
    	}
body {
	font: 12px "Lucida Grande", Helvetica, Arial, sans-serif;
}

a {
	color: #00B7FF;
}

.background {
	
	width: 90%;
}

.metest {
	text-align: right;
}
.youtest {
	text-align: left;
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
    border: beige;
    background: beige;
	display: inline-block;
	border-radius: 15px;
	padding: 7px 15px;
	margin-bottom: 5px;
	margin-top: 5px;
}

.talk.me {
	margin-right: 30px;
    border: lightgreen;
    background: lightgreen;
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
	width: 100%;
	     height: 370px;
}

#chat-area {
	margin: 20px 0;
	padding: 20px;

}
#wrapper{
    height: 752px;
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
	  position: fixed;
    top: 10.7%;
    left: 11.6%;
    margin-top: %;
    /* margin-left: 10%; */
    width: 21.3%;
    float: left;
    box-sizing: border-box;
    background-color: white;
    border-right: 1px solid lightgray;
}

div.chattings {
position: fixed;
    left: 33%;
    top: 17.4%;
    width: 55.5%;
	float: right;
	box-sizing: border-box;
	background-color: white;
	max-height: 800px;
    overflow-y: auto;
}

div.chattings_data {
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
	max-height: 800px;
	overflow-y: auto;
}

.friends_bar_profile_rooms {
	background: white;
	/* padding: 1px 0px; */
	    padding: 10px;
	/* border-width: 2px;
	border-style: inset; */
    font-style: italic;
    text-align: center;
      border-left-style: groove;
    border-left-color: cyan;
    background: aliceblue;

}
.friends_bar_profile_rooms.active {
	background: white;
	padding: 1px 0px;
	/* border-width: 2px;
	border-style: inset; */
    font-style: italic;
    text-align: center;
 

}
.opps_profile{
	font-size: 15pt; position: fixed; 
	 left: 33.01%;
    top: 10.7%;
    width: 55.5%;
	height: 6.4%;
	background: white;

  }
  .opps_orifile_img{
     border-radius: 50%;
    transform-style: preserve-3d;
    transition: transform 0.5s linear;
    height: 45px;
    margin-left: 15px;
    text-align: center;
  }
   #data_notis {
position: absolute;
    right: 9%;
    top: 9.4%;
 	width: 30.5%;
	float: right;
	box-sizing: border-box;
	background-color: white;
	max-height: 800px;
    overflow-y: auto;
    height: 400px;
    background: white;
    z-index: 4;
}
.nav-counter {

 position:absolute;
 top: -1px;
 left: 60%;
 line-height: 20px;
 margin-top: -11px;
 padding: 0 6px;
 font-weight: normal;
 font-size: small;
 color: white;
 text-align: center;
 text-shadow: 0 1px rgba(0, 0, 0, 0.2);
 background: #e23442;
 border: 1px solid #911f28;
 border-radius: 11px;
 background-image: -webkit-linear-gradient(top, #e8616c, #dd202f);
 background-image: -moz-linear-gradient(top, #e8616c, #dd202f);
 background-image: -o-linear-gradient(top, #e8616c, #dd202f);
 background-image: linear-gradient(to bottom, #e8616c, #dd202f);
 -webkit-box-shadow: inset 0 0 1px 1px rgba(255, 255, 255, 0.1), 0 1px rgba(0, 0, 0, 0.12);
 box-shadow: inset 0 0 1px 1px rgba(255, 255, 255, 0.1), 0 1px rgba(0, 0, 0, 0.12);
}
.opps_profile_1{
	font-size: 15pt; position: fixed; 
	 left: 33.01%;
    top: 10.7%;
    width: 55.5%;
	height: 6.4%;
	background: white;

  }
  .opps_orifile_img_1{
     border-radius: 50%;
    transform-style: preserve-3d;
    transition: transform 0.5s linear;
    height: 45px;
    margin-left: 15px;
    margin-top: 15px;
    text-align: center;
      
  }
  .opps_main_css_1{
  
   border-left-style: groove;
    border-left-color: cyan;
    background: aliceblue;
    height: 60px;
  }
</style>
</head>
<body> 
	<div id="wrapper" >
	<div id="data_notis"> </div>
<nav class="navigation">
		<div class="navigation__column">
			<a href="main"><img class="logo" alt="home" src="resources/images/home/im_logo_w.jpg">
			</a>
		</div>
		<div class="navigation__column">
			<i class="fa fa-search"></i> <input type="text" placeholder="Search">
		</div>
	
		<div class="navigation__column">
			<div class="navigations__links">
				<div class="navigation__list-item"><a 
					class="navigation__link" onclick="chatOpen()"><i class="fa fa-send-o"></i>
				</a></div>
				<div class="navigation__list-item"><a 
					class="navigation__link" onclick="noti_getBycust_number()"><i class="fa fa-bell-o"><span class="nav-counter">new</span>
					</i>
				</a></div>
				<div class="navigation__list-item"  >
					<span style="font-size:20px;cursor:pointer" onclick="openNav()">&#9776;</span>
				</div>
			</div>
			
			
			
			<div id="mySidenav" class="sidenav">
			  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
			  <a href="musiclist"><i class="fa fa-music"></i> Music List</a>
			  <a href="profile"><i class="fa fa-user-o"> Profile</i></a>
			  <a href="follow"><i class="fa fa-user-plus"></i> Follow</a>
			  <a href="chattingTemp" ><i class="fa fa-comments-o "></i> Texting</a>
			  <a href="logout"><i class="fa fa-power-off"></i> Logout</a>
			</div>
		</div>
	</nav>
		<div class="friends_bar">


			<div id="friends_bar_profile" class="friends_bar_profile"
				style="font-size: 20pt; font-family: fantasy; color: black;">대화방
				리스트</div>
				<div class="friends_bar_list">
					
			<c:forEach var="room" items="${RoomList}">
			 
				<div class="friends_bar_profile_rooms"
					onclick="init(${room.messangerRoom})" >
					<div id="opps_profile_imgs" style=" width: 30%;">
						<div id="opps_profile_imgs_inner" style="float: left;">
						<c:if test="${room.oppsProfile!=null}">
						
						<img class = "opps_orifile_img" alt="" src="<c:url value="/image/${room.oppsProfile}"/>"/>
					</c:if>
						<!-- <img class = "opps_orifile_img" alt="???" src="resources/images/goyang.jpg"> -->
						</div>
					<%-- <img alt="" src="resources/${room.oppsProfile}"> --%>
					
					</div>
					<div  style="text-align: right; width: 90%;">
					<span style="border: thick;font-size: 12pt;font-weight: bold;">${room.opponentName} </span>
				 <br> <span
						style="font-size: 10pt; color: red;">${room.howManyChecks}</span>
					${room.recentMessage} <br>
					</div>
				</div>	
		
			</c:forEach>
			
</div>
		</div>
			<div id="Opps_file"  class= "opps_profile" >
				<div id="OppsImgs" style="width: 20%">${msList.oppsProfile}</div>
				
			</div>
		<div id="chattings" class="chattings" style="font-size: 10pt; font-weight: bolder;">
		
			<input type="hidden" value="" id="messangerRoom"> <input
				type="hidden" value="${nickname}" id="cust_nickname">
			<div class="background">
				<div class="msgbox" id="chat-area"></div>
				
			</div>
			
		</div>
	<div class="chattings_data">
	<form style="position: fixed;width: 59%;top: 74.2%;left: 33%;">
					<input type="text" class="msg" id="Mes_content" autocomplete="off"
						placeholder="메시지" style="height: 50px; width: 85%; border:1px solid lightgray;" />
					<button class="send" style="height: 50px; width: 50px;">Send</button>
				</form>
	
	</div>
	<div class="new_footer_sign">
	<footer class="footer" style=" position: fixed;top: 85%;left: 20%;">
		<div class="footer__column">
			<nav class="footer__nav">
				<ul class="footer__list">
					<li class="footer__list-item"><a href="#" class="footer__link">About
							Us</a></li>
					<li class="footer__list-item"><a href="#" class="footer__link">Support</a></li>
					<li class="footer__list-item"><a href="#" class="footer__link">Blog</a></li>
					<li class="footer__list-item"><a href="#" class="footer__link">Press</a></li>
					<li class="footer__list-item"><a href="#" class="footer__link">Api</a></li>
					<li class="footer__list-item"><a href="#" class="footer__link">Jobs</a></li>
					<li class="footer__list-item"><a href="#" class="footer__link">Privacy</a></li>
					<li class="footer__list-item"><a href="#" class="footer__link">Terms</a></li>
					<li class="footer__list-item"><a href="#" class="footer__link">Directory</a></li>
					<li class="footer__list-item"><a href="#" class="footer__link">Language</a></li>
				</ul>
			</nav>
		</div>
		<div class="footer__column">
			<span class="footer__copyright">© 2020 IM!</span>
		</div>
	</footer>
		</div>
	</div>
	<script src="http://192.168.0.21:4000/socket.io/socket.io.js"></script>
	<script src="http://code.jquery.com/jquery-1.11.1.js"></script>
	
	<script type="text/javascript">
	var $window = $(window);
	var username = '${nickname}';
							//Need to change IP address**
	var socket = io.connect('http://192.168.0.21:4000');

	var opponentName = '${opponentName}';
	var cust_number = '${cust_number}' ;
	var data_flag = 0;
    var chatPage = $('.chattings');
    var chattings_data = $('.chattings_data');
    var Opps_file_data = $('#Opps_file')
	var buttonSend = document.getElementById("send-button");
	var label = document.getElementById("status-label");
	var chatArea = document.getElementById("chat-area");
	 toastr.options = {
			  "closeButton": true,
			  "debug": false,
			  "newestOnTop": true,
			  "progressBar": false,
			  "positionClass": "toast-bottom-right",
			  "preventDuplicates": true,
			  "showDuration": "300",
			  "hideDuration": "1000",
			  "timeOut": "5000",
			  "extendedTimeOut": "1000",
			  "showEasing": "swing",
			  "hideEasing": "linear",
			  "showMethod": "fadeIn",
			  "hideMethod": "fadeOut",
			  "onclick" : function(event){
			var toastr_kind = event.currentTarget.children[1].children[0].value;
			if(toastr_kind == 'CHAT'){
				  
			var opponentName = event.currentTarget.children[1].innerText
			var UserName = username;
			
		 location.href = "chattingTemp?UserName=" + UserName + "&opponentName="+ opponentName; 
				  }
			  // mus 로 post번호로 찾아감
			if(toastr_kind == 'POST'){
				
				var mus_number =  event.currentTarget.children[2].children[1].value;
				location.href = "postGetOne?mus_number=" + mus_number ; 
					  }
			if(toastr_kind == 'Follow'){
				
				var opponentName = event.currentTarget.children[1].innerText
				var cust_number =  event.currentTarget.children[2].children[0].value;
			  location.href = "proDetail?cust_number=" + cust_number ;
					  }
			if(toastr_kind == 'Reply'){
				var mus_title
				var opponentName = event.currentTarget.children[1].innerText
				var post_number =event.currentTarget.children[2].children[0].value;
			
			 location.href = "postGetOne?post_number=" + post_number ; 
					  }
		
			  }	
			};


	socket.on('chat message', function(data) {
		
		if(data.username==username){
			}else{
			
				var mesMain = data.message;
				var mesHead = "<input type='hidden'  name='toastr_kind' value='CHAT' >"+data.username;
					}
			
		toastr["info"](mesMain, mesHead);
		
	});
	socket.on('postWrite message', function(data) {
			$.each(data.followerList,function(index, item) {
				if(item==cust_number){
					var cust_number2 = data.cust_number;
				var mesMain = data.username+"님이 올린 새글"+ data.message+"<input type='hidden'  name='cust_number' value='"+data.cust_number2+"' ><input type='hidden'  name='mus_number' value='"+data.mus_number+"' >";
				var mesHead = "<input type='hidden'  name='toastr_kind' value='POST' > 알림" ;
				
				toastr["info"](mesMain, mesHead);
					}
			});

	});
	socket.on('newFollow message', function(data) {
			if(data.follow_number==cust_number){
				
				var mesMain = data.username+"님이 회원님을  팔로우하기 시작하였습니다.<input type='hidden'  name='cust_number' value='"+data.follower_number+"' > ";
				var mesHead = "<input type='hidden'  name='toastr_kind' value='Follow' > 알림" ;
			
			toastr["info"](mesMain, mesHead);
			
			} 

	});


	socket.on('replynotice message', function(data) {
		if(data.postWriter_number==cust_number){
		var mesMain = data.replyWriter_number+"님이 "+data.mus_title+"글에 댓글을 달았습니다.<input type='hidden'  name='post_number' value='"+data.post_number+"' >";
		var mesHead = "<input type='hidden'  name='toastr_kind' value='Reply' > 알림" ;

	toastr["info"](mesMain, mesHead);
		}


	});


	function getNotis(resp){

		 var data = "<div id = 'noti_list_thing'>"
			 $.each(resp,function(index, item) {
					
					 	data += ' <div class="opps_profile_imgs_1" >'
						data +='<div class="opps_profile_imgs_inner_1" style="float: left;">'
						data += '<img class = "opps_orifile_img_1" alt="" src="<c:url value="/image/'+item.not_savedData+'"/>"/></div>'
						data +='<div  class="opps_main_css_1" style ="padding-top: 15px;" ><span style="border: thick;font-size: 12pt;font-weight: bold;"></span>' 
							
						data +='<span style ="margin-left: 20px;">'+item.not_content+'</span>'; 
								
							data += "</div></div></div>";
						});
		data += '</div>'

		$("#data_notis").html(data); 

		
		if(data_flag==0){
			$("#data_notis").show();
			data_flag++;
			}else if(data_flag==1){
				$("#data_notis").hide();
				data_flag--;
				}
	}


	$(function() {
		socket.emit('add user', username);
		$("#data_notis").hide(); 
		chatPage.hide();
		chattings_data.hide();
		Opps_file_data.hide();
	});
	
if(${messangerRoom}!=0){
	init(${messangerRoom});
};
		
		$('form').submit(function() {
			/*  = $('#newOpps_data')[0].currentSrc; */
			var srcdata = $('#newOpps_data')[0].value;
			 socket.emit('chat message', $('#Mes_content').val(),srcdata); 
			
			noti_save();
			sendText();
			$('#Mes_content').val('');
			return false;
		});

		socket.on('chat message', function(data) {
			if(data.username==username){
				/* var li = $('<div class  = "youtest"><div class = "talk me">').append(span).append(data.message).append('</div></div>'); */
				var li = '<div class  = "metest"><div class = "talk me" ><span class="nickname">'+ data.message+ '</div></div>';

				
				}else if(data.username==opponentName){
					
				var  li = '<div class  = "mett"><img class = "opps_orifile_img" alt="" src="<c:url value="/image/'+data.srcdata+'"/>"/> '+data.username  +'<br><div class = "talk other" ><span class="nickname">' + data.message+ '</div></div>';	
					/* var span = $('<span class="nickname">').text(data.username).append(' : ');
					var li = $('<p class = "talk other">').append(span).append(data.message).append('<br>'); */
			/* var li ='<p class = "talk other">' + data.username + ' :' + data.message+'</p><br>';
 */
					}
			document.getElementById('chattings').scrollTop = document.getElementById('chattings').scrollHeight;
		
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
					document.getElementById('chattings').scrollTop = document.getElementById('chattings').scrollHeight;

					
				},
				error : function(resp) {
					alert("Error");
				}
			});

		}

		function init(messangerRoom) {
			chatPage.show();
			chattings_data.show();
			Opps_file_data.show();
		

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
				 	/* '+msList.oppsProfile+' */
				 	var opData ='<input id ="newOpps_data" type="hidden" value="'+msList.oppsProfile+'">';
				 	 opData +=msList.opponentName+"의 메세지";
					$('#Opps_file').html(opData);
					
					/* $('#Opps_file').append('<input type="button" onclick="messages_delete_before_confirm()"  value="delete" style="width: 80px" ><input type="hidden" name="messangerRoom" id="messangerRoom" value="messangerRoom">'); */
					opponentName =msList.opponentName;
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
					data += '<div class  = "metest"><div class = "talk me" >'  + item.mes_content
					+ '</div></div>';
					}else{
						
						data+=	 '<div class  = "mett"><img class = "opps_orifile_img" alt="???"  src="<c:url value="/image/'+item.mes_savefile+'"/>"/>'+item.cust_nickname  +'<br><div class = "talk other" ><span class="nickname">' + item.mes_content+ '</div></div>';	
	
						}
				
			})
			document.getElementById('chattings').scrollTop = document.getElementById('chattings').scrollHeight;
			$("#chat-area").html(data);
			
		}

	
		function openNav() {
			  document.getElementById("mySidenav").style.width = "250px";
			}

		function closeNav() {
			  document.getElementById("mySidenav").style.width = "0";
			}
		function noti_save(){
			var not_content  =opponentName;
			var not_cust_number = cust_number;
			var not_sender_number ='${cust_number}';
			var not_type = 'CHAT';
			$.ajax({
				method : 'GET',
				url : 'noti_save',
				data : {
					"not_sender_number":not_sender_number,
					"not_cust_number" : not_cust_number,
					"not_content" : not_content,
					"not_type" : not_type
				}

			});

			}
		function chatOpen(){
			window.open("popup", "win", "width=450,height=450, left=50,up=50");
		}

		function noti_getBycust_number(){
			
			$.ajax({
				method : 'GET',
				url : 'noti_getBycust_number',
				success : getNotis,
				error : function(resp) {
					alert("Error");
				}
			})

			}
		/* function messages_delete_before_confirm(){
			
			alert(messangerRoom);
			} */ 
	</script>

</body>
</html>
