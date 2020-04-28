<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://10.10.12.92:4000/socket.io/socket.io.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<link rel="stylesheet" href="resources/css/navigation.css">
<link rel="stylesheet" href="resources/css/sideMenuBar.css">
<link rel="stylesheet" href="resources/css/3d_double_roll_btn.css">
<script src="resources/js/toastr.min.js"></script>
<style type="text/css">
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
 <link href="resources/css/toastr.min.css" rel="stylesheet"/>
<title>글쓰기</title>



<script  type="text/javascript">


var start_Page = -1;
var cust_number = '${cust_number}';
var username = '${nickname}';

var data_flag = 0;
var socket = io.connect('http://10.10.12.92:4000');
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
			  console.log(event);
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
				console.log(item)
				
				 	data += ' <div class="opps_profile_imgs_1" >'
					data +='<div class="opps_profile_imgs_inner_1" style="float: left;">'
					data += '<img class = "opps_orifile_img_1" alt="" src="<c:url value="/image/'+item.not_savedData+'"/>"/></div>'
					data +='<div  class="opps_main_css_1" style ="padding-top: 15px;" ><span style="border: thick;font-size: 12pt;font-weight: bold;"></span>' 
						
					data +='<span style ="margin-left: 20px;">'+item.not_content+'</span>'; 
							
						data += "</div></div></div>";
					});
	data += '</div>'

		 console.log(data);
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
		
function getTags() {
		  var mus_number = document.getElementById("mus_number").value;
		  var cust_number = document.getElementById("cust_number").value;
		  var mus_title = document.getElementById("mus_title").value;
		  var mus_time = document.getElementById("mus_time").value;
		  var post_nickname = document.getElementById("post_nickname").value;
		  var post_content = document.getElementById("post_content").value;
		  var post_url = document.getElementById("post_url").value;
		 
						$.ajax({
							type : "POST"
							,url : "post_write_save"
							,data : {
								"mus_number":mus_number
								,"cust_number":cust_number
								,"mus_title":mus_title				
								,"mus_time":mus_time
								,"post_content":post_content
								,"post_nickname":post_nickname
								,"post_url":post_url
							}
							,success : function(resp){
								
								var post_content = document.getElementById("post_content").value;
								  var post_content = $("#post_content").val();
								 $("#result_content").text(post_content);
							  var tags_List = [];
									  post_content = post_content.replace(/#[^#\s,;]+/gm, function(post_content) {
										  tags_List.push(post_content);
									  });
							for(var i in tags_List){	
								//깨짐
								if(tags_List[i].length<5){
								$.ajax({
									type : "GET"
									,url : "tag_write_save"
									,data : {
										"resp" :resp
									 	,"text" : tags_List[i] }					
								})
								};
							}
						}
					})
					postnotice(mus_title);
					};

	function postnotice(mus_title){
		var followerList = new Array();
		var mus_number  =document.getElementById("mus_number").value;
		console.log(${followerList});
		$.each(${followerList},function(index, item) {
			followerList[index] = item;
			 noti_save(item);
				});
		 
		 socket.emit('postWrite',followerList,username,mus_title,mus_number,cust_number);	
		 location.href = "main";
		}


	function noti_save(item){
	
		var not_cust_number =  item;
		var not_content  =document.getElementById("mus_number").value;
		var not_sender_number  = '${cust_number}';
		var not_type = 'POST';
		$.ajax({
			method : 'GET',
			url : 'noti_save',
			data : {
				"not_sender_number":not_sender_number,
				"not_cust_number":not_cust_number,
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
	</script>




</head>
<body >
	<!-- Top for logo and navibar -->
	 <nav class="navigation">
		<div class="navigation__column">
			<a href="home"><img class="logo" alt="home" src="resources/images/home/im_logo_w.jpg">
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
			  <a href="chattingTemp"><i class="fa fa-comments-o "></i> Texting</a>
			  <a href="logout"><i class="fa fa-power-off"></i> Logout</a>
			</div>
		</div>
	</nav>
<div id="wrapper">
<div id="data_notis"></div>
<%-- <div id = "homereturner">
			<c:url var="home" value="resources/images/homeimg.png"></c:url>
			<c:url var="root" value="/"></c:url>
			<a href="${root}"><img src="${home}" width="30px"></a>
			</div> --%>
<h2 style="text-align: center; color: white;">글 작성</h2><br><br><br>
<div style="width: 60%; text-align: center; margin: auto;">
 <span style="color: white;">제목을 입력해주세요</span>
 <div id="writeForm">
	
		<textarea id="post_content" rows="10" cols="50"placeholder="설명을 작성해주세요"></textarea>
			<br><br>
	
	<!-- 3d double roll button for posting -->
	<div class="button_base btn_3d_double_roll">
        <div>Posting</div>
        <div>Posting</div>
        <div>Posting</div>
        <div>Posting</div>
	</div>

		<!-- <input id="subBtn" type="button" value="글 태그 추출" style="float: right; margin-right: 100pt;" onclick="getTags()"/> -->
	<!-- <div id="subBtn" class="button_base btn_3d_double_roll" onclick="getTags()"> -->
	<div  class="button_base btn_3d_double_roll" onclick="getTags()">
		<div>Get Tags</div>
		<div>Get Tags</div>
		<div>Get Tags</div>
		<div>Get Tags</div>
	</div>
	</div>
	
	<div id="checkForm">
	
	<input type="hidden" name="tagsresult" value="">

		<form id="frm" method="post" action="post_write_save">
	
<%-- 		<input type="hidden" id="mus_number" name="mus_number" value="${mus_number}"><!-- 음악 숫자  --> --%>
			<input type="hidden" id="mus_number" name="mus_number" value=978><!-- 음악 숫자  -->
		<input type="hidden" id="cust_number" name="cust_number" value="${cust_number}"><!-- 회원번호 -->
		
		<input type="text" id="mus_title" name="mus_title" value="${mus_title}" placeholder ="음악제목"><!-- 음악제목 -->
<%-- 		<input type="hidden" id="mus_time" name="mus_time" value="${mus_time}"><!-- 음악 길이 --> --%>
			<input type="hidden" id="mus_time" name="mus_time" value="152"><!-- 음악 길이 -->
		<input type="hidden" id="post_nickname" name="post_nickname" value="${nickname}">
		<input type="hidden" id="post_url" value="???">
		
	<!-- 	 <input type="hidden" id="content_here" name="post_content" value="">
		 <input type="hidden" id="tag_here" name="tagsresult" value="">
		 <br>
		 
			<span id="result_content"></span>
		<br> -->
	
	</form>

	<input type="button" value="저장" onclick="go()">
	</div>
	<div class="jumbotron" style="margin-bottom: 0"></div>
</div>
</div>
</body>
<script>
function openNav() {
	  document.getElementById("mySidenav").style.width = "250px";
	}

function closeNav() {
	  document.getElementById("mySidenav").style.width = "0";
	}
</script>
</html>