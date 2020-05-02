<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/js/jquery-3.4.1.min.js"></script>
<script src="resources/js/p5.min.js"></script>
<script src="resources/js/p5.sound.min.js"></script>
<script src="resources/js/jquery-ui.min.js"></script>
<script src="resources/js/sketch.js"></script>
<!-- include libraries(jQuery, bootstrap) -->

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/css/styles.css">
<link rel="stylesheet" href="resources/css/sideMenuBar.css"> 
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<script src="http://192.168.0.21:4000/socket.io/socket.io.js"></script>
<script src="resources/js/toastr.min.js"></script>
 <link href="resources/css/toastr.min.css" rel="stylesheet"/>
<style>
.write, .delete{
	width: 20px;
	height : 20px;
}
.table{
text-align: center;
max-width: 70%;
margin-bottom: 0px;
margin-left: 14%;
}
.recon{
text-align: center;
}
.date{
text-align: center;
width: 100px;
}
.cid{
text-align: center;
width: 120px;
}
.proset{
float : left;
}
.sp{
	width: 30px;
	height: 30px;
	border-radius:15px;
}
#visualizer{
	padding : 25px 25px 25px 25px;
	width : 100%;
	height : 450px;
	background-color : #D8D8D8;
	margin-bottom : 10px;
}
#musicinfo{
	float : left;
	width : 600px;
	height : 400px;
	margin-down : 20px;
	margin-left : 23px;
}
#profile{
	float : left;
	width : 300px;
	height : 400px;
	background-color : white;
	margin-top : 0px;
	margin-left : 23px;
}
#musicimg{
	float : left;
	width : 400px;
	height : 400px;
	margin-left : 20px;
}
#musicimg img{
	width : 400px;
	height : 400px;
}
#musictitle{
	font-size : 80px;
	text-align:center;
	width : 600px;
	height : 180px;
	text-decoration: underline;
}
#sketch-target{
	width : 400px;
	height : 100px;
	float : left;
}
#musiccontent{
    background-color: gainsboro;
    margin-bottom: 10px;
    font-size: 20px;
}
#tags{
	width : 600px;
	height : 100px;
	text-align: center;
	background-color : white;
	margin-bottom : 10px;
	padding: 5px 5px 5px 5px;
	white-space: nowrap;
	overflow-x: hidden;
}
.post_tag{
	float : left;
	margin : 5px 5px 5px 5px;
}
#musicbtns{
	width : 150px;
	height : 100px;
	float : left;
}
#musicbtns img{
	margin-top : 25px;
	width : 50px;
	height : 50px;
	float : left;
	margin-right : 15px;
	margin-left : 5px;
	cursor: pointer;
	}
  .opps_orifile_img{
     border-radius: 50%;
    transform-style: preserve-3d;
    transition: transform 0.5s linear;
    height: 150px;
    text-align: center;
     padding: 15px;
  }
  #profile_data{
      padding: 15px;
    font-size: 24pt;
    font-weight: bolder;
  }
  .a_tag_css{
  margin: 15px;
  text-align: center;
  font-size : 20px;
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
</style>
<script type="text/javascript">

var start_Page = -1;
var cust_number = '${cust_number}';
var username = '${nickname}';
var data_flag = 0;
var socket = io.connect('http://192.168.0.21:4000');
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
   init();
   tag_gets();
   $("#replyControl").on('click', replySend);
});
function init() {
   var post_number = ${post.post_number};

   $.ajax({
      method : 'GET',
      url : 'replyAll',
      data : {
         "post_number" : post_number
      },
      success : output,
      error : function(resp) {
         alert("Error");
      }
   })
}
function output(resp) {
   var nickname = "${sessionScope.nickname}";
   var data = '   <table class="table table-dark"><thead><tr><th class="date"></th><th class="cid"></th><th class="recon"></th></tr></thead><tbody>';
         $.each(resp,
               function(index, item) {
                  data += '<tr><td>' + item.rep_date + '</td>'
                  data += '<td>';
               /*    if (item.savedfilename!=null) {
                     data += '<img src="<c:url value="/imgs/'+item.savedfilename+'"/>" width="25px" height="25px"/>'
                  } else {
                     data +='<img src="/personal/resources/images/userdefalut.png" width="25px" height="25px"/>'
                     
                  } */
                  data += '<a href="proDetail?cust_number='+item.cust_number+'">'+'<span class="proset"><img class="sp" src="<spring:url value="/image/'
					+item.cust_photo+'"/>"/>'+'&nbsp'+item.rep_nickname + '</span></td>'
                  data += '<input type="hidden" value="'+item.rep_content+'">'
                  data +='<td>'+ item.rep_content+'</td><td>' ;

                  if (nickname == item.rep_nickname) {
                     data += '<a id="replyDelete" data-num="'+  item.rep_number+'" class="replyDelete" ">'+'<img class="delete" src="resources/images/reply/slreset.png">'+'</a>';
//                      data +='<a id="replyUpdate" data-num="'+  item.rep_number+'" class="replyUpdate" ">'+'<img class="update" src="resources/images/sound/slset.png">'+'</a>';
                  }
                  data += '</td></tr>'
               })
   data += '</tbody></table>';

   $("#replyResult").html(data);
   $("#replyDelete").on('click', replyDelete);
   $("#replyUpdate").on('click', replyUpdate);

}

