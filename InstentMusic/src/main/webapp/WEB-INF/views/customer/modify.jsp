<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
				$("#proimg").attr("src",e.target.result);
			}
			reader.readAsDataURL(f);	
			});
	}
	function withdrawal(){
			location.href="deleteView"
		}
	
	
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
<style>
.profile__column img{
	width:100px;
	height:100px;
	border-radius:50px;
}
.logoDiv img{
	width: 60px;
	position: absolute;
	top: 5%;
	left: 5%;
}
</style>
</head>
<body>
	<div class="logoDiv">
		<a href="main" class="w3-bar-item w3-button w3-wide"><img class="logo" alt="home" src="resources/images/home/im_logo_w.jpg"></a>
	</div>
	<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4">
			<div class="w3-center w3-large w3-margin-top">
				<h3>My Page</h3>
			</div>
			<div>
				<form id="myForm" action="goModify" method="post" enctype="multipart/form-data">
				<input type="hidden" value="${login}" name="cust_number"/>
					<p>
						<label>ProfileImage</label>
						<div class="profile__column">
						<c:if test="${image == null}">
						<img class="img-responsive center-block" id=proimg name="m_photo" src="resources/images/profile.png">
						</c:if>
						<c:if test="${image != null}">
						<img class="pro" id="proimg" src="<spring:url value='/image/${image}'/>"/>
						</c:if>
						</div>
						<input class="w3-input" type="file" id="input_img" name="upload"> 
					</p>
					<p>
						<label>ID</label> 
						<input class="w3-input" type="text" id="cust_id" name="cust_id" readonly value="${id}"> 
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
						<button  onclick="withdrawal()"  class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">회원 탈퇴</button>
					</p>
				</form>
			</div>
		</div>
	</div>
</body>
</html>