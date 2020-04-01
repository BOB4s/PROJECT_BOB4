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
	.header {
	}
	img {
		width : 60px;
	}
	body, html{
		height: 100%;
		margin: 0;
	}
	.bg{
		background-image: url("resources/images/join/songwriter.jpg");
		height: 100%;
		background-position: center;
		background-repeat: no-repeat;
		background-size: cover;
	}
	th{
		background-color: white;
	}
	
	
</style>
<script src="resources/js/jquery-3.4.1.min.js"></script>
<script>
$(function(){
	$("#cust_id").on('keyup',function(){
		var custid = $('#cust_id').val();
		$("#idCheck").text('');
		// 입력한 아이디가 사용가능한지 여부 체크
		$.ajax({
			type : "GET"
			,url : "idCheck"
			,data : {"cust_id" : custid}
			,success : function(resp){
				// 사용 가능한 경우 : 'success'
				// 사용 불가능한 경우 : 'fail'	
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
	<form id="join" action="join" method="POST">
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
			<td><input type="password" id="cust_password2" name="cust_password"
		    placeholder="비밀번호를 입력하세요" /></td> 
		</tr>
		<tr>
			<th>비밀번호 확인</th>
			<td><input type="password" id="cust_password2" 
			placeholder="비밀번호 재확인" /></td> 
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
			<td><input class="fa text-white" type="file" value="사진 첨부" name="upload"></td>
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