function replyUpdate() {

   var rep_number = $(this).attr("data-num");
   var rep_content = $(this).attr("data-text");
   $("#replyControl").attr("data-num", rep_number);

   $("#rep_content").val(rep_content);
//    $("#replyControl").val('댓글수정');

}
//수정과 입력을 동시에 처리할것이다.
function replySend() {
   var rep_number = $(this).attr("data-num");
   if (rep_number == ""){
      rep_number = 0;
   }
   var rep_url = $("#rep_url").val();
   var cust_number = '${cust_number}';
   var rep_content = $("#rep_content").val();
   var post_number = '${post.post_number}';
   var status = ($("#replyControl").val() == "댓글수정") ? "replyUpdate": "replyWrite";
   /* var savedfilename = $("#getUserimgs").val(); */

   if (status == 'replyUpdate') {
      var sendData = {
            "rep_url" : rep_url,
         "cust_number" : cust_number,
         "rep_number" : rep_number,
         "rep_content" : rep_content,
         "post_number" : post_number
      /*    ,"savedfilename" : savedfilename */
      };
      $.ajax({
         method : "POST",
         url : status,
         data : sendData,
         success : function(resp) {
            if (resp == 'success') {
               alert("댓글수정완료");
               init();
               $("#rep_content").val("");
               $("#replyControl").val("댓글달기");
            } else {
               alert("댓글수정실패")
            }
         }
      });

   } else {
      var sendData = {
            "rep_url" : rep_url,
            "cust_number":cust_number,
            "rep_number" : rep_number,
            "rep_content" : rep_content,
            "post_number" : post_number
         /*    ,"savedfilename" : savedfilename */
      };
      $.ajax({

         method : "POST",
         url : status,
         data : sendData,
         success : function(resp) {
            if (resp == 'success') {
               replynotice();
               init();
               $("#rep_content").val("");
               
               
            } else {
               alert("작성실패")
            }
         }
      });

   }
}

function replyDelete() {
   var rep_number = $(this).attr('data-num');
   var post_number = ${post.post_number};

   var sendData = {
      "post_number" : post_number,
      "rep_number" : rep_number
   };

   $.ajax({
      method : 'GET',
      url : 'replyDelete',
      data : sendData,
      success : function(resp) {
         if (resp == 'success') {
            alert("삭제 성공");
            //전체 댓글다시 불러온다.
            init();
         } else
            alert('삭제 실패')
      },
      error : function() {
         alert("에러 에러");
      }
   })

}

function replynotice(){
      var post_number = '${post.post_number}';
      var mus_title = '${post.mus_title}';
      var replyWriter_number = '${nickname}';
      var postWriter_number = '${post.cust_number}';
      console.log(mus_title+','+replyWriter_number+','+postWriter_number);
    socket.emit('replynotice',replyWriter_number , postWriter_number,mus_title,post_number);
    noti_save();
	}

