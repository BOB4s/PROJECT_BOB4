<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://192.168.0.21:4000/socket.io/socket.io.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="resources/js/jquery-3.4.1.min.js"></script>
<script src="resources/js/p5.min.js"></script>
<script src="resources/js/p5.sound.min.js"></script>
<script src="resources/js/jquery-ui.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<link rel="stylesheet" href="resources/css/navigation.css">
<link rel="stylesheet" href="resources/css/sideMenuBar.css">
<link rel="stylesheet" href="resources/css/3d_double_roll_btn.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="resources/js/toastr.min.js"></script>
<title>글쓰기</title>
<style type="text/css">
body{
	background-image: url("resources/images/zzzzz.jpg");
	background-size:cover;
	background-repeat:no-repeat;
}
#postForm{
	width: 800px;
	height: 600px;
	margin : 0 auto;
	margin-top : 40px;
	border : 1px solid black;
	text-align: center;
	background-color: #FFFFFF;
}
#postcontent{
	margin : 10px 10px 10px 10px;
	width: 700px;
	height : 100px;
}
#postimg{
	margin-top : 20px;
	margin-bottom : 20px;
	width : 160px;
	height : 160px;
}
#upload{
	margin : 0 auto;
}
#posttitle{
	font-size : 20px;
}
#posttag{
	width : 700px;
	height : 100px;
	margin : 0 auto;
	margin-top : 10px;
	background-color: #E6E6E6;
	white-space: nowrap;
	overflow-x: hidden;
}
#postup{
	margin-top : 10px;
}
.addtag{
	float : left;
	margin : 5px 5px 5px 5px;
}
#musicplay{
	margin-left : 5px;
	width : 30px;
	height : 30px;
	cursor: pointer;
}
.deltag{
	width : 15px;
	height : 15px;
	font-weight: bold;
	cursor: pointer;
	border: 0;
	background: red;
	color: #FFFFFF;
	border-radius: 100%;
	padding: 0;
	font-size: 5px;
}
</style>
<script  type="text/javascript">
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
})
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
		getmusic();	
	})
var path, song;
function getmusic(){
	var num = "${mus_number}";
	$.ajax({
		type : 'get'
		,url : 'getmusic'
		,data : {'mus_number':num}
		,success : function(resp){
				var data = resp.mus_title+'<img src="resources/images/sound/play.png" id="musicplay">'
				$("#posttitle").html(data);
				path = resp.fullPath;
				setup();
				$("#musicplay").click(function(){
					if(song.isPlayed){
						song.stop();
					}
					song.play();
				})
			}
	})
}
function postnotice(mus_title){
	var followerList = new Array();
	$.each(${followerList},function(index, item) {
	
		followerList[index] = item;
			});
	 
	console.log(followerList);
	 socket.emit('postWrite',followerList,username,mus_title);

	  location.href = "main" 
}
function setup(){
	userStartAudio();
	song = loadSound(path);
}
var sel_file;
var count = 0;
$(function(){
	$("#upload").on("change",handleImgFileSelect);

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
	$("#tagbtn").click(function(){
		var tag = $("#inputtag").val();
		if(tag.trim().length<1){
			alert("The tag must be at least one character.");
			return;
		}
		if(count>=10){
			alert("Tags are too much!");
			return;
		}
		$.ajax({
			type : 'post'
			,url : 'inserttag'
			,data : {'tag_name':tag}
			,success : function(resp){
				var data = '<div class="addtag"><span>#'+tag+'</span><button class="deltag">x</button></div>'
				$("#posttag").append(data);
				$("#inputtag").val('');
				count++;
				}
		})
		
		$(".deltag").click(function(){
			$(this).parent().remove();
			count--;
		})
	})
	$("#postup").click(function(){
		var formData = new FormData();
		var tagss = $(".addtag").children('span').text();
		var tags = tagss.split("#");
		 
		   formData.append("file", $("#upload")[0].files[0]);
		   formData.append("mus_number", ${mus_number});
		   formData.append("cust_number", "${sessionScope.login}");
		   formData.append("mus_title", $("#posttitle").text());
		   formData.append("post_content", $("#postcontent").val());
		   formData.append("tags",tags);
		   formData.append("post_saved",path);

		   $.ajax({
				type : 'post'
				,url : 'postup'
				,data : formData
				,processData: false
			    ,contentType: false
			    ,success : function(resp){
						alert("success!");
						postnotice($("#posttitle").text());
						location.href="main?post_number="+resp;
				    }
		   })
	})
});
	function handleImgFileSelect(e){
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);

	filesArr.forEach(function(f){
		if(!f.type.match("image.*")){
			alert("이미지 파일을 업로드 해주세요.");
			return;
		}
		sel_file=f;
		var reader = new FileReader();
		reader.onload = function(e){
			$("#postimg").attr("src",e.target.result);
		}
		reader.readAsDataURL(f);	
		});
}
</script>
</head>
<body >
	<!-- Top for logo and navibar -->
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
			  <a href="chattingTemp"><i class="fa fa-comments-o "></i> Texting</a>
			  <a href="logout"><i class="fa fa-power-off"></i> Logout</a>
			</div>
		</div>
	</nav>
<div id="wrapper">
<div id="postForm">
<img id="postimg" src="resources/images/home/im_logo_w.jpg">
<form id="form_upload" enctype="multipart/form-data" action="/file/upload" method="post">
<input type="file" id="upload">
</form>
<div id="posttitle"></div>
<textarea id="postcontent" placeholder="Introduce this music."></textarea><br>
Add tag : <input type="text" id="inputtag" placeholder="Add a tag to the music">&nbsp;<button class="w3-btn w3-grey w3-round" id="tagbtn">+</button>
<div id="posttag">
</div>
<button id="postup" class="w3-btn w3-grey w3-round">Sharing Music</button>
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