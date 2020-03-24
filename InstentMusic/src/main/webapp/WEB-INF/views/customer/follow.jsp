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
		var follower_number = 1;
		var follow_number = 2;
		$.ajax({
			method : 'GET',
			url : 'followchecking',
			data : {
				"follower_number" : follower_number,
				"follow_number" : follow_number
			},
			success : function(resp) {
				if (resp == 'unfollowed')
					$("#following").val("팔로우")
				if (resp == 'followed')
					$("#following").val("언팔로우")
			}
		})

		$("#following").on("click", function() {
			var follower_number = 1;
			var follow_number = 2;

			$.ajax({
				method : 'GET',
				url : 'following',
				data : {
					"follower_number" : follower_number,
					"follow_number" : follow_number
				},
				success : function(resp) {
					if (resp == 'unfollowed')
						$("#following").val("팔로우")
					if (resp == 'followed')
						$("#following").val("언팔로우")

				}

			})

		});
		$("#followList").on("click", function() {
			var follow_number = 2;
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
	
		//끝
	});
</script>
</head>
<body>
	<div>



		<input type="button" id="following" name="following" value="팔로우">

		<input type="button" id="followList" value="리스트 가져오기">
		<div id="followlists">
		</div>
	</div>
</body>
</html>