function noti_save(){
	
	var not_cust_number =  '${post.cust_number}';
	var not_sender_number  = '${cust_number}';
	var not_content  ='${post.post_number}';
	var not_type = 'Reply';
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
$(function(){
	$("#playsong").click(function(){
		song.play();
	})
	$("#stopsong").click(function(){
		song.stop();
	})
})
var amp;
var volhistory = [];
function preload(){
	song = loadSound('${post.post_saved}');
}
function setup() {
	userStartAudio();
	var cvs = createCanvas(450,100);
	cvs.parent('sketch-target');
	amp = new p5.Amplitude();
}
function draw() {
	 background(0);
	var vol = amp.getLevel();
	stroke(255);
	noFill();
	beginShape();
	volhistory.push(vol*10);
	for(var i=0; i<volhistory.length; i++){
		var y = map(volhistory[i], 0, 1, height, 0);
		vertex(i, y);
	}
	endShape();

	if(volhistory.length > width-50){
		volhistory.splice(0,1);
	}

	stroke(255,0,0);
	line(volhistory.length,0,volhistory.length,height);
}
function tag_gets(){

	console.log(${tagList});
	var data = "";
	$.each(${tagList},function(index, item) {
		data += "<a class='a_tag_css' href = ''>#"+item+"</a>";
			});
	$('#tags').html(data);
	}
$(function() {
    var post_number = '${post.post_number}';
    var cust_number = '${cust_number}';
    var target_number = '${post.cust_number}'   

       
    $.ajax({
       method : 'GET',
       url : 'likedchecking',
       data : {
          "post_number" : post_number,
          "cust_number" : cust_number,
          "target_number" : target_number
       },
       
       
       success : function(resp) {
          if (resp == 'unliked')
             $("#liked_button").html('<img  class="heart_icons"  src="resources/images/canheart.png">')
          if (resp == 'liked')
             $("#liked_button").html('<img class="heart_icons" src="resources/images/fullheart.png">')
             
       }
    })
    $("#liked_button").on("click", function() {
       $.ajax({
          method : 'GET',
          url : 'like_click',
          data : {
             "post_number":post_number,
             "cust_number":cust_number,
             "target_number" : target_number
          },
          success : function(resp) {
             if (resp == 'unliked')
                $("#liked_button").html('<img  class="heart_icons"  src="resources/images/canheart.png">')

             if (resp == 'liked')
                $("#liked_button").html('<img class="heart_icons" src="resources/images/fullheart.png">')
                
              /* socket.emit('newFollow',follow_number,username ); */
             

          }

       })

    })
 });  
</script>

</head>
<body>
<nav class="navigation">
		<div class="navigation__column">
			<a href="main"><img class="logo" alt="home" src="resources/images/home/im_logo_w.jpg">
			</a>&nbsp;&nbsp;&nbsp;
			<a href="profile">
			<img class="pro" style="width: 46px; height: 46px; border-radius: 23px;" src="<spring:url value='/image/${image}'/>"/>
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
   <div id="wrapper">
   <div id="visualizer">
   	<div id="musicimg"><img id="postimg" src="${post.post_original}"></div>
   	<div id="musicinfo">
   		<div id="musictitle">${post.mus_title }</div>
   		<div id="tags"></div>
   		<div id="musicplayer">
   			<div id="musicbtns"><img id="playsong" src="resources/images/sound/play.png">
   			<img id="stopsong" src="resources/images/sound/stop.png"></div>
   			<div id="sketch-target"></div>
   		</div>
   	</div>
  	 <div id="profile">
  	 
  	 <div id="custphoto"><img class = "opps_orifile_img" alt="" src="<c:url value="/image/${post_profile.cust_photo_saved}"/>"/></div> 
  		 	<div id="profile_data">${post_profile.cust_nickname}</div>
  		 <div id="musiccontent">${post.post_content }</div>
			<a id="liked_button" >like</a>
  	 </div>
   </div>
      <div id="replyForm" style="text-align: center;">
         <c:if test="${not empty nickname}">
            <form action="replyWrite" method="POST">
               <input type="hidden" name="cust_number" value="${cust_number}">
               <input type="hidden" name="rep_nickname" value="${nickname}">
            <%--    <input type="hidden" name="rep_url" value="${rep_url}"> --%>
               <input type="hidden"  id="rep_url" name="rep_url" value="url입니다">
               <span id="rep_nickname">
<!--                작성자 :  -->
         <%--       <c:if test="${not empty sessionScope.cust_photo_saved}">
               <img src="<c:url value='/imgs/${sessionScope.cust_photo_saved}'/>"
                  width="50px" height="30px" />
            </c:if> <c:if test="${empty sessionScope.cust_photo_saved}">
               <img src="<c:url value='/resources/images/userdefalut.png'/>"
                  width="50px" height="30px" />
            </c:if> --%>
<%--                ${sessionScope.nickname} --%>
               </span> <input type="text" id="rep_content"
             placeholder="댓글 달기..." name="rep_content" >
             <a id="replyControl" data-num=""><img class="write" src="resources/images/reply/sledit.png">
			</a>
<!--                <input id="replyControl" name="replyControl" data-num="" type="button" value="댓글달기">  -->
            </form>
         </c:if>

      </div>
      <!-- 댓글 목록 출력 -->
      

   </div>
   <div id="replyResult" style="width: 60%; margin: auto; "></div>
   <div id="data_notis"></div>
</body>
</html>