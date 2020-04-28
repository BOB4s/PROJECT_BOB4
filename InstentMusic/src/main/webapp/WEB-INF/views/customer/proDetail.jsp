<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
<!-- <meta http-equiv="X-UA-Compatible" content="ie=edge"> -->
<title>Profile</title>
<script src="resources/js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/css/styles.css">
<link rel="stylesheet" href="resources/css/sideMenuBar.css"> 
 <script src="http://172.20.10.3:4000/socket.io/socket.io.js"></script>
<%-- <script src="<c:url value="resources/js/jquery-3.4.1.min.js" />"></script> --%>
<link rel="stylesheet" href="resources/css/main.css">
<script src="resources/js/toastr.min.js"></script>
 <link href="resources/css/toastr.min.css" rel="stylesheet"/>
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
}.nav-counter {

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
<script>
var start_Page = -1;
var cust_number = '${pd.cust_number}';
var username = '${pd.cust_nickname}';
var data_flag = 0;
var socket = io.connect('http://172.20.10.3:4000');
$(function(){
	$("#data_notis").hide();
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
$("#profileSetting").click(function(){
	location.href="goModify"
	})
	$("#searchpf").keyup(function(){
		var data = {'search':$("#searchpf").val()};
		$.ajax({
			method : 'get'
			,url : 'searchpf'
			,data : data
			,success : function(resp){
				var d = '';
					if($("#searchpf").val()==''){
					$("#myUL").html('');
					}else{
					$.each(resp,function(index,item){
// 						d+= '<span class="sepf">'+item.cust_nickname+'</span><br/>'
						d+= '<li>'+'<a href="proDetail?cust_number='+item.cust_number+'">'+'<img class="sp" src="<spring:url value="/image/'
						+item.cust_photo_saved+'"/>"/>'+item.cust_nickname+'</a>'+'</li>';
					})
					$("#myUL").html(d);
					}
				}
		})
	})
})
$(function() {

		socket.emit('add user', username);
		getPage_data(cust_number);
		
		var follower_number = '${cust_number}';
	 	var follow_number = '${customersData.cust_number}'; 
		$.ajax({
			method : 'GET',
			url : 'followchecking',
			data : {
				"follower_number" : follower_number,
				"follow_number" : follow_number
			},
			success : function(resp) {
				if (resp == 'unfollowed')
					$("#following_button").text("follow")
				if (resp == 'followed')
					$("#following_button").text("unfollow")
			}
		})

		$("#following_button").on("click", function() {
			$.ajax({
				method : 'GET',
				url : 'following',
				data : {
					"follower_number" : follower_number,
					"follow_number" : follow_number
				},
				success : function(resp) {
					if (resp == 'unfollowed')
						$("#following_button").text("follow")
					if (resp == 'followed')
						$("#following_button").text("unfollow")
						
					 socket.emit('newFollow',follow_number,username );
					

				}

			})

		});
		$("#followList").on("click", function() {
			$.ajax({
				method : 'GET',
				url : 'getFollowers',
				data : {
					"follow_number" : follow_number
				},
				success :	function followersList(resp) {
					var data = '';
					$.each(resp,function(index, item) {
						data += '<a>'+item+'</a>';				
									})
					

					$("#followlists").html(data);

				}
			})

		});
	
	});
	function getPage_data(cust_number){
		if($("#profile")[0].className=='stop'){
			$("#profile")[0].className='';
			$('#endDan').html('');
			}
 		if(start_Page==0){
			start_Page++;
			} 
		start_Page++;

		console.log(start_Page);
		$.ajax({
			method : 'GET',
			url : 'myList',
			data : {
				"start_Page" : start_Page
				,"cust_number":cust_number
			},
			success : getPage,
			error : function(resp) {
				alert("Error");
			}
		})

		}
	function getPage(resp){
		if(resp==null) {
			alert("글이 없습니다.");
			return ;
		}
		var data = "<section class='profile__photos'>"
			$.each(resp,function(index, item) {
				var rannum =  Math.floor(Math.random() * 3)+0.65;/* 0.65 */

					data += "<div class='profile__photo' style='-webkit-transform: translateY(0px);transform: translateY(0px);-webkit-animation: moveUp "+rannum+"s ease forwards;animation: moveUp "+rannum+"s ease forwards;'>"
						
				 	data += "<img src='resources/uploadPath/"+item.post_original+"' />"
				 		
				 	data += "<div class='profile__photo-overlay' onclick='postDetail(event)'>"
				 	data += "<input type='hidden' id='post_number'  name='post_number' value='"+item.post_number+"' >"
				 	 data += "<span class='overlay__item'> <i class='fa fa-heart'>"+item.mus_title+"</i></span> ";
				 	 data += "<span class='overlay__item'> <i class='fa fa-comment'>"+item.post_nickname+"</i></span> ";

				 	 data += "</div></div>"

					

					});

		data +="</section>";
		$("#profile").append(data);
	
	
	}
	function postDetail(event){
		if(event.target.children[0]==undefined){
			return;
			}
		var post_number = event.target.children[0].value
		console.log(post_number);
		location.href = "postGetOne?post_number=" + post_number;

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
<body>
	<nav class="navigation">
		<div class="navigation__column">
			<a href="main"> <img class="logo" alt="home" src="resources/images/home/im_logo_w.jpg" />
			</a>&nbsp;&nbsp;&nbsp;
			<a href="profile">
			<img class="pro" style="width: 46px; height: 46px; border-radius: 23px;" src="<spring:url value='/image/${image}'/>"/>
			</a>
		</div>
		<div class="navigation__column">
			<div class="searchingTool">
				<i class="fa fa-search"></i> <input id="searchpf" type="text" placeholder="Search">
			</div>
		</div>
		<div id="myUL1">
			<ul id="myUL"></ul>
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
	<div id="data_notis"></div>
	<main id="profile">
		<header class="profile__header">
			<div class="profile__column">
				<c:if test="${pd.cust_photo_saved == null}">
				<img class="img-responsive center-block" id=m_photo name="m_photo" src="resources/images/profile.png">
				</c:if>
				<c:if test="${pd.cust_photo_saved != null}">
				<img class="pro" src="<spring:url value='/image/${pd.cust_photo_saved}'/>"/>	
				</c:if>
			</div>
			<div class="profile__column">
				<div class="profile__title">
					<h3 class="profile__username">${pd.cust_nickname}</h3>
					<a id="following_button" >following</a> <i class="fa fa-cog fa-lg"></i>
					
					<c:if test="${pd.cust_id == id}">
					<i id="profileSetting" class="fa fa-cog fa-lg"></i>
					</c:if>
				</div>
				<ul class="profile__stats">
					<li class="profile__stat"><span class="stat__number">이사람이 글쓴수 가져오기</span>
						posts</li>
					<li class="profile__stat"><span class="stat__number">${followers}</span>
						<a href="followers">followers</a></li>
					<li class="profile__stat"><span class="stat__number">${followings}</span>
						<a href="followings">following</a></li>
				</ul>
				<p class="profile__bio">
					<span class="profile__full-name">${pd.cust_introduce} </span>
				</p>
			</div>
		</header>
		<main id="profile" class="">	</main>
				<div id="endDan" ></div>
	</main>
	<footer class="footer">
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