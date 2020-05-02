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
 <script src="http://192.168.0.21:4000/socket.io/socket.io.js"></script>
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
 .flist1{
     position: absolute;
    margin-left: 18%;
    margin-top: -9%;
  }
  .sp{
   width: 30px;
   height: 30px;
   border-radius:25px;
}
.div wrapper{
   font-size: x-large;
    margin-left: 41%;
    margin-top: -3%;
}
.line{
   font-style: italic;
    font-family: "Times New Roman", Times, serif;
   margin-left: 43%;
    font-size: xx-large;
    margin-top: 4%;
}
.nick{
    font-size: large;
   font-style: italic;
   padding-left: 45px;
    padding-bottom: 0px;
    padding-top: 10px;
    position: absolute;
}
.hrcss{
    color:black;
    width: 300px;
     margin-left: -25%;
    margin-right:0px;
    margin-top:32px;
    size:10px;
    white-space: nowrap;
	overflow-x: hidden;
}
.table{
   margin-left: 38%;
    margin-top: -10%;
}
</style>
<script src="http://192.168.0.21:4000/socket.io/socket.io.js"></script>
<script>
var start_Page = -1;
var cust_number = '${cust_number}';
var username = '${nickname}';
var data_flag = 0;
var socket = io.connect('http://192.168.0.21:4000');
$(function(){
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
						d+= '<li>'+'<a style="font-style: italic" href="proDetail?cust_number='+item.cust_number+'">'+'<img class="sp" src="<spring:url value="/image/'
						+item.cust_photo_saved+'"/>"/>'+item.cust_nickname+'</a>'+'</li>';
					})
					$("#myUL").html(d);
					}
				}
		})
	})
})
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

	var username = '${nickname}';
	var socket = io.connect('http://10.10.1.211:4000');

	$(function() {

		socket.emit('add user', username);
		getPage_data(cust_number);
		$("#data_notis").hide(); 	
		
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

		}
	

	function noti_save(){
 		var  not_cust_number = '${customersData.cust_number}';
		var not_content  = '${nickname}';
		var not_sender_number  = '${cust_number}';
		var not_type = 'Follow';
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
$(function(){
	$("#goModify").click(function(){
		location.href="goModify";
	})
})
function followers(){
      
      $.ajax({
         method : 'GET',
         url : 'followers',
         success : wers,
      })

      }
function followings(){
   
   $.ajax({
      method : 'GET',
      url : 'followings',
      success : wings,
   })

   }
function wers(resp){

   var data ='<div class="line">followerList<hr class="hrcss"></div><table class="table table-dark" div="wrapper"><thead><tr><th class="proimg"></th><th class="nick"></th></tr></thead><tbody><br>';
   $.each(resp,function(index, item) {
      data += '<tr><td><a href="proDetail?cust_number='+item.cust_number+'">'+'<span class="proset"><img class="sp" src="<spring:url value="/image/'
      +item.cust_photo_saved+'"/>"/></td>'+'&nbsp'+'<td class="nick">'+item.cust_nickname + '</span></td></tr>';
         });
   data +="</tbody></table>";
   $('#followerList_Profiles').html(data);
}
function wings(resp){

   var data ='<div class="line">followingList<hr class="hrcss"></div><table class="table table-dark" div="wrapper"><thead><tr><th class="proimg"></th><th class="nick"></th></tr></thead><tbody><br>';
   $.each(resp,function(index, item) {
      data += '<tr><td><a href="proDetail?cust_number='+item.cust_number+'">'+'<span class="proset"><img class="sp" src="<spring:url value="/image/'
      +item.cust_photo_saved+'"/>"/></td>'+'&nbsp'+'<td class="nick">'+item.cust_nickname + '</span></td></tr>';
         });
   data +="</tbody></table>";
   $('#followerList_Profiles').html(data);
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
			  <a href="chattingTemp" ><i class="fa fa-comments-o "></i> Texting</a>
			  <a href="follow"><i class="fa fa-user-plus"></i> Follow</a>
			  <a href="goModify"><i class="fa fa-id-card-o"></i> Edit profile</a>
			  <a href="logout"><i class="fa fa-power-off"></i> Logout</a>
			</div>
		</div>
	</nav>
	<div id="data_notis"></div>
	<main id="profile">
		<header class="profile__header">
			<div class="profile__column">
				<c:if test="${image == null}">
				<img class="img-responsive center-block" id=m_photo name="m_photo" src="resources/images/profile.png">
				</c:if>
				<c:if test="${image != null}">
				<img class="pro" src="<spring:url value='/image/${image}'/>"/>	
				</c:if>
			</div>
			<div class="profile__column">
				<div class="profile__title">
					<h3 class="profile__username">${customersData.cust_nickname}</h3>
					<i class="fa fa-cog fa-lg" id="profileSetting"></i>
				</div>
				<ul class="profile__stats">
					<li class="profile__stat"><span class="stat__number"></span>
						</li>
					<li class="profile__stat"><span class="stat__number">${followers}</span>
						<a onclick="followers()">followers</a></li>
					<li class="profile__stat"><span class="stat__number">${followings}</span>
						<a onclick="followings()">following</a></li>
				</ul>
				<p class="profile__bio">
					<span class="profile__full-name">${introduce} </span>
				</p><div class="flist1">
				<div id="followerList_Profiles"> </div>
				</div>
			</div>
		</header>
			<main id="profile" class="">	</main>
				<div id="endDan" ></div>
	</main>
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