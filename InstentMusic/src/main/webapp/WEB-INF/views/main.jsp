<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<!--  notice 업뎃시 chaticon파일 하나 옮기기 -->
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!--  <meta http-equiv="X-UA-Compatible" content="ie=edge">  -->
<title>Main page after login</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/css/navigation.css">
<link rel="stylesheet" href="resources/css/sideMenuBar.css">
<link rel="stylesheet" href="resources/css/main.css">
<link rel="stylesheet" href="resources/css/styles.css">
<link rel="stylesheet" href="resources/css/opps_data_css.css">
<link rel="stylesheet" href="resources/css/followBar.css">
<script src="http://192.168.0.21:4000/socket.io/socket.io.js"></script>
<script src="resources/js/jquery-3.4.1.min.js"></script>
<script src="resources/js/toastr.min.js"></script>
<link href="resources/css/toastr.min.css" rel="stylesheet"/>
<style type="text/css">
a:link{
	text-decoration: none;
}
@-webkit-keyframes moveUp {
	0% {}

	100% {
		-webkit-transform: translateY(0);
		opacity: 1
	}
}

@keyframes moveUp {
	0% {}

	100% {
	-webkit-transform: translateY(0);
		transform: translateY(0);
		opacity: 1;
		
	}
}
#endDan{
position: relative;
left: 43%;
top: 90%;
font-size: 30pt;
-webkit-transform: translateY(200px);
transform: translateY(200px);
-webkit-animation: moveUp 3.65s ease forwards;
animation: moveUp 3.65s ease forwards;
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

