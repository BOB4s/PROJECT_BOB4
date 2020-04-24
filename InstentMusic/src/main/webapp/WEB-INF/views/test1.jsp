<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/styles.css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/css/styles.css">
<link rel="stylesheet" href="resources/css/sideMenuBar.css"> 
<script>
$(function() { //화면 다 뜨면 시작

// 		$.ajax({
// 			method : 'get'
// 			,url : 'getsearch'
// 			,data : 
// 		})
// 		var arr = ["abab","Babafdb","bsfbf"];
		var arr = ${search};
// 		$.each(arr, function(index, item){
// 		var result='';
// 		result += item.cust_id;
// 		});
		// 배열 형태로 
		$("#searchInput").autocomplete({  //오토 컴플릿트 시작
			source : arr,	// source 는 자동 완성 대상
			select : function(event, ui) {	//아이템 선택시
				console.log(ui.item);
			},
			focus : function(event, ui) {	//포커스 가면
				return false;//한글 에러 잡기용도로 사용됨
			},
			minLength: 1,// 최소 글자수
			autoFocus: true, //첫번째 항목 자동 포커스 기본값 false
			classes: {	//잘 모르겠음
			    "ui-autocomplete": "highlight"
			},
			delay: 500,	//검색창에 글자 써지고 나서 autocomplete 창 뜰 때 까지 딜레이 시간(ms)
//			disabled: true, //자동완성 기능 끄기
			position: { my : "right top", at: "right bottom" },	//잘 모르겠음
			close : function(event){	//자동완성창 닫아질때 호출
				console.log(event);
			}
		});
		
	});
</script>
	
</head>
<body>
<div class="profile__column">
		<img class="pro" src="<spring:url value='/image/${image}'/>"/>	
</div>
<input id="searchInput">
<i class="fa fa-search"></i>
</body>
</html>