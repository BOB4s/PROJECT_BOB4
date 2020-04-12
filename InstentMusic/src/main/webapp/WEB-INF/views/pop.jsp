<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#senderToWho").on("keyup", function() {
			var sendData = $("#senderToWho").val();
			// 입력한 아이디가 사용가능한지 여부 체크
			$.ajax({
				type : "GET"
				,url : "toSendIsCorrect"
				,data : {"sendData" : sendData}
				,success :function (resp) {
					var data ='';
							if(resp==''){
							data +=sendData+'의 아이디를 확인해주세요'
								}else{
									data +='To . '+resp;
									data +='<input type="hidden" id="opponentName" value="'+resp+'">';
									}
						$("#reci_Name").html(data);
					}
			     });
	 	   	})
		})
			
			
	function SendNewChatRoom(){
		var UserName = document.getElementById("senderName").value;
		var opponentName = document.getElementById("opponentName").value;
		var recentMessage =document.getElementById("sendContents").value; 
		$.ajax({
			type : "POST"
			,url : "CreateChatRoom"
			,data : {"UserName" : UserName,
					"opponentName" :opponentName,
					"recentMessage":recentMessage }
			
			
				
		})
		this.close();
		opener.	location.href = "chattingTemp?UserName=" + UserName + "&opponentName="+ opponentName;
		
		}
		
		
	

</script>
<style type="text/css">
#wrapper {
	margin-left: 10px;
}
</style>
</head>
<body>

	<h3>New Message</h3>
	<hr>
	<div id="wrapper">
		<form action="">
			<input type="hidden" id="senderName" value="${nickname}"> <br>
			<div id="reci_Name">
				<span>To</span>
			</div>
			<input type="text" id="senderToWho" value="" placeholder="상대방닉네임입력"
				style="width: 80%; margin-top: 10px; margin-bottom: 10px;">

			<br> <span>Write your message</span> <br>
			<textarea rows="10" cols="51" id="sendContents"
				style="margin-top: 10px;"></textarea>
			<br>
			<div style="width: 50px; margin-left: 70%;">
				<input type="button" value="Send" onclick="SendNewChatRoom()">
			</div>


		</form>

	</div>
</body>
</html>