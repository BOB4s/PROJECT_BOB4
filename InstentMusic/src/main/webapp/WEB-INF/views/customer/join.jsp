<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
		background-image: url("resources/images/join/songwriter.jpg");
		height: 100%;
		background-position: center;
		background-repeat: no-repeat;
		background-size: cover;
		-webkit-filter: grayscale(100%);
		filter: grayscale(100%);
	}
	th{
		background-color: white;
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
			$("#img").attr("src",e.target.result);	
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
					$("#idCheck").css("color","blue");
					$("#idCheck").text("사용가능한 아이디입니다.");
				}
				else{
					$("#idCheck").css("color","red");
					alert("이미 존재하는 아이디입니다.")
					$("#idCheck").text("사용 불가능한 아이디입니다.");
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
					$("#emailCheck").css("color", "blue");
					$("#emailCheck").text("사용가능한 이메일입니다..");
				} else {
					$("#emailCheck").css("color", "red");
					alert("이미 존재하는 이메일입니다.")
					$("#emailCheck").text('사용 불가능한 이메일입니다.');
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
	<a href="home" class="w3-bar-item w3-button w3-wide"><img class="logo" alt="home" src="resources/images/home/im_logo_w.jpg"></a>
	<form id="join" action="cust_join_byemail" method="POST" enctype="multipart/form-data">
	<table border="1">
		<tr>
			<th>ID</th>
			<td class ="inputdata">
			<input type="text" id="cust_id" name="cust_id" placeholder="아이디를  입력하세요" />
			<span id="idCheck"></span>
			</td> 
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" id="cust_password" name="cust_password"
		    placeholder="비밀번호를 입력하세요" /></td> 
		</tr>
		<tr>
			<th>비밀번호 확인</th>
			<td><input type="password" id="cust_password2" 
			placeholder="비밀번호 재확인" /><span id="pwdCheck"></span></td> 
		</tr>
		<tr>
			<th>닉네임</th>
			<td><input type="text" id="cust_nickname" name="cust_nickname"
			placeholder="닉네임을 입력하세요." /></td>
		</tr>
		<tr>
			<th>E-mail</th>
			<td><input type="text" id="cust_email" name="cust_email"
			placeholder="Email을 입력하세요." /><span id="emailCheck"></span>
			</td>
		</tr>
		<tr>
			<th>자기소개</th>
			<td>
			<textarea rows="10" cols="30" id="cust_introduce" name="cust_introduce"></textarea>
			</td>
		</tr>
		<tr>
			<th>프로필 사진</th>
			<td><input class="fa text-white" type="file" value="사진 첨부" name="upload" id="input_img">
			<div class="img_wrap"><img id="img" /></div>
			</td>
		</tr>
		<tr>
			<th colspan="2">
			<input type = "submit" value="가입" onclick="formCheck()" />
			<input type = "reset" value="다시 쓰기" />
			</th>
		</tr>
	</table>
	</form>
</div>
</div>
</body>
</html>