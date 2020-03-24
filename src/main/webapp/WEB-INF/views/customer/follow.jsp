<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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

		//끝
	});
</script>
</head>
<body>
	<div>



		<input type="button" id="following" name="following" value="팔로우">
	
	</div>
</body>
</html>