<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<title>회원 가입</title>
<style>
	#wrapper{
		width : 500px;
		margin : 0 auto;
	}
	.img_wrap {
		width: 300px;
		margin-top: 50px;
	}
	.img_wrap img{
		max-width: 100%;
	}
	img {
		display: block;	
		width : 60px;
		
	}
	body, html{
		height: 100%;
		margin: 0;
	}
	input, td{
		background-color: white;
	}
	.bg{
		background-image: url("resources/images/join/songwriter.png");
		height: 100%;
		background-position: center;
		background-repeat: no-repeat;
		background-size: cover;
	}
	th{
		background-color: white;
	}
	
	
	body {
  font-family: Arial, Helvetica, sans-serif;
  background-color: black;
}

* {
  box-sizing: border-box;
}

/* Add padding to containers */
.container {
  padding: 16px;
  background-color: white;
}

/* Full-width input fields */
input[type=text], input[type=password] {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}

/* Overwrite default styles of hr */
hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;
}

/* Set a style for the submit button */
.registerbtn {
  background-color: #4CAF50;
  color: white;
  padding: 16px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}

.registerbtn:hover {
  opacity: 1;
}

/* Add a blue text color to links */
a {
  color: dodgerblue;
}

/* Set a grey background color and center the text of the "sign in" section */
.signin {
  background-color: #f1f1f1;
  text-align: center;
}
.logoDiv img{
	position: absolute;
	top: 5%;
	left: 15%;
}
</style>
<script src="resources/js/jquery-3.4.1.min.js"></script>
<script>
function formCheck(){
	var password = document.getElementById("cust_password").value;
	var password2 = document.getElementById("cust_password2").value;
	if (password!== password2) {
		$("#pwdCheck").css("color","red");
		$("#pwdCheck").text("비밀번호가 맞지 않습니다.");
		document.getElementById("pass_word2").select();
		return;
	}
	var mail = document.getElementById("cust_email").value;
	var mailCheck = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		if(mailCheck.test(mail)==false){
			alert("올바른 Email 형식을 입력해 주세요.");
			document.getElementById("cust_email").select();
			return ;
		}
		
		var welcomeForm = document.getElementById("join");
		welcomeForm.submit();
		alert("이메일 인증 후에 로그인 하실수 있습니다!");
		
}

var sel_file;
$(document).ready(function(){
	$("#input_img").on("change",handleImgFileSelect);
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
			$("#m_photo").attr("src",e.target.result);
			$("#m_photo").css("width","100px");
			$("#m_photo").css("height","100px");
			$("#m_photo").css("border-radius","50px");
		}
		reader.readAsDataURL(f);	
		});
}
$(function(){
	$("#cust_id").on('keyup',function(){
		var custid = $('#cust_id').val();
		$("#idCheck").text('');
		$.ajax({
			type : "GET"
			,url : "idCheck"
			,data : {"cust_id" : custid}
			,success : function(resp){
				if(resp == 'success'){
// 					$("#idCheck").css("color","blue");
					$("#idCheck").text(" 사용가능한 아이디입니다.");
				}
				else{
// 					$("#idCheck").css("color","red");
					alert("이미 존재하는 아이디입니다.")
					$("#idCheck").text(" 사용 불가능한 아이디입니다.");
				}
			}
		})
	})
	$("#cust_email").on("keyup", function() {
		var email = $("#cust_email").val();

		$.ajax({
			type : 'GET',
			url : "emailCheck",
			data : {
				"cust_email" : email
			},
			success : function(resp) {

				if (resp == 'success') {
// 					$("#emailCheck").css("color", "blue");
					$("#emailCheck").text(" 사용가능한 이메일입니다.");
				} else {
// 					$("#emailCheck").css("color", "red");
					alert("이미 존재하는 이메일입니다.")
					$("#emailCheck").text(' 사용 불가능한 이메일입니다.');
				}
			}
		});
	});
});
</script>

</head>
<body>
<div class="bg">
<div id="wrapper">
	<div class="logoDiv">
		<a href="home" class="w3-bar-item w3-button w3-wide"><img class="logo" alt="home" src="resources/images/home/im_logo_w.jpg"></a>
	</div>
	<form id="join" action="cust_join_byemail" method="POST" enctype="multipart/form-data">
	<div class="container">
    <h1>Register</h1>
    <p>Please full-fill the blanks in this form to create an account.</p>
    <hr>
    <div class="col-xs-6 profileplace">
		<label for="profile"><b>Image</b><img class="img-responsive center-block" id=m_photo name="m_photo" src="resources/images/profile.png"></label>
    	<input type="file" value="사진 첨부" name="upload" id="input_img">
	</div>
	
    <label for="id"><b>ID</b></label><span id="idCheck"></span>   
	<input type="text" id="cust_id" name="cust_id" placeholder="Enter ID" />
	
    <label for="psw"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="cust_password" id="cust_password" required>

    <label for="psw-repeat"><b>Repeat Password</b></label><span id="pwdCheck"></span>
    <input type="password" placeholder="Repeat Password" name="psw-repeat"  id="cust_password2"  required>
    
    <label for="nickname"><b>Nickname</b></label>
    <input type="text" id="cust_nickname" name="cust_nickname" placeholder="Enter Nickname" />
    
    <label for="email"><b>Email</b></label><span id="emailCheck"></span>
    <input type="text" placeholder="Enter Email" id="cust_email" name="cust_email" required>
			
    <label for="introduce"><b>Introduce</b></label>
    <input type="text" id="cust_introduce" name="cust_introduce" placeholder="Enter Introduce">
    <br>
    
	<button type="submit" class="registerbtn" onclick="formCheck()">Register</button>
  </div>
	</form>
</div>
</div>
</body>
</html>