#nav{
position: fixed;
  top: 0;
  left: 0;
  right: 0;
}
body{
padding-top: 75px;
}
.postbtn{
	text-decoration: underline;
	font-size: 30px;
	margin-left: 10px;
	margin-right: 10px;
	cursor: pointer;
}
#musicBoard{
	width: 1500px;
	height : 30px;
	text-align: center;
}
#searchp{
	cursor: pointer;
}
</style>
<!-- 192.168.0.84 -->
<script type="text/javascript">
	var start_Page = -1;
	var cust_number = '${cust_number}';
	var username = '${nickname}';
	var controls = "all";
	var data_flag = 0;
	var socket = io.connect('192.168.0.21:4000');
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




	$(function(){
	
		socket.emit('add user', username);
		getPage_data(controls);
			$("#data_notis").hide(); 
			
		$(window).scroll(function() {
		    var scrolltop = $(document).scrollTop();
		    var height = $(document).height();
		    var height_win = $(window).height();
		 if (Math.round( $(window).scrollTop()) == $(document).height() - $(window).height()-1) {
			if($("#profile")[0].className!='stop'){
					 getPage_data(cust_number);
						if(start_Page%3==0){
							
							$("#profile")[0].className='stop';
							$('#endDan').html('<a onclick="getPage_data('+${cust_number}+')"><<더보기>></a>');
							}
						}
				}
			});

		
	});


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
	function getPage_data(controls){
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
			url : 'postLists',
			data : {
				"start_Page" : start_Page
				,"cust_number":cust_number
				,"controls" :controls
			},
			success : getPage,
			error : function(resp) {
				alert("Error");
			}
		})

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
	function getPage(resp){
		if(resp==null) {
			alert("글이 없습니다.");
			return ;
		}
		var data = "<section class='profile__photos'>"
			$.each(resp,function(index, item) {
				var rannum =  Math.floor(Math.random() * 3)+0.65;/* 0.65 */

					data += "<div class='profile__photo' style='-webkit-transform: translateY(200px);transform: translateY(200px);-webkit-animation: moveUp "+rannum+"s ease forwards;animation: moveUp "+rannum+"s ease forwards;'>"

					//사진
					if(item.post_original==null){
						data += '<img src="resources/images/IUfeed.jpg" />'
						}else{
							data += '<img src="<c:url value="/resources/uploadPath/'+item.post_original+'"/>"/>'	
							}
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
	
	$(function(){
		$("#searchPost").keyup(function(){
			var data = {'search_word':$("#searchPost").val()};
			$.ajax({
				method : 'get'
				,url : 'searchpost'
				,data : data
				,success : function(resp){
					var d = '';
						if($("#searchPost").val()==''){
						$("#myUL2").html('');
						}else{
						$.each(resp,function(index,item){
							if(item.hitcount>50 && item.hitcount<100){
								d+= '<li>'+'<a class="name" style="font-style: italic">'+item.search_word+'</a>'+'</li>';
							}
							else if(item.hitcount>100){
								d+= '<li>'+'<a class="name" style="font-style: italic">'+item.search_word+'</a>'+'</li>';	
							}else{
							d+= '<li>'+'<a class="name" style="font-style: italic">'+item.search_word+'</a>'+'</li>';
							}
						})
						$("#myUL2").html(d);
						$(document).on("click",".name",function(){
							var v = $(this).text();
							$("#searchPost").val(v);
							$("#myUL2").html('');
							});
						}
					}
			})
		})
	})
	$(function(){
      $("#searchp").click(function(){
         var data = {'search_word':$("#searchPost").val()};
         $.ajax({
            method : 'get'
            ,url : 'postList'
            ,data : data
            ,success : function(resp){
                $("#profile").html('');
               var a = "<section class='profile__photos'>";
               $.each(resp,function(index,item){
                    var rannum =  Math.floor(Math.random() * 3)+0.65;/* 0.65 */
                        a += "<div class='profile__photo' style='-webkit-transform: translateY(200px);transform: translateY(200px);-webkit-animation: moveUp "+rannum+"s ease forwards;animation: moveUp "+rannum+"s ease forwards;'>"
                        //사진
                        if(item.post_original==null){
                           a += '<img src="resources/images/IUfeed.jpg" />'
                           }else{
                              a += '<img src="<c:url value="/resources/uploadPath/'+item.post_original+'"/>"/>'   
                              }
                         a += "<div class='profile__photo-overlay' onclick='postDetail(event)'>"
                         a += "<input type='hidden' id='post_number'  name='post_number' value='"+item.post_number+"' >"
                          a += "<span class='overlay__item'> <i class='fa fa-heart'>"+item.mus_title+"</i></span> ";
                          a += "<span class='overlay__item'> <i class='fa fa-comment'>"+item.post_nickname+"</i></span> ";
                          a += "</div></div>"
                        
                        });
               data +="</section>";
               $("#profile").append(a);
            }
            })
         })
      
      })
	
	/* function getfollwedList(){
		var data = "<table border='1' style='font-size: 15pt'>";
		var j[] = '${followed_Profiles_List}';
		$.each(j[],function(index, item) {
			data +="<tr>";
			data += "<td>"+item.cust_nickname+"</td>";
			data += "<td>"+item.cust_number+"</td>";
			data += "<td>"+item.cust_photo_saved+"</td>";
			data += "</tr>";
				});
		data +="</table>";
		$('#followerList_Profiles').html(data);
		} */
	function logout(){
		socket.emit('disconnect',username);
		location.href = "logout";
		}


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

		 function id_change_to_all(){
			 controls="all";
			 $("#profile").html('');
			 start_Page = -1;
			 getPage_data();
		 }
		 function id_change_to_followOnly(){
			 controls="followOnly";
			 $("#profile").html('');
			 start_Page = -1;
			 getPage_data(controls);
		 }
		 function id_change_to_likes(){
			 controls="likes";
			 $("#profile").html('');
			 start_Page = -1;
			 getPage_data();
			
		 }
</script>
</head>
<body>
	<!-- Top for logo and navibar -->
	 <nav class="navigation" id="nav">
		<div class="navigation__column">
			<a href="main"><img class="logo" alt="home" src="resources/images/home/im_logo_w.jpg">
			</a>
		</div>
		<div class="navigation__column">
			<div class="searchingTool">
         <a href="#musicBoard"><i id="searchp" class="fa fa-search"></i></a><input id="searchPost" type="text" placeholder="Search">
      </div>
      </div>
      <div id="myUL3">
         <ul id="myUL2"></ul>
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
			  <a href="chattingTemp" ><i class="fa fa-comments-o "></i> Texting</a>
			  <a href="logout"><i class="fa fa-power-off"></i> Logout</a>
			</div>
		</div>
	</nav>

<div class="wrapper">
<div id="data_notis">
				
			
			</div>
<img class="imgContainer" alt="produce" src="resources/images/musiclist/produce.png">
	<ul class="stage">
	<li class="icon">
		<div class="boxContainer">
			<div class="frontImgForBoxContainer">
				<img alt="manListening" src="resources/images/main/manListening.JPG">
			</div>
			<div class="info">
				<header>
					<h1>My Music List</h1>
						<a href="musiclist"><img alt="myMusicList" src="resources/images/main/headphone1.png"></a>
				</header>
					<p>
					Click the icon for listening to the music list that built by what you composed music.
					</p>
			</div>
		</div>
    </li>
	<li class="icon">
		<div class="boxContainer">
			<div class="frontImgForBoxContainer">
				<img alt="notesKeyboard" src="resources/images/musiclist/notes_keyboard.JPG">
			</div>
			<div class="info">
				<header>
					<h1>Producing</h1>
					<a href="makingMusic"><img alt="producing" src="resources/images/main/producing_icon.png"></a>
				</header>
				<p>
				Click the icon for composing and producing your new music.
				</p>
			</div>
		</div>
	</li>
	<li class="icon">
		<div class="boxContainer">
			<div class="frontImgForBoxContainer">
				<img alt="womanListening" src="resources/images/main/womanListening.png">
			</div>
			<div class="info">
				<header>
					<h1>Music Board</h1>
					<a href="#musicBoard"><img alt="musicBoard" src="resources/images/main/allList.png"></a>
				</header>
				<p>
				Click the icon to see your friends' music and what's the trend.
				</p>
			</div>
		</div>
	</li>
</ul>
</div>
<div id="musicBoard">
	<br><br>
<a onclick="id_change_to_all()" class="postbtn">All</a>&nbsp;
<a onclick="id_change_to_followOnly()" class="postbtn">Follow</a>&nbsp;
<a onclick="id_change_to_likes()" class="postbtn">Popular</a>
<br>
</div>
<div id="followerList_Profiles"> </div>
	<main id="profile" class="">	</main>
				<div id="endDan" ></div>

<!-- follow list -->
<article id="follower_tool" style="font-size: 15pt">
	<div id="followBar">
		<div class="follower_viewall">
			<a href="#">View all</a>
		</div>
		<div id="initialPhoto">
			<ul id="photoDataBar"></ul>
		</div>
		<div>
			<ul id="followerList_Profiles"></ul>
		</div>
	</div>
</article>
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