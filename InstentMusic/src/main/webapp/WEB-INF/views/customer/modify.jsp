<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- <script src="http://code.jquery.com/jquery-latest.js"></script> -->
<script src="resources/js/jquery-3.4.1.min.js"></script>
<script>
/* 	$(function(){
		$("#joinBtn").onclick(function(){
			if($("#pw").val() !== $("#pw2").val()){
				alert("暗証番号が違います。");
				$("#pw").val("").focus();
				$("#pw2").val("");
				return false;
			}else if ($("#pw").val().length > 10 || $("#pw").val().length<3) {
				alert("Password should be 3~10 letters");
				$("#pw").val("").focus();
				return false;
			}else if($.trim($("#pw").val()) !== $("#pw").val()){
				alert("공백이라니");
				return false;
			}
			if(${password} !== $("#old_pw").val()){
				alert("현재 비밀번호가 다릅니다.")
				$("#old_pw").val("").focus();
				return false;
				}
			$("#pwForm").submit();
		});
	}) */
	function joinBtn(){
		if($("#pw").val() !== $("#pw2").val()){
			alert("暗証番号が違います。");
			$("#pw").val("").focus();
			$("#pw2").val("");
			return false;
		}else if ($("#pw").val().length > 10 || $("#pw").val().length<3) {
			alert("Password should be 3~10 letters");
			$("#pw").val("").focus();
			return false;
		}else if($.trim($("#pw").val()) !== $("#pw").val()){
			alert("공백이라니");
			return false;
		}
		if('${password}' !== $("#old_pw").val()){
			alert("현재 비밀번호가 다릅니다.")
			$("#old_pw").val("").focus();
			return false;
			}
		 $("#pwForm").submit(); 


		}
// 	$(function(){
// 		if($("#pwForm").submit(function(){
// 			if(${password} !== $("#old_pw").val()){
// 				alert("현재 비밀번호가 다릅니다.")
// 				$("#old_pw").val("").focus();
// 				return false;
// 				}
// 			}))
// 		})
</script>
<title>Crystal</title>
</head>
<body>
	<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4">
			<div class="w3-center w3-large w3-margin-top">
				<h3>My Page</h3>
			</div>
			<div>
				<form id="myForm" action="goModify" method="post">
					<p>
						<label>ID</label> 
						<input class="w3-input" type="text" id="cust_id" name="cust_id" readonly value="${login}"> 
					</p>
					<p>
						<label>ProfileImage</label><!-- 요기는 수정해야합니당다라당당닫ㅇ당 --> 
						<input class="w3-input" type="file" id="cust_img"> 
					</p>
					<p>
						<label>Nickname</label> 
						<input class="w3-input" type="text" id="cust_nickname" name="cust_nickname" value="${nickname}" required> 
					</p>
					<p>
						<label>Introduce</label>
						<input class="w3-input" type="text" id="cust_introduce" name="cust_introduce" value="${introduce}" required> 
					</p>
					<p class="w3-center">
						<button type="submit" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">회원정보 변경</button>
					</p>
				</form>
				<br />
				<form id="pwForm" action="change" method="post">	
					<input type="hidden" name="cust_id" value="${login}">
					<p>
						<label>Password</label>
						<input class="w3-input" id="old_pw" name="old_pw" type="password" required>
					</p>
					<p>
						<label>New Password</label> 
						<input class="w3-input" id="pw" name="cust_password" type="password" required>
					</p>
					<p>
						<label>Confirm</label>
						<input class="w3-input" id="pw2" type="password" required>
					</p>
					<p class="w3-center">
					<!--id="joinBtn"  -->
<!-- 					<input type="button" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round" value="new" onclick="joinBtn()"> -->
						<button  onclick="joinBtn()"  class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">비밀번호 변경</button>
					</p>
				</form>
			</div>
		</div>
	</div>
</body>
